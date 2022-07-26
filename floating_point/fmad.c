
/*
 * fmad.c test for fused multiply add opcodes and results
 * Copyright (C) Dennis Clarke 2022
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * https://www.gnu.org/licenses/gpl-3.0.txt
 */

/*********************************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 *
 *********************************************************************/

#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <stdint.h>
#include <math.h>

static int endian( void );

int main(int argc, char **argv)
{

    /* For a brief explanation and also bad numerical results see :
     *
     * https://docs.nvidia.com/cuda/floating-point/index.html#comparison
     *
     * However we shall use the fused multiply add example data.
     *
     * ARMv8 claims the following
     *
     *    0.055957882598579763
     *    0x3faca682f76db9b9
     *
     * Note the binary 10111001 at the ULP end
     *
     * Whereas SPARC VII+ Fujitsu stuff claims
     *
     *    0x3faca682f76db9c0
     *
     * See the 1100 0000 at the ULP
     *
     *    NOTE that the armv8 actually uses FMAD
     *        thanks to Nico Sonack for the tests.
     *
     * Also here "ULP" means unit of least precision.
     * Please see Handbook for Floating Point Mathematics,
     * 2nd Edition.
     *
     * The IBM Power systems and IBM MainFrame systems will
     * implement a strange IBM datatype for the 128-bit values.
     * In memory we will see they are really the concatonation
     * of two FP64 double types. We must use the _float128 style
     * datatype to get the real thing in compliance with the
     * IEEE754-2008 specifications. This is a hack to ensure that
     * the IBM systems have backwards compatibility.
     *
     */

    /* some 32 bit floating point numbers */
    volatile float a[4] = {  1.907607f,  -0.7862027f, 1.147311f,  0.9604002f };
    volatile float b[4] = { -0.9355000f, -0.6915108f, 1.724470f, -0.7097529f };

    /* 64-bit floating point */
    volatile double a64[4] = {  1.907607,  -0.7862027, 1.147311,  0.9604002 };
    volatile double b64[4] = { -0.9355000, -0.6915108, 1.724470, -0.7097529 };

    /* Most systems do not implement the IEEE754-2008 datatype for
     * the 128-bit floating point operations. In fact, the x86 hardware
     * will fail entirely and only handle 80bits of data. Having said
     * this we should point out that x86 hardware will allocate all
     * 16bytes of memory for the data elements but only uses 10 bytes.
     * Thus x86 hardware throws away 32.5% of the memory used. */
    volatile long double a128[4] = {  1.907607L,  -0.7862027L, 1.147311L,  0.9604002L };
    volatile long double b128[4] = { -0.9355000L, -0.6915108L, 1.724470L, -0.7097529L };

    /* places to drop results */
    volatile float dotme_fp32;
    volatile double dotme_fp64;
    volatile long double dotme_fp128;

    size_t j;

    printf("NOTE : this machine is a ");
    if ( endian() ){
        printf ("big");
    } else {
        printf ("little");
    }
    printf (" endian architecture.\n");
    printf ("     : Be sure to adjust your brain accordingly.\n\n\n");

    printf("--------------- Maybe no FMA Calls ---------------\n\n");

    /* first test is to try the trivial multiplication and addition as
     * separate operations. The compiler may choose to implement FMA
     * opcodes with the right CFLAGS. */
    dotme_fp32 =

         a[0] * b[0]

         +

         a[1] * b[1]

         +

         a[2] * b[2]

         +

         a[3] * b[3];


    printf("        fp32  = %-+24.18e\n", (double)dotme_fp32);
    /* we can print out the hex bytes */
    printf("dotme_fp32  is ");
    for (j=0; j<sizeof(float); j++) {
        printf("0x%02x ", ((uint8_t *)&dotme_fp32)[j] );
    }
    printf("\n\n");

    /* A silly test to see what the cast to double
     * is doing. The data we get from a 32bit float :
     *
     *     0x3d6533f0
     *
     *        0011 1101 0110 0101 0011 0011 1111 0000
     *           3    d    6    5    3    3    f    0
     *
     *        seee eeee e110 0101 0011 0011 1111 0000
     *
     * Where s is a sign bit and the 'e' means exponent bit.
     *
     *
     * The actual data  1.1100 1010 0110 0111 1110 0000
     * Those bits are repacked for 4bit alignment and we see
     * the implied leading invisible "1." bit.
     *
     * Thus the double FP64 bits will be :
     *
     *     0x3faca67e0000....
     *
     *       0011 1111 1010 1100 1010 0110 0111 1110 0000000....
     *       seee eeee eeee 1100 1010 0110 0111 1110  perfect match
     *
     *
    dotme_fp64 = (double)dotme_fp32;
    printf("\n-------------- gack ------------\n");
    printf("dotme_fp32 casted is (double)dotme_fp32\ndotme_fp64  is ");
    for (j=0; j<sizeof(double); j++) {
        printf("0x%02x ", ((uint8_t *)&dotme_fp64)[j] );
    }
    printf("\n");
    printf("\n-------------- gack ------------\n");
    */


    /* next test is to use the very well implemented 64-bit datatype.
     *
     * WARNING : most NVidia GPU technology has the FP64 operations
     *           disabled or severly crippled at the factory.
     *           The only reasonable GPU options seem to be Quadro
     *           branded and only on very select and expensive cards.
     */

    dotme_fp64 =

         a64[0] * b64[0]

         +

         a64[1] * b64[1]

         +

         a64[2] * b64[2]

         +

         a64[3] * b64[3];

    printf("        fp64  = %-+24.18e\n", dotme_fp64);
    printf("dotme_fp64  is ");
    for (j=0; j<sizeof(double); j++) {
        printf("0x%02x ", ((uint8_t *)&dotme_fp64)[j] );
    }
    printf("\n\n");

    /* For the sake of the test we shall attempt to use the 128-bit
     * datatype. The only systems that implement this datatype and
     * related operations in hardware would be the IBM POWER9 and
     * IBM POWER10 and IBM MainFrame systems. All others seem to
     * emit software traps and software emulation.
     *
     * see https://git.sr.ht/~racingmars/pi_fp_test/tree/master/item/README
     *
     */
    dotme_fp128 =

         a128[0] * b128[0]

         +

         a128[1] * b128[1]

         +

         a128[2] * b128[2]

         +

         a128[3] * b128[3];

    printf("        fp128 = %-+24.18Le\n", dotme_fp128);
    printf("dotme_fp128 is ");
    for (j=0; j<sizeof(long double); j++) {
        printf("0x%02x ", ((uint8_t *)&dotme_fp128)[j] );
    }
    printf("\n\n\n\n");

    printf("-------------------- FMA Calls -------------------\n\n");
    /* From the NVidia documentation noted above we see
     *
     *     FMA Method to Compute Vector Dot Product. The FMA method
     *     uses a simple loop with fused multiply-adds to compute the
     *     dot product of the vectors.
     *
     *     The final result can be represented as
     *
     *     a4 x b4 = (a3 x b3 + (a2 x b2 + (a1 x b1 + 0)))
     *
     * We also see that the documentation at the NVidia site is wrong
     * as the above is clearly not the final result. One more FMA call
     * is required.
     *
     * These are the fma calls to use with C99 : 
     *
     *       float       fmaf(float x, float y, float z);
     *       double       fma(double x, double y, double z);
     *       long double fmal(long double x, long double y, long double z);
     *
     */

    dotme_fp32 = fmaf( a[3], b[3], fmaf( a[2], b[2], fmaf( a[1], b[1], fmaf( a[0], b[0], 0.0f ))));

    printf("  fmaf fp32   = %-+24.18e\n", (double)dotme_fp32);
    /* we can print out the hex bytes */
    printf("dotme_fp32  is ");
    for (j=0; j<sizeof(float); j++) {
        printf("0x%02x ", ((uint8_t *)&dotme_fp32)[j] );
    }
    printf("\n");



    dotme_fp64 = fma( a64[3], b64[3], fma( a64[2], b64[2], fma( a64[1], b64[1], fma( a64[0], b64[0], 0.0 ))));

    printf("  fma  fp64   = %-+24.18e\n", dotme_fp64);
    printf("dotme_fp64  is ");
    for (j=0; j<sizeof(double); j++) {
        printf("0x%02x ", ((uint8_t *)&dotme_fp64)[j] );
    }
    printf("\n");



    dotme_fp128 = fmal( a128[3], b128[3], fmal( a128[2], b128[2], fmal( a128[1], b128[1], fmal( a128[0], b128[0], 0.0L ))));

    printf("  fmal fp128  = %-+24.18Le\n", dotme_fp128);
    printf("dotme_fp128 is ");
    for (j=0; j<sizeof(long double); j++) {
        printf("0x%02x ", ((uint8_t *)&dotme_fp128)[j] );
    }
    printf("\n\n\n");

    printf("--------------------------------------------------\n\n");


    /* this is just reference data stuff */
    printf("\nCorrect result is +5.595788259858e-02\n");
    printf("or this    0x3faca682f76db9b9 from ARMv8\n");
    printf("or maybe   0x3faca682f76db9c0 on Fujitsu SPARC VII+\n");
    printf("also fp128 0x3ffaca682f76db9db367bf4a016eb280\n");

    printf ("\nNOTE : IBM Power systems may report strange fp128 hex values\n");

    return 42;

}

static int endian( void )
{
    int eflag = 1; /* 0x00000001 big endian */
    eflag = (*(uint8_t*)&eflag == 1) ? 0 : 1;
    return eflag;
}

