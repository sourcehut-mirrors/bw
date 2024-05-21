
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

#define VERBOSE 1
#define MPFR_VERSION_ERROR 999

/* int sysinfo(int verbose); */
uint64_t timediff( struct timespec st, struct timespec en );
int gmp_mpfr_ver(int *status, int *mpfr_flags);

int main(int argc, char **argv)
{

    mpfr_prec_t prec;
    int j, inex, status, mpfr_flags, mpfr_prec_size;
    long candidate_input;

    /* seems we may need to compute the precision in decimal
     * digits for the binary pile we have. Thus we will need
     * the ratio log(2)/log(10) .
     *
     * double bits_per = 0.30102999566398119521373889472449;
     *
     *                      Not needed. 
     *
     * The MPFR library provides the call : 
     *
     * size_t mpfr_get_str_ndigits (int b, mpfr_prec_t p)
     *
     * Return the minimal integer m such that any number of p bits, when
     * output with m digits in radix b with rounding to nearest, can be
     * recovered exactly when read again, still with rounding to nearest.
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

    struct timespec t0, t1;
    uint64_t delta_t;

    setlocale( LC_ALL, "C" );
    /* sysinfo(VERBOSE); */

    mpfr_prec_size = gmp_mpfr_ver(&status, &mpfr_flags);
    if ( mpfr_prec_size == MPFR_VERSION_ERROR ) {
        /* That silly magic number will get cleaned
         * up at some point. Just not now.
         * This is silly but could happen I guess */
        fprintf(stderr,"FAIL : bork bork bork\n");
        return EXIT_FAILURE;
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
            printf("     : we shall assume 113 bits.\n");
            candidate_input = 113;
        }
        if ( candidate_input < 23 ) {
            fprintf(stderr,"WARN : IEEE754 minimum is 23 bits.\n");
            printf("     : we shall assume 53 bits for binary64 FP64.\n");
            prec = 53;
        } else {
            prec = (mpfr_prec_t)candidate_input;
        }
    } else {
        fprintf(stderr,"WARN : no precision entered.\n");
        printf("     : we shall assume 113 bits.\n");
        prec = 113;
    }

    decimal_prec = mpfr_get_str_ndigits(10, prec);
    printf("INFO : using %li bits of precision ", (long)prec );
    printf("and %i decimal digits.\n", decimal_prec);

    /* Create MPFR format buffer string with the correct number
     * of decimal digits. NOTE there is not a newline char.
     *
     * NOTE : the use of the asterisk inside the format string seems
     *        to imply that we need to specify the rounding method
     *        thus :  mpfr_printf(format_buf, MPFR_RNDN, foo);
     */
    sprintf(format_buf,"%%.%iR*f", decimal_prec);

    printf("------------------------------------------------------\n");

    mpfr_inits2( prec, pi_mpfr, e_mpfr, one_mpfr, atan_pi_mpfr,
                 atan_pi4_mpfr, third_mpfr, half_mpfr,
                 atan_half_mpfr, atan_third_mpfr, delta_mpfr,
                 sum_mpfr, gruenberger_0, gruenberger_1,
                 ten_million, one_ten_millionth, (mpfr_ptr*)0 );

    inex = mpfr_set_flt(one_mpfr, 1.0, MPFR_RNDN);
    if ( inex ) fprintf(stderr,"WARN : mpfr_set_flt() returns %i\n", inex);

    inex = mpfr_div_si(half_mpfr, one_mpfr, 2, MPFR_RNDN);
    inex = mpfr_div_si(third_mpfr, one_mpfr, 3, MPFR_RNDN);

    /* Get the CLOCK_REALTIME time in a timespec struct */
    if ( clock_gettime(CLOCK_REALTIME, &t0 ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }

    /* Note that it is entirely harmless to call clock_gettime()
     * again. However it is a waste of time. */

    /* compute atan(1) */
    inex = mpfr_atan(atan_pi4_mpfr, one_mpfr, MPFR_RNDN);
    clock_gettime(CLOCK_REALTIME, &t1);
    delta_t = timediff(t0, t1);

    printf("atan(1)   ");
    mpfr_printf(format_buf, MPFR_RNDN, atan_pi4_mpfr);

#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)
    printf("\ndelta t = %" PRIu64 " nsecs\n\n", delta_t);
#else
    printf("\ndelta t = %llu nsecs\n\n", delta_t);
#endif

    /* compute atan(1/2) */
    clock_gettime(CLOCK_REALTIME, &t0);
    inex = mpfr_atan(atan_half_mpfr, half_mpfr, MPFR_RNDN);
    clock_gettime(CLOCK_REALTIME, &t1);
    delta_t = timediff(t0, t1);

    printf("atan(1/2) ");
    mpfr_printf(format_buf, MPFR_RNDN, atan_half_mpfr);

#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)
    printf("\ndelta t = %" PRIu64 " nsecs\n\n", delta_t);
#else
    printf("\ndelta t = %llu nsecs\n\n", delta_t);
#endif

    /* compute atan(1/3) */
    clock_gettime(CLOCK_REALTIME, &t0);
    inex = mpfr_atan(atan_third_mpfr, third_mpfr, MPFR_RNDN);
    clock_gettime(CLOCK_REALTIME, &t1);
    delta_t = timediff(t0, t1);

    printf("atan(1/3) ");
    mpfr_printf(format_buf, MPFR_RNDN, atan_third_mpfr);

#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)
    printf("\ndelta t = %" PRIu64 " nsecs\n\n", delta_t);
#else
    printf("\ndelta t = %llu nsecs\n\n", delta_t);
#endif

    /* sum atan(1/2) + atan(1/3) */
    clock_gettime(CLOCK_REALTIME, &t0);
    inex = mpfr_add(sum_mpfr, atan_half_mpfr, atan_third_mpfr, MPFR_RNDN);
    clock_gettime(CLOCK_REALTIME, &t1);
    delta_t = timediff(t0, t1);
    printf("sum       ");
    mpfr_printf(format_buf, MPFR_RNDN, sum_mpfr);

#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)
    printf("\ndelta t = %" PRIu64 " nsecs\n\n", delta_t);
#else
    printf("\ndelta t = %llu nsecs\n\n", delta_t);
#endif

    /* check delta on atan(1) and ( atan(1/2) + atan(1/3) ) */
    inex = mpfr_sub(delta_mpfr, sum_mpfr, atan_pi4_mpfr, MPFR_RNDN);
    if ( mpfr_zero_p(delta_mpfr) != 0 ) {
        printf("delta( atan(1) - atan(1/2) - atan(1/3) ) = 0 exactly.");
    } else {
        printf("ERROR : atan(1) - atan(1/2) - atan(1/3) = ");
        mpfr_printf(format_buf, MPFR_RNDN, delta_mpfr);
    }
    printf("\n\n");

    /* compute pi */
    clock_gettime(CLOCK_REALTIME, &t0);
    inex = mpfr_const_pi(pi_mpfr, MPFR_RNDN);
    clock_gettime(CLOCK_REALTIME, &t1);
    delta_t = timediff(t0, t1);
    printf ("pi may be ");
    mpfr_printf(format_buf, MPFR_RNDN, pi_mpfr );

#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)
    printf("\ndelta t = %" PRIu64 " nsecs\n\n", delta_t);
#else
    printf("\ndelta t = %llu nsecs\n\n", delta_t);
#endif

    /* Eulers Number e */
    clock_gettime(CLOCK_REALTIME, &t0);
    inex = mpfr_exp(e_mpfr, one_mpfr, MPFR_RNDN);
    clock_gettime( CLOCK_REALTIME, &t1);
    delta_t = timediff(t0, t1);
    printf("Eulers e  ");
    mpfr_printf(format_buf, MPFR_RNDN, e_mpfr);

#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)
    printf("\ndelta t = %" PRIu64 " nsecs\n\n", delta_t);
#else
    printf("\ndelta t = %llu nsecs\n\n", delta_t);
#endif

    /* multiply atan(1) * 4 */
    clock_gettime(CLOCK_REALTIME, &t0);
    inex = mpfr_mul_si(atan_pi_mpfr, atan_pi4_mpfr, 4, MPFR_RNDN);
    clock_gettime(CLOCK_REALTIME, &t1);
    delta_t = timediff(t0, t1);
    printf("4*atan(1) ");
    mpfr_printf(format_buf, MPFR_RNDN, atan_pi_mpfr);

#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)
    printf("\ndelta t = %" PRIu64 " nsecs\n\n", delta_t);
#else
    printf("\ndelta t = %llu nsecs\n\n", delta_t);
#endif

    inex = mpfr_sub(delta_mpfr, pi_mpfr, atan_pi_mpfr, MPFR_RNDN);
    /* do we really care about the absolute value here? */
    inex = mpfr_abs(delta_mpfr, delta_mpfr, MPFR_RNDN);

    /* see https://www.mpfr.org/mpfr-current/mpfr.html
     *
     * Check that the delta value is actually zero.
     *
     * Function: int mpfr_regular_p (mpfr_t op)
     *
     *    Return non-zero if op is respectively NaN, an infinity, an
     *    ordinary number (i.e., neither NaN nor an infinity), zero,
     *    or a regular number (i.e., neither NaN, nor an infinity
     *    nor zero). Return zero otherwise. 
     */

    if ( mpfr_zero_p(delta_mpfr) != 0 ) {
        printf("delta( atan(1) * 4 ) - pi = 0 exactly.");
    } else {
        printf("ERROR : delta((4*atan(1)) - pi) = ");
        mpfr_printf(format_buf, MPFR_RNDN, delta_mpfr);
    }
    printf("\n\n");


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

    inex = mpfr_set_flt(ten_million, 10000000.0, MPFR_RNDN);
    inex = mpfr_div(one_ten_millionth, one_mpfr, ten_million, MPFR_RNDN);
    inex = mpfr_add(gruenberger_0, one_mpfr, one_ten_millionth, MPFR_RNDN);

    printf("------------------------------------------------------\n");
    printf("---------- Enter the Fred Gruenberger loop -----------\n");
    printf("loop  0 : ");
    mpfr_printf(format_buf, MPFR_RNDN, gruenberger_0);
    printf("\n");

    for ( j = 0; j<27; j++ ) {

        inex = mpfr_mul(gruenberger_1,
                        gruenberger_0, gruenberger_0, MPFR_RNDN);

        printf("loop %2i : ",j+1);
        mpfr_printf(format_buf, MPFR_RNDN, gruenberger_1);
        printf("\n");

        mpfr_swap(gruenberger_1, gruenberger_0);

    }
    printf("------------------------------------------------------\n");

    printf("final   : ");
    mpfr_printf(format_buf, MPFR_RNDN, gruenberger_0);
    printf("\n");
    printf("expected: ");
    printf("674530.47074108455938268917802974681284444414341\n\n");


    mpfr_clears( pi_mpfr, e_mpfr, one_mpfr, atan_pi_mpfr,
                 atan_pi4_mpfr, third_mpfr, half_mpfr,
                 atan_half_mpfr, atan_third_mpfr, delta_mpfr,
                 sum_mpfr, gruenberger_0, gruenberger_1,
                 ten_million, one_ten_millionth, (mpfr_ptr*) 0 );

    return EXIT_SUCCESS;

}

