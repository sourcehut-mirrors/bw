
/* mpfr.c  Demonstrate libgmp and libmpfr version reports as well
 *         as a computation of pi and Eulers number e with the
 *         provided mpfr function calls. Compute arctan(1) and
 *         then multiply by 4 with the mpfr functions calls.
 *         Check for correct results where reasonable.
 *
 *         Just for fun. There is a nifty little computation
 *         that was written about by Fred Gruenberger way back
 *         in 1984 and it has always been fun to see what very
 *         limited systems do with it. At the moment the old
 *         bc and dc utilities seem to have a real fit with it.
 *
 *         JOURNAL ARTICLE : COMPUTER RECREATIONS
 *
 *         Title : "How to handle numbers with thousands of
 *                  digits, and why one might want to."
 *
 *         Author : Fred Gruenberger
 *
 *         Scientific American : Vol. 250, No. 4 (April 1984),
 *                               pp. 19-27 (13 pages)
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
 *
 * ------------------------------------------------------------------
 * The above text is the "MIT License" which is a permissive free
 * software license originating at the Massachusetts Institute of
 * Technology (MIT) somewhere around 1987 maybe. Who knows? Feel
 * free to read the file README_MIT_LICENSE
 * ------------------------------------------------------------------
 */

/*******************************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *
 *  An XSI-conforming application should ensure that the feature
 *  test macro _XOPEN_SOURCE is defined with the value 600 before
 *  inclusion of any header. This is needed to enable the
 *  functionality described in The _POSIX_C_SOURCE Feature Test
 *  Macro and in addition to enable the XSI extension.
 *******************************************************************/
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <errno.h>
#include <inttypes.h>
#include <locale.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>
#include <sys/utsname.h>
#include <time.h>
#include <unistd.h>

#include <gmp.h>
#include <mpfr.h>

#include "tdiff.h"

#define VERBOSE 1
#define MPFR_VERSION_ERROR 999

int sysinfo(int verbose);
int gmp_mpfr_ver(int *status, int *mpfr_flags);

int main(int argc, char **argv)
{

    mpfr_prec_t prec;
    int j, inex, status, err_clock, mpfr_flags, mpfr_prec_size;
    long candidate_input;

    struct timespec tn_begin, tn_end, t0, t1;
    tdiff_type delta_time;
    double total_time = 0.0;

    /* we may or may not have CLOCK_MONOTONIC implemented */
    clockid_t clock_flag;

    /********************** not needed *******************************
     * Seems we may need to compute the precision in decimal
     * digits for the binary data. Thus we will need the
     * ratio log(2)/log(10) .
     *
     * double bits_per = 0.30102999566398119521373889472449;
     *
     *****************************************************************
     * The MPFR library provides the call : 
     *
     *     size_t mpfr_get_str_ndigits (int b, mpfr_prec_t p)
     *
     *     Return the minimal integer m such that any number of
     *     p bits, when output with m digits in radix b with
     *     rounding to nearest, can be recovered exactly when
     *     read again, still with rounding to nearest.
     */
    size_t decimal_prec;
    char format_buf[64] = "";

    mpfr_t pi_mpfr, e_mpfr, one_mpfr, atan_pi_mpfr,
           atan_pi4_mpfr, third_mpfr, half_mpfr,
           atan_half_mpfr, atan_third_mpfr, sum_mpfr,
           delta_mpfr;

    /* Just for fun. There is a nifty little computation
     * that was written about by Fred Gruenberger way back
     * in 1984 and it has always been fun to see what very
     * limited systems do with it. At the moment the old
     * bc and dc utilities seem to have a real fit with it.
     *
     * JOURNAL ARTICLE : COMPUTER RECREATIONS
     *
     * "How to handle numbers with thousands of digits, and
     * why one might want to."
     *
     * Fred Gruenberger
     *
     * Scientific American
     * Vol. 250, No. 4 (April 1984), pp. 19-27 (13 pages)
     */

    mpfr_t gruenberger_0, gruenberger_1;
    mpfr_t ten_million, one_ten_millionth;

    if ( setlocale(LC_ALL, "C") == NULL ) {
        fprintf(stderr,"FAIL : can not set locale\n");
        return EXIT_FAILURE;
    }

    sysinfo(VERBOSE);

    mpfr_prec_size = gmp_mpfr_ver(&status, &mpfr_flags);
    if ( mpfr_prec_size == MPFR_VERSION_ERROR ) {
        /* That silly magic number will get cleaned
         * up at some point. Just not now.
         * This is silly but could happen I guess */
        fprintf(stderr,"FAIL : bork bork bork\n");
        return EXIT_FAILURE;
    }
    printf("INFO : mpfr_prec_size = %i\n", mpfr_prec_size);

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
                    fprintf(stderr,"     : your system is strange.\n");
                    return EXIT_FAILURE;
                }
                fprintf(stderr,"FAIL : bizarre error. good luck.\n");
                return EXIT_FAILURE;
            }
        }
    }

    /* What follows is a tad clumsy but gets the job done.
     *
     * Try to parse a reasonable integer where strtol really
     * does not care if argv[1] is some trash text. We may end
     * up with a zero value and errno is also a zero. Some
     * platforms will set errno to EINVAL if no conversion
     * could be performed and then return a zero value as the
     * result. No promise. FreeBSD and Solaris correctly set
     * errno to EINVAL but Linux does not. Go ahead and try
     * to input "foobar" as the requested precision.
     *
     * If we are given a numerical value that is out of range
     * for a long integer type then we will use default 113
     * bits of precision as this is similar to the IEEE754-2008
     * binary128 floating point format. If trash text "foobar"
     * is the given input we may be able to trap this with the
     * above noted EINVAL. Or not. Good luck. We shall assume
     * a reasonable precision of 113 bits or perhaps we may
     * assume the binary64 format with 53 bits of data after
     * the exponent bits. Really depends on if we catch EINVAL. */
    if ( argc > 1 ) {
        errno = 0;
        candidate_input = strtol(argv[1], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ) {
            fprintf(stderr,"WARN : precision not understood\n");
            perror("     ");
            fprintf(stderr,"     : we shall assume 113 bits.\n");
            candidate_input = 113;
        }
        if ( candidate_input < 23 ) {
            fprintf(stderr,"WARN : IEEE754 minimum is 23 bits.\n");
            fprintf(stderr,"     : we shall assume 53 bits for binary64 FP64.\n");
            prec = 53;
        } else {
            prec = (mpfr_prec_t)candidate_input;
        }
    } else {
        fprintf(stderr,"WARN : no precision entered.\n");
        fprintf(stderr,"     : we shall assume 113 bits.\n");
        prec = 113;
    }

    decimal_prec = mpfr_get_str_ndigits(10, prec);
    printf("INFO : using %li bits of precision ", (long)prec );
    printf("and %li decimal digits.\n", decimal_prec);

    /* Create MPFR format buffer string with the correct number
     * of decimal digits. NOTE there is not a newline char.
     *
     * NOTE : the use of the asterisk inside the format string seems
     *        to imply that we need to specify the rounding method
     *        thus :  mpfr_printf(format_buf, MPFR_RNDN, foo);
     */
    sprintf(format_buf,"%%.%liR*f", decimal_prec);

    printf("------------------------------------------------------\n");

    mpfr_init2(one_mpfr, prec);
    inex = mpfr_set_flt(one_mpfr, 1.0, MPFR_RNDN);
    if ( inex ) fprintf(stderr,"WARN : mpfr_set_flt() returns %i\n", inex);

    mpfr_init2(half_mpfr, prec);
    inex = mpfr_div_si(half_mpfr, one_mpfr, 2, MPFR_RNDN);
    if ( inex ) fprintf(stderr,"\n\nWARN : mpfr_div_si() returns %i\n\n", inex);

    mpfr_init2(third_mpfr, prec);
    inex = mpfr_div_si(third_mpfr, one_mpfr, 3, MPFR_RNDN);
    if ( inex ) fprintf(stderr,"\n\nWARN : mpfr_div_si() returns %i\n\n", inex);

    if ( clock_gettime(clock_flag, &t0 ) == -1 ) {
        /* We tested this situation above. Very unlikely that
         * we get an error. */
        fprintf(stderr,"ERROR : clock_gettime() failed\n");
        return EXIT_FAILURE;
    }

    /* compute atan(1) */
    mpfr_init2(atan_pi4_mpfr, prec);
    inex = mpfr_atan(atan_pi4_mpfr, one_mpfr, MPFR_RNDN);
    if ( inex ) fprintf(stderr,"WARN : mpfr_atan() returns %i\n\n", inex);

    err_clock = clock_gettime(clock_flag, &t1);
    err_clock = tdiff(&delta_time, t0, t1);
    total_time += delta_time.delta;

    printf ("       t0  %7i secs %9i nsec\n", t0.tv_sec, t0.tv_nsec);
    printf ("       t1  %7i secs %9i nsec    compute dt = %-+20.10g\n\n",
                            t1.tv_sec, t1.tv_nsec, delta_time.delta);

    printf("atan(1)   ");
    mpfr_printf(format_buf, MPFR_RNDN, atan_pi4_mpfr);
    printf("\n\n");


    /* compute atan(1/2) */
    mpfr_init2(atan_half_mpfr, prec);
    err_clock = clock_gettime(clock_flag, &t0);
    inex = mpfr_atan(atan_half_mpfr, half_mpfr, MPFR_RNDN);
    err_clock = clock_gettime(clock_flag, &t1);
    err_clock = tdiff(&delta_time, t0, t1);
    total_time += delta_time.delta;

    printf ("       t0  %7i secs %9i nsec\n", t0.tv_sec, t0.tv_nsec);
    printf ("       t1  %7i secs %9i nsec    compute dt = %-+20.10g\n",
                            t1.tv_sec, t1.tv_nsec, delta_time.delta);

    printf("atan(1/2) ");
    mpfr_printf(format_buf, MPFR_RNDN, atan_half_mpfr);
    printf("\n\n");

    /* compute atan(1/3) */
    mpfr_init2(atan_third_mpfr, prec);
    clock_gettime(clock_flag, &t0);
    inex = mpfr_atan(atan_third_mpfr, third_mpfr, MPFR_RNDN);
    clock_gettime(clock_flag, &t1);
    err_clock = tdiff(&delta_time, t0, t1);
    total_time += delta_time.delta;

    printf ("       t0  %7i secs %9i nsec\n", t0.tv_sec, t0.tv_nsec);
    printf ("       t1  %7i secs %9i nsec    compute dt = %-+20.10g\n",
                            t1.tv_sec, t1.tv_nsec, delta_time.delta);


    printf("atan(1/3) ");
    mpfr_printf(format_buf, MPFR_RNDN, atan_third_mpfr);
    printf("\n\n");

    /* sum atan(1/2) + atan(1/3) */
    mpfr_init2(sum_mpfr, prec);
    clock_gettime(clock_flag, &t0);
    inex = mpfr_add(sum_mpfr, atan_half_mpfr, atan_third_mpfr, MPFR_RNDN);
    clock_gettime(clock_flag, &t1);
    err_clock = tdiff(&delta_time, t0, t1);
    total_time += delta_time.delta;

    printf ("       t0  %7i secs %9i nsec\n", t0.tv_sec, t0.tv_nsec);
    printf ("       t1  %7i secs %9i nsec    compute dt = %-+20.10g\n",
                            t1.tv_sec, t1.tv_nsec, delta_time.delta);

    printf("sum       ");
    mpfr_printf(format_buf, MPFR_RNDN, sum_mpfr);
    printf("\n\n");

    /* check delta on atan(1) and ( atan(1/2) + atan(1/3) ) */
    mpfr_init2(delta_mpfr, prec);
    inex = mpfr_sub(delta_mpfr, sum_mpfr, atan_pi4_mpfr, MPFR_RNDN);
    if ( mpfr_zero_p(delta_mpfr) != 0 ) {
        printf("delta( atan(1) - atan(1/2) - atan(1/3) ) = 0 exactly.");
    } else {
        printf("ERROR : atan(1) - atan(1/2) - atan(1/3) = ");
        mpfr_printf(format_buf, MPFR_RNDN, delta_mpfr);
        printf("\n\n");
    }
    printf("\n\n");

    /* fetch the value for pi from libMPFR */
    mpfr_init2(pi_mpfr, prec);
    clock_gettime(clock_flag, &t0);
    inex = mpfr_const_pi(pi_mpfr, MPFR_RNDN);
    clock_gettime(clock_flag, &t1);
    err_clock = tdiff(&delta_time, t0, t1);
    total_time += delta_time.delta;

    printf ("       t0  %7i secs %9i nsec\n", t0.tv_sec, t0.tv_nsec);
    printf ("       t1  %7i secs %9i nsec    compute dt = %-+20.10g\n",
                            t1.tv_sec, t1.tv_nsec, delta_time.delta);

    printf ("mpfr_const_pi() claims pi may be ");
    mpfr_printf(format_buf, MPFR_RNDN, pi_mpfr );
    printf("\n\n");


    /* Eulers Number e */
    mpfr_init2(e_mpfr, prec);
    clock_gettime(clock_flag, &t0);
    /* compute e^1 */
    inex = mpfr_exp(e_mpfr, one_mpfr, MPFR_RNDN);
    clock_gettime( clock_flag, &t1);
    err_clock = tdiff(&delta_time, t0, t1);
    total_time += delta_time.delta;

    printf ("       t0  %7i secs %9i nsec\n", t0.tv_sec, t0.tv_nsec);
    printf ("       t1  %7i secs %9i nsec    compute dt = %-+20.10g\n",
                            t1.tv_sec, t1.tv_nsec, delta_time.delta);

    printf("Eulers e  ");
    mpfr_printf(format_buf, MPFR_RNDN, e_mpfr);
    printf("\n\n");


    /* multiply atan(1) * 4 */
    mpfr_init2(atan_pi_mpfr, prec);
    clock_gettime(clock_flag, &t0);
    inex = mpfr_mul_si(atan_pi_mpfr, atan_pi4_mpfr, 4, MPFR_RNDN);
    clock_gettime(clock_flag, &t1);
    err_clock = tdiff(&delta_time, t0, t1);
    total_time += delta_time.delta;

    printf ("       t0  %7i secs %9i nsec\n", t0.tv_sec, t0.tv_nsec);
    printf ("       t1  %7i secs %9i nsec    compute dt = %-+20.10g\n",
                            t1.tv_sec, t1.tv_nsec, delta_time.delta);

    printf("4*atan(1) ");
    mpfr_printf(format_buf, MPFR_RNDN, atan_pi_mpfr);
    printf("\n\n");

    inex = mpfr_sub(delta_mpfr, pi_mpfr, atan_pi_mpfr, MPFR_RNDN);
    /* do we really care about the absolute value here? */
    inex = mpfr_abs(delta_mpfr, delta_mpfr, MPFR_RNDN);

    /* see https://www.mpfr.org/mpfr-current/mpfr.html
     *
     * Check that the delta value is actually zero.
     *
     * Function: int mpfr_regular_p (mpfr_t op)
     *
     *    Return non-zero if op zero.
     *    Return zero otherwise. 
     */

    if ( mpfr_zero_p(delta_mpfr) != 0 ) {
        printf("delta( atan(1) * 4 ) - pi = 0 exactly.");
    } else {
        printf("ERROR : delta((4*atan(1)) - pi) = ");
        mpfr_printf(format_buf, MPFR_RNDN, delta_mpfr);
        printf("\n\n");
    }
    printf("\n\n");

    /* free up some memory */
    mpfr_clears(atan_half_mpfr, atan_pi_mpfr, atan_pi4_mpfr,
                atan_third_mpfr, delta_mpfr, e_mpfr, half_mpfr,
                pi_mpfr, sum_mpfr, third_mpfr,
                (mpfr_ptr*) 0 );


    /* Now that cute little problem written about
     * by Fred Gruenberger.
     *
     * However the first problem is there there is no
     * really good way to set the initial value. If
     * we use a long double precision 1.0000001 then
     * we start off with perhaps something close to
     * 1.0000001 but not really. So we have to sum
     * together, with the full specified precision, the
     * value 1 plus 1/10000000 and then see what happens.
     */

    mpfr_init2(ten_million, prec);
    inex = mpfr_set_flt(ten_million, 10000000.0, MPFR_RNDN);

    mpfr_init2(one_ten_millionth, prec);
    inex = mpfr_div(one_ten_millionth, one_mpfr, ten_million, MPFR_RNDN);

    mpfr_init2(gruenberger_0, prec);
    mpfr_init2(gruenberger_1, prec);
    inex = mpfr_add(gruenberger_0, one_mpfr, one_ten_millionth, MPFR_RNDN);

    printf("------------------------------------------------------\n");
    printf("---------- Enter the Fred Gruenberger loop -----------\n");
    printf("loop  0 : ");
    mpfr_printf(format_buf, MPFR_RNDN, gruenberger_0);
    printf("\n\n");
    printf("\n");

    /* free up some memory */
    mpfr_clears(one_mpfr, ten_million, one_ten_millionth,
                (mpfr_ptr*) 0 );

    for ( j = 0; j<27; j++ ) {

        err_clock = clock_gettime(clock_flag, &t0);
        inex = mpfr_mul(gruenberger_1, gruenberger_0, gruenberger_0, MPFR_RNDN);
        err_clock = clock_gettime(clock_flag, &t1);
        err_clock = tdiff(&delta_time, t0, t1);
        total_time += delta_time.delta;

        printf("loop %2i : ",j+1);
        mpfr_printf(format_buf, MPFR_RNDN, gruenberger_1);
        printf("\n\n");
        printf("\n");

        printf ("       t0  %7i secs %9i nsec\n", t0.tv_sec, t0.tv_nsec);
        printf ("       t1  %7i secs %9i nsec    compute dt = %-+20.10g\n",
                            t1.tv_sec, t1.tv_nsec, delta_time.delta);

        mpfr_swap(gruenberger_1, gruenberger_0);

    }
    printf("------------------------------------------------------\n");

    printf("final   : ");
    mpfr_printf(format_buf, MPFR_RNDN, gruenberger_0);
    printf("\n\n");
    printf("\n");
    printf("expected: ");
    printf("674530.47074108455938268917802974681284444414341\n\n");

    err_clock = clock_gettime(clock_flag, &tn_end);
    err_clock = tdiff(&delta_time, tn_begin, tn_end);
    total_time = delta_time.delta;
    printf("\nTotal time %-+20.10g\n", total_time);

    return EXIT_SUCCESS;

}

