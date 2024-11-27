
/*
 * sqrt128.c  Trivial compute square root of two and hope the results
 *            make sense somewhere. No promise.
 *
 * -------------------------------------------------------------------
 * Copyright (c) 2019 Dennis Clarke
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
#define _XOPEN_SOURCE 600

#include <math.h>
#include <stdlib.h>
#include <inttypes.h>
#include <stdio.h>
int
main ( int argc, char **argv )
{

    /* In theory we should have data in memory that looks like
     * the following ... on little endian
     *
     * This is the value for 2 which is a perfect trivial number
     * in binary :
     *
     *   0x00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 40
     *                    exponent and sign bit -----+
     *
     * On the rare big-endian system you will see something that
     * looks almost sane to most humans :
     *
     *   0x40 00 00 .... etc etc etc 00 00
     *
     * For the value of sqrt(2) we only get the positive value
     * which on RISC-V rv64imafdc running FreeBSD 15 we see :
     *
     *   0x95 ea 66 13 fb b2 08 c9 bc f3 67 e6 09 6a ff 3f
     *
     *  On big endian old Fujitsu SPARC64 we will see : 
     *
     *   0x3f ff 6a 09 e6 67 f3 bc c9 08 b2 fb 13 66 ea 95
     *
     *  Most x86_64 and AMD64 hardware will be unable to produce
     *  that result due to severly limited hardware where no more
     *  than 80 bits are used for a long double IEEE754 datatype.
     *  Good luck with libquadmath.h and its nefarious friends.
     */

    long double two = 2.0L;
    long double sqrt_two;

    printf("\n-----\nHey there you, we can do the square root of two.\n\n");
    printf("INFO : the sizeof(long double) is %zu bytes.\n", sizeof(long double));

    sqrt_two = sqrtl(two);

    printf("     : sqrt(two) = %-44.38Lg\n", sqrt_two);

    printf("     :     actual  1.414213562373095048801688724209698078569671875...\n");
    printf("     :     also   -1.414213562373095048801688724209698078569671875...\n");

    return EXIT_SUCCESS;

}
