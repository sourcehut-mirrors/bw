
/*
 * popcount.c  more or less ripped off from the LLVM codebase
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
int
popcount(unsigned long long a)
{
    unsigned long long x2;
    long long x;
    x2 = a;
    x2 = x2 - ((x2 >> 1) & 0x5555555555555555uLL);
    x2 = ((x2 >> 2) & 0x3333333333333333uLL) + (x2 & 0x3333333333333333uLL);
    x2 = (x2 + (x2 >> 4)) & 0x0F0F0F0F0F0F0F0FuLL;
    x = (long long)(x2 + (x2 >> 32));
    return (int)( (x + (x >> 8)) & 0x0000007F );
}

