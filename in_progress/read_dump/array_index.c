
/*
 * array_index.c   compute of an offset into linear arrays that
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
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <inttypes.h>

/*
 * There is paperwork on this somewhere ... no idea where.
 *
 * However it works!
 *
 * There is a grid of sample regions called "vbox" and there
 * seems to be vbox_real_count x vbox_imag_count of them.
 * However the offset into the linear array only requires that
 * we pass in the vbox_real_count value. So if there are 16 x 16
 * of them we only care about the vbox_real_count = 16 part.
 *
 * We do need the width and height of the vbox region as samples
 * measured vbox_sample_real x vbox_sample_imag which may be
 * something like 64 x 64 = 4096 samples.
 *
 * To find the index into the absolute top right corner of the
 * sample space we need vbox[15][15] and then inside that region
 * we have actual sample [63][63] with a packed data structure
 * of :
 *
 *   IEEE-754-2008 FP64 real coordinate is 8 bytes little endian
 *                 FP64 imaginary coordinate also
 *                 uint32_t integer value is 4 bytes
 *
 * The index into the linear array would be :
 *
 *           array_index(15,15,63,63,16,64,64)
 *
 * that should be 1048575 as we have 16^2  x  64^2  data points.
 *
 * A typical call would look like : 
 *
 *     printf("     : r[15][15][63][63] = %-+32.26e\n",
 *      mandelbrot_file->mandelbrot_data->coord_r[array_index(15,15,63,63,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);

    printf("     : j[15][15][63][63] = %-+32.26e\n",
            mandelbrot_file->mandelbrot_data->coord_j[array_index(15,15,63,63,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);


    printf("     :       mand_height = %9i\n",
            mandelbrot_file->mandelbrot_data->mandel_val[array_index(15,15,63,63,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);

 *
 * see the guts in xmand_read.c for examples that work neatly.
 *
 *
 * For the sake of duplication : 
 *
 *
 * For a sample [Sr,Sj] within a
 * vbox [Vbox_r,Vbox_j] we may index :
 *
 *
 *   index = Vbox_r x VBOX_SAMPLE_REAL + Sr
 *
 *         + Vbox_j x VBOX_REAL_COUNT
 *                  x VBOX_SAMPLE_REAL
 *                  x VBOX_SAMPLE_IMAG
 *
 *         + Sj * VBOX_REAL_COUNT * VBOX_SAMPLE_REAL
 * 
 */

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

    int result = part1 + (int)Sr + part2 + part3;

    return result;

}

