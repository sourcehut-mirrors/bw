
/*
 * c_do.c  Collatz Conjecture calculation function
 *
 * ------------------------------------------------------------------
 * Copyright (C) Dennis Clarke 2019
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

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

/* there should be no reason to need this anymore 
 *   #define __STDC_FORMAT_MACROS
 */
#include <inttypes.h>

#include "collatz.h"

int c_do(collatz_type *cdat, int verbose) 
{

    uint64_t number;

    if ( ( cdat->c0 ) > COLLATZ_LIM ) {
        fprintf(stderr,"FAIL : computation outside uint64_t domain.\n");
        return EXIT_FAILURE;
    }

    cdat->height_location = 0;
    cdat->path_height = cdat->c0;
    cdat->path_len = 0;
    cdat->upwards_count = 0;
    number = cdat->c0;

    if ( verbose ) {
        printf ("        0 : number = %16" PRIu64 " ", number);
        printf ("max_height = %16" PRIu64 "\n", cdat->c0);
    }

    while (number > 1) {

        if (number % 2 == 0) {
            number = number / 2;
        } else {
            if ( number > COLLATZ_LIM ) {

                fprintf(stderr,"FAIL : uint64_t overflow\n");
                fprintf(stderr," cdat->c0 = %16" PRIu64, cdat->c0);
                fprintf(stderr," number   = %16" PRIu64, number);
                fprintf(stderr," path pos = %16i\n", cdat->path_len );

                return EXIT_FAILURE;
            }
            number = 3 * number + 1;
            /* We are curious about hailstone numbers 
             * https://mathworld.wolfram.com/HailstoneNumber.html
             * integers in the Collatz conjecture may rise and fall
             * over and over before dropping to one. Called hailstone
             * numbers which rise and fall. */
            cdat->upwards_count +=1;
        }
        cdat->path_len = cdat->path_len + 1;

        if ( number > ( cdat->path_height ) ) {
            cdat->path_height = number;
            cdat->height_location = (uint64_t)cdat->path_len;
        }

        if ( verbose ) {
            printf (" %8i : number = %16" PRIu64 " ",
                      cdat->path_len, number);
            printf ("max_height = %16" PRIu64 "\n",
                            cdat->path_height );
        }

    }

    return EXIT_SUCCESS;

}

