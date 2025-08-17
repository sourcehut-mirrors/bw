
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
 * intermediate values also. A very big problem in 1984. Good luck
 * with floating point. One would need more than 3,121,031,510 bits.
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
#include <string.h>
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
    struct timespec tn_begin, tn_0, tn_1, tn_end;
    tdiff_type delta_time;

    /* for the sake of plotting a graph we shall track the compute
     * times per iteration */
    double fg[29], mgst[29];
    double mpz_mul_time = 0.0;
    double mpz_get_str_time = 0.0;

    mpz_t g0, g1;
    char *gmp_out_buf = NULL;

    /* The libGMP call to create the char string output requires
     * a NULL *char ptr as a parameter. Otherwise weird things
     * happen. At least for me I saw a sigSEGV nasty stuff. */
    char *null_ptr = NULL;

    /* This next little buffer wwill be for the actual char string
     * to be dumped onto stdout. Not the whole damn result as that
     * would be out of control massive. Thing is a GB of digits. */
    char *prn_buf = NULL;

    /* We may or may not have CLOCK_MONOTONIC implemented and thus
     * we test for what does exist and set a clockid_t type. */
    clockid_t clock_flag;

    /* The LLVM/Clang compiler can be a real whiner about
     * things declared and not defined. Thus this is a way
     * to tell the compiler to shut up. */
    tn_0.tv_sec = 0;
    tn_0.tv_nsec = 0;
    tn_1.tv_sec = 0;
    tn_1.tv_nsec = 0;
    tn_begin.tv_sec = 0;
    tn_begin.tv_nsec = 0;
    tn_end.tv_sec = 0;
    tn_end.tv_nsec = 0;

    if ( sysinfo(VERBOSE) == SYSINFO_FAIL ) {
        fprintf(stderr,"WARN : we may not have valid system info.\n");
    }

    printf("GMP  library: %d.%d.%d\n",
            __GNU_MP_VERSION,
            __GNU_MP_VERSION_MINOR,
            __GNU_MP_VERSION_PATCHLEVEL );
    printf("-------------------------------------------------------------------\n");

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
            fprintf(stderr,"     : we shall assume 8 loops.\n");
            loop_limit = 8;
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
        fprintf(stderr,"     : we shall assume 8 loops\n");
        loop_limit = 8;
    }
    fprintf(stderr,"\n");

    mpz_inits(g0, g1, NULL);
    mpz_set_ui(g0, 10000001);
    /* we know that initially the compute time is zero */
    fg[0] = 0.0;

    prn_buf = calloc(80,sizeof(unsigned char));
    if ( prn_buf == NULL ) {
        fprintf(stderr,"FAIL : calloc? really?\n");
        return EXIT_FAILURE;
    }

    err_clock = clock_gettime(clock_flag, &tn_0);
    gmp_out_buf = mpz_get_str(null_ptr, 10, g1);
    err_clock = clock_gettime(clock_flag, &tn_1);
    err_clock = tdiff( &delta_time, tn_0, tn_1);
    mpz_get_str_time += delta_time.delta;
    mgst[0] = delta_time.delta;

    if ( gmp_out_buf == NULL ) {
        fprintf(stderr,"FAIL : mpz_get_str()\n");
        return EXIT_FAILURE;
    } else {
        num_bytes = strlen(gmp_out_buf);
        /* printf("INFO : mpz_get_str() returns %li bytes\n", (int)num_bytes); */

        /* This is where OpenSSL can be used to get a SHA512
         * hash of the data in gmp_out_buf however we display
         * only 72 chars of that. For obvious reasons. */
        strncpy(prn_buf, gmp_out_buf, 72);
        printf("  1    : %s\n", prn_buf);
        printf("    %14i digits\n\n", (int)num_bytes);
        /* slide in a dirty nul char at byte 0 */
        prn_buf[0]='\0';

        free(gmp_out_buf);
        gmp_out_buf = NULL;

    }

    for ( j = 0; j < (loop_limit-1); j++ ) {
        err_clock = clock_gettime(clock_flag, &tn_0);
        mpz_mul(g1, g0, g0);
        err_clock = clock_gettime(clock_flag, &tn_1);
        err_clock = tdiff( &delta_time, tn_0, tn_1);
        fg[j+1] = delta_time.delta;
        mpz_mul_time += delta_time.delta;

        /* Once upon a time we would output the whole nasty long
         * string of digits thus :
         *
         *      num_bytes = mpz_out_str(stdout, 10, g1);
         *
         * We do not do that anymore for reasons of sanity.
         */

        err_clock = clock_gettime(clock_flag, &tn_0);
        gmp_out_buf = mpz_get_str(null_ptr, 10, g1);
        err_clock = clock_gettime(clock_flag, &tn_1);
        err_clock = tdiff( &delta_time, tn_0, tn_1);
        mgst[j+1] = delta_time.delta;
        mpz_get_str_time += delta_time.delta;

        strncpy(prn_buf, gmp_out_buf, 72);
        printf("%3i    : %s", j+2, prn_buf);
        num_bytes = strlen(gmp_out_buf);
        if (num_bytes>72) printf("...");
        printf("\n");
        prn_buf[0]='\0';

        printf ("    %14i digits    dt = %-.9f     mgs_dt = %-.9f\n\n",
                           (int)num_bytes, fg[j+1], mgst[j+1]);

        free(gmp_out_buf);
        gmp_out_buf = NULL;

        mpz_set(g0, g1);

    }

    mpz_clears( g0, g1, NULL);
    free(prn_buf);
    prn_buf = NULL;

    err_clock = clock_gettime(clock_flag, &tn_end);
    err_clock = tdiff( &delta_time, tn_begin, tn_end);

    printf ("\n              total mpz_mul time     %-.9f secs\n",
                                       mpz_mul_time);

    printf ("\n              total mpz_get_str time %-.9f secs\n",
                                       mpz_get_str_time);

    printf ("\n              total execute time     %-.9f secs\n",
                                       delta_time.delta);

    printf("\n------ compute time and mpz_get_str times ------\n");
    for (j = 0; j < loop_limit; j++ ) {
        printf ("%3i      %-.9f      %-.9f\n",j+1,fg[j],mgst[j]);
    }
    printf("------------------------------------------------\n");

    EXIT_SUCCESS;

}

