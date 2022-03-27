
/* index_check.c  Verify that the math for index into the four
 *                dimensional floating point array will be
 *                correct.
 *
 *                One may run this and send the output to a file.
 *                There will be exactly 1048576 numbers and they
 *                are NOT in numerical order. They represent an
 *                index location for a sample [Sr,Sj] within a
 *                given vbox[Vbox_r,Vbox_j] on the complex plane.
 *
 *                Feel free to sort the output in numerical order
 *                as well as pass to "uniq" to verify that all of
 *                the 16*16*64*64 addresses have been found and
 *                there are no duplicates.
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

#define VBOX_REAL_COUNT 16
#define VBOX_IMAG_COUNT 16
#define VBOX_SAMPLE_REAL 64
#define VBOX_SAMPLE_IMAG 64

int main(int argc, char **argv) {

    int Sr, Sj, Vbox_r, Vbox_j;
    int index;

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

    for ( Vbox_r = 0; Vbox_r < VBOX_REAL_COUNT; Vbox_r++ ) {
        for ( Vbox_j = 0; Vbox_j < VBOX_IMAG_COUNT; Vbox_j++ ) {
            for ( Sr = 0; Sr < VBOX_SAMPLE_REAL; Sr++ ) {
                for ( Sj = 0; Sj < VBOX_SAMPLE_REAL; Sj++ ) {

                    index = Vbox_r * VBOX_SAMPLE_REAL + Sr

                          + Vbox_j * VBOX_REAL_COUNT
                                   * VBOX_SAMPLE_REAL
                                   * VBOX_SAMPLE_IMAG

                          + Sj * VBOX_REAL_COUNT * VBOX_SAMPLE_REAL;

                    printf("%7i\n",index);

                } /* end Sj for */
            } /* end Sr for */
        } /* end Vbox_j for */
    } /* end Vbox_r for */

    return EXIT_SUCCESS;

}

