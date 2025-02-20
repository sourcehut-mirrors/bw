
/*
 * test_popcount.c accept some input integer number and then try
 *                 to count the '1' bits
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2025 Dennis Clarke
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

#include <errno.h>
#include <inttypes.h>
#include <stdlib.h>
#include <stdio.h>

#include "popcount.h"

int main( int argc, char **argv )
{
    unsigned long long j, test;
    int k, p, in, count = -1;

    if ( argc > 1 ) {

        in = (int)strtol(argv[1], (char **)NULL, 10);

        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : input not understood\n");
            perror("     ");
            return EXIT_FAILURE;
        }

        if ( in < 0 ) {
            fprintf(stderr,"WARN : input is negative?\n");
            fprintf(stderr,"     : good luck.\n");
        }

        test = (unsigned long long)in;

    } else {
        fprintf(stderr,"USAGE : %s an_integer\n", argv[0]);
        return EXIT_FAILURE;
    }

    /* bit shifting and counting where this is not
     * even remotely efficient
     *
     *   k will be the number of '1' bits
     *   j is the number being tested
     *   p is the bit position being tested
     */

    k = 0;
    j = test;
    p = 0;

    while (j) {
        if ( j & 1 ) { /* test the LSB position */
            k += 1;    /* count the '1' bit */
        }
        j = j >> 1;    /* shift left */
        p += 1;        /* keep track of the bit position */
    }
    printf("INFO : shifting counted %i\n", k);

    count = popcount( test );
    printf("     : popcount returns %i\n", count);

    return EXIT_SUCCESS;

}

