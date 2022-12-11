
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

#define THREADS_PER_BLOCK 1024

/* Add FP64 floating point numbers */
__global__ void
vectorAdd(const double *A, const double *B, double *C, int numElements)
{
    int k = blockDim.x * blockIdx.x + threadIdx.x;

    if (k < numElements)
    {
        C[k] = A[k] + B[k];
    }
}

int main(int argc, char *argv[])
{
    /* only you can stop the abuse of i as a loop counter */
    int j;

    long candidate_int = 0;

    /* we shall assume that everything just works. */
    int exit_status = EXIT_SUCCESS;

    /* Check if the addition was reasonably correct */
    double epsilon = pow( 2.0, -36.0);

    cudaEvent_t cuda_start, cuda_stop;

    /* CUDA error status */
    cudaError_t cuda_err = cudaSuccess;

    int numElements = 1048576;
    size_t memory_size = numElements * sizeof(double);

    int num_gpus = 0;

    setlocale( LC_ALL, "C" );

    /* call srand48() with the same long seed val just
     * for testing purposes */
    srand48( 123456789 );

    /* initialize the cuda event timers */
    float cuda_milliseconds = 0.0;
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

    /* determine the number of CUDA capable GPUs */
    cudaGetDeviceCount(&num_gpus);
    if (num_gpus < 1) {
        printf("INFO : no CUDA capable devices were detected\n");
        return EXIT_FAILURE;
    }


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
            memory_size = numElements * sizeof(double);
        }

        fprintf(stderr,"INFO : array size is %i\n", numElements);

    }

    /* we need a device that can handle three arrays with some 
     * minimal overhead. Say 5% just for giggles. */
    uint64_t memory_fit_size = (uint64_t)(3.0 * memory_size * 1.05);

    printf("     : we need %" PRIu64 " bytes of memory on a GPU\n",
                 memory_fit_size);

    cudaDeviceProp *dprop = (cudaDeviceProp *)calloc( num_gpus, sizeof(cudaDeviceProp));
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

    /* For giggles we shall select the min unit */
    cuda_err = cudaSetDevice(gpu_unit_min_number);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed to select %s\n",
                                        (dprop+gpu_unit_min_number)->name);
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    } else {
        printf("     : selected %s\n", (dprop+gpu_unit_min_number)->name);
    }

    /* this would be the unit with the most memory *

    if (cudaSetDevice(gpu_unit_max_number) != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to select %s\n",
                                        (dprop+gpu_unit_max_number)->name);
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        exit(EXIT_FAILURE);
    }
    */

    cuda_err = cudaDeviceReset();
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed cudaDeviceReset()\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }

    printf("INFO : we shall add %d double FP64 elements\n", numElements);

    double *h_A = (double *)malloc(memory_size);
    if ( h_A == NULL ) {
        fprintf(stderr, "FAIL : memory allocate double *h_A at %d in %s\n",
                               __LINE__, __FILE__);
        return EXIT_FAILURE;
    }

    double *h_B = (double *)malloc(memory_size);
    if ( h_B == NULL ) {
        fprintf(stderr, "FAIL : memory allocate double *h_B at %d in %s\n",
                               __LINE__, __FILE__);
        free(h_A);
        return EXIT_FAILURE;
    }

    double *h_C = (double *)malloc(memory_size);
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
    for (j = 0; j < numElements; ++j) {
        h_A[j] = drand48();
        h_B[j] = drand48();
    }

    /* Allocate the device input vectors */
    double *d_A = NULL;
    cuda_err = cudaMalloc((void **)&d_A, memory_size);
    if (cuda_err != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to allocate vector A\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }

    double *d_B = NULL;
    if (cudaMalloc((void **)&d_B, memory_size) != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to allocate vector B\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }

    double *d_C = NULL;
    if (cudaMalloc((void **)&d_C, memory_size) != cudaSuccess) {
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

    /* Copy the host input vectors h_A and h_B in host memory
     * to the device input vectors in device memory */
    if (cudaMemcpy(d_A, h_A, memory_size, cudaMemcpyHostToDevice) != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to copy vector A from host to device\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }
    printf("INFO : Copy of vector A from host to device done.\n");

    if (cudaMemcpy(d_B, h_B, memory_size, cudaMemcpyHostToDevice) != cudaSuccess) {
        cuda_err = cudaGetLastError();
        fprintf(stderr, "FAIL : CUDA failed to copy vector B from host to device\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }
    printf("INFO : Copy of vector B from host to device done.\n");

    /* Launch the default stream CUDA Kernel */
    int threadsPerBlock = THREADS_PER_BLOCK;
    int blocksPerGrid =(numElements + threadsPerBlock - 1) / threadsPerBlock;
    printf("INFO : CUDA kernel launch with %d blocks of %d threads\n",
                    blocksPerGrid, threadsPerBlock);


    /* always throws an error cudaErrorInvalidResourceHandle
     *
     *  ***********************************************************
     *  *   THE CUDA Event timer stuff does not work at all. At   *
     *  *   least not for me. I have no idea why.                 *
     *  ***********************************************************
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
                               cuda_milliseconds * 1000.0);


    /* Copy the device result vector in device memory to the host
     * result vector in host memory */
    cuda_err = cudaMemcpy(h_C, d_C, memory_size, cudaMemcpyDeviceToHost);
    if (cuda_err != cudaSuccess) {
        fprintf(stderr, "FAIL : CUDA failed to copy result vector C from device to host\n");
        fprintf(stderr, "FAIL : error %s\n", cudaGetErrorString(cuda_err));
        return EXIT_FAILURE;
    }
    printf("INFO : Copy result vector C from device to host done.\n");

    /* test that result vector is correct within epsilon error */
    for (j = 0; j < numElements; ++j) {
        if ( fabs(h_A[j] + h_B[j] - h_C[j]) > epsilon ) {
            fprintf(stderr, "FAIL : Result verification failed at element %d!\n", j);
            exit_status = EXIT_FAILURE;
            /* may as well stop checking */
            j = numElements;
        }
    }

    printf("INFO : A + B correct within error 2^(-36) epsilon\n");

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

    return exit_status;

}

