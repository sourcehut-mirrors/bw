
/*
 * fp_region.c compute normalized coordinates in the main plot region
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

#include <fenv.h>
#ifndef __FAST_MATH__
#pragma STDC FENV_ACCESS ON
#endif
#pragma STDC FP_CONTRACT ON

#include <math.h>
#include "mandelbrot.h"

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

