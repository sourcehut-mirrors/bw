/*
 * hacked at by Dennis Clarke for some twitch fun stuff
 */

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>
#include <locale.h>
#include <errno.h>
#include <sys/resource.h>
#include <sys/utsname.h>
#include <unistd.h>
#include <time.h>
#include <cuda_runtime.h>
#include <helper_cuda.h>
#include <cuda_profiler_api.h>
#include <omp.h>

#include "dat.h"

int sysinfo(void);
uint64_t system_memory();
uint64_t timediff( struct timespec st, struct timespec en );

/**
 * CUDA Kernel Device code
 */
__global__ void
vectorAdd(const double *A, const double *B, double *C, int numElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < numElements)
    {
        C[i] = A[i] + B[i];
    }
}

int main(int argc, char *argv[])
{
    /* only you can stop the abuse of i as a loop counter */
    int j;

    long candidate_int = 0;

    /* we shall assume that everything just works. */
    int exit_status = EXIT_SUCCESS;

    /* We have a mantissa of 52 bits plus an implied one bit
     * thus epsilon will be 2^(-50) may work well.
     */
    double epsilon = 0.000000000000000888178419700125232338905334472656250;
    struct timespec t_start, t_end, t0, t1;
    cudaEvent_t cuda_start, cuda_stop;
    uint64_t tdelta_nsec;

    /* we shall use this CUDA device error status over and over */
    cudaError_t cuda_err = cudaSuccess;

    int numElements = NUM_ELEMENTS;
    size_t size = numElements * sizeof(double);

    int num_gpus = 0;

    setlocale( LC_ALL, "C" );
    sysinfo();

    /* Get the CLOCK_REALTIME time in a timespec struct */
    if ( clock_gettime( CLOCK_REALTIME, &t_start ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    } else {
        /* call srand48() with the sub-second time data */
        srand48( (long) t_start.tv_nsec );
    }

    /* ensure we also have a time t0 */
    t0.tv_sec = t_start.tv_sec;
    t0.tv_nsec = t_start.tv_nsec;

    float cuda_milliseconds = 0.0;

    /* determine the number of CUDA capable GPUs */
    cudaGetDeviceCount(&num_gpus);
    if (num_gpus < 1) {
        printf("INFO : no CUDA capable devices were detected\n");
        return EXIT_FAILURE;
    }

    /* display CPU and GPU configuration */
    printf("INFO : number of host CPUs:\t%d\n", omp_get_num_procs());
    printf("INFO : number of CUDA devices:\t%d\n", num_gpus);



    /* check if there is a numerical parameter on the CLI */
    errno = 0;
    if ( argc > 1 ) {
        candidate_int = (int)strtol(argv[1], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : array size not understood\n");
            perror("     ");
            return EXIT_FAILURE;
        }

        /* 681740840 elements of 8-byte floating point in three arrays
         * will likely fit into a 16G mem GPU. Barely */
        if ( ( candidate_int < 16777216 ) || ( candidate_int > 681740840 ) ){
            fprintf(stderr,"WARN : array size is unreasonable\n");
            fprintf(stderr,"     : we shall assume 2^28 and proceed.\n");
            numElements = 268435456;
        } else {
            numElements = candidate_int;
            size = numElements * sizeof(double);
        }

        fprintf(stderr,"INFO : array size is %i\n", numElements);
    }

    /* we need a device that can handle three arrays with some 
     * minimal overhead. Say 5% just for giggles. That can be
     * stupid large on a big NVidia Quadro */
    uint64_t memory_fit_size = (uint64_t)(

                            (double)( 3.0 * size ) * 1.05

                                         );

    printf("     : we need %" PRIu64 " bytes of memory on a GPU\n",
                 memory_fit_size);

    cudaDeviceProp *dprop = (cudaDeviceProp *)calloc( num_gpus, sizeof(cudaDeviceProp));
    if ( dprop == NULL ) {
        fprintf(stderr, "FAIL : memory allocate cudaDeviceProp dprop at %d in %s\n",
                               __LINE__, __FILE__);
        return EXIT_FAILURE;
    }

    uint64_t *gpu_memory = (uint64_t *)calloc( num_gpus, sizeof(uint64_t));
    if ( gpu_memory == NULL ) {
        fprintf(stderr, "FAIL : memory allocate uint64_t *gpu_memory at %d in %s\n",
                               __LINE__, __FILE__);
        return EXIT_FAILURE;
    }

    int *gpu_unit_number = (int *)calloc( num_gpus, sizeof(int));
    if ( gpu_unit_number == NULL ) {
        fprintf(stderr, "FAIL : memory allocate int *gpu_unit_number at %d in %s\n",
                               __LINE__, __FILE__);
        return EXIT_FAILURE;
    }

    uint64_t gpu_max_memory = 0;
    /* the Ampere A100X has 80G so lets assume 96G as upper limit */
    uint64_t gpu_min_memory = 103079215104;
    int gpu_unit_max_number = -1;
    int gpu_unit_min_number = -1;

    for (j = 0; j < num_gpus; j++) {

        cudaGetDeviceProperties(dprop+j, j);
        printf("     :    %d: %s", j, (dprop+j)->name);

        *(gpu_memory+j) = (uint64_t)(dprop+j)->totalGlobalMem;
        *(gpu_unit_number+j) = j;

        printf(" totalGlobalMem = %" PRIu64 "\n", *(gpu_memory+j));

        /* track the largest memory device */
        if ( *(gpu_memory+j) > gpu_max_memory ) {
            gpu_max_memory = *(gpu_memory+j);
            gpu_unit_max_number = j;
        }

        /* track the smallest memory device */
        if ( *(gpu_memory+j) < gpu_min_memory ) {
            gpu_min_memory = *(gpu_memory+j);
            gpu_unit_min_number = j;
        }

    }

    printf("     : min memory unit is %i: %s with %" PRIu64 " bytes\n",
                          gpu_unit_min_number,
                          (dprop+gpu_unit_min_number)->name,
                          gpu_min_memory);

    printf("     : max memory unit is %i: %s with %" PRIu64 " bytes\n",
                          gpu_unit_max_number,
                          (dprop+gpu_unit_max_number)->name,
                          gpu_max_memory);

    /* For giggles we shall select the min unit and watch
     * it all blow up */
    cuda_err = cudaSetDevice(gpu_unit_min_number);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed to select %s\n",
                                        (dprop+gpu_unit_min_number)->name);
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    } else {
        printf("     : selected %s\n", (dprop+gpu_unit_min_number)->name);
    }

    /*
    if (cudaSetDevice(gpu_unit_max_number) != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to select %s\n",
                                        (dprop+gpu_unit_max_number)->name);
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        exit(EXIT_FAILURE);
    }
    */

    cuda_err = cudaDeviceReset();
    if ( cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed cudaDeviceReset()\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }


    /* initialize the cuda event timers after we select the device */
    cuda_err = cudaEventCreate(&cuda_start);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : failed to cudaEventCreate()\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }

    cuda_err = cudaEventCreate(&cuda_stop);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : failed to cudaEventCreate()\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }

    printf("INFO : Vector addition of %d double FP64 elements\n", numElements);
    printf("     : Memory size is %ld bytes\n", size );

    double *h_A = (double *)malloc(size);
    if ( h_A == NULL ) {
        fprintf(stderr, "FAIL : memory allocate double *h_A at %d in %s\n",
                               __LINE__, __FILE__);
        return EXIT_FAILURE;
    }

    double *h_B = (double *)malloc(size);
    if ( h_B == NULL ) {
        fprintf(stderr, "FAIL : memory allocate double *h_B at %d in %s\n",
                               __LINE__, __FILE__);
        free(h_A);
        return EXIT_FAILURE;
    }

    double *h_C = (double *)malloc(size);
    if ( h_C == NULL ) {
        fprintf(stderr, "FAIL : memory allocate double *h_C at %d in %s\n",
                               __LINE__, __FILE__);
        free(h_A);
        free(h_B);
        return EXIT_FAILURE;
    }

    /* Init input vectors with random data in the domain 0 upwards
     * to less than 1. Math people say this is a uniform distribution
     * within [0, 1) where we never see a value of 1 exactly. */
    clock_gettime( CLOCK_REALTIME, &t0 );
    for (int i = 0; i < numElements; ++i) {
        h_A[i] = drand48();
        h_B[i] = drand48();
    }
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : random data loaded %" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);

    /* Allocate the device input vectors */
    double *d_A = NULL;
    cuda_err = cudaMalloc((void **)&d_A, size);
    if (cuda_err != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to allocate vector A\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }

    clock_gettime( CLOCK_REALTIME, &t0 );
    tdelta_nsec = timediff( t1, t0);
    printf("     : Wallclock cudaMalloc(A) %10" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);

    double *d_B = NULL;
    if (cudaMalloc((void **)&d_B, size) != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to allocate vector B\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : Wallclock cudaMalloc(B) %10" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);


    double *d_C = NULL;
    if (cudaMalloc((void **)&d_C, size) != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to allocate vector C\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));

        if ( cuda_err == cudaErrorMemoryAllocation ) {
            fprintf(stderr, "     : cuda_err = cudaErrorMemoryAllocation\n");
        } else {
            fprintf(stderr, "     : cuda_err = something strange?? Good Luck.\n");
        }

        return EXIT_FAILURE;
    }
    clock_gettime( CLOCK_REALTIME, &t0 );
    tdelta_nsec = timediff( t1, t0);
    printf("     : Wallclock cudaMalloc(C) %10" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);


    /* Copy the host input vectors h_A and h_B in host memory
     * to the device input vectors in device memory */
    if (cudaMemcpy(d_A, h_A, size, cudaMemcpyHostToDevice) != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to copy vector A from host to device\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }
    printf("INFO : Copy of vector A from host to device done.\n");
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : Wallclock cudaMemcpy() %" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);


    if (cudaMemcpy(d_B, h_B, size, cudaMemcpyHostToDevice) != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to copy vector B from host to device\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }
    printf("INFO : Copy of vector B from host to device done.\n");
    clock_gettime( CLOCK_REALTIME, &t0 );
    tdelta_nsec = timediff( t1, t0);
    printf("     : Wallclock cudaMemcpy() %" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);


    /* Launch the default stream CUDA Kernel */
    int threadsPerBlock = THREADS_PER_BLOCK;
    int blocksPerGrid =(numElements + threadsPerBlock - 1) / threadsPerBlock;
    printf("INFO : CUDA kernel launch with %d blocks of %d threads\n",
                    blocksPerGrid, threadsPerBlock);


    /* this sucks -- always throws an error cudaErrorInvalidResourceHandle


       ***********************************************************
       *   THE CUDA Event timer stuff does not work at all. At   *
       *   least not for me. I have no idea why.                 *
       ***********************************************************
       */

    cuda_err = cudaEventRecord(cuda_start, 0);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : failed to cudaEventRecord(cuda_start, 0)\n");
        fprintf(stderr, "     : error %s\n", cudaGetErrorString(cuda_err));
        fprintf(stderr, "     : at %d in %s\n", __LINE__, __FILE__);
        free(h_A);
        free(h_B);
        free(h_C);
        return EXIT_FAILURE;
    }


    /*******************************************************
     * Special NOTE : this is asynchronous where control   *
     *                returns immediately to the CPU.      *
     *                There is no waiting for the kernel   *
     *                code to complete.                    *
     *******************************************************/
    vectorAdd<<<blocksPerGrid, threadsPerBlock, 0>>>(d_A, d_B, d_C, numElements);

    /* a call to cudaError_t cudaDeviceSynchronize ( void )  will ensure
       that all previous tasks in the GPU are completed. */
    cuda_err = cudaDeviceSynchronize();
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed vectorAdd\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }
    printf("INFO : vectorAdd done.\n");
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : Wallclock kernel launch %" PRIu64 " nsecs  %9.7g secs\n",
                            tdelta_nsec, (float)tdelta_nsec/1.0e9);



    cuda_err = cudaEventRecord(cuda_stop, 0);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : failed to cudaEventRecord(cuda_stop, 0)\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        fprintf(stderr, "     : at %d in %s\n", __LINE__, __FILE__);
        free(h_A);
        free(h_B);
        free(h_C);
        return EXIT_FAILURE;
    }


    cuda_err = cudaEventSynchronize(cuda_stop);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : failed to cudaEventSynchronize\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        fprintf(stderr, "     : at %d in %s\n", __LINE__, __FILE__);
        return EXIT_FAILURE;
    }

    cuda_err = cudaEventElapsedTime(&cuda_milliseconds, cuda_start, cuda_stop);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : failed to cudaEventElapsedTime\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        fprintf(stderr, "     : at %d in %s\n", __LINE__, __FILE__);
        free(h_A);
        free(h_B);
        free(h_C);
        return EXIT_FAILURE;
    }
    printf("     : cudaEventElapsedTime claims %9.7g secs\n",
                               cuda_milliseconds / 1000.0);


    /* Copy the device result vector in device memory to the host
     * result vector in host memory */
    cuda_err = cudaMemcpy(h_C, d_C, size, cudaMemcpyDeviceToHost);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed to copy result vector C from device to host\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }
    printf("INFO : Copy result vector C from device to host done.\n");
    clock_gettime( CLOCK_REALTIME, &t0 );
    tdelta_nsec = timediff( t1, t0 );
    printf("     : cudaMemcpy() %" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);


    /* test that result vector is correct within epsilon error */
    for (int i = 0; i < numElements; ++i) {
        if ( fabs(h_A[i] + h_B[i] - h_C[i]) > epsilon ) {
            fprintf(stderr, "FAIL : Result verification failed at element %d!\n", i);
            return EXIT_FAILURE;
        }
    }

    printf("INFO : A + B correct within error 2^(-50) epsilon\n");
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : result check done %" PRIu64 " nsecs  %9.7g secs\n",
                          tdelta_nsec, (float)tdelta_nsec/1.0e9);


    /* Free device global memory */
    cuda_err = cudaFree(d_A);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : Failed to free memory on device for vector A\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }

    cuda_err = cudaFree(d_B);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : Failed to free memory on device for vector B\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }

    cuda_err = cudaFree(d_C);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : Failed to free memory on device for vector C\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        exit_status = EXIT_FAILURE;
    }

    cuda_err = cudaEventDestroy(cuda_start);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : Failed to cudaEventDestroy(cuda_start)\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        /* we do not need to bail out here 
        exit_status = EXIT_FAILURE;
        */
    }

    cuda_err = cudaEventDestroy(cuda_stop);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : Failed to cudaEventDestroy(cuda_stop)\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        /* we do not need to bail out here 
        exit_status = EXIT_FAILURE;
        */
    }


    /* Someday we may actually use exit_status but today is not that day */
    if ( exit_status != EXIT_SUCCESS ) {
        fprintf(stderr, "FAIL : Something went wrong somewhere. Good Luck.\n");
    }


    /* Free host memory */
    free(h_A);
    free(h_B);
    free(h_C);
    free(dprop);
    free(gpu_memory);
    free(gpu_unit_number);

    cudaProfilerStop();

    clock_gettime( CLOCK_REALTIME, &t_end );
    tdelta_nsec = timediff( t_start, t_end);
    printf("DONE : total time %" PRIu64 " nsecs  %9.7g secs\n",
            tdelta_nsec, (float)tdelta_nsec/1.0e9);

    return exit_status;

}

uint64_t timediff( struct timespec st, struct timespec en )
{
    /* return the delta time as a 64-bit positive number of
     * nanoseconds.  Regardless of the time direction between
     * start and end we always get a positive result. */

    struct timespec temp;
    uint64_t s, n;

    if ( ( en.tv_nsec - st.tv_nsec ) < 0 ) {
        /* make a full second adjustment to tv_sec */
        temp.tv_sec = en.tv_sec - st.tv_sec - 1;
        /* we have to add a full second to temp.tv_nsec */
        temp.tv_nsec = 1000000000 + en.tv_nsec - st.tv_nsec;
    } else {
        temp.tv_sec = en.tv_sec - st.tv_sec;
        temp.tv_nsec = en.tv_nsec - st.tv_nsec;
    }
    s = (uint64_t) temp.tv_sec;
    n = (uint64_t) temp.tv_nsec;
    return ( s * (uint64_t)1000000000 + n );
}

uint64_t system_memory()
{
    /* should return the amount of memory available in bytes */
    long en;
    uint64_t pages, page_size;

    en = sysconf(_SC_PHYS_PAGES);
    if ( en < 0 ){
        perror("sysconf(_SC_PHYS_PAGES) : ");
        exit(EXIT_FAILURE);
    }
    pages = (uint64_t) en;

    page_size = (uint64_t)sysconf(_SC_PAGE_SIZE);
    return ( pages * page_size );
}

int sysinfo(void) {

    struct utsname uname_data;

    uint64_t sysmem = system_memory();
    uint64_t pagesize = (uint64_t)sysconf(_SC_PAGESIZE);

    setlocale( LC_MESSAGES, "C" );
    if ( uname( &uname_data ) < 0 ) {
        fprintf ( stderr,
                 "WARNING : Could not attain system uname data.\n" );
        perror ( "uname" );
    } else {
        printf ( "-------------------------------" );
        printf ( "------------------------------\n" );
        printf ( "        system name = %s\n", uname_data.sysname );
        printf ( "          node name = %s\n", uname_data.nodename );
        printf ( "            release = %s\n", uname_data.release );
        printf ( "            version = %s\n", uname_data.version );
        printf ( "            machine = %s\n", uname_data.machine );
        printf ( "          page size = %" PRIu64 "\n", pagesize );
        printf ( "       avail memory = %" PRIu64 "\n", sysmem );
        printf ( "                    = %" PRIu64 " kB\n", sysmem/1024 );
        printf ( "                    = %" PRIu64 " MB\n", sysmem/1048576 );
        /*
         *  this doesn't really work for memory size near GB boundaries
         *
         *  if ( sysmem > ( 1024 * 1048576 ) ) {
         *      printf ( "                    = %" PRIu64 " GB\n",
         *              sysmem/( 1024 * 1048576 ) );
         *  }
        */
        printf ( "-------------------------------" );
        printf ( "------------------------------" );
    }
    printf ("\n");

    return ( EXIT_SUCCESS );

}

