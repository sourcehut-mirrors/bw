/**
 * same idea just do a multiply
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
vector_mult(const double *A, const double *B, double *C, int num_elements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if ( i < num_elements )
    {
        C[i] = A[i] * B[i];
    }
}

int main(int argc, char *argv[])
{
    struct timespec time_begin, time_end, t0, t1;
    uint64_t tdelta_nsec, cuda_malloc, cuda_memcpy, cuda_free;

    /* Even the top of the line H100 does not have a full 96G */
    unsigned long long min_memory = 105553116266496;
    unsigned long long max_memory = 0;

    int driver_ver = 0;
    int runtime_ver = 0;
    int max_dev, min_dev;

    cudaError_t err = cudaSuccess;
    int num_elements = NUM_ELEMENTS;
    size_t size = num_elements * sizeof(double);

    /* do we even have a NVidia Quadro GPU ? */
    int num_gpus = 0;

    setlocale( LC_ALL, "C" );
    sysinfo();

    /* Get the CLOCK_REALTIME time in a timespec struct */
    if ( clock_gettime( CLOCK_REALTIME, &t0 ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return(EXIT_FAILURE);
    } else {
        /* Usually I call srand48() with the sub-second time data
        srand48( (long) t0.tv_nsec );

        to get consistent data in the so-called random arrays we
        shall use 2^31 -1 = 2147483647
        */
        srand48( 2147483647 ); 
    }

    time_begin.tv_sec = t0.tv_sec;
    time_begin.tv_nsec = t0.tv_nsec;

    cudaDriverGetVersion(&driver_ver);
    cudaRuntimeGetVersion(&runtime_ver);

    printf("INFO : CUDA Driver Version    %d.%d\n",
                                 driver_ver/1000, (driver_ver%100)/10);

    printf("     : CUDA Runtime Version   %d.%d\n",
                               runtime_ver/1000, (runtime_ver%100)/10);

    /* determine the number of CUDA capable GPUs */
    cudaGetDeviceCount(&num_gpus);
    if ( num_gpus < 1 ) {
        printf("FAIL : no CUDA capable devices were detected\n");
        return EXIT_FAILURE;
    }

    /* display CPU and GPU configuration */
    printf("     : number of host CPUs:\t%d\n", omp_get_num_procs());
    printf("     : number of CUDA devices:\t%d\n", num_gpus);

    /* only YOU can stop the abuse of i */
    for (int j = 0; j < num_gpus; j++) {
        cudaDeviceProp dprop;
        cudaGetDeviceProperties(&dprop, j);
        printf("     :    %d: %s\n", j, dprop.name);


        printf("     : dev number %d: name = \"%s\"\n",
                                                   j, dprop.name);

        printf("     : CUDA Capability Major/Minor version %d.%d\n",
                                       dprop.major, dprop.minor);


        printf("     : Total global memory: %llu bytes\n",
                         (unsigned long long) dprop.totalGlobalMem);

        if ( dprop.totalGlobalMem > max_memory ) {
            max_memory = dprop.totalGlobalMem;
            max_dev = j;
        }

        if ( dprop.totalGlobalMem < min_memory ) {
            min_memory = dprop.totalGlobalMem;
            min_dev = j;
        }

        printf("     : constant memory: %llu bytes\n",
                                               dprop.totalConstMem);

        printf("     : multiprocessor count = %i\n",
                                         dprop.multiProcessorCount);

        printf("     : CUDA cores per multiprocessor = %d\n",
                  _ConvertSMVer2Cores(dprop.major, dprop.minor));

        printf("     : total CUDA cores = %d\n",
                  ( _ConvertSMVer2Cores(dprop.major, dprop.minor)
                    * dprop.multiProcessorCount ) );

    }

    printf("     : Max memory device %i has %lu\n", max_dev, max_memory);
    printf("     : Min memory device %i has %lu\n", min_dev, min_memory);

    if (cudaSetDevice(max_dev)) {
        err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to select device\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }
    printf("     : we selected device %i\n", max_dev);

    printf("     : Vector multiply of %d double FP64 elements\n", num_elements);
    printf("     : Memory size of each array is %ld bytes\n", size );

    /* thanks to C++ the NVidia CUDA nvcc will barf if you do not cast */
    double *h_A = (double *)malloc(size);
    double *h_B = (double *)malloc(size);
    double *h_C = (double *)malloc(size);

    if (h_A == NULL || h_B == NULL || h_C == NULL) {
        fprintf(stderr, "FAIL : memory allocate\n");
        return EXIT_FAILURE;
    }

    /* fill the arrays A and B with random data */
    clock_gettime( CLOCK_REALTIME, &t0 );
    for (int i = 0; i < num_elements; ++i) {
        h_A[i] = drand48();
        h_B[i] = drand48();
    }
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     : random data loaded %" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);

    /* Allocate the device input memory */
    double *d_A = NULL;
    if (cudaMalloc((void **)&d_A, size) != cudaSuccess) {
        err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to allocate vector A\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }
    clock_gettime( CLOCK_REALTIME, &t0 );
    tdelta_nsec = timediff( t1, t0);
    cuda_malloc = tdelta_nsec;
    printf("     : cudaMalloc(A) %10" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);


    double *d_B = NULL;
    if (cudaMalloc((void **)&d_B, size) != cudaSuccess) {
        err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to allocate vector B\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    cuda_malloc += tdelta_nsec;
    printf("     : cudaMalloc(B) %10" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);


    double *d_C = NULL;
    if (cudaMalloc((void **)&d_C, size) != cudaSuccess) {
        err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to allocate vector C\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }
    clock_gettime( CLOCK_REALTIME, &t0 );
    tdelta_nsec = timediff( t1, t0);
    cuda_malloc += tdelta_nsec;
    printf("     : cudaMalloc(C) %10" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);
    printf("TOTAL: cudaMalloc    %10" PRIu64 " nsecs  %9.7g secs\n",
                     cuda_malloc, (float)cuda_malloc/1.0e9);


    /* Copy the host input A and B arrays in host memory
     * to the device memory */
    clock_gettime(CLOCK_REALTIME, &t0);
    err = cudaMemcpy(d_A, h_A, size, cudaMemcpyHostToDevice);
    clock_gettime(CLOCK_REALTIME, &t1);
    if (err != cudaSuccess) {
        err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to copy vector A from host to device\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }
    printf("INFO : Copy of vector A from host to device done.\n");
    tdelta_nsec = timediff(t0, t1);
    cuda_memcpy = tdelta_nsec;
    printf("     : cudaMemcpy() %" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);


    clock_gettime(CLOCK_REALTIME, &t0);
    err = cudaMemcpy(d_B, h_B, size, cudaMemcpyHostToDevice);
    clock_gettime(CLOCK_REALTIME, &t1);
    if (err != cudaSuccess) {
        err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to copy vector B from host to device\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }
    printf("INFO : Copy of vector B from host to device done.\n");
    tdelta_nsec = timediff(t0, t1);
    cuda_memcpy += tdelta_nsec;
    printf("     : cudaMemcpy() %" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);


    /* fire off the cuda "kernel" code blocks */
    int threadsPerBlock = THREADS_PER_BLOCK;
    int blocksPerGrid =( num_elements + threadsPerBlock - 1 ) / threadsPerBlock;
    printf("INFO : CUDA kernel launch with %d blocks of %d threads\n", blocksPerGrid, threadsPerBlock);

    cudaEvent_t start_cuda_event, stop_cuda_event;
    cudaEventCreate(&start_cuda_event);
    cudaEventCreate(&stop_cuda_event);

    cudaEventRecord(start_cuda_event);
    vector_mult<<<blocksPerGrid, threadsPerBlock>>>(d_A, d_B, d_C, num_elements);
    cudaEventRecord(stop_cuda_event);
    cudaEventSynchronize(stop_cuda_event);
    float vector_mult_msec = 0.0f;
    cudaEventElapsedTime(&vector_mult_msec, start_cuda_event, stop_cuda_event);

    err = cudaGetLastError();
    if (err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed vector_mult\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        return EXIT_FAILURE;
    }
    printf("     : vector_mult %9.7g msecs\n", vector_mult_msec);

    /* Copy the device result memory d_C to the host result h_C memory */
    clock_gettime(CLOCK_REALTIME, &t0);
    err = cudaMemcpy(h_C, d_C, size, cudaMemcpyDeviceToHost);
    clock_gettime(CLOCK_REALTIME, &t1);
    if (err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed to copy result vector C from device to host\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        return EXIT_FAILURE;
    }
    printf("INFO : Copy result A from device to host done.\n");
    tdelta_nsec = timediff(t0, t1);
    cuda_memcpy += tdelta_nsec;
    printf("     : cudaMemcpy %10" PRIu64 " nsecs  %9.7g secs\n",
                               tdelta_nsec, (float)tdelta_nsec/1.0e9);
    printf("TOTAL: cudaMemcpy %10" PRIu64 " nsecs  %9.7g secs\n",
                               cuda_memcpy, (float)cuda_memcpy/1.0e9);


    /* test that result vector is correct within epsilon error
     *
     * Note that the various IEEE754-2008 ( onwards ) compiler
     * options make a world of difference here.
     *
     * Essentially the NVidia hardware will make optimization
     * choices for you and deliver wrong results.
     *
     * Feel free to verify for yourself.
     */
    int correct_flag = 1;
    for (int j = 0; j < num_elements; ++j)
    {
        if ( fabs(h_A[j] * h_B[j] - h_C[j]) > EPSILON ) {
            fprintf(stderr, "FAIL : Result verification failed at element %d!\n", j);
            correct_flag = 0;
        }
    }

    if ( correct_flag ) {
        printf("INFO : A * B correct within error epsilon = %16.9e\n", EPSILON);
    } else {
        printf("INFO : A * B went sideways somewhere\n");
    }
    clock_gettime(CLOCK_REALTIME, &t1);
    tdelta_nsec = timediff(t0, t1);
    printf("     : epsilon %" PRIu64 " nsecs  %9.7g secs\n",
                          tdelta_nsec, (float)tdelta_nsec/1.0e9);


    /* Free device memory */
    clock_gettime(CLOCK_REALTIME, &t0);
    err = cudaFree(d_A);
    clock_gettime(CLOCK_REALTIME, &t1);
    cuda_free = timediff(t0, t1);
    if (err != cudaSuccess) {
        fprintf(stderr, "FAIL : Failed to free memory on device for vector A\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }

    clock_gettime(CLOCK_REALTIME, &t0);
    err = cudaFree(d_B);
    clock_gettime(CLOCK_REALTIME, &t1);
    cuda_free += timediff(t0, t1);
    if (err != cudaSuccess) {
        fprintf(stderr, "FAIL : Failed to free memory on device for vector B\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }

    clock_gettime(CLOCK_REALTIME, &t0);
    err = cudaFree(d_C);
    clock_gettime(CLOCK_REALTIME, &t1);
    cuda_free += timediff(t0, t1);
    if (err != cudaSuccess) {
        fprintf(stderr, "FAIL : Failed to free memory on device for vector C\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(err));
        exit(EXIT_FAILURE);
    }
    printf("TOTAL: cudaFree   %10" PRIu64 " nsecs  %9.7g secs\n",
                               cuda_free, (float)cuda_free/1.0e9);

    /* Free host memory */
    free(h_A);
    free(h_B);
    free(h_C);

    printf("INFO : host memory free and we are done\n");
    cudaProfilerStop();

    clock_gettime(CLOCK_REALTIME, &time_end);
    tdelta_nsec = timediff(time_begin, time_end);
    printf("TOTAL TIME %" PRIu64 " nsecs  %9.7g secs\n",
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
        /* it would be unwise to bail out simply because
         * we can not determine the memory amount
         */
        return 0;
    }
    pages = (uint64_t) en;

    page_size = (uint64_t)sysconf(_SC_PAGE_SIZE);
    return ( pages * page_size );
}

int sysinfo(void) {

    struct utsname uname_data;
    long sysconf_status;
    uint64_t pagesize;

    sysconf_status = sysconf(_SC_PAGESIZE);
    if ( sysconf_status < 0 ) {
        perror("sysconf(_SC_PAGESIZE) : ");
        /* best we can do is assume a zero here */
        pagesize = 0;
    } else {
        pagesize = (uint64_t)sysconf_status;
    }

    uint64_t sysmem = system_memory();

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

    return EXIT_SUCCESS;

}

