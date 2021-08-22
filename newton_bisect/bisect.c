
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
 * Results may be checked with MS Excell and the RATE() function
 * which uses an estimation method similar to this trivial code.
 *
 * See an example images at : 
 * https://www.blastwave.org/dclarke/repo_notes/newton_bisect/
 *
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
 *    $ ./bisect 24 -793.80531 15596.68
 *    INFO : we have 
 *           nper = 24
 *           pmt  = -793.805
 *           pv   = 15596.7
 *           pper = 12
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
 *    c = 31    p = 0.01666664059007  
 *    c = 32    p = 0.01666664082290  
 *    c = 33    p = 0.01666664070648  
 *    c = 34    p = 0.01666664076469  
 *    
 *    There were 34 bisection loops
 *    Best guess rate = 0.01666664076469  
 *    This equates to 20.0000 % rate on 12 per period.
 *    
 *    
 * A perfect solution is root = 0.016666666666
 *     ( n.b. : another root exists at r = -1.8598 )
 *
 * Microsoft Excel returns 0.0166666407269634
 *
 * The root at r = 0.01666667 represents r * 12 = 0.20 and thus 20% 
 * interest per 12 months.
 *
 *---------------------------------------------------------------------
 * Another example which is very similar to Excel may be seen
 * at https://www.blastwave.org/dclarke/repo_notes/newton_bisect/
 *
 *    $ ./bisect 364 -120.13 34000.0
 *    INFO : we have 
 *           nper = 364
 *           pmt  = -120.13
 *           pv   = 34000
 *           pper = 12
 *    c =  1    p = 0.50000500000000  
 *    c =  2    p = 0.25000750000000  
 *    c =  3    p = 0.12500875000000  
 *    c =  4    p = 0.06250937500000  
 *    c =  5    p = 0.03125968750000  
 *    c =  6    p = 0.01563484375000  
 *    c =  7    p = 0.00782242187500  
 *    c =  8    p = 0.00391621093750  
 *    c =  9    p = 0.00196310546875  
 *    c = 10    p = 0.00098655273437  
 *    c = 11    p = 0.00147482910156  
 *    c = 12    p = 0.00123069091797  
 *    c = 13    p = 0.00135276000977  
 *    c = 14    p = 0.00141379455566  
 *    c = 15    p = 0.00144431182861  
 *    c = 16    p = 0.00142905319214  
 *    c = 17    p = 0.00143668251038  
 *    c = 18    p = 0.00144049716949  
 *    c = 19    p = 0.00144240449905  
 *    c = 20    p = 0.00144335816383  
 *    c = 21    p = 0.00144288133144  
 *    c = 22    p = 0.00144264291525  
 *    c = 23    p = 0.00144252370715  
 *    c = 24    p = 0.00144246410310  
 *    c = 25    p = 0.00144243430108  
 *    c = 26    p = 0.00144244920209  
 *    c = 27    p = 0.00144244175158  
 *    c = 28    p = 0.00144244547684  
 *    c = 29    p = 0.00144244361421  
 *    c = 30    p = 0.00144244268290  
 *    c = 31    p = 0.00144244314855  
 *    c = 32    p = 0.00144244338138  
 *    c = 33    p = 0.00144244349780  
 *    c = 34    p = 0.00144244343959  
 *    
 *    There were 34 bisection loops
 *    Best guess rate = 0.00144244343959  
 *    This equates to 1.7309  % rate on 12 per period.
 *    
 * We note that MS Excell ( MS Office 2010 ) provides a
 * guess at 0.001442443488299 and thus our bisection is
 * nearly identical within epsilon < 1E-10.
 ******************************************************************/

#define GUESS_BAILOUT 64

double rootfind(double left, double right,
                double tol, int *nper,
                double *pmt, double *pv,
                int *count);

double f(double x, int *nper,double *pmt,double *pv );

int main( int argc, char *argv[] ) {

    int num = 0;
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
        pmt = strtod(argv[2], (char **)NULL);
        pv = strtod(argv[3], (char **)NULL);

        if ( pmt > 0.0 ) { 
            printf ("WARN : pmt should be a negative number.\n");
            pmt = -1.0 * pmt;
            printf ("     : adjusted pmt to now be %12.4f\n", pmt);
        }

        if ( argc > 4 ) {
            pper = (int32_t)atoi(argv[4]);
        }
    } else {
        printf ("FAIL : usage %s nper pmt pv [pper]\n");
        printf ("     : nper is total number of payment periods\n");
        printf ("     : pmt is the negative payment made\n");
        printf ("     : pv is the present value\n");
        printf ("     : pper is the optional number of periods\n");
        /* note that pper is more involved than just a number of
         * amortization periods */
        return EXIT_FAILURE;
    }

    /* these are initial left and right boundary conditions on
     * on the Newtonian bisection. */
    left = 0.00001;
    right = 1.0;

    printf ("INFO : we have \n       nper = %i\n", nper);
    printf ("       pmt  = %g\n", pmt);
    printf ("       pv   = %g\n", pv);
    printf ("       pper = %i\n", pper);

    /* Programmers have the right to be ignorant of many details of your
     * code and still make reasonable changes.
     * --Kernighan and Plauger, _Software Tools_  */

    /* some reasonably small error epsilon that we may use in order
     * to know when our bisection should stop */
    tol = 0.0000000001;


    /* if there exists a zero value on the computation within the
     * boundary condition range 0.0 upwards to 1.0 then we expect
     * that f(0) and f(1) will have different signs. Thus their
     * product f(0)*(f(1) will be negative. In this situation we
     * do an initial check for the left and right boundary. */
    if ( (  f(left, &nper, &pmt, &pv)
          * f(right, &nper, &pmt, &pv) )  >= 0.0 ) {

        printf ("No solution in range 0 to 1.\n");

        if ( fabs( pmt * ((double)nper) ) < pv ) {
            printf ( "Also %i payments of %lf is less than %lf\n",
                            nper, ( (double) -1.0 * pmt ), pv );
        }
        return EXIT_FAILURE;
    }

    root = rootfind( left, right, tol, &nper, &pmt, &pv, &num );

    printf ( "\nThere were %d bisection loops\n", num);
    printf ( "Best guess rate = %-18.14f\n", root);
    printf ( "This equates to %-8.4f%% rate on %i per period.\n",
                  root * ((double)pper) * 100.0, pper);

    return EXIT_SUCCESS;

}

double rootfind(double left, double right,
                double tol, int32_t *nper,
                double *pmt, double *pv, int *count) {

    /* we need a midpoint value between left and right */
    double p;

    /* this loop should exit when the error epsilon < tol */
    while( fabs(left-right) > tol) { 
        p = ( left + right ) / 2.0;

        if ( fabs(f(p, nper, pmt, pv)) < tol ) {
            /* we have a zero solution that is within our epsilon
             * error range and thus we say it is close enough */
            return p;
        }

        /* since we are not yet within epsilon tolerance we need
         * to determine shall we jump to the left or right of our
         * midpoint guess value p ? Here we must again choose a
         * left and right range wherein f(right)*f(left) is a
         * negative value and thus there exists a solution. */
        if ( ( f(p, nper, pmt, pv)
              *f(right, nper, pmt, pv) ) < 0.0 ) {

            left=p;

        } else {

            right=p;

        }

        /* how many loops have we been guessing for a solution? */
        (*count)++;

        printf ("c = %2i    p = %-18.14f\n", *count, p );

        /* we need some hard coded bail out on the loop counter
         * or we may end up going in circles for a very long time */
        if ( *count > GUESS_BAILOUT ) {
            /* We did not manage to get a solution within the
             * epsilon tolerance. To be blunt we just have a 
             * guess at the solution and we know it is not 
             * a good guess. Know when to give up.
             *
             * NOTE : this information is lost as we have not
             *        provided and signal mechanism. */ 
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

