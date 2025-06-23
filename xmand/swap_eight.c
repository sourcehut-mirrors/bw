
/*********************************************************************
 * swap_eight.c : in a C90 clean way? we rotate around a 64bit data
 *                element for big endian and little endian systems
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

#include <inttypes.h>
uint64_t swap_eight(uint64_t x)
{

    uint64_t result, b[8] = {0,0,0,0,0,0,0,0};

    b[0] = ( ( x & 0xff ) << 56 );
    b[1] = ( ( x & 0xff00 ) << 40 );
    b[2] = ( ( x & 0xff0000 ) << 24 );
    b[3] = ( ( x & 0xff000000 ) << 8 );
    b[4] = ( ( x & 0xff00000000 ) >> 8 );
    b[5] = ( ( x & 0xff0000000000 ) >> 24 );
    b[6] = ( ( x & 0xff000000000000 ) >> 40 );
    b[7] = ( x >> 56 );

    result = b[0] | b[1] | b[2] | b[3] | b[4] | b[5] | b[6] | b[7];

    return result;

}

