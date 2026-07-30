
/*
 * addition of two arrays of 64-bit floating point
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

#include "sysinfo.h"
#include "tdiff.h"

#define VERBOSE 1
#define SYSINFO_FAIL 127

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

    /* pick a GPU device and keep track of the device number */
    int device_id = -1;

    /* epsilon of 2^(-52) may work well.
     * here we note that IEEE754 only provides 53 bits
     */
    double epsilon = powf(2.0, -52.0); 

    int err_clock;
    struct timespec tn_begin, tn_0, tn_1, tn_end;
    tdiff_type delta_time;

    cudaEvent_t cuda_start, cuda_stop;

    /* we shall use this CUDA device error status over and over */
    cudaError_t cuda_err = cudaSuccess;

    int numElements = NUM_ELEMENTS;
    size_t size = numElements * sizeof(float);

    int num_gpus = 0;
    int user_select = 0;

    /* We may or may not have CLOCK_MONOTONIC implemented and thus
     * we test for what does exist and set a clockid_t type. */
    clockid_t clock_flag;

    setlocale(LC_ALL, "C");
    if ( sysinfo(VERBOSE) == SYSINFO_FAIL ) {
        fprintf(stderr,"\nWARN : system info may be incomplete.\n\n");    
    }

    errno = 0;
    clock_flag = CLOCK_MONOTONIC;
    err_clock = clock_gettime(clock_flag, &tn_begin);
    if ( err_clock != 0 ) {
        fprintf(stderr,"FAIL : ");
        if ( errno == ENOSYS ) {
            fprintf(stderr,"clock_gettime() not supported\n");
            return EXIT_FAILURE;
        }

        if ( errno == EINVAL ) {
            fprintf(stderr,"CLOCK_MONOTONIC not known\n");
            errno = 0;
            clock_flag = CLOCK_REALTIME;
            err_clock = clock_gettime(clock_flag, &tn_begin);

            if ( err_clock != 0 ) {
                if ( errno == EINVAL ) {
                    /* Not very likely to ever happen as CLOCK_REALTIME
                     * shall always be implemented if the clock_gettime()
                     * function exists. */
                    fprintf(stderr,"FAIL : CLOCK_REALTIME not supported\n");
                    fprintf(stderr,"     : your system is bork bork bork\n");
                    return EXIT_FAILURE;
                }
                fprintf(stderr,"FAIL : bizarre error. good luck.\n");
                return EXIT_FAILURE;
            }
        }
    }

    /* call srand48() with the sub-second time data */
    srand48( (long) tn_begin.tv_nsec );

    /* ensure we also have a time t0 */
    tn_0.tv_sec = tn_begin.tv_sec;
    tn_0.tv_nsec = tn_begin.tv_nsec;

    float cuda_milliseconds = 0.0;

    /* determine the number of CUDA capable GPUs */
    cudaGetDeviceCount(&num_gpus);
    if (num_gpus < 1) {
        printf("INFO : no CUDA capable devices were detected\n");
        return EXIT_FAILURE;
    }

    /* display CPU and GPU configuration */
    printf("INFO : number of host CPUs:\t%d\n", omp_get_num_procs());
    printf("     : number of CUDA devices:\t%d\n", num_gpus);

    /* check if there is a numerical parameter on the CLI */
    errno = 0;
    if ( argc > 1 ) {
        candidate_int = (int)strtol(argv[1], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : array size not understood\n");
            perror("     ");
            return EXIT_FAILURE;
        }

        /* the insane 96G value is for the big barking Ampere A100X */
        if ( ( candidate_int < 1024 ) || ( candidate_int > 103079215104 ) ){
            fprintf(stderr,"WARN : array size is unreasonable\n");
            fprintf(stderr,"     : we shall assume 2^28 and proceed.\n");
            numElements = 16777216;
        } else {
            numElements = candidate_int;
        }

        size = candidate_int * sizeof(double);
        fprintf(stderr,"     : array size is %i\n", numElements);
    }

    uint64_t memory_fit_size = 3 * size;

    printf("     : we need %" PRIu64 " bytes of memory on a GPU\n",
                 memory_fit_size);

    cudaDeviceProp *dprop = (cudaDeviceProp *)calloc(num_gpus, sizeof(cudaDeviceProp));
    if ( dprop == NULL ) {
        fprintf(stderr, "FAIL : memory allocate cudaDeviceProp dprop at %d in %s\n",
                               __LINE__, __FILE__);
        return EXIT_FAILURE;
    }

    uint64_t *gpu_memory = (uint64_t *)calloc(num_gpus, sizeof(uint64_t));
    if ( gpu_memory == NULL ) {
        fprintf(stderr, "FAIL : memory allocate uint64_t *gpu_memory at %d in %s\n",
                               __LINE__, __FILE__);
        return EXIT_FAILURE;
    }

    int *gpu_unit_number = (int *)calloc(num_gpus, sizeof(int));
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
    int managed_mem = 0;

    for (j = 0; j < num_gpus; j++) {

        cudaGetDeviceProperties(dprop+j, j);
        printf("     :    %d: %s", j, (dprop+j)->name);

        *(gpu_memory+j) = (uint64_t)(dprop+j)->totalGlobalMem;
        *(gpu_unit_number+j) = j;

        printf(" totalGlobalMem = %" PRIu64 "\n", *(gpu_memory+j));

        printf("              id = 0x%x , bus id = 0x%x , location = 0x%x\n",
                                                  (dprop+j)->pciDomainID,
                                                  (dprop+j)->pciBusID,
                                                  (dprop+j)->pciDeviceID);

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

        /* select a GPU with enough memory */
        if ( ( device_id < 0 )
                &&
             ( *(gpu_memory+j) > memory_fit_size ) ) {

            /* grab the first GPU that fits the mem requested */
            device_id = j;

        }
    }

    /* this is sort of stupid when there is only one GPU */
    if ( num_gpus > 1 ) {
        printf("     : min memory unit is %i: %s with %" PRIu64 " bytes\n",
                          gpu_unit_min_number,
                          (dprop+gpu_unit_min_number)->name,
                          gpu_min_memory);

        printf("     : max memory unit is %i: %s with %" PRIu64 " bytes\n",
                          gpu_unit_max_number,
                          (dprop+gpu_unit_max_number)->name,
                          gpu_max_memory);
    }

    /* provide the opportunity for the user to force select a device id */
    errno = 0;
    if ( argc > 2 ) {
        candidate_int = (int)strtol(argv[2], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ) {
            fprintf(stderr,"WARN : device choice not understood\n");
            perror("     ");
            /* may not be needed but certainly is clear */
            user_select = 0;
        } else {
            if ( ( candidate_int < 0 ) || ( candidate_int > num_gpus ) ) {
                fprintf(stderr,"WARN : device select unreasonable\n");
                fprintf(stderr,"     : we shall assume device %i\n",
                             device_id );

                /* again this is harmless but very clear */
                user_select = device_id;
            } else {
                user_select = candidate_int;
            }
        }
        /* let the user shoot themselves in the foot */
        device_id = user_select;
    }

    cuda_err = cudaSetDevice(device_id);
    
    if (cuda_err != cudaSuccess) {
    
        fprintf(stderr, "FAIL : CUDA failed to select %s\n",
                                            (dprop+device_id)->name);
    
        fprintf(stderr, "FAIL : error %s\n",
                                       cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    
    } else {
    
        printf("     : selected %s\n", (dprop+device_id)->name);

        printf("              id = 0x%x , bus id = 0x%x , location = 0x%x\n",
                                       (dprop+device_id)->pciDomainID,
                                       (dprop+device_id)->pciBusID,
                                       (dprop+device_id)->pciDeviceID);

        /* we need to check for cudaDevAttrManagedMemory */
        managed_mem = (dprop+device_id)->managedMemory ;
    
    }
    

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

    printf("     : Vector addition of %d float FP32 elements\n", numElements);

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

    /* Allocate the device input vectors */
    double *d_A = NULL;
    err_clock = clock_gettime(clock_flag, &tn_0);
    if ( managed_mem == 0 ) {
        cuda_err = cudaMalloc((void **)&d_A, size);
    } else {
        cuda_err = cudaMallocManaged((void **)&d_A, size);
    }
    if (cuda_err != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to allocate vector A\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }

    err_clock = clock_gettime(clock_flag, &tn_1);
    err_clock = tdiff( &delta_time, tn_0, tn_1);

    printf("     :  cudaMalloc( d_A ) %10ld.%09ld secs\n",
                             delta_time.sec, delta_time.nsec);


    err_clock = clock_gettime(clock_flag, &tn_0);
    printf("     : fill random host arrays    ");
    for (int i = 0; i < numElements; ++i) {
        h_A[i] = drand48();
        h_B[i] = drand48();
    }
    err_clock = clock_gettime(clock_flag, &tn_1);
    err_clock = tdiff( &delta_time, tn_0, tn_1);

    printf("%10ld.%09ld secs\n",
                             delta_time.sec, delta_time.nsec);


    double *d_B = NULL;
    err_clock = clock_gettime(clock_flag, &tn_0);
    if ( managed_mem == 0 ) {
        cuda_err = cudaMalloc((void **)&d_B, size);
    } else {
        cuda_err = cudaMallocManaged((void **)&d_B, size);
    }
    if (cuda_err != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to allocate vector B\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }

    err_clock = clock_gettime(clock_flag, &tn_1);
    err_clock = tdiff( &delta_time, tn_0, tn_1);

    printf("     :  cudaMalloc( d_B ) %10ld.%09ld secs\n",
                             delta_time.sec, delta_time.nsec);



    double *d_C = NULL;
    err_clock = clock_gettime(clock_flag, &tn_0);
    if ( managed_mem == 0 ) {
        cuda_err = cudaMalloc((void **)&d_C, size);
    } else {
        cuda_err = cudaMallocManaged((void **)&d_C, size);
    }
    if (cuda_err != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to allocate vector C\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }

    err_clock = clock_gettime(clock_flag, &tn_1);
    err_clock = tdiff( &delta_time, tn_0, tn_1);

    printf("     :  cudaMalloc( d_C ) %10ld.%09ld secs\n",
                             delta_time.sec, delta_time.nsec);


    /* Copy the host input vectors h_A and h_B in host memory
     * to the device input vectors in device memory */
    err_clock = clock_gettime(clock_flag, &tn_0);
    if (cudaMemcpy(d_A, h_A, size, cudaMemcpyHostToDevice) != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to copy vector A from host to device\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }
    err_clock = clock_gettime(clock_flag, &tn_1);
    err_clock = tdiff( &delta_time, tn_0, tn_1);

    printf("     : copy host A to dev %10ld.%09ld secs\n",
                             delta_time.sec, delta_time.nsec);



    err_clock = clock_gettime(clock_flag, &tn_0);
    if (cudaMemcpy(d_B, h_B, size, cudaMemcpyHostToDevice) != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to copy vector B from host to device\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }
    err_clock = clock_gettime(clock_flag, &tn_1);
    err_clock = tdiff( &delta_time, tn_0, tn_1);

    printf("     : copy host B to dev %10ld.%09ld secs\n",
                             delta_time.sec, delta_time.nsec);


    /* Launch the default stream CUDA Kernel */
    int threadsPerBlock = THREADS_PER_BLOCK;
    int blocksPerGrid =(numElements + threadsPerBlock - 1) / threadsPerBlock;
    printf("     : CUDA kernel launch with %d blocks of %d threads\n",
                    blocksPerGrid, threadsPerBlock);


    err_clock = clock_gettime(clock_flag, &tn_0);
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

    /* call to cudaError_t cudaDeviceSynchronize ( void ) will ensure
     * that all previous tasks in the GPU are completed. */
    cuda_err = cudaDeviceSynchronize();
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed vectorAdd\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }
    printf("     : vectorAdd done.\n");

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
    err_clock = clock_gettime(clock_flag, &tn_1);
    err_clock = tdiff( &delta_time, tn_0, tn_1);

    printf("     : system clock delta %10ld.%09ld secs\n",
                             delta_time.sec, delta_time.nsec);

    printf("     : cudaEventElapsedTime claims %9.9g secs\n",
                               cuda_milliseconds / 1000.0);


    /* Copy the device result vector in device memory to the host
     * result vector in host memory */

    err_clock = clock_gettime(clock_flag, &tn_0);
    cuda_err = cudaMemcpy(h_C, d_C, size, cudaMemcpyDeviceToHost);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed to copy result vector C from device to host\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }

    err_clock = clock_gettime(clock_flag, &tn_1);
    err_clock = tdiff( &delta_time, tn_0, tn_1);

    printf("     :   copy d_C to host %10ld.%09ld secs\n",
                             delta_time.sec, delta_time.nsec);




    printf("INFO : test stage to begin\n");
    printf("     : epsilon is %-48.36e\n", epsilon );
    /* test that result vector is correct within epsilon error */
    err_clock = clock_gettime(clock_flag, &tn_0);
    for (int i = 0; i < numElements; ++i) {
        if ( fabs(h_A[i] + h_B[i] - h_C[i]) > epsilon ) {
            fprintf(stderr, "FAIL : Result verification failed at element %d!\n", i);
            return EXIT_FAILURE;
        }
    }

    printf("     : A + B correct within error 2^(-52) epsilon\n");
    err_clock = clock_gettime(clock_flag, &tn_1);
    err_clock = tdiff( &delta_time, tn_0, tn_1);
    printf("     : verify vector time %10ld.%09ld secs\n",
                             delta_time.sec, delta_time.nsec);


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

    err_clock = clock_gettime(clock_flag, &tn_end);
    err_clock = tdiff( &delta_time, tn_begin, tn_end);
    printf("     :     total run time %10ld.%09ld secs\n",
                             delta_time.sec, delta_time.nsec);

    return exit_status;

}

