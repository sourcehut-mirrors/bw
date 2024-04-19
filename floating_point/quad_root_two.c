
/*
 * quad_root_two.c   Merely a look at the fractional parts of the
 *                   third root of two. See further comments below.
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2024 Dennis Clarke
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

/*
 *
 * If one looks at the NIST FIPS 180-4 document for the SHA512
 * algorithm then one will see section 4.2.3 which talks about
 * the fractional hex data for the first eighty prime numbers.
 *
 * Well ... the cube root of two is the first one to look at
 * where the fraction hex data is :
 *
 *    0x42 8a 2f 98 d7 28 ae 22 3d da b7 15 be 25 etc etc
 *
 * Therefore the first constant is 42 8a 2f 98 d7 28 ae 22
 *
 * You can easily see that in the memory representation of
 * the data below. Works great on SPARC and IBM POWER and
 * maybe RISC-V.  Everyone else ... good luck.
 */

#define _XOPEN_SOURCE 500

#include <stdio.h>
#include <math.h>
#include <fenv.h>

int
main ( int argc, char** argv )
{
    int j,k;
    int prime[88];
    long double quad_root_two = 1.259921049894873164767210607278228350570250L;

    printf("go get that yourself %-36.22Le\n", quad_root_two);

    return 42;
}
