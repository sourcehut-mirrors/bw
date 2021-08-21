
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
#include <float.h>
#include <math.h>

/******************************************************************
 * Using the typical financial calculation for Pv ( present value ) 
 * which includes the parameters for Pmt ( Payment per period ) and
 * interest rate per n terms as r we have : 
 *
 *    Pv = 15596.68
 *    Pmt = ( -897/1.13 ) due to HST tax of 13%
 *    n = 24
 *
 *    f(r) = ( -897/1.13 ) * ( ( 1 + r )^24 - 1 ) 
 *             / ( r * ( 1 + r )^24 ) + 15596.68
 *
 *    Thus pmt = -793.80531
 *
 *    $ ./bisect_rate 24 -793.80531 15596.68
 *    c =  1    p = 0.50000500000000  
 *    c =  2    p = 0.25000750000000  
 *    c =  3    p = 0.12500875000000  
 *    c =  4    p = 0.06250937500000  
 *    c =  5    p = 0.03125968750000  
 *    c =  6    p = 0.01563484375000  
 *    c =  7    p = 0.02344726562500  
 *    c =  8    p = 0.01954105468750  
 *    c =  9    p = 0.01758794921875  
 *    c = 10    p = 0.01661139648438  
 *    c = 11    p = 0.01709967285156  
 *    c = 12    p = 0.01685553466797  
 *    c = 13    p = 0.01673346557617  
 *    c = 14    p = 0.01667243103027  
 *    c = 15    p = 0.01664191375732  
 *    c = 16    p = 0.01665717239380  
 *    c = 17    p = 0.01666480171204  
 *    c = 18    p = 0.01666861637115  
 *    c = 19    p = 0.01666670904160  
 *    c = 20    p = 0.01666575537682  
 *    c = 21    p = 0.01666623220921  
 *    c = 22    p = 0.01666647062540  
 *    c = 23    p = 0.01666658983350  
 *    c = 24    p = 0.01666664943755  
 *    c = 25    p = 0.01666661963552  
 *    c = 26    p = 0.01666663453653  
 *    c = 27    p = 0.01666664198704  
 *    c = 28    p = 0.01666663826179  
 *    c = 29    p = 0.01666664012441  
 *    c = 30    p = 0.01666664105573  
 *    30 iter: rate = 0.0166666411 equates to 20.0000 % rate on 12 per period
 *
 *
 * Results in a solution near r = 0.016666666666
 *     ( n.b. : another root exists at r = -1.8598 )
 *
 * Microsoft Excel returns 0.0166666407269634
 *
 * The root at r = 0.01666667 represents r * 12 = 0.20 and thus 20% 
 * interest per 12 months.
 *
 * Another potential solution is : 
 *
 *    Enter the total number of payment periods : n
 *    520
 *    Enter the payment made each period : pmt
 *    -57.52
 *    Enter the present value : pv
 *    15600
 *    Enter the left end point 
 *    0.0
 *    Enter the right end point 
 *    1.0
 *    iterations is 24
 *      estimate is   0.00284606218338
 *     equates to a   3.4153% interest rate on 12 payments per term
 *
 *
 *$ ./bisect_rate_001 360 -889.19 192000
 *24 iter: rate = 0.0031250119 equates to 3.7500% rate on 12 per period
 *
 ******************************************************************/

double rootfind(double left, double right,
                double tol, int *nper,
                double *pmt, double *pv,
                int *count );

double f(double x, int *nper,double *pmt,double *pv );

int main( int argc, char *argv[] ) {

    int32_t num;
    double left, right, tol, root;

    /* nper   The total number of payment periods in an annuity.
     * pmt    The payment made each period and cannot change over
     *        the life of the annuity. Typically, pmt includes
     *        principal and interest but no other fees or taxes.
     * pv     The present value — the total amount that a series
     *        of future payments is worth now.
     */

    int32_t nper, pper;
    double pmt, pv;

    /* Assume 12 payments per period unless argv[4] exists */
    pper = 12;

    if ( argc > 1 ) {
        nper = (int32_t) strtol( argv[1], (char **)NULL, 10);
        pmt = strtod( argv[2], (char **)NULL);
        pv = strtod( argv[3], (char **)NULL);

        if ( pmt > 0.0 ) { 
            printf ( "WARN : pmt should be a negative number.\n" );
            pmt = -1.0 * pmt;
            printf ( "     : adjusted pmt to now be %12.4lf\n", pmt );
        }

        if ( argc > 4 ) {
            pper = (int32_t) atoi( argv[4] );
        }
    } else {
        printf ( "FAIL : gimme some data dammmmit !\n");
        return EXIT_FAILURE;
    }

    left = 0.00001;
    right = 1.0;

    printf ("INFO : we have \n       nper = %i\n", nper);
    printf ("       pmt = %g\n", pmt);
    printf ("       pv = %g\n", pv);
    printf ("       pper = %i\n", pper);

    /* tol = (double) 0.0000001; */


    /* Programmers have the right to be ignorant of many details of your
     * code and still make reasonable changes.
     * --Kernighan and Plauger, _Software Tools_  */


    /* tol = (double) 0.000000000000001;  */
    /* tol = (double) DBL_MIN; */

    tol = 0.0000001;

    if ( (  f(left, &nper, &pmt, &pv)
          * f(right, &nper, &pmt, &pv) )  >= 0.0 ) {

        printf ( "No solution in range 0 to 1.\n" );

        if ( fabs( pmt * ( (double) nper ) ) < pv ) {
            printf ( "Also %i payments of %lf is less than %lf\n",
                            nper, ( (double) -1.0 * pmt ), pv );
        }
        return EXIT_FAILURE;
    }

    num=0;

    root = rootfind( left, right, tol, &nper, &pmt, &pv, &num );

    printf ( "%d iter:", num );
    printf ( " rate = %-12.10f", root );
    printf ( " equates to %-8.4f%% rate on %i per period\n",
                  root * ((double) pper) * (double) 100.0, pper );

    return EXIT_SUCCESS;

}

double rootfind(double left, double right,
                double tol, int32_t *nper,
                double *pmt, double *pv, int32_t *count ) {

    double p = 0.0; /* p is middle of left and right */

    /* this loop should exit when the interval < tol */
    while( fabs(left-right) > tol) { 
        p = ( left + right ) / 2.0;

        if ( fabs(f(p, nper, pmt, pv)) < tol ) {
            /* close enough to zero */
            return p;
        }

        if ( ( f(p, nper, pmt, pv)*f(right, nper, pmt, pv) ) < 0.0 ) {
            left=p;
        } else {
            right=p;
        }

        (*count)++;
        printf ( "c = %2i    p = %-18.14f\n", *count, p );

        if ( *count > 64 ) {
            /* bail out */
            return p;
        }
    }
    return p;
}

double f(double r, int32_t *nper, double *pmt, double *pv) {
    /*****************************************************************
     *
     *    Pv = present value such as 15596.68
     *    Pmt = payment ( -897/1.13 ) due to HST tax of 13%
     *    n = 24 total number of payments to be made
     *
     *    f(r) = ( -897/1.13 ) 
     *             * ( ( 1 + r )^24 - 1 ) / ( r * ( 1 + r )^24 )
     *           + 15596.68
     *
     *****************************************************************/
    double present_value = *pv;
    double payment = *pmt;
    double n = *nper;

    return ( payment * ( pow( ( 1.0 + r ), n ) - 1.0 )
             /
            ( r * pow( ( 1.0 + r ), n ) ) + present_value );

}

