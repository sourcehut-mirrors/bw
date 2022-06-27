
/*
 * array_offset.c compute array offset
 *
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

