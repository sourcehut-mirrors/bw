
/*
 * array_offset.c compute array offset
 *
 * Copyright (C) Dennis Clarke 2022
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

/* The actual complex coordinates are stored in 
 * two large arrays. coord_r will be all the real
 * values whereas coord_j shall hold the imaginary
 * component of any given sample point.
 *
 * The plot surface is also the sample set and it consists
 * of VBOX_REAL_COUNT*VBOX_IMAG_COUNT smaller "vbox" regions
 * with a total of VBOX_SAMPLE_REAL*VBOX_SAMPLE_IMAG samples
 * each.
 *
 * If we use the default numbers : 
 *
 *     VBOX_REAL_COUNT = 16
 *     VBOX_IMAG_COUNT = 16
 *     VBOX_SAMPLE_REAL = 64
 *     VBOX_SAMPLE_IMAG = 64
 *
 * then we easily see we have a 16x16 grid of sample set vbox
 * regions with 64x64 samples each. To index into the memory
 * arrays created below we need a small bit of math to find
 * the correct sample point.  For a sample [Sr,Sj] within a
 * vbox [Vbox_r,Vbox_j] we may index thus :
 *
 *              index = Vbox_r * VBOX_SAMPLE_REAL + Sr
 *
 *                    + Vbox_j * VBOX_REAL_COUNT
 *                             * VBOX_SAMPLE_REAL
 *                             * VBOX_SAMPLE_IMAG
 *
 *                    + Sj * VBOX_REAL_COUNT * VBOX_SAMPLE_REAL;
 *
 * Please see test code index_check.c where this has been
 * verified.
 */

#include "mandelbrot.h"

int array_offset(int Vr, int Vj, int Sr, int Sj) {

    return   Vr * VBOX_SAMPLE_REAL + Sr

           + Vj * VBOX_REAL_COUNT
                * VBOX_SAMPLE_REAL
                * VBOX_SAMPLE_IMAG

           + Sj * VBOX_REAL_COUNT * VBOX_SAMPLE_REAL;

}

