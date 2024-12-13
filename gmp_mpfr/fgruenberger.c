
/*
 * fgruenberger.c    An implementation of the Fred Gruenberger
 *                   loop as presented in 1984 :
 *
 *            JOURNAL ARTICLE : COMPUTER RECREATIONS
 *
 *            "How to handle numbers with thousands of
 *            digits, and why one might want to."
 *
 *            Fred Gruenberger
 *
 *            Scientific American
 *            Vol. 250, No. 4 (April 1984), pp. 19-27 (13 pages)
 *
 * Here I use the GMP math library to get precise integer values
 * on each loop. We know that the final result should be in the
 * vicinity of 674530.470741084559 and as near as I can compute
 * we need a LOT of digits to correctly represent the final loop
 * value. Roughly 939524102 digits and you need room for all the
 * intermediate values also. A very big problem in 1984.
 *
 * ------------------------------------------------------------------
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

#define _XOPEN_SOURCE 600
#define VERBOSE 1
#define SYSINFO_FAIL 127

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

#include "gmp.h"
#include "tdiff.h"

int sysinfo(int verbose);

int
main ( int argc, char **argv )
{

    int j, loop_limit, err_clock;
    size_t num_bytes;
    long candidate_input;
    struct timespec tn_begin, tn_0, tn_1;
    tdiff_type delta_time;
    double total_time = 0.0;
    mpz_t g0, g1;

    if ( sysinfo(VERBOSE) == SYSINFO_FAIL ) {
        fprintf(stderr,"WARN : we may not have valid system info.\n");
    }

    printf("GMP  library: %d.%d.%d\n",
            __GNU_MP_VERSION,
            __GNU_MP_VERSION_MINOR,
            __GNU_MP_VERSION_PATCHLEVEL );
    printf("-------------------------------------------------------------------\n");


    /* we may or may not have CLOCK_MONOTONIC implemented */
    clockid_t clock_flag;

    errno = 0;
    clock_flag = CLOCK_MONOTONIC;
    err_clock = clock_gettime(clock_flag, &tn_begin);
    if ( err_clock != 0 ) {
        fprintf(stderr,"FAIL : ");
        if ( errno == ENOSYS ) {
            fprintf(stderr,"clock_gettime() not supported\n");
            return EXIT_FAILURE;
        }

        if ( errno == EINVAL ) {
            fprintf(stderr,"CLOCK_MONOTONIC not known\n");
            errno = 0;
            clock_flag = CLOCK_REALTIME;
            err_clock = clock_gettime(clock_flag, &tn_begin);

            if ( err_clock != 0 ) {
                if ( errno == EINVAL ) {
                    /* Not very likely to ever happen as CLOCK_REALTIME
                     * shall always be implemented if the clock_gettime()
                     * function exists. */
                    fprintf(stderr,"FAIL : CLOCK_REALTIME not supported\n");
                    fprintf(stderr,"     : your system is bork bork bork\n");
                    return EXIT_FAILURE;
                }
                fprintf(stderr,"FAIL : bizarre error. good luck.\n");
                return EXIT_FAILURE;
            }
        }
    }

    if ( argc > 1 ) {
        errno = 0;
        candidate_input = strtol(argv[1], (char **)NULL, 10);

        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ) {
            fprintf(stderr,"WARN : loop limit not understood\n");
            perror("     ");
            fprintf(stderr,"     : we shall assume 12 loops.\n");
            loop_limit = 12;
        }

        if ( ( candidate_input < 2 ) || ( candidate_input > 28 ) ) {
            fprintf(stderr,"WARN : strange input. we shall assume 28 loops.\n");
            fprintf(stderr,"     : hundreds of millions of digits needed.\n");
            loop_limit = 28;
        } else {
            loop_limit = (int)candidate_input;
        }

    } else {
        fprintf(stderr,"WARN : no loop limit entered\n");
        fprintf(stderr,"     : we shall assume 12 loops\n");
        loop_limit = 12;
    }
    fprintf(stderr,"\n");

    mpz_inits ( g0, g1, NULL);
    mpz_set_ui ( g0, 10000001);

    printf ("%3i    ", 1);
    num_bytes = mpz_out_str (stdout, 10, g0);
    printf ("\n    %14i digits\n", (int)num_bytes);

    for ( j = 0; j < (loop_limit-1); j++ ) {
        err_clock = clock_gettime(clock_flag, &tn_0);
        mpz_mul (g1, g0, g0);
        err_clock = clock_gettime(clock_flag, &tn_1);
        err_clock = tdiff( &delta_time, tn_0, tn_1);
        total_time += delta_time.delta;

        printf ("\n%3i    ", j+2);
        num_bytes = mpz_out_str(stdout, 10, g1);
        printf ("\n    %14i digits\n", (int)num_bytes);
        printf ("       t0  %7i secs %9i nsec\n", tn_0.tv_sec, tn_0.tv_nsec);
        printf ("       t1  %7i secs %9i nsec    compute dt = %-+20.10g\n",
                                tn_1.tv_sec, tn_1.tv_nsec, delta_time.delta);

        err_clock = clock_gettime(clock_flag, &tn_1);
        err_clock = tdiff( &delta_time, tn_0, tn_1);
        printf ("       out %7i secs %9i nsec     output dt = %-+20.10g\n",
                                tn_1.tv_sec, tn_1.tv_nsec, delta_time.delta);

        mpz_set (g0, g1);

    }

    mpz_clears ( g0, g1, NULL);

    err_clock = tdiff( &delta_time, tn_begin, tn_1);
    printf ("\n\nTotal computation time %-+20.10g secs\n", total_time);
    printf ("\nWith stdout %7i secs %9i nsecs\n",
                                           delta_time.sec, delta_time.nsec);

    EXIT_SUCCESS;

}

