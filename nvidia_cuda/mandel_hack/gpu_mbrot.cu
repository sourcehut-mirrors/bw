
/* Please see https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#global

   and read below for the __device__ decoration which claims :

       The __global__ and __device__ execution space specifiers
       cannot be used together.

  Also note that __fma_rn is an intrinsic double precision
  call in the GPU which performs the x * y + z as a single
  operation in round-to-nearest-even mode

    __device__ double __fma_rn ( double  x, double  y, double  z ) 

  See https://docs.nvidia.com/cuda/cuda-math-api/group__CUDA__MATH__INTRINSIC__DOUBLE.html#group__CUDA__MATH__INTRINSIC__DOUBLE_1g57cb4940e3202c0e1302aa71703b7761

  Also please read the goodness from some cool human on the
  NVidia dev forums : 

  https://forums.developer.nvidia.com/t/error-kernel-launch-from-device-or-global-functions-requires-separate-compilation-mode/271568/2


  You are evidently confused about the decorators __global__, __device__ and when to use them.

__global__ is used to mark a kernel definition only. It indicates code that will run on the device.

__device__ (by itself) is used to mark code that will run on the device, but is not a kernel by itself.

vectorMult should be marked with __global__, what you have there is correct.

deviceMultiply is called from device code (from the vectorMult kernel.) it must be marked with __device__.

allocatedDeviceMemory is called from host code and is expected to run on the host. It should not be marked with __device__.

executeKernel is host code. It should not be marked with __global__.

deallocatedMemory is host code. It should not be marked with __device__.

performTest is host code. It should not be marked with __device__.


*/

#include <inttypes.h>
#include "mand.h"

__global__ void gpu_mbrot( const double *c_r, const double *c_i,
       uint32_t *mval, int num_elements )
{

    int i = blockDim.x * blockIdx.x + threadIdx.x;

    uint32_t height = 0;
    double zr = 0.0;
    double zi = 0.0;
    double tmp_r, tmp_i;
    double mag = 0.0;
    double temp0, temp1;

    if ( i < num_elements ) {

        while ( ( height < BAIL_OUT ) && ( mag < 4.0 ) ) {

            temp0 = -1.0 * zi * zi;
            tmp_r = __fma_rn( zr, zr, temp0);
            
            temp1 = zr * zi;
            tmp_i = __fma_rn( zr, zi, temp1);

            zr = tmp_r + c_r[i];
            zi = tmp_i + c_i[i];
 
            temp0 = zi * zi;
            mag = __fma_rn( zr, zr, temp0);

            height += 1;
        }

        mval[i] = height;

    }

}


