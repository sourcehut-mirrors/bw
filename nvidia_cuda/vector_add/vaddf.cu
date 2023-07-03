/**
 * hacked at by Dennis Clarke
 *
 * okay hacked a LOT.
 *
 * Lets get system info and memory reports for local host
 * and then use the system clock to init the drand prng pool.
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

#define GIG 1073741824

int sysinfo(void);
uint64_t system_memory();
uint64_t timediff( struct timespec st, struct timespec en );

/**
 * CUDA Kernel Device code
 */
__global__ void
vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < numElements)
    {
        C[i] = A[i] + B[i];
    }
}

int main(int argc, char *argv[])
{

    /* at best we have mantissa of 23 bits plus an implied one bit
     * thus epsilon will be 2^(-21) which is perfectly reasonable 
     */
    float epsilon = 0.0000004768371582031250;
    struct timespec t_start, t_end, t0, t1;
    uint64_t tdelta_nsec;

    cudaError_t err = cudaSuccess;
    int numElements = NUM_ELEMENTS;
    int candidate_int;
    size_t size = numElements * sizeof(float);

    int num_gpus = 0;

    setlocale( LC_ALL, "C" );
    sysinfo();

    if (argc>1) {
        errno = 0;
        candidate_int = (int)strtol(argv[1], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : numElements not understood\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        if ( ( candidate_int < 16777216 ) || ( candidate_int > GIG ) ){
            fprintf(stderr,"WARN : numElements is unreasonable\n");
            fprintf(stderr,"     : we shall assume 16777216 numElements and proceed.\n");
            numElements = 16777216;
        } else {
            numElements = candidate_int;
            fprintf(stderr,"INFO : numElements is %i\n", numElements);
        }
    }


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


    /* determine the number of CUDA capable GPUs */
    cudaGetDeviceCount(&num_gpus);
    if (num_gpus < 1) {
        printf("INFO : no CUDA capable devices were detected\n");
        return EXIT_FAILURE;
    }

    /* display CPU and GPU configuration */
    printf("INFO : number of host CPUs:\t%d\n", omp_get_num_procs());
    printf("INFO : number of CUDA devices:\t%d\n", num_gpus);

    /* we need a device that can handle three arrays with some 
     * minimal overhead. Say 3% just for giggles. That can be
     * stupid large on a big NVidia Quadro */
    uint64_t memory_fit_size = (uint64_t)(

                            (double)( 3.0 * size ) * 1.03

                                         );

    printf("     : we need %" PRIu64 " bytes of memory on a GPU\n", memory_fit_size);

    cudaDeviceProp *dprop = (cudaDeviceProp *)calloc( num_gpus, sizeof(cudaDeviceProp));
    uint64_t *gpu_memory = (uint64_t *)calloc( num_gpus, sizeof(uint64_t));
    int *gpu_unit_number = (int *)calloc( num_gpus, sizeof(int));
    if ( ( dprop == NULL ) || ( gpu_memory == NULL ) || ( gpu_unit_number == NULL ) ) {
        fprintf(stderr, "FAIL : memory allocate at %d in %s\n", __LINE__, __FILE__);
        exit(EXIT_FAILURE);
    }

    uint64_t gpu_max_memory = 0;
    int gpu_unit_max_number = -1;

    /* why is the NVidia Device properties name 256 bytes ? */
    char gpu_unit_name[256] = "";

    for (int j = 0; j < num_gpus; j++) {

        cudaGetDeviceProperties(dprop+j, j);
        printf("     :    %d: %s", j, (dprop+j)->name);

        *(gpu_memory+j) = (uint64_t)(dprop+j)->totalGlobalMem;
        *(gpu_unit_number+j) = j;

        printf(" totalGlobalMem = %" PRIu64 "\n", *(gpu_memory+j));

        if ( *(gpu_memory+j) > gpu_max_memory ) {
            gpu_max_memory = *(gpu_memory+j);
            gpu_unit_max_number = j;
            gpu_unit_name[0] = '\0';
            strncpy(gpu_unit_name,(dprop+j)->name,strlen((dprop+j)->name));
        }

    }


    printf("     : max memory unit is %i: %s with %" PRIu64 " bytes\n",
                          gpu_unit_max_number, gpu_unit_name, gpu_max_memory);

    /* Returns: cudaSuccess, cudaErrorInvalidDevice,
     * cudaErrorSetOnActiveProcess
     */
    if (cudaSetDevice(gpu_unit_max_number) != cudaSuccess) {
        err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to select %s\n", gpu_unit_name);
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }

    /* we may as well do a cudaDeviceReset ( void ) */
    if (cudaDeviceReset() != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed cudaDeviceReset()\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }

    printf("INFO : Vector addition of %d float FP32 elements\n", numElements);
    printf("     : Memory size is %ld bytes\n", size );

    float *h_A = (float *)malloc(size);
    float *h_B = (float *)malloc(size);
    float *h_C = (float *)malloc(size);

    if (h_A == NULL || h_B == NULL || h_C == NULL) {
        /* Note that I don't even bother to check which of
           the above arrays borked. This is lazy code.
           Don't do this unless you really don't care. */
        fprintf(stderr, "FAIL : memory allocate\n");
        exit(EXIT_FAILURE);
    }

    /* Init input vectors with random data */
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
    float *d_A = NULL;
    if (cudaMalloc((void **)&d_A, size) != cudaSuccess) {
        err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to allocate vector A\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        /* TODO Note that I am being lazy here and not doing memory
           cleanup */
        exit(EXIT_FAILURE);
    }
    clock_gettime( CLOCK_REALTIME, &t0 );
    tdelta_nsec = timediff( t1, t0);
    printf("     : cudaMalloc(A) %10" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);


    float *d_B = NULL;
    if (cudaMalloc((void **)&d_B, size) != cudaSuccess) {
        err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to allocate vector B\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : cudaMalloc(B) %10" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);


    float *d_C = NULL;
    if (cudaMalloc((void **)&d_C, size) != cudaSuccess) {
        err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to allocate vector C\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }
    clock_gettime( CLOCK_REALTIME, &t0 );
    tdelta_nsec = timediff( t1, t0);
    printf("     : cudaMalloc(C) %10" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);


    /* Copy the host input vectors A and B in host memory
     * to the device input vectors in device memory */
    if (cudaMemcpy(d_A, h_A, size, cudaMemcpyHostToDevice) != cudaSuccess) {
        err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to copy vector A from host to device\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }
    printf("INFO : Copy of vector A from host to device done.\n");
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : cudaMemcpy() %" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);


    if (cudaMemcpy(d_B, h_B, size, cudaMemcpyHostToDevice) != cudaSuccess) {
        err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to copy vector B from host to device\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }
    printf("INFO : Copy of vector B from host to device done.\n");
    clock_gettime( CLOCK_REALTIME, &t0 );
    tdelta_nsec = timediff( t1, t0);
    printf("     : cudaMemcpy() %" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);


    /* Launch the Vector Add CUDA Kernel */
    int threadsPerBlock = THREADS_PER_BLOCK;
    int blocksPerGrid =(numElements + threadsPerBlock - 1) / threadsPerBlock;
    printf("INFO : CUDA kernel launch with %d blocks of %d threads\n", blocksPerGrid, threadsPerBlock);

    vectorAdd<<<blocksPerGrid, threadsPerBlock>>>(d_A, d_B, d_C, numElements);

    err = cudaGetLastError();
    if (err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed vectorAdd\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }
    printf("INFO : vectorAdd done.\n");
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : vectorAdd %" PRIu64 " nsecs  %9.7g secs\n",
                            tdelta_nsec, (float)tdelta_nsec/1.0e9);

    /* Copy the device result vector in device memory to the host
     * result vector in host memory */
    err = cudaMemcpy(h_C, d_C, size, cudaMemcpyDeviceToHost);
    if (err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed to copy result vector C from device to host\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
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
            /* this is terrible lazy code where I don't even bother to 
               clean up memory. */
            exit(EXIT_FAILURE);
        }
    }

    printf("INFO : A + B correct within error 2^(-21) epsilon\n");
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : epsilon %" PRIu64 " nsecs  %9.7g secs\n",
                          tdelta_nsec, (float)tdelta_nsec/1.0e9);


    /* Free device global memory */
    err = cudaFree(d_A);
    if (err != cudaSuccess) {
        fprintf(stderr, "FAIL : Failed to free memory on device for vector A\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }

    err = cudaFree(d_B);
    if (err != cudaSuccess) {
        fprintf(stderr, "FAIL : Failed to free memory on device for vector B\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }

    err = cudaFree(d_C);
    if (err != cudaSuccess) {
        fprintf(stderr, "FAIL : Failed to free memory on device for vector C\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }

    /* Free host memory */
    free(h_A);
    free(h_B);
    free(h_C);
    free(dprop);
    free(gpu_memory);
    free(gpu_unit_number);

    printf("INFO : host memory free and we are done\n");
    cudaProfilerStop();

    clock_gettime( CLOCK_REALTIME, &t_end );
    tdelta_nsec = timediff( t_start, t_end);
    printf("DONE : total time %" PRIu64 " nsecs  %9.7g secs\n",
            tdelta_nsec, (float)tdelta_nsec/1.0e9);

    return EXIT_SUCCESS;

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

