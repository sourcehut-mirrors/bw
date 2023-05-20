
/* mpfr_ver.c  Demonstrate libgmp and libmpfr version reports as well
 *             as a computation of pi and Eulers number e with the
 *             provided mpfr function calls. Compute arctan(1) and
 *             then multiply by 4 with the mpfr functions calls.
 *             Check for correct results where reasonable.
 *
 * Copyright (C) Dennis Clarke 2018
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * https://www.gnu.org/licenses/gpl-3.0.txt
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
#define _XOPEN_SOURCE 600

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

int sysinfo(int verbose);
uint64_t timediff( struct timespec st, struct timespec en );

int main(int argc, char *argv[])
{

    mpfr_prec_t prec;
    int inex;
    long candidate_input;

    /* seems we may need to compute the precision in decimal
     * digits for the binary pile we have. Thus we will need
     * the ratio log(2)/log(10) .
     *
     * double bits_per = 0.30102999566398119521373889472449;
     * Not needed. 
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

    struct timespec t0, t1;
    uint64_t delta_t;

    setlocale( LC_ALL, "C" );
    sysinfo(VERBOSE);

    printf("GMP  library version : %d.%d.%d\n",
            __GNU_MP_VERSION,
            __GNU_MP_VERSION_MINOR,
            __GNU_MP_VERSION_PATCHLEVEL );

    printf("MPFR library: %-12s\n", mpfr_get_version ());
    printf("MPFR header : %s (based on %d.%d.%d)\n",
            MPFR_VERSION_STRING,
            MPFR_VERSION_MAJOR,
            MPFR_VERSION_MINOR,
            MPFR_VERSION_PATCHLEVEL);

    if (mpfr_buildopt_tls_p()!=0)
        printf("            : compiled as thread safe using TLS\n");

    if (mpfr_buildopt_float128_p()!=0) 
        printf("            : __float128 support enabled\n");

    if (mpfr_buildopt_decimal_p()!=0)
        printf("            : decimal float support enabled\n");

    if (mpfr_buildopt_gmpinternals_p()!=0)
        printf("            : compiled with GMP internals\n");

    if (mpfr_buildopt_sharedcache_p()!=0)
        printf("            : threads share cache per MPFR const\n");

    printf("            : sizeof(mpfr_prec_t) = %i\n",
                                      sizeof(mpfr_prec_t));

    printf("MPFR thresholds file used at compile time : %s\n\n",
                                      mpfr_buildopt_tune_case ());

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

    printf("INFO : using %li bits of precision.\n", (long)prec );

    /*
    decimal_dig = (int)( 1.0 + ( (double)prec * bits_per ) );
    */

    decimal_prec = mpfr_get_str_ndigits(10, prec);
    printf("     : we need %i decimal digits.\n", decimal_prec);

    /* create a MPFR format buffer string with the correct number
     * of decimal digits. NOTE there is not a newline char. */
    sprintf(format_buf,"%%.%iR*f", decimal_prec);

    /* NOTE : the use of the asterisk inside the format string seems
     *        to imply that we need to specify the rounding method
     *        thus :  mpfr_printf(format_buf, MPFR_RNDN, foo);
     */

    printf("-------------------------------------------------------------\n");

    mpfr_inits2( prec, pi_mpfr, e_mpfr, one_mpfr, atan_pi_mpfr,
                 atan_pi4_mpfr, third_mpfr, half_mpfr,
                 atan_half_mpfr, atan_third_mpfr, delta_mpfr,
                 sum_mpfr, (mpfr_ptr*)0 );

    inex = mpfr_set_flt(one_mpfr, 1.0, MPFR_RNDN);
    inex = mpfr_div_si(half_mpfr, one_mpfr, 2, MPFR_RNDN);
    inex = mpfr_div_si(third_mpfr, one_mpfr, 3, MPFR_RNDN);

    /* Get the CLOCK_REALTIME time in a timespec struct */
    if ( clock_gettime(CLOCK_REALTIME, &t0 ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }
    /* Note that it is entirely harmless to call clock_gettime()
     * again. */

    /* compute atan(1) */
    clock_gettime(CLOCK_REALTIME, &t0);
    inex = mpfr_atan(atan_pi4_mpfr, one_mpfr, MPFR_RNDN);
    clock_gettime(CLOCK_REALTIME, &t1);
    delta_t = timediff(t0, t1);

    printf("atan(1)   ");
    mpfr_printf(format_buf, MPFR_RNDN, atan_pi4_mpfr);
    printf("\n");

    printf("delta t = %" PRIu64 " nsecs\n\n", delta_t);

    /* compute atan(1/2) */
    clock_gettime(CLOCK_REALTIME, &t0);
    inex = mpfr_atan(atan_half_mpfr, half_mpfr, MPFR_RNDN);
    clock_gettime(CLOCK_REALTIME, &t1);
    delta_t = timediff(t0, t1);

    printf("atan(1/2) ");
    mpfr_printf(format_buf, MPFR_RNDN, atan_half_mpfr);
    printf("\ndelta t = %" PRIu64 " nsecs\n\n", delta_t);

    /* compute atan(1/3) */
    clock_gettime(CLOCK_REALTIME, &t0);
    inex = mpfr_atan(atan_third_mpfr, third_mpfr, MPFR_RNDN);
    clock_gettime(CLOCK_REALTIME, &t1);
    delta_t = timediff(t0, t1);

    printf("atan(1/3) ");
    mpfr_printf(format_buf, MPFR_RNDN, atan_third_mpfr);

    printf("\ndelta t = %" PRIu64 " nsecs\n\n", delta_t);

    /* sum atan(1/2) + atan(1/3) */
    clock_gettime(CLOCK_REALTIME, &t0);
    inex = mpfr_add(sum_mpfr, atan_half_mpfr, atan_third_mpfr, MPFR_RNDN);
    clock_gettime(CLOCK_REALTIME, &t1);
    delta_t = timediff(t0, t1);
    printf("sum       ");
    mpfr_printf(format_buf, MPFR_RNDN, sum_mpfr);
    printf("\ndelta t = %" PRIu64 " nsecs\n\n", delta_t);

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
    printf("\ndelta t = %" PRIu64 " nsecs\n\n", delta_t);

    /* Eulers Number e */
    clock_gettime(CLOCK_REALTIME, &t0);
    inex = mpfr_exp(e_mpfr, one_mpfr, MPFR_RNDN);
    clock_gettime( CLOCK_REALTIME, &t1);
    delta_t = timediff(t0, t1);
    printf("Eulers e  ");
    mpfr_printf(format_buf, MPFR_RNDN, e_mpfr);
    printf("\ndelta t = %" PRIu64 " nsecs\n\n", delta_t);

    /* multiply atan(1) * 4 */
    clock_gettime(CLOCK_REALTIME, &t0);
    inex = mpfr_mul_si(atan_pi_mpfr, atan_pi4_mpfr, 4, MPFR_RNDN);
    clock_gettime(CLOCK_REALTIME, &t1);
    delta_t = timediff(t0, t1);
    printf("4*atan(1) ");
    mpfr_printf(format_buf, MPFR_RNDN, atan_pi_mpfr);
    printf("\ndelta t = %" PRIu64 " nsecs\n\n", delta_t);

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

    mpfr_clears( pi_mpfr, e_mpfr, one_mpfr, atan_pi_mpfr,
                 atan_pi4_mpfr, third_mpfr, half_mpfr,
                 atan_half_mpfr, atan_third_mpfr, delta_mpfr,
                 sum_mpfr, (mpfr_ptr*) 0 );

    return EXIT_SUCCESS;

}

