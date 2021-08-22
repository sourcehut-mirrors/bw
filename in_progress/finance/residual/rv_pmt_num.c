
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
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <stddef.h>
#include <locale.h>
#include "math.h"

/* a really high number of payments would be nine years at weekly */
#define GUESS_TOP 468

/******************************************************************
 * Given :
 *
 *      rv_apr = residual value rate
 *      pmt_freq = element of { 12, 24, 26,52 }
 *      num_of_pmts = some positive integer
 *      pmt = a negative double for payment amount
 *      sec_deposit = a double security deposit
 *      tgt_residual = target residual
 *      n = some integer payment number guess
 *             n.b. : A good guess could be term/2 for example.
 ******************************************************************/

double pv_fv( double r, int32_t nper, double pmt, double fv );
double pv_trivial( double r, int32_t nper, double pmt );

double rv_amort_val( double  rv_apr,
                     int32_t pmt_freq,
                     int32_t num_of_pmts,
                     double  pmt,
                     double  sec_deposit,
                     double  tgt_residual,
                     int32_t n );

int32_t rv_pmt_dir( double  rv_apr,
                    int32_t pmt_freq,
                    int32_t num_of_pmts,
                    double  pmt,
                    double  sec_deposit,
                    double  tgt_residual,
                    int32_t n,
                    double  reference_pv );

int main( int argc, char *argv[] ) {

    int32_t pmt_freq, num_of_pmts, n;
    double  rv_apr, pmt, sec_deposit, tgt_residual;

    double  rate, p0, p1, reference_pv, estimate_rv;
    double  estimate_rv0, estimate_rv1;

    int32_t guess, guess_direction, current_direction;
    int32_t guess_limit = 16;
    int32_t guess_count, guess_bracket;

    if ( argc < 8 ) {
        fprintf ( stderr, "FAIL : how about some data?\n" );
        return EXIT_FAILURE;
    }

    rv_apr = strtod( argv[1], (char **)NULL);
    pmt_freq = (int32_t) strtol( argv[2], (char **)NULL, 10);
    num_of_pmts = (int32_t) strtol( argv[3], (char **)NULL, 10);
    pmt = strtod( argv[4], (char **)NULL);
    sec_deposit = strtod( argv[5], (char **)NULL);
    tgt_residual = strtod( argv[6], (char **)NULL);
    n = (int32_t) strtol( argv[7], (char **)NULL, 10);

    if ( n == 0 ) {
        return EXIT_FAILURE;
    }

    /* common data to be used later is the int rate */
    rate = rv_apr / ( (double) pmt_freq );
    /* also a baseline reference present value at 100% residual
     * which is at payment zero. */
    reference_pv = pv_fv( rate, num_of_pmts, pmt, sec_deposit );
    fprintf ( stdout, "\nREF Amort ( for APR calc ) = %-12.10lf\n",
                                                          reference_pv );

    /* we may now accept the input payment number n which
     * is a guess.  If rv_pmt_dir() returns a negative
     * then we reduce our guess. If rv_pmt_dir() returns
     * a positive non-zero value then we increase our
     * guess. A return value of zero from rv_pmt_dir()
     * then we have a perfect guess.
     */

    guess_direction = rv_pmt_dir( rv_apr, pmt_freq, num_of_pmts,
                                  pmt, sec_deposit, tgt_residual,
                                  n, reference_pv );

    fprintf ( stdout, "guess_direction = %i\n", guess_direction );

    if ( guess_direction == 0 ) {
        fprintf ( stdout, "\ninitial guess perfect at n = %i\n", n );
        return EXIT_SUCCESS;
    }

    guess_count = 0;

    /* use a reasonable binary number here */
    if ( num_of_pmts > 64 ) {
        guess_bracket = 64;
    } else {
        guess_bracket = 32;
    }

    fprintf ( stdout, "INFO : guess_bracket = %i\n", guess_bracket );

    if ( guess_direction < 0 ) {
        guess = n - guess_bracket;
    } else {
        guess = n + guess_bracket;
    }

    if ( guess < 0 ) {
        guess = 1;
        guess_bracket = guess_bracket / 2;
    }

    if ( guess > GUESS_TOP ) {
        guess = GUESS_TOP - 1;
    }

    fprintf ( stdout, "INFO : g=%3i before loop.\n", guess );

    current_direction = guess_direction;
    while ( ( guess_count < guess_limit ) && ( guess_direction != 0 ) ) {

        guess_direction = rv_pmt_dir( rv_apr, pmt_freq, num_of_pmts,
                                      pmt, sec_deposit, tgt_residual,
                                      guess, reference_pv );

        if ( guess_direction == 0 ) {
            fprintf ( stdout, "INFO : n=%3i perfect.\n", guess );
            break;
        }

        fprintf ( stdout, "INFO : c=%3i  g=%3i   dir=%3i\n", guess_count, guess, guess_direction );
        guess_count = guess_count + 1;

        if ( ( current_direction != guess_direction ) && ( guess_direction != 0 ) ) {
            current_direction = guess_direction;
            fprintf ( stdout, "     : direction change.\n" );
            guess_bracket = guess_bracket / 2;
            fprintf ( stdout, "     : bracket = %i\n", guess_bracket );
        }

        if ( guess_direction < 0 ) {
            guess = guess - guess_bracket;
            if ( guess < 0 ) {
                guess = 1;
            }
        }

        if ( guess_direction > 0 ) {
            guess = guess + guess_bracket;
            if ( guess > GUESS_TOP ) {
                guess = GUESS_TOP - 1;
            }
        }

        /* sanity check */
        if ( guess_bracket < 1 ) {
            fprintf ( stdout, "FAIL : guess_bracket = %i\n", guess_bracket );
            guess_count = guess_limit; /* bail out */
        }

    }

    return EXIT_SUCCESS;

}

double pv_fv( double r, int32_t nper, double pmt, double fv ) {
    double i_factr, fv_factr, pv;
    i_factr = exp( log( r + ( (double) 1 ) ) * ( (double) nper ) );
    fv_factr = ( (double) -1 ) * fv / i_factr;
    pv = fv_factr - ( (double) pmt ) * ( i_factr - ( (double) 1 ) ) / ( r * i_factr );
    return pv;
}

double rv_amort_val( double  rv_apr,
                     int32_t pmt_freq,
                     int32_t num_of_pmts,
                     double  pmt,
                     double  sec_deposit,
                     double  tgt_residual,
                     int32_t n ) {

    /******************************************************
     * Given :
     *
     *      rv_apr = residual value rate
     *      pmt_freq = element of { 12, 24, 26,52 }
     *      num_of_pmts = some positive integer
     *      pmt = a negative double for payment amount
     *      sec_deposit = a double security deposit
     *      tgt_residual = target residual
     *      n = some integer payment number
     *
     * Return : amount used for amortization in annual
     *          percentage rate calculation
     ******************************************************/
    double rate, j_rate, j_rate_sub_1, gamma, rate_divisor;
    double j_factor, p0;
    int32_t nper;

    rate = rv_apr / ( (double) pmt_freq );
    nper = num_of_pmts - n;
    j_rate = exp(log(rate + ( (double) 1.0 ) ) * ( (double) nper ) );
    gamma = ( (double) -1 ) * sec_deposit / j_rate;
    j_rate_sub_1 = j_rate - ( (double) 1 );
    rate_divisor = rate * j_rate;
    j_factor = j_rate_sub_1 / rate_divisor;
    p0 = gamma + ( ( (double) -1 ) * pmt * j_rate_sub_1 / rate_divisor );
    return p0;
}

int32_t rv_pmt_dir( double  rv_apr,
                    int32_t pmt_freq,
                    int32_t num_of_pmts,
                    double  pmt,
                    double  sec_deposit,
                    double  tgt_residual,
                    int32_t n,
                    double  reference_pv ) {

    int32_t ret_direction = 0;
    double p0, p1, estimate_rv0, estimate_rv1;

    p0 = rv_amort_val( rv_apr, pmt_freq,
                       num_of_pmts, pmt,
                       sec_deposit, tgt_residual, ( n - 1 ) );

    p1 = rv_amort_val( rv_apr, pmt_freq,
                       num_of_pmts, pmt,
                       sec_deposit, tgt_residual, n );

    estimate_rv0 = p0 / reference_pv;
    estimate_rv1 = p1 / reference_pv;

    if ( ( tgt_residual < estimate_rv0 ) && ( tgt_residual < estimate_rv1 ) ) {
        ret_direction = 1;
    } else if ( ( tgt_residual < estimate_rv0 ) && ( tgt_residual > estimate_rv1 ) ) {
        ret_direction = 0;
    } else {
        ret_direction = -1;
    }

    return ret_direction;

}

