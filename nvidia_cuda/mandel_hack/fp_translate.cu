

/*
 * fp_translate.c compute complex coordinates
 *
 *             This is very likely duplicated in the old xmand
 *             directory. However here we do NOT bother with
 *             __FAST_MATH__ or the "pragma STDC FENV_ACCESS ON"
 *             type stuff. No idea why I ever needed/watned that
 *             anyways.
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


#ifndef __mand_h__
#include "mand.h"
#endif

void fp_translate(double r, double j, double magnify,
                  double t_r, double t_j, fp64_cplex *cplex)
{

    /* given some normalized coordinates ( r, j ) within our plot
     * region we may easily translate to the centre ( t_r, t_j )
     * with a given magnification. */
    cplex->r = t_r + r * DEFAULT_REAL_WIDTH / ( 2.0 * magnify );
    cplex->j = t_j + j * DEFAULT_IMAG_HEIGHT / ( 2.0 * magnify );

}


