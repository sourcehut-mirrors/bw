
/* Please see https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#global

   and read below for the __device__ decoration which claims :

       The __global__ and __device__ execution space specifiers
       cannot be used together.

  Also note that __fma_rn is an intrinsic double precision
  call in the GPU which performs the x * y + z as a single
  operation in round-to-nearest-even mode

    __device__ double __fma_rn ( double  x, double  y, double  z ) 

  See https://docs.nvidia.com/cuda/cuda-math-api/group__CUDA__MATH__INTRINSIC__DOUBLE.html#group__CUDA__MATH__INTRINSIC__DOUBLE_1g57cb4940e3202c0e1302aa71703b7761

*/

#include <inttypes.h>
#include "mand.h"

__device__ void gpu_mbrot( const double *c_r, const double *c_i,
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


