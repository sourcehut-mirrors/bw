

/*
 * fp_vbox.c compute normalized coordinates in the main plot region
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
 *
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
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#if _XOPEN_SOURCE - 0 >= 600
#define __XSI_VISIBLE           600
#undef _POSIX_C_SOURCE
#define _POSIX_C_SOURCE         200112

#include <fenv.h>
#ifndef __FAST_MATH__
#pragma STDC FENV_ACCESS ON
#endif
#pragma STDC FP_CONTRACT ON
#endif



#include <math.h>
#include "mandelbrot.h"

void fp_vbox(int Vr, int Vj, int Sr, int Sj,
             int real_range, int imag_range,
             fp64_cplex *cplex)
{

    /* try to reduce the number of floating point operations */
    int numerator = 2 * Vr * VBOX_SAMPLE_REAL + 2 * Sr - real_range + 1;
    cplex->r = numerator / ( 1.0 * real_range );

    numerator = 2 * Vj * VBOX_SAMPLE_IMAG + 2 * Sj - imag_range + 1;
    cplex->j = numerator / ( 1.0 * imag_range );

}

