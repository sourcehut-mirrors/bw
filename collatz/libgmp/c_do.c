
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
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <inttypes.h>
#include <gmp.h>

#include "collatz.h"

int c_do(stuff_t *cdat, int verbose) 
{

    mpz_t number;
    size_t num_bytes;

    mpz_set_ui(cdat->height_location, 0);
    mpz_set(cdat->path_height, cdat->c0) ;
    cdat->path_len = 0;
    cdat->upwards_count = 0;

    mpz_set(number,cdat->c0);

    if ( verbose ) {
        printf ("\n        0 : number = ");

        num_bytes = mpz_out_str(stdout, 10, number);
        if ( num_bytes == 0 ) {
            fprintf(stderr,"\nFAIL : mpz_out_str() bork bork bork\n");
            fprintf(stderr,"     : %s at %i\n",__FILE__,__LINE__);
            exit(EXIT_FAILURE);
        }

        printf ("    max_height = ");
        num_bytes = mpz_out_str(stdout, 10, cdat->c0);
        if ( num_bytes == 0 ) {
            fprintf(stderr,"\nFAIL : mpz_out_str() bork bork bork\n");
            fprintf(stderr,"     : %s at %i\n",__FILE__,__LINE__);
            exit(EXIT_FAILURE);
        }
        printf ("\n");
    }

    while ( mpz_cmp_ui(number, 1) > 0 ) {

        if mpz_even_p(number) {
            mpz_divexact_ui(number, number, 2);
        } else {
            
            mpz_mul_ui(number, number, 3);

            mpz_add_ui(number, number, 1);

            cdat->upwards_count +=1;
        }
        cdat->path_len = cdat->path_len + 1;

        if ( mpz_cmp(number, cdat->path_height ) > 0 ) {
            mpz_set(cdat->path_height, number);
            mpz_set_ui(cdat->height_location, cdat->path_len);
        }

        if ( verbose ) {
            printf ("\n %8i ", cdat->path_len);

            printf(" : number = ");
            num_bytes = mpz_out_str(stdout, 10, number);
            if ( num_bytes == 0 ) {
                fprintf(stderr,"\nFAIL : mpz_out_str() bork bork bork\n");
                fprintf(stderr,"     : %s at %i\n",__FILE__,__LINE__);
                exit(EXIT_FAILURE);
            }

            printf ("    max_height = ");
            num_bytes = mpz_out_str(stdout, 10, cdat->path_height);
            if ( num_bytes == 0 ) {
                fprintf(stderr,"\nFAIL : mpz_out_str() bork bork bork\n");
                fprintf(stderr,"     : %s at %i\n",__FILE__,__LINE__);
                exit(EXIT_FAILURE);
            }
            printf("\n");
        }

    }

    return EXIT_SUCCESS;

}

