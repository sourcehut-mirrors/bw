
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
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

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
    uint64_t k, number;
    collatz_type clatz;

    /* allocate an empty bucket for a future hailstone */
    struct hailstone_t *hs = calloc(1, sizeof(struct hailstone_t));
    struct hailstone_t *last_hailstone = NULL;
    /* not necessary but pedantic to set next pointer NULL */
    hs->next = NULL;
    hs->prev = NULL;

    /* beginning of the hailstone list */
    struct hailstone_t *hailstone_ptr = hs;

    int hs_count = 0;

    /* Track when a hailstone happens and it is more dynamic
     * than seen before.
     */
    int big_upwards = 0;

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
        fprintf(stderr,"     : optional flags may also be entered\n");
        fprintf(stderr,"     : thus -> %s N v\n", argv[0]);
        fprintf(stderr,"     : that provides verbose output.\n");
        fprintf(stderr,"     : You may provide an additional flag\n");
        fprintf(stderr,"     : thus -> %s N v v\n", argv[0]);
        fprintf(stderr,"     : To process only N verbosely.\n");
        fprintf(stderr,"     : WARNING : you are wasting your life!\n");
        return EXIT_FAILURE;
    }

    /* There are a few problems with the Collatz Conjecture and
     * the hailstone ( up and down and up and down ) is cool.
     *
     * Here is the sequence for N = 9 :
     *
     *   9 -> 28 
     *     -> 14 ->  7
     *     -> 22 -> 11 
     *     -> 34 -> 17 
     *     -> 52 -> 26 -> 13
     *     -> 40 -> 20 -> 10 -> 5
     *     -> 16 -> 8 ->  4 ->  2 -> 1
     *
     * Above we see the sequence goes upwards 7 time.
     */

    /* After a whack of OCD fiddling around we have this header */
    printf ("--------------------------------");
    printf ("--------------------------------\n");
    printf ("       start   path_len    max_at             max");
    printf ("  hailstone\n");
    printf ("--------------------------------");
    printf ("--------------------------------\n");

    for ( k = 1; k <= number; k++ ) {
        clatz.c0 = k;

        /* If the extra verbose flag exists then we never get here.
         * Thus the verbosity flag here is hard coded to 0.
         */
        if ( c_do( &clatz, 0 ) == EXIT_FAILURE ) {
            fprintf(stderr,"FAIL : computer says \"No\"\n");
            return EXIT_FAILURE;
        }

        /* the actual data line for k */
        if ( debug ) {
            c_out(&clatz);
        }

        /* track the hailstones */
        if ( clatz.upwards_count > big_upwards ) {
            big_upwards = clatz.upwards_count;
            hs->c0 = clatz.c0;
            hs->path_len = clatz.path_len;
            hs->height_location = clatz.height_location;
            hs->path_height = clatz.path_height;
            hs->upwards_count = clatz.upwards_count;

            /* We actually have data */
            last_hailstone = hs;

            printf ("%12" PRIu64 "   %8i", clatz.c0, clatz.path_len);

            printf("    %6" PRIu64 "    %12" PRIu64,
                clatz.height_location,
                clatz.path_height);

            printf("   %8i\n", clatz.upwards_count);

            /* Make an empty hailstone */
            hs->next = calloc(1, sizeof(struct hailstone_t));
            hs->next->prev = hs;
            hs = hs->next;
            hs->next = NULL;

            hs_count += 1;
        }
    }

    if ( debug ) {
        printf ("\n\n %i hailstones\n", hs_count);
        printf ("--------------------------------");
        printf ("--------------------------------\n");
        printf ("       start   path_len    max_at");
        printf ("             max  hailstone\n");
        printf ("--------------------------------");
        printf ("--------------------------------\n");

        hs_count = 0;
        while ( hailstone_ptr->next != NULL ) {
            hs_count += 1;
            printf("%4i : ", hs_count);
            printf("%12" PRIu64 "   %8i",
                    hailstone_ptr->c0,
                    hailstone_ptr->path_len);
    
            printf("    %6" PRIu64 "    %12" PRIu64,
                    hailstone_ptr->height_location,
                    hailstone_ptr->path_height);
    
            printf("   %8i\n",
                    hailstone_ptr->upwards_count);
    
            hailstone_ptr = hailstone_ptr->next;
        }
    }

    printf("\n\nfree the list %i \n", hs_count);
    do {
        printf("free(%p)\n",last_hailstone->next);
        free(last_hailstone->next);
        last_hailstone->next = NULL;
        hs_count -= 1;
        printf("%i \n", hs_count);
        last_hailstone = last_hailstone->prev;
    } while ( last_hailstone != NULL );
    printf("\n");

    return EXIT_SUCCESS;

}

