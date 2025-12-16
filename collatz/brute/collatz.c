
/*
 * collatz.c  A brief look at the Collatz Conjecture sequence
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
#include <inttypes.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <sys/utsname.h>

#include "collatz.h"

#define VERBOSE 1

int main(int argc, char *argv[]) 
{
    int debug = 0;
    int return_status;
    uint64_t k, number;
    collatz_type clatz;

    /* calloc provides a pile of zero value data elements */
    struct hailstone_t *hs = calloc(1, sizeof(struct hailstone_t));
    struct hailstone_t *first_hailstone = hs;
    struct hailstone_t *last_hailstone = hs;
    struct hailstone_t *hailstone_ptr = first_hailstone;
    int hs_count = 0;
    int big_upwards = 0;

    /* not necessary but pedantic to set next pointer NULL */
    hs->next = NULL;
    hs->prev = NULL;

    setlocale( LC_ALL, "C" );

    if ( argc > 1 ){
        number = (uint64_t)strtoll(argv[1], (char **)NULL, 10);
        if ( number > COLLATZ_LIM ) {
            fprintf(stderr,"FAIL : stay in the uint64_t domain\n");
            return EXIT_FAILURE;
        }
        if ( number < 3 ) {
            fprintf(stderr,"FAIL : be reasonable\n");
            return EXIT_FAILURE;
        }
        clatz.c0 = number;
        if ( argc > 2 ) {
            debug = 1;
        }
        if ( argc > 3 ) {
            c_do( &clatz, VERBOSE );
            return EXIT_SUCCESS;
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

    for ( k = 1; k < (number+1); k++ ) {
        clatz.c0 = k;
        if ( c_do( &clatz, 0 ) == EXIT_FAILURE ) {
            fprintf(stderr,"FAIL : computer says \"No\"\n");
            return EXIT_FAILURE;
        }

        if ( debug ) {
            c_out(&clatz);
        }

        /* here we can track the big hailstones */
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

            /* make an empty hailstone */
            hs->next = calloc(1, sizeof(struct hailstone_t));
            hs->next->prev = hs;
            hs = hs->next;
            hs->next = NULL;

            hs_count += 1;
        }
    }

    if ( c_do( &clatz, 0 ) == EXIT_FAILURE ) {
        fprintf(stderr,"FAIL : something bad happened\n");
        return_status = EXIT_FAILURE;
        goto freeit;
    } else {
        return_status = EXIT_SUCCESS;
    }

    printf ("\n\n-------------- %i hailstones\n", hs_count);
    while ( hailstone_ptr->next != NULL ) {

        printf ("%12" PRIu64 "   %8i",
                hailstone_ptr->c0,
                hailstone_ptr->path_len);

        printf("    %6" PRIu64 "    %12" PRIu64,
                hailstone_ptr->height_location,
                hailstone_ptr->path_height);

        printf("   %8i\n",
                hailstone_ptr->upwards_count);

        hailstone_ptr = hailstone_ptr->next;
    }


freeit:

    /* Actually the really last hailstone in the list
     * was just a pile of zeros. We never did put any
     * data in there.
     */
    free ( last_hailstone->next );
    last_hailstone->next = NULL;

    /* TODO fix this broken shit and only you can
     * stop the SIGSEGV
    while ( last_hailstone != NULL ) {
        last_hailstone = last_hailstone->prev;
        free ( last_hailstone->next );
        if ( last_hailstone != NULL ) {
            last_hailstone->next = NULL;
        }
    }
     */

    return return_status;

}

