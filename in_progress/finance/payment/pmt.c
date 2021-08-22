
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

/*********************************************************************
 * Trivial amortization payment computation which should output
 * like so : 
 *
 *  $ ./pmt 20000 5 7.5
 *  +--------------+---------------+----------------+
 *  |   schedule   |    payment    |       cost     |
 *  +--------------+---------------+----------------+
 *  |    monthly   |    400.7590   |     4045.5383  |
 *  | bi-monthly   |    200.1225   |     4014.6984  |
 *  |  bi-weekly   |    184.7102   |     4012.3248  |
 *  |     weekly   |     92.3003   |     3998.0795  |
 *  +--------------+---------------+----------------+
 * The above is for a principal of $20,000 for 5 years at 7.5% APR
 *
 *
 *  $ ./pmt 36000 7 8.5
 *  +--------------+---------------+---------------+
 *  |   schedule   |    payment    |      cost     |
 *  +--------------+---------------+---------------+
 *  |    monthly   |    570.1135   |   11889.5320  |
 *  | bi-monthly   |    284.6889   |   11827.7295  |
 *  |  bi-weekly   |    262.7636   |   11822.9727  |
 *  |     weekly   |    131.3034   |   11794.4238  |
 *  +--------------+---------------+---------------+
 * The above is for a $36,000.00 principal at 8.5% APR where we see
 * that a weekly payment frequency saves essentially nothing over
 * the 7 year term.
 *********************************************************************/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <stddef.h>
#include <locale.h>
#include "math.h"

int main (int argc, char **argv) {

    /* note p0 is the principal */
    double rate, p0, pmt, i_rate, kappa, cof;
    int    j, yrs, total_n;
    int    n, nper[4] = { 12, 24, 26, 52 };

    /* input value assumptions 
        argv[1] = ( double ) principal
        argv[2] = ( integer ) number of years
        argv[3] = ( double ) interest rate as a percentage
    */

    if ( argc < 4 ) { 
        fprintf ( stderr, "ERROR ----------------------------------\n" );
        fprintf ( stderr, "usage : %s ", argv[0] );
        fprintf ( stderr, "principal num_years rate\n" );
        fprintf ( stderr, "        principal is a double value\n" );
        fprintf ( stderr, "        num_years is an integer\n" );
        fprintf ( stderr, "        rate is a double value and\n" );
        fprintf ( stderr, "          expressed as a percentage\n" );
        fprintf ( stderr, "\n" );
        return EXIT_FAILURE;
    }

    /* note that there is no checking on the input values here */
    p0 = strtod( argv[1], (char **)NULL);
    yrs = atoi ( argv[2] );
    rate = strtod( argv[3], (char **)NULL) / 100.0;

    if ( p0 < 0.01 ) {
        fprintf ( stderr, "ERROR ----------------------------------\n" );
        fprintf ( stderr, "principal must be a reasonable value.\n" );
        return EXIT_FAILURE;
    }

    if ( rate < 0.0 ) {
        fprintf ( stderr, "ERROR ----------------------------------\n" );
        fprintf ( stderr, "interest rate must be reasonable.\n" );
        return EXIT_FAILURE;
    }

    if ( yrs < 1 ) {
        fprintf ( stderr, "ERROR ----------------------------------\n" );
        fprintf ( stderr, "At least 1 year required.\n" );
        return EXIT_FAILURE;
    }

    printf ( "\n" );
    printf ( "    +--------------+---------------+---------------+\n" );
    printf ( "    |   schedule   |    payment    |      cost     |\n" );
    printf ( "    +--------------+---------------+---------------+\n" );
    for ( j=0; j<4; j++ ) {

        n = nper[j];

        switch ( n ) {
            case 12 :
                printf ( "    |    monthly   | " );
                break;
            case 24 :
                printf ( "    | bi-monthly   | " );
                break;
            case 26 :
                printf ( "    |  bi-weekly   | " );
                break;
            case 52 :
                printf ( "    |     weekly   | " );
                break;
            default :
                fprintf ( stderr, "ERROR --------------------------\n" );
                fprintf ( stderr, "Number of payments per year must " );
                fprintf ( stderr, "be in the set [ 12, 24, 26, 52].\n" );
                return EXIT_FAILURE;
        }

        total_n = yrs * n;
        i_rate = rate / (( double ) n );
        kappa = pow( i_rate + 1.0 , (double)total_n);
        pmt = p0 * i_rate * kappa / ( kappa - 1.0 );   
        cof = ( pmt * ( (double)total_n ) ) - p0;
        printf ( " %10.4f   | %12.4f  |\n", pmt, cof );

    }
    printf ( "    +--------------+---------------+---------------+\n" );

    return EXIT_SUCCESS;

}

