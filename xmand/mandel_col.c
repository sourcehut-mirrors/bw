
/*
 * mandel_col.c A simple colour map for the mandlebrot
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

#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>

#include "mandelbrot.h"

unsigned long mandle_col ( uint8_t height )
{
    unsigned long cpixel = 0;
    /* the idea on the table is to compute a reasonable
     * 32 bit value for RGBA data based on a range of
     * possible mandlebrot evaluations :
     *
     *  range val
     *   0 - 31  : dark blue     -> light blue
     *             0x0b104b         0x6973ee
     *
     *  32 - 63  : light blue    -> light red
     *             0x6973ee         0xf73f3f
     *
     *  64 - 127 : light red     -> dark cyan
     *             0xf73f3f         0xb7307b
     *
     * 128 - 159 : dark cyan     -> bright yellow
     *             0xb7307b         0xecff3a
     *
     * 160 - 191 : bright yellow -> dark red
     *             0xecff3a         0x721a1a
     *
     * 192 - 223 : dark red      -> green
     *             0x721a1a         0x00ff00
     *
     * 224 - 239 : green         -> magenta
     *             0x00ff00         0xff00ff
     *
     * 11 May 2021 lets try to smooth this out and avoid
     * a transition to pure white 0xffffff where really
     * we need to wrap around the 8-bit colour index to
     * the start value dark blue 0x0b104b
     * 240 - 255 : magenta       -> white
     *             0xff00ff         0xffffff
     *                              0x0b104b  <-- try this
     */

    if ( height < 32 ) {
        cpixel = linear_inter( height, (uint32_t)0x0b104b,
                                       (uint32_t)0x6973ee,
                                       (uint8_t)0, (uint8_t)31);
    } else if ( ( height > 31 ) && ( height < 64 ) ) {
        cpixel = linear_inter( height, (uint32_t)0x6973ee,
                                       (uint32_t)0xf73f3f,
                                       (uint8_t)32, (uint8_t)63);
    } else if ( ( height > 63 ) && ( height < 128 ) ) {
        cpixel = linear_inter( height, (uint32_t)0xf73f3f,
                                       (uint32_t)0xb7307b,
                                       (uint8_t)64, (uint8_t)127);
    } else if ( ( height > 127 ) && ( height < 160 ) ) {
        cpixel = linear_inter( height, (uint32_t)0xb7307b,
                                       (uint32_t)0xecff3a,
                                       (uint8_t)128, (uint8_t)159);
    } else if ( ( height > 159 ) && ( height < 192 ) ) {
        cpixel = linear_inter( height, (uint32_t)0xecff3a,
                                       (uint32_t)0x721a1a,
                                       (uint8_t)160, (uint8_t)191);
    } else if ( ( height > 191 ) && ( height < 224 ) ) {
        cpixel = linear_inter( height, (uint32_t)0x721a1a,
                                       (uint32_t)0x00ff00,
                                       (uint8_t)192, (uint8_t)223);
    } else if ( ( height > 223 ) && ( height < 240 ) ) {
        cpixel = linear_inter( height, (uint32_t)0x00ff00,
                                       (uint32_t)0xff00ff,
                                       (uint8_t)224, (uint8_t)239);
    } else if ( height > 239 ) {
        /* see comment above from 11 May 2021 */
        cpixel = linear_inter( height, (uint32_t)0xff00ff,
                                       (uint32_t)0x0b104b,
                                       (uint8_t)240, (uint8_t)255);
    }

    return ( cpixel );

}

