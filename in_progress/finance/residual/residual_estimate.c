
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

/******************************************************************
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
 ******************************************************************/

double pv_fv( double r, int32_t nper, double pmt, double fv );

double rv_amort_val( double  rv_apr,
                     int32_t pmt_freq,
                     int32_t num_of_pmts,
                     double  pmt,
                     double  sec_deposit,
                     double  tgt_residual,
                     int32_t n );

int main( int argc, char **argv) {

    int32_t pmt_freq, num_of_pmts, n;
    double  rv_apr, pmt, sec_deposit, tgt_residual;

    double  rate, p0, reference_pv, estimate_rv;

    if ( argc < 8 ) {
        fprintf ( stderr, "FAIL : how about some data?\n" );
        printf ("\n       Error on usage %s \n", argv[0]);
        printf ("\n       Provide data all on one single line where");
        printf ("\n       the numbers are in the following order:\n");
        printf ("           residual_value_rate\n");
        printf ("           payment_freq(12, 24, 26, 52)\n");
        printf ("           number_of_payments\n");
        printf ("           payment_amount\n");
        printf ("           security_deposit\n");
        printf ("           target_residual\n");
        printf ("           payment_number\n");

        return EXIT_FAILURE;
    }

    rv_apr = strtod( argv[1], (char **)NULL);
    pmt_freq = (int32_t) strtol( argv[2], (char **)NULL, 10);
    num_of_pmts = (int32_t) strtol( argv[3], (char **)NULL, 10);
    pmt = strtod( argv[4], (char **)NULL);
    sec_deposit = strtod( argv[5], (char **)NULL);
    tgt_residual = strtod( argv[6], (char **)NULL);
    n = (int32_t) strtol( argv[7], (char **)NULL, 10);

    p0 = rv_amort_val( rv_apr, pmt_freq,
                       num_of_pmts, pmt,
                       sec_deposit, tgt_residual, n );

    fprintf ( stdout, "p0 = %-12.10lf\n", p0 );

    rate = rv_apr / ( (double) pmt_freq );

    reference_pv = pv_fv( rate, num_of_pmts, pmt, sec_deposit );
    /* fprintf ( stdout, "reference_pv = %-12.10lf\n", reference_pv ); */

    estimate_rv = p0 / reference_pv;
    fprintf ( stdout, "estimate_rv = %-12.10lf\n", estimate_rv );

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
     *      rv_apr = residual value rate per RV_calc
     *      pmt_freq = element of { 12, 24, 26,52 }
     *      num_of_pmts = some positive integer
     *      pmt = a negative double for payment amount
     *      sec_deposit =  a double
     *      tgt_residual = target residual
     *      n = some integer payment number 
     *
     * Return : amount used for amortization
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

