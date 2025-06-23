
/*
 * check_fp_region.c both fp routines should return the same data
 *
 * Copyright Dennis M. Clarke 2019
 *
 *    Permission is hereby granted, free of charge, to any person
 *    obtaining a copy of this software and associated documentation
 *    files (the "Software"), to deal in the Software without
 *    restriction, including without limitation the rights to use,
 *    copy, modify, merge, publish, distribute, sublicense, and/or
 *    sell copies of the Software, and to permit persons to whom the
 *    Software is furnished to do so, subject to the following
 *    conditions:
 *
 *    The above copyright notice and this permission notice shall be
 *    included in all copies or substantial portions of the Software.
 *
 *        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
 *        KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 *        WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 *        PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
 *        OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 *        OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 *        OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 *        SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * ------------------------------------------------------------------
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

#include <fenv.h>
#ifndef __FAST_MATH__
#pragma STDC FENV_ACCESS ON
#endif
#pragma STDC FP_CONTRACT ON

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define VBOX_SAMPLE_REAL 64
#define VBOX_SAMPLE_IMAG 64

/* IEEE754-2008 64bit coordinates where Nico says 
 * "Damn it why not just use the complex data type
 * that we already have!?" Damn it Janet! */
typedef struct {
    double r, j;
} fp64;

void fp_vbox(int Vr, int Vj, int Sr, int Sj,
             int real_range, int imag_range,
             fp64 *cplex)
{

    /* try to reduce the number of floating point operations */
    int numerator = 2 * Vr * VBOX_SAMPLE_REAL + 2 * Sr - real_range + 1;
    cplex->r = numerator / ( 1.0 * real_range );

    numerator = 2 * Vj * VBOX_SAMPLE_IMAG + 2 * Sj - imag_range + 1;
    cplex->j = numerator / ( 1.0 * imag_range );

}

void fp_region(int real, int imag,
               int real_range, int imag_range,
               fp64 *locate)
{

    /* We assume that the real and imag integers are inside
     * the primary plotting region pixel space. Then offset
     * the results such that the center is ( 0.0, 0.0 ) and
     * coordinates are always  -1.0 <= r,j <= +1.0 */

    locate->r = fma( (( 1.0 * real ) / ( 1.0 * real_range )), 2.0, -1.0)
                + ( 1.0 / real_range );

    locate->j = fma( (( 1.0 * imag ) / ( 1.0 * imag_range )), 2.0, -1.0)
                + ( 1.0 / imag_range );

}


int
main ( int argc, char **argv )
{

    int real_samples = 1024;
    int imag_samples = 1024;
    int r_sample, j_sample;
    fp64 some_data;

    for ( r_sample = 511; r_sample < 513; r_sample++ ) {
        for ( j_sample = 511; j_sample < 513; j_sample++ ) {
            fp_region( r_sample, j_sample, real_samples, imag_samples, &some_data);
            printf("[%3i][%3i]     W( %-+32.26e, %-+32.26e )\n", r_sample, j_sample, some_data.r, some_data.j);
        }
    }
    
    /* perform the same computation but with a central offset */
    fp_vbox( 7, 7, 63, 63, real_samples, imag_samples, &some_data);
    printf("[7][7][63][63] W( %-+32.26e, %-+32.26e )\n", some_data.r, some_data.j);

    fp_vbox( 7, 8, 63,  0, real_samples, imag_samples, &some_data);
    printf("[7][8][63][ 0] W( %-+32.26e, %-+32.26e )\n", some_data.r, some_data.j);

    fp_vbox( 8, 7,  0, 63, real_samples, imag_samples, &some_data);
    printf("[8][7][ 0][63] W( %-+32.26e, %-+32.26e )\n", some_data.r, some_data.j);

    fp_vbox( 8, 8,  0,  0, real_samples, imag_samples, &some_data);
    printf("[8][8][ 0][ 0] W( %-+32.26e, %-+32.26e )\n", some_data.r, some_data.j);

    return EXIT_SUCCESS;

}

