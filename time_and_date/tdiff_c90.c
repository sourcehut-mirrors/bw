
/*
 * tdiff_c90.c  entirely strict compliant ISO9899:1990 code to return
 *              a struct which holds the time delta between two timespec
 *              parameters.
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

#define _XOPEN_SOURCE 500

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <errno.h>

#include "tdiff.h"

int
main ( int argc, char **argv )
{
    struct timespec tn_0, tn_1;
    int err_clock, sin_num, out_num, err_num;
    int sleep_time;
    int collatz, current_val, loop_count, altitude, bail_out=100;

    tdiff_type delta_time;

    /* we may or may not have CLOCK_MONOTONIC implemented */
    clockid_t clock_flag;

    errno = 0;
    clock_flag = CLOCK_MONOTONIC;
    err_clock = clock_gettime(clock_flag, &tn_0);
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
            err_clock = clock_gettime(clock_flag, &tn_0);

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

    sin_num = fileno(stdin);
    out_num = fileno(stdout);
    err_num = fileno(stderr);

    /* slam in some collatz conjecture madness to suck up
     * a bit of time ... */
    collatz = 2;
    loop_count = 0;
    altitude = collatz;
    current_val = collatz;
wam:
    loop_count += 1;
    if ( collatz%2 == 1 ) {
        collatz = collatz * 3 + 1;
        altitude = ( collatz > altitude ) ? collatz : altitude;
        /* printf ("       %04i    %i\n", loop_count, collatz); */
        goto wam;
    } else {
        collatz = collatz >> 1;
        /* printf ("       %04i    %i\n", loop_count, collatz); */
    }
    if ( collatz != 1 ) goto wam;
    printf ("%4i    %04i    %i\n", current_val, loop_count, altitude);
    if ( current_val < bail_out ) {
        current_val += 1;
        collatz = current_val;
        loop_count = 0;
        altitude = collatz;
        goto wam;
    }

    errno = 0;
    /* sort of pi seconds would be 3 141 593 micro-secs */
    sleep_time = usleep( 3141593 );
    if ( errno == EINTR ) {
        fprintf(stderr,"\nINFO : Really? you really did that?\n");
    }
    printf("\nINFO : well sleep_time is now %i\n", sleep_time);

    /* we should not get an error from this given all the checks
     * that were done above */
    err_clock = clock_gettime(clock_flag, &tn_1);
    err_clock = tdiff( &delta_time, tn_0, tn_1);

    printf("INFO : fileno(stdin)  = %i\n", sin_num);
    printf("     : fileno(stdout) = %i\n", out_num);
    printf("     : fileno(stderr) = %i\n", err_num);

    printf("\n\nAlso maybe tdelta secs = %i\n", delta_time.sec);
    printf("                 nsecs = %i\n", delta_time.nsec);

    return EXIT_SUCCESS;

}

