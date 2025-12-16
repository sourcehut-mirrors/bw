
/*
 * collatz.c  Collatz Conjecture again? With libgmp integers.
 * ------------------------------------------------------------------
 * Copyright (C) Dennis Clarke 2025
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
#include <inttypes.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <sys/utsname.h>
#include <errno.h>

#include <gmp.h>

#include "collatz.h"

#define VERBOSE 1

int main(int argc, char *argv[]) 
{
    int debug = 0;
    int return_status;
    uint64_t candidate_n;
    mpz_t k, number, end_loop;
    stuff_t clatz;

    mpz_inits (k, number, end_loop,
               clatz.c0,
               clatz.height_location,
               clatz.path_height, NULL);

    struct stuff_t *hs = calloc(1, sizeof(struct stuff_t));
    struct stuff_t *first_hailstone = hs;
    struct stuff_t *last_hailstone = hs;
    struct stuff_t *hailstone_ptr = first_hailstone;
    int hs_count = 0;
    int big_upwards = 0;

    /* not necessary but pedantic to set next pointer NULL */
    hs->next = NULL;
    hs->prev = NULL;

    setlocale( LC_ALL, "C" );
    errno = 0;
    if ( argc > 1 ){

        candidate_n = (int)strtol(argv[1], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : integer not understood\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        if ( candidate_n < 4 ) {
            fprintf(stderr,"WARN : you are unreasonable\n");
            return EXIT_FAILURE;
        }

        mpz_set_ui(number, (unsigned long int)candidate_n);
        mpz_set_ui(clatz.c0, (unsigned long int)candidate_n);

        if ( argc > 2 ) {
            debug = VERBOSE;
        }
    } else {
        fprintf(stderr,"FAIL : please enter a starting number.\n");
        return EXIT_FAILURE;
    }

    /* After a whack of OCD fiddling around we have this header */
    printf ("--------------------------------");
    printf ("--------------------------------\n");
    printf ("       start   path_len    max_at             max");
    printf ("  hailstone\n");
    printf ("--------------------------------");
    printf ("--------------------------------\n");

    mpz_set_ui(k, 1);
    mpz_set_ui(end_loop, (unsigned long int)(candidate_n + 1));

    /* for ( k = 1; k < (number+1); k++ ) { */
    do {

        mpz_set(clatz.c0, k);

        if ( c_do( &clatz, debug ) == EXIT_FAILURE ) {
            fprintf(stderr,"FAIL : oops ... something bad happened\n");
            return EXIT_FAILURE;
        }

        if ( debug ) {
            c_out(&clatz);
        }

        /* here we can track the big hailstones *
        if ( clatz.upwards_count > big_upwards ) {
            big_upwards = clatz.upwards_count;
            hs->c0 = clatz.c0;
            hs->path_len = clatz.path_len;
            hs->height_location = clatz.height_location;
            hs->path_height = clatz.path_height;
            hs->upwards_count = clatz.upwards_count;
            last_hailstone = hs;

            printf ("%12" PRIu64 "   %8i",
                clatz.c0,
                clatz.path_len);

            printf("    %6" PRIu64 "    %12" PRIu64,
                clatz.height_location,
                clatz.path_height);

            printf("   %8i\n",
                clatz.upwards_count);

            ******* make an empty hailstone ********
            hs->next = calloc(1, sizeof(struct hailstone_t));
            hs->next->prev = hs;
            hs = hs->next;
            hs->next = NULL;

            hs_count += 1;
        }
    */

        /* k++ */
        mpz_add_ui(k, k, 1);

        /* do while k < (number+1) */
    } while ( mpz_cmp(k, end_loop) < 0 );

    return EXIT_SUCCESS;

}

