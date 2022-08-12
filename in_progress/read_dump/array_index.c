

/*
 * array_index.c   Trivial compute of an offset into large arrays that
 *                 hold the dump data.
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

#include <stdint.h>

int array_index(uint32_t Vr, uint32_t Vj,
                uint32_t Sr, uint32_t Sj,
                uint32_t vbox_real_count,  
                uint32_t vbox_sample_real, 
                uint32_t vbox_sample_imag )
{

    int part1 = (int)Vr * (int)vbox_sample_real;

    int part2 = (int)Vj * (int)vbox_real_count
                        * (int)vbox_sample_real
                        * (int)vbox_sample_imag;

    int part3 = (int)Sj * (int)vbox_real_count
                        * (int)vbox_sample_real;

    /*
    int result =  Vr * vbox_sample_real + Sr

                + Vj * vbox_real_count
                     * vbox_sample_real
                     * vbox_sample_imag

                + Sj * vbox_real_count * vbox_sample_real;
    */

    int result = part1 + (int)Sr + part2 + part3;

    return result;

}

