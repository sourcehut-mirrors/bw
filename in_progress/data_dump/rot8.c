
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

uint64_t rot8(uint64_t x)
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

