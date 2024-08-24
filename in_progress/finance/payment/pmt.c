
/*
 * pmt.c  Trivial amortization payment computation
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2012 Dennis Clarke
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

/********************************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 *
 *******************************************************************/
#define _XOPEN_SOURCE 600

/********************************************************************
 * For a principal of $20,000 for 5 years at 7.5% APR :
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
 *
 * For $36,000.00 principal at 8.5% APR :
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
 *******************************************************************/

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
    int    n, j, yrs, total_n;
    /* nper is the number of payments per year */
    int    nper[4] = { 12, 24, 26, 52 };

    /* input value assumptions 
        argv[1] = ( double ) principal
        argv[2] = ( integer ) number of years
        argv[3] = ( double ) interest rate as a percentage
    */

    if ( argc < 4 ) { 
        fprintf(stderr,"ERROR ----------------------------------\n");
        fprintf(stderr,"  usage : %s ",argv[0]);
        fprintf(stderr,"principal num_years annual_rate\n");
        fprintf(stderr,"   thus : %s 20000.00 4 7.5\n",argv[0]);
        fprintf(stderr,"        : $20,000 at 7.5%% for 4 years\n");
        fprintf(stderr,"        : principal is at least $1000\n");
        fprintf(stderr,"----------------------------------------\n");
        return EXIT_FAILURE;
    }

    /* note that there is no checking on the input values here */
    p0 = strtod( argv[1], (char **)NULL);
    yrs = atoi ( argv[2] );
    rate = strtod( argv[3], (char **)NULL) / 100.0;

    if ( p0 < 1000.00 ) {
        fprintf(stderr,"ERROR ----------------------------------\n");
        fprintf(stderr,"        : principal at least $1000\n");
        fprintf(stderr,"----------------------------------------\n");
        return EXIT_FAILURE;
    }

    if ( rate < 0.0 ) {
        fprintf(stderr,"ERROR ----------------------------------\n");
        fprintf(stderr,"        : interest rate is negative\n");
        fprintf(stderr,"----------------------------------------\n");
        return EXIT_FAILURE;
    }

    if ( yrs < 1 ) {
        fprintf(stderr,"ERROR ----------------------------------\n");
        fprintf(stderr,"        : at least 1 year required\n");
        fprintf(stderr,"----------------------------------------\n");
    }

    printf("\n" );
    printf("    +--------------+---------------+---------------+\n");
    printf("    |   schedule   |    payment    |      cost     |\n");
    printf("    +--------------+---------------+---------------+\n");
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
                fprintf(stderr,"ERROR --------------------------\n");
                /* this is just a place holder in case we ever want
                 * some other payment frequency */
                return EXIT_FAILURE;
        }

        total_n = yrs * n;
        i_rate = rate / (( double ) n);
        kappa = pow((i_rate + 1.0), (double)total_n);
        pmt = p0 * i_rate * kappa / (kappa - 1.0);   
        cof = ( pmt * ((double)total_n )) - p0;
        printf ( " %10.4f   | %12.4f  |\n", pmt, cof );

    }
    printf("    +--------------+---------------+---------------+\n");

    return EXIT_SUCCESS;

}

