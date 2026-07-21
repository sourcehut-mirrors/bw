
/*
 * addition of two arrays of 32-bit floating point
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
#include "tdiff.h"

#include "dat.h"

#define VERBOSE 1
#define SYSINFO_FAIL 127
int sysinfo(int verbose);

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
    /* only you can stop the abuse of i as a loop counter */
    int j;

    long candidate_int = 0;

    /* we shall assume that everything just works. */
    int exit_status = EXIT_SUCCESS;

    /* pick a GPU device and keep track of the device number */
    int device_id = -1;

    /* epsilon of 2^(-21) may work well.  */
    float epsilon = powf(2.0, -21.0); 

    struct timespec t_start, t_end, t0, t1;
    cudaEvent_t cuda_start, cuda_stop;
    uint64_t tdelta_nsec;
    tdiff_type delta_time;

    /* we shall use this CUDA device error status over and over */
    cudaError_t cuda_err = cudaSuccess;

    int numElements = NUM_ELEMENTS;
    size_t size = numElements * sizeof(float);

    int num_gpus = 0;
    int user_select = 0;

    setlocale(LC_ALL, "C");
    if ( sysinfo(VERBOSE) == SYSINFO_FAIL ) {
        fprintf(stderr,"\nWARN : system info may be incomplete.\n\n");    
    }

    /* TODO : verify the platform clock flag type */
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

        size = candidate_int * sizeof(float);
        fprintf(stderr,"     : array size is %i\n", numElements);
    }

    /* we need a device that can handle three arrays with some 
     * minimal overhead. Say 5% just for giggles. That can be
     * stupid large on a big NVidia Quadro */
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
        if ( ( device_id < 0 ) && ( *(gpu_memory+j) > memory_fit_size ) ) {
            /* TODO we may want a bit more logic to select the device
             * with just enough memory but no more than that */
            device_id = j;
            printf("     :    %d: %s is to be selected\n",
                      device_id, (dprop+device_id)->name);
        }
    }

    /* this is sort of stupid when there is only one GPU */
    printf("     : min memory unit is %i: %s with %" PRIu64 " bytes\n",
                          gpu_unit_min_number,
                          (dprop+gpu_unit_min_number)->name,
                          gpu_min_memory);

    printf("     : max memory unit is %i: %s with %" PRIu64 " bytes\n",
                          gpu_unit_max_number,
                          (dprop+gpu_unit_max_number)->name,
                          gpu_max_memory);

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
                fprintf(stderr,"     : we shall assume device 0 and proceed.\n");
                /* again this is harmless but very clear */
                user_select = 0;
            } else {
                user_select = candidate_int;
            }
        }
        /* let the user shoot themselves in the foot */
        device_id = user_select;
    }

    /* the user my bork this up and we are not to blame damn it */
    cuda_err = cudaSetDevice(device_id);
    
    if (cuda_err != cudaSuccess) {
    
        fprintf(stderr, "FAIL : CUDA failed to select %s\n",
                                            (dprop+device_id)->name);
    
        fprintf(stderr, "FAIL : error %s\n",
                                       cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    
    } else {
    
        printf("     : selected %s\n", (dprop+device_id)->name);

        /* we need to check for cudaDevAttrManagedMemory */
        managed_mem = (dprop+device_id)->managedMemory ;
    
    }
    

    /* this was just a dirty select of the unit with the least memory *
    if (cudaSetDevice(gpu_unit_min_number) != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to select %s\n",
                                        (dprop+gpu_unit_min_number)->name);
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
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

    printf("     : Vector addition of %d float FP32 elements\n", numElements);

    float *h_A = (float *)malloc(size);
    if ( h_A == NULL ) {
        fprintf(stderr, "FAIL : memory allocate float *h_A at %d in %s\n",
                               __LINE__, __FILE__);
        return EXIT_FAILURE;
    }

    float *h_B = (float *)malloc(size);
    if ( h_B == NULL ) {
        fprintf(stderr, "FAIL : memory allocate float *h_B at %d in %s\n",
                               __LINE__, __FILE__);
        free(h_A);
        return EXIT_FAILURE;
    }

    float *h_C = (float *)malloc(size);
    if ( h_C == NULL ) {
        fprintf(stderr, "FAIL : memory allocate float *h_C at %d in %s\n",
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


    /* right fukkin here ... stop this old clock trash */
    tdiff( &delta_time, t0, t1);
    printf("     : random data loaded %-+20.10g\n\n", delta_time.delta);

    /* Allocate the device input vectors */
    float *d_A = NULL;
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

    /* TODO it would be nice to know the memory utilization in the
     * GPU and that would tell us how much memory is still available
     */
    clock_gettime( CLOCK_REALTIME, &t0 );

    tdiff( &delta_time, t1, t0);
    printf("     : Wallclock cudaMalloc(A) %-+20.10g\n", delta_time.delta);

    float *d_B = NULL;
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

    clock_gettime( CLOCK_REALTIME, &t1 );

    tdiff( &delta_time, t0, t1);
    printf("     : Wallclock cudaMalloc(B) %-+20.10g\n", delta_time.delta);


    float *d_C = NULL;
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

    clock_gettime( CLOCK_REALTIME, &t0 );
    tdiff( &delta_time, t1, t0);
    printf("     : Wallclock cudaMalloc(C) %-+20.10g\n", delta_time.delta);

    /* Copy the host input vectors h_A and h_B in host memory
     * to the device input vectors in device memory */
    if (cudaMemcpy(d_A, h_A, size, cudaMemcpyHostToDevice) != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to copy vector A from host to device\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }
    printf("     : Copy of vector A from host to device done.\n");

    clock_gettime( CLOCK_REALTIME, &t1 );
    tdiff( &delta_time, t0, t1);
    printf("     : Wallclock cudaMemcpy() %-+20.10g\n", delta_time.delta);

    if (cudaMemcpy(d_B, h_B, size, cudaMemcpyHostToDevice) != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to copy vector B from host to device\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }
    printf("     : Copy of vector B from host to device done.\n");

    clock_gettime( CLOCK_REALTIME, &t0 );
    tdiff( &delta_time, t1, t0);
    printf("     : Wallclock cudaMemcpy() %-+20.10g\n", delta_time.delta);

    /* Launch the default stream CUDA Kernel */
    int threadsPerBlock = THREADS_PER_BLOCK;
    int blocksPerGrid =(numElements + threadsPerBlock - 1) / threadsPerBlock;
    printf("     : CUDA kernel launch with %d blocks of %d threads\n",
                    blocksPerGrid, threadsPerBlock);


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


    clock_gettime( CLOCK_REALTIME, &t1 );
    tdiff( &delta_time, t0, t1);
    printf("     : Wallclock kernel launch %-+20.10g\n", delta_time.delta);


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

    clock_gettime( CLOCK_REALTIME, &t1 );
    cuda_err = cudaMemcpy(h_C, d_C, size, cudaMemcpyDeviceToHost);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed to copy result vector C from device to host\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }
    printf("     : Copy result vector C from device to host done.\n");
    clock_gettime( CLOCK_REALTIME, &t0 );
    tdiff( &delta_time, t1, t0);

    printf("     : cudaMemcpy() %-+20.10g\n", delta_time.delta);

    /* test that result vector is correct within epsilon error */
    for (int i = 0; i < numElements; ++i) {
        if ( fabs(h_A[i] + h_B[i] - h_C[i]) > epsilon ) {
            fprintf(stderr, "FAIL : Result verification failed at element %d!\n", i);
            return EXIT_FAILURE;
        }
    }

    printf("     : A + B correct within error 2^(-21) epsilon\n");
    clock_gettime( CLOCK_REALTIME, &t1 );

    tdiff( &delta_time, t0, t1);

    printf("     : result check done %-+20.10g\n", delta_time.delta);


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
    tdiff( &delta_time, t_start, t_end);

    printf("DONE : total time %-+20.10g\n",delta_time.delta);

    return exit_status;

}

