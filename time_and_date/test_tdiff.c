
/*
 * test_tdiff.c   fire some numbers at tdiff() and see if the results
 *                are reasonable
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

    double billion = 1000000000.0;
    double fp64_delta;

    /* we may or may not have CLOCK_MONOTONIC implemented */
    clockid_t clock_flag;

    tdiff_type delta_time;

    /* we can begin with the case examples in the tdiff.c
     * sources
     *
     * Case (1) where t0 sec > t1 sec
     *
     *        tn_0                    tn_1
     * (1.1)  108.925                 102.655
     * (1.2)  277.186                 192.186
     * (1.3)  126.587                 104.816
     *
     * Case (2) where t0 sec == t1 sec
     *
     *        tn_0                    tn_1
     * (2.1)  1718602045.843710014    1718602045.714047011
     * (2.2)  1718666491.595164076    1718666491.595164076
     * (2.3)  1718604178.149045751    1718604178.457419106
     *
     * Case (3) where t0 sec < t1 sec
     *
     *        tn_0                    tn_1
     * (3.1)  54387.390145701         68712.127084199
     * (3.2)  1718604178.123456789    1718604192.123456789
     * (3.3)  1718604178.047684173    1718607011.094571341
     *
     *
     * In all circumstances we need a delta report that seems to
     * be a resonable number. Simply using sec = 0 and nsec = -23
     * is of little value. 
     *
     * Perhaps a double would not be a terrible idea. At the very
     * least one should have a usable numerical result.
     *
     * */

    /*
     *        tn_0                    tn_1
     * (1.1)  108.925                 102.655
     *             delta = -6.27 secs
     */
    tn_0.tv_sec = 108;            tn_0.tv_nsec = 925000000;
    tn_1.tv_sec = 102;            tn_1.tv_nsec = 655000000;

    printf("Case ( 1.1 ) tn_0 = %10ld    %9ld\n",
                                tn_0.tv_sec, tn_0.tv_nsec);
    printf("             tn_1 = %10ld    %9ld\n",
                                tn_1.tv_sec, tn_1.tv_nsec);

    tdiff( &delta_time, tn_0, tn_1);

    printf("   expected delta = -6.27\n");
    printf("            delta = %10ld    %9ld\n",
                             delta_time.sec, delta_time.nsec);

    printf("             fp64 = %-+20.10g\n\n", delta_time.delta);

    /*
     *        tn_0                    tn_1
     * (1.2)  277.186                 192.186
     *             delta = -85.000
     */
    tn_0.tv_sec = 277;            tn_0.tv_nsec = 186000000;
    tn_1.tv_sec = 192;            tn_1.tv_nsec = 186000000;

    printf("Case ( 1.2 ) tn_0 = %10ld    %9ld\n",
                                tn_0.tv_sec, tn_0.tv_nsec);
    printf("             tn_1 = %10ld    %9ld\n",
                                tn_1.tv_sec, tn_1.tv_nsec);

    tdiff( &delta_time, tn_0, tn_1);

    printf("   expected delta = -85.0\n");
    printf("            delta = %10ld    %9ld\n",
                             delta_time.sec, delta_time.nsec);

    printf("             fp64 = %-+20.10g\n\n", delta_time.delta);

    /*
     *        tn_0                    tn_1
     * (1.3)  126.587                 104.816
     *             delta = -21.771
     */
    tn_0.tv_sec = 126;            tn_0.tv_nsec = 587000000;
    tn_1.tv_sec = 104;            tn_1.tv_nsec = 816000000;

    printf("Case ( 1.3 ) tn_0 = %10ld    %9ld\n",
                                tn_0.tv_sec, tn_0.tv_nsec);
    printf("             tn_1 = %10ld    %9ld\n",
                                tn_1.tv_sec, tn_1.tv_nsec);

    tdiff( &delta_time, tn_0, tn_1);

    printf("   expected delta = -21.771\n");
    printf("            delta = %10ld    %9ld\n\n",
                             delta_time.sec, delta_time.nsec);

    printf("             fp64 = %-+20.10g\n\n", delta_time.delta);

    /* section ( 2 )
     *
     *        tn_0                    tn_1
     * (2.1)  1718602045.843710014    1718602045.714047011
     *             delta = -0.129663003
     *
     *   +-------------------------------------+
     *   | Here we need a better output format |
     *   +-------------------------------------+
     */
    tn_0.tv_sec = 1718602045;     tn_0.tv_nsec = 843710014;
    tn_1.tv_sec = 1718602045;     tn_1.tv_nsec = 714047011;

    printf("Case ( 2.1 ) tn_0 = %10ld    %9ld\n",
                                tn_0.tv_sec, tn_0.tv_nsec);
    printf("             tn_1 = %10ld    %9ld\n",
                                tn_1.tv_sec, tn_1.tv_nsec);

    tdiff( &delta_time, tn_0, tn_1);

    printf("   expected delta = -0.129663003\n");
    printf("            delta = %10ld    %9ld\n\n",
                             delta_time.sec, delta_time.nsec);

    printf("             fp64 = %-+20.10g\n\n", delta_time.delta);

    /*
     *        tn_0                    tn_1
     * (2.2)  1718668074.456789001    1718668074.456789001
     *             delta = 0
     */
    tn_0.tv_sec = 1718668074;     tn_0.tv_nsec = 456789001;
    tn_1.tv_sec = 1718668074;     tn_1.tv_nsec = 456789001;

    printf("Case ( 2.2 ) tn_0 = %10ld    %9ld\n",
                                tn_0.tv_sec, tn_0.tv_nsec);
    printf("             tn_1 = %10ld    %9ld\n",
                                tn_1.tv_sec, tn_1.tv_nsec);

    tdiff( &delta_time, tn_0, tn_1);

    printf("   expected delta = 0.0\n");
    printf("            delta = %10ld    %9ld\n\n",
                             delta_time.sec, delta_time.nsec);

    printf("             fp64 = %-+20.10g\n\n", delta_time.delta);

    /*
     *        tn_0                    tn_1
     * (2.3)  1718604178.149045751    1718604178.457419106
     *             delta = 0.308373355 
     */
    tn_0.tv_sec = 1718604178;     tn_0.tv_nsec = 149045751;
    tn_1.tv_sec = 1718604178;     tn_1.tv_nsec = 457419106;

    printf("Case ( 2.3 ) tn_0 = %10ld    %9ld\n",
                                tn_0.tv_sec, tn_0.tv_nsec);
    printf("             tn_1 = %10ld    %9ld\n",
                                tn_1.tv_sec, tn_1.tv_nsec);

    tdiff( &delta_time, tn_0, tn_1);

    printf("   expected delta = 0.308373355\n");
    printf("            delta = %10ld    %9ld\n\n",
                             delta_time.sec, delta_time.nsec);

    printf("             fp64 = %-+20.10g\n\n", delta_time.delta);

    /*
     *        tn_0                    tn_1
     * (3.1)  54387.390145701         68712.127084199
     *             delta = 14324.736938498
     */
    tn_0.tv_sec = 54387;     tn_0.tv_nsec = 390145701;
    tn_1.tv_sec = 68712;     tn_1.tv_nsec = 127084199;

    printf("Case ( 3.1 ) tn_0 = %10ld    %9ld\n",
                                tn_0.tv_sec, tn_0.tv_nsec);
    printf("             tn_1 = %10ld    %9ld\n",
                                tn_1.tv_sec, tn_1.tv_nsec);

    tdiff( &delta_time, tn_0, tn_1);

    printf("   expected delta = 14324.736938498\n");
    printf("            delta = %10ld    %9ld\n\n",
                             delta_time.sec, delta_time.nsec);

    printf("             fp64 = %-+20.10g\n\n", delta_time.delta);

    /*
     *        tn_0                    tn_1
     * (3.2)  1718604178.123456789    1718604192.123456789
     *             delta = 14.0
     */
    tn_0.tv_sec = 1718604178;     tn_0.tv_nsec = 123456789;
    tn_1.tv_sec = 1718604192;     tn_1.tv_nsec = 123456789;

    printf("Case ( 3.2 ) tn_0 = %10ld    %9ld\n",
                                tn_0.tv_sec, tn_0.tv_nsec);
    printf("             tn_1 = %10ld    %9ld\n",
                                tn_1.tv_sec, tn_1.tv_nsec);

    tdiff( &delta_time, tn_0, tn_1);

    printf("   expected delta = 14.0\n");
    printf("            delta = %10ld    %9ld\n\n",
                             delta_time.sec, delta_time.nsec);

    printf("             fp64 = %-+20.10g\n\n", delta_time.delta);

    /*
     *        tn_0                    tn_1
     * (3.3)  1718604178.047684173    1718607011.094571341
     *             delta = 2833.046887168
     */
    tn_0.tv_sec = 1718604178;     tn_0.tv_nsec = 47684173;
    tn_1.tv_sec = 1718607011;     tn_1.tv_nsec = 94571341;

    printf("Case ( 3.3 ) tn_0 = %10ld    %9ld\n",
                                tn_0.tv_sec, tn_0.tv_nsec);
    printf("             tn_1 = %10ld    %9ld\n",
                                tn_1.tv_sec, tn_1.tv_nsec);

    tdiff( &delta_time, tn_0, tn_1);

    printf("   expected delta = 2833.046887168\n");
    printf("            delta = %10ld    %9ld\n\n",
                             delta_time.sec, delta_time.nsec);

    printf("             fp64 = %-+20.10g\n\n", delta_time.delta);

    return EXIT_SUCCESS;


    printf("\n\n\n\n---------------------------------------\n\n");
    printf(" A small slice of collatz conjecture.\n");
    printf("---------------------------------------\n");

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
            fprintf(stderr,"WARN : using CLOCK_REALTIME\n");
        }
    }

    /* wtf?
    sin_num = fileno(stdin);
    out_num = fileno(stdout);
    err_num = fileno(stderr);
    */


    /* slam in some collatz conjecture madness to chew up
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

    err_clock = clock_gettime(clock_flag, &tn_1);
    err_clock = tdiff( &delta_time, tn_0, tn_1);
    printf("\n  collatz t_delta = %10ld    %9ld\n\n",
                             delta_time.sec, delta_time.nsec);


    printf ("\n\n====== done with collatz for now ======\n\n");

    errno = 0;
    /* pi seconds would be 3 141 593 micro-secs */
    printf("\nINFO : calling usleep( 3141593 )\n");
    sleep_time = usleep( 3141593 );
    if ( errno == EINTR ) {
        fprintf(stderr,"\nINFO : Really? you really did that?\n");
    }
    printf("     : sleep_time is %i\n\n", sleep_time);

    err_clock = clock_gettime(clock_flag, &tn_0);
    err_clock = tdiff( &delta_time, tn_1, tn_0);

    printf("INFO : fileno(stdin)  = %i\n", sin_num);
    printf("     : fileno(stdout) = %i\n", out_num);
    printf("     : fileno(stderr) = %i\n", err_num);

    printf("\n\nAlso maybe pi tdelta secs = %ld\n", delta_time.sec);
    printf("                    nsecs = %ld\n", delta_time.nsec);

    return EXIT_SUCCESS;

}

