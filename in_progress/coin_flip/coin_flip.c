
/*
 * coin_flip.c : flip a coin one hundred times in a row and wait to
 *               see results with a large percentage of "heads"
 *
 *      RETURN : This code will return eventually. Maybe. If the
 *               user requests a large percentage of "heads" then
 *               it may run a very long time. There is no promise
 *               that it will ever exit. Good luck.
 *
 *      UPDATE : A bail out condition was needed to have the code
 *               bail out before the heat death of the universe.
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

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <inttypes.h>
#include <time.h>

#define LIMIT 70

int
main ( int argc, char **argv )
{

    /* this code was written with some beers and while
     * ranting about uniform distribution results for
     * a given source of random data. No attempt was
     * made to make the code well organized and variables
     * were tossed into the fray at whim.
     */
    int k, bias = 0;
    uint64_t j;
    int heads, tails;
    int head_count, max_heads_in_a_row;
    int tail_count;
    int max_tails_in_a_row;
    int max_heads_when;
    int max_tails_when;
    int this_flip;
    int limit = LIMIT;
    int64_t loop_up = 0;
    int64_t loop_last = -1;
    int bit_shift = 1;
    double x;
    struct timespec now_time;

    /* did the user suggest a given percentage ? */
    if ( argc > 1 ) {
        /*     * * * *    W  A  R  N  I  N  G    * * * *
         *
         * There is no checking for reasonable data here.
         */
        limit = atoi(argv[1]);
        printf("Geez I hope you really want %i\n", limit );
    }

    /* Get the REALTIME_CLOCK time in a timespec struct */
    if ( clock_gettime(CLOCK_REALTIME, &now_time ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    } else {
        /* call srand48() with the nanosecond time data */
        srand48( (long) now_time.tv_nsec );
    }

    /* this is the iteration counter */
    j = 0;

    max_heads_in_a_row = 0;
    max_tails_in_a_row = 0;
    max_heads_when = 0;
    max_tails_when = 0;
doagain:
    heads = 0;
    tails = 0;
    this_flip = 0;
    head_count = 0;
    tail_count = 0;

    for ( k=0 ; k<100; k++ ) {
        x = drand48();
        if ( x < 0.5 ) {
            tails += 1;
            this_flip = 0;
        } else {
            heads += 1;
            this_flip = 1;
        }

        if ( this_flip == 1 ) {
            head_count += 1;
            tail_count = 0;
            if ( head_count > max_heads_in_a_row ) {
                max_heads_in_a_row = head_count;
                max_heads_when = j;
            }
        } else {
            head_count = 0;
            tail_count += 1;
            if ( tail_count > max_tails_in_a_row ) {
                max_tails_in_a_row = tail_count;
                max_tails_when = j;
            }
        }
    }

    if ( heads > limit ) {
        bias += 1;
    }

    j += 1;

    /* This is just a progress report which will only
     * happen when j is a perfect power of two. Also
     * the power of two is increased with a left bit
     * shift and so you can expect the reports to happen
     * ever more slowly as the code runs. At least we
     * see some sign of activity to let the user know
     * something is running. */
    if ( j & bit_shift ) {
        printf ("\nloop j = %" PRIu64 "\n", j );
        printf ("max number of heads in a row was %i\n", max_heads_in_a_row);
        printf ("max heads happened at loop num   %i\n", max_heads_when);
        printf ("max number of tails in a row was %i\n", max_tails_in_a_row);
        printf ("max tails happened at loop num   %i\n", max_tails_when);
        bit_shift *= 2;
    }

    /* be sure to bail out if we have already run 2^34 loops */
    if ( ( bias < 1 ) && ( j < ( 1L<<34 ) ) ) goto doagain;

    printf ("\nbias events count at %" PRIu64 " for %i%% heads.\n", j, limit );
    printf ("max number of heads in a row was %i\n", max_heads_in_a_row);
    printf ("max heads happened at loop num   %i\n", max_heads_when);
    printf ("max number of tails in a row was %i\n", max_tails_in_a_row);
    printf ("max tails happened at loop num   %i\n", max_tails_when);

    /* Please see "The Hitch Hikers Guide to the Galaxy" */
    return 42;

}

