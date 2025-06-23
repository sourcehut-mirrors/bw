
/* offset_check.c  Verify that the math for index into the four
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

    for ( Vbox_r = 0; Vbox_r < VBOX_REAL_COUNT; Vbox_r++ ) {
        for ( Vbox_j = 0; Vbox_j < VBOX_IMAG_COUNT; Vbox_j++ ) {
            for ( Sr = 0; Sr < VBOX_SAMPLE_REAL; Sr++ ) {
                for ( Sj = 0; Sj < VBOX_SAMPLE_REAL; Sj++ ) {

                    result = array_offset(Vbox_r, Vbox_j, Sr, Sj);
                    printf("%7i\n",result);

                } /* end Sj for */
            } /* end Sr for */
        } /* end Vbox_j for */
    } /* end Vbox_r for */

    return EXIT_SUCCESS;

}

