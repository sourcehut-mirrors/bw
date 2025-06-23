
/*
 * mbrot.c Overly long and winding code chunk that draws the mandelbrot
 *         via X11 calls and with POSIX threads dispatched for select
 *         regions.
 *
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


#include <stdint.h>
#include <stdlib.h>
#include "mandelbrot.h"

uint32_t mbrot( double c_r, double c_i, uint32_t bail_out )
{

    /* point c belongs to the Mandelbrot set if and only if
     * the magnitude of the f(c) <= 2.0 */
    uint32_t height = 0;
    double zr = 0.0;
    double zi = 0.0;
    double tmp_r, tmp_i;
    double mag = 0.0;

    while ( ( height < bail_out ) && ( mag <= 4.0 ) ) {
        tmp_r = ( zr * zr ) - ( zi * zi );
        tmp_i = ( zr * zi ) + ( zr * zi );
        zr = tmp_r + c_r;
        zi = tmp_i + c_i;

        /* mag = sqrt( zr * zr + zi * zi ); */
        mag = zr * zr + zi * zi;

        height += 1;
    }

    return ( height );

}

