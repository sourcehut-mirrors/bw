
/* file_offset_3_12.c Verify that the math for index into the data
 *                dump file will be correct for vbox ( 3, 12 ).
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

#include <stdio.h>
#include <stdlib.h>
#include "mandelbrot.h"

int main(int argc, char **argv) {

    int Sr, Sj, Vbox_r, Vbox_j;
    int result;

    /* For a sample [Sr,Sj] within a
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
     */

    Vbox_r = 3;
    Vbox_j = 12;

    for ( Sj = 0; Sj < VBOX_SAMPLE_REAL; Sj++ ) {
        for ( Sr = 0; Sr < VBOX_SAMPLE_REAL; Sr++ ) {

            result = array_offset(Vbox_r, Vbox_j, Sr, Sj);
            printf("%7i\n",result);

        } /* end Sr for */
    } /* end Sj for */

    return EXIT_SUCCESS;

}

