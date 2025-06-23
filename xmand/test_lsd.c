
/**********************************************************************
 * test_lsd.c test a really trippy colour map for the mandelbrot
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
#include <stdint.h>
#include <errno.h>
#include <inttypes.h>

uint32_t linear_inter( uint8_t  in_val,
                       uint32_t low_col, uint32_t high_col,
                       uint8_t  low_val, uint8_t upper_val);

int main(int argc, char **argv)
{

    /*  range val
     *   0 - 31  : dark blue     ->  light blue
     *             0x0b104b          0x6973ee
     *
     *  32 - 63  : light blue    ->  light red
     *             0x6973ee          0xf73f3f
     *
     *  64 - 127 : light red     ->  dark cyan
     *             0xf73f3f          0xb7307b
     *
     * 128 - 159 : dark cyan     ->  bright yellow
     *             0xb7307b          0xecff3a
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
     * 240 - 255 : magenta       -> white
     *             0xff00ff         0xffffff
     */

    errno = 0;
    uint8_t tester = 0;
    uint32_t cpixel = 0;

    if ( argc < 2 ) return ( EXIT_FAILURE );

    int candidate_int = (int)strtol(argv[1], (char **)NULL, 10);
    if ( errno ) {
        fprintf(stderr,"FAIL : what did you enter?\n");
        if ( errno == ERANGE ) {
            fprintf(stderr,"FAIL : integer out of range?\n");
        }
        if ( errno == EINVAL ) {
            fprintf(stderr,"FAIL : integer invalid?\n");
        }
        perror("     ");
        return ( EXIT_FAILURE );
    }

    if ( ( candidate_int < 0 ) || ( candidate_int > 255 ) ){
        fprintf(stderr,"WARN : be positive 8 bit my dude\n");
        return ( EXIT_FAILURE );
    }

    tester = (uint8_t)candidate_int;

    if ( tester < 32 ) {
        cpixel = linear_inter( tester, (uint32_t)0x0b104b,
                                       (uint32_t)0x6973ee,
                                       (uint8_t)0, (uint8_t)31);
    } else if ( ( tester > 31 ) && ( tester < 64 ) ) {
        cpixel = linear_inter( tester, (uint32_t)0x6973ee,
                                       (uint32_t)0xf73f3f,
                                       (uint8_t)32, (uint8_t)63);
    } else if ( ( tester > 63 ) && ( tester < 128 ) ) {
        cpixel = linear_inter( tester, (uint32_t)0xf73f3f,
                                       (uint32_t)0xb7307b,
                                       (uint8_t)64, (uint8_t)127);
    } else if ( ( tester > 127 ) && ( tester < 160 ) ) {
        cpixel = linear_inter( tester, (uint32_t)0xb7307b,
                                       (uint32_t)0xecff3a,
                                       (uint8_t)128, (uint8_t)159);
    } else if ( ( tester > 159 ) && ( tester < 192 ) ) {
        cpixel = linear_inter( tester, (uint32_t)0xecff3a,
                                       (uint32_t)0x721a1a,
                                       (uint8_t)160, (uint8_t)191);
    } else if ( ( tester > 191 ) && ( tester < 224 ) ) {
        cpixel = linear_inter( tester, (uint32_t)0x721a1a,
                                       (uint32_t)0x00ff00,
                                       (uint8_t)192, (uint8_t)223);
    } else if ( ( tester > 223 ) && ( tester < 240 ) ) {
        cpixel = linear_inter( tester, (uint32_t)0x00ff00,
                                       (uint32_t)0xff00ff,
                                       (uint8_t)224, (uint8_t)239);
    } else if ( tester > 239 ) {
        cpixel = linear_inter( tester, (uint32_t)0xff00ff,
                                       (uint32_t)0xffffff,
                                       (uint8_t)240, (uint8_t)255);
    }

    printf ( "  0x%06" PRIx32 "\n", cpixel );

    return ( EXIT_SUCCESS );

}

