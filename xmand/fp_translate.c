

/*
 * fp_translate.c compute complex coordinates
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

#include <math.h>
#include "mandelbrot.h"

void fp_translate(double r, double j, double magnify,
                  double t_r, double t_j, fp64 *cplex)
{

    /* given some normalized coordinates ( r, j ) within our plot
     * region we may easily translate to the centre ( t_r, t_j )
     * with a given magnification. */
    cplex->r = t_r + r * DEFAULT_REAL_WIDTH / ( 2.0 * magnify );
    cplex->j = t_j + j * DEFAULT_IMAG_HEIGHT / ( 2.0 * magnify );

}

