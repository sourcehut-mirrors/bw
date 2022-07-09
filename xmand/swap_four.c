
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

#include <inttypes.h>

#include "mandelbrot.h"

uint32_t swap_four(uint32_t x)
{
    uint32_t result, b[4] = {0,0,0,0};

    b[0] = ( ( x & 0xff ) << 24 );
    b[1] = ( ( x & 0xff00 ) << 8 );
    b[2] = ( ( x & 0xff0000 ) >> 8 );
    b[3] = ( ( x & 0xff000000 ) >> 24 );

    result = b[0] | b[1] | b[2] | b[3];

    return result;

}

