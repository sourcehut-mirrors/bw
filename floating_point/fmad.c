
#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <stdint.h>

size_t bin_printf ( uint8_t* f, size_t n );

int main(int argc, char **argv)
{

/* see 
   https://docs.nvidia.com/cuda/floating-point/index.html#comparison
 */

    float a[4] = {  1.907607f,  -0.7862027f, 1.147311f,  0.9604002f };
    float b[4] = { -0.9355000f, -0.6915108f, 1.724470f, -0.7097529f };

    /* by default we should get 64-bit floating point from the data */
    double a64[4] = {  1.907607,  -0.7862027, 1.147311,  0.9604002 };
    double b64[4] = { -0.9355000, -0.6915108, 1.724470, -0.7097529 };

    /* for the sake of being a geek */
    long double a128[4] = {  1.907607L,  -0.7862027L, 1.147311L,  0.9604002L };
    long double b128[4] = { -0.9355000L, -0.6915108L, 1.724470L, -0.7097529L };

    float dotme_fp32 =

         a[0] * b[0]

         +

         a[1] * b[1]

         +

         a[2] * b[2]
    
         +

         a[3] * b[3];


    printf("d32   = %-+24.18e\n", dotme_fp32);
    printf("dotme_fp32 is at %p\n", &dotme_fp32);
    for (int j=0; j<sizeof(float); j++) {
        printf("0x%02x ", ((uint8_t *)&dotme_fp32)[j] );
    }
    printf("\n");
    bin_printf ( (uint8_t*)&dotme_fp32, sizeof(dotme_fp32));

    double dotme_fp64 =

         a64[0] * b64[0]

         +

         a64[1] * b64[1]

         +

         a64[2] * b64[2]
    
         +

         a64[3] * b64[3];

    printf("d64   = %-+24.18e\n", dotme_fp64);
    printf("dotme_fp64 is at %p\n", &dotme_fp64);
    for (int j=0; j<sizeof(double); j++) {
        printf("0x%02x ", ((uint8_t *)&dotme_fp64)[j] );
    }
    printf("\n");

    long double dotme_fp128 =

         a128[0] * b128[0]

         +

         a128[1] * b128[1]

         +

         a128[2] * b128[2]
    
         +

         a128[3] * b128[3];

    printf("d128  = %-+24.18Le\n", dotme_fp128);
    printf("dotme_fp128 is at %p\n", &dotme_fp128);
    for (int j=0; j<sizeof(long double); j++) {
        printf("0x%02x ", ((uint8_t *)&dotme_fp128)[j] );
    }
    printf("\n");

    printf("      = +5.595788259858e-02 is correct\n");
    printf("trust this 0x3faca682f76db9b9 from ARMv8\n");
    printf("or maybe   0x3faca682f76db9c0 on Fujitsu SPARC VII+\n");
    printf("also fp128 0x3ffaca682f76db9db367bf4a016eb280\n");

    printf ("\nNOTE : IBM Power systems may report strange hex values\n");

    return 42;

    /* ARMv8 claims the following 

    0.055957882598579763
    0x3faca682f76db9b9

                    10111001 at the ULP end

    Whereas SPARC VII+ Fujitsu stuff claims 

    0x3faca682f76db9c0

                    1100 0000 at the ULP end of things

    NOTE that the armv8 actually uses FMAD thanks to Nico !
 
   */

}

