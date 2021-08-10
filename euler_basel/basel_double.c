
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>

#include <fenv.h>
#pragma STDC FENV_ACCESS ON

#define __STDC_FORMAT_MACROS
#include <inttypes.h>

int main(int argc, char *argv[])
{
    uint64_t n;
    long double sum;

    /* this is far more precision than needed */
    long double pi = 3.1415926535897932384626433832795028842L;

    /* the infinite sum eventually */
    long double basel = pi * pi / 6.0L;

    long double error_prev, error_now;

    if ( argc < 2 ) {
        fprintf(stderr,"FAIL  : provide a decimal integer\n");
        fprintf(stderr,"USAGE : %s positive_integer\n", argv[0]);
        return EXIT_FAILURE;
    }

    /* this is verbose and overly detailed just to process
     * a number on the command line */
    errno = 0;
    feclearexcept(FE_ALL_EXCEPT);

    double candidate_double = strtod(argv[1], (char **)NULL);

    /* try to handle fp error signals */
    int fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if ( fpe_raised != 0 ){
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
    }

    if ( fpe_raised & FE_INEXACT ) {
        printf("     : FE_INEXACT returned by strtod()\n");
        printf("     : this is a non-issue\n");
    }

    if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
        fprintf(stderr,"FAIL : number not understood\n");
        perror("     ");
        return EXIT_FAILURE;
    }

    if ( !isnormal(candidate_double) && ( candidate_double != 0.0 ) ) {
        fprintf(stderr,"FAIL : number is not normal\n");
        return EXIT_FAILURE;
    }

    /* clear all floating point exceptions even if none happened */
    feclearexcept(FE_ALL_EXCEPT);

    /* slightly wide format spec to see many digits which should
     * be well past the FP64 precision */
    printf ("INFO : seems like a decimal number %-+36.34g\n",
                                                      candidate_double);

    uint64_t sum_limit;
    if ( candidate_double < 256.0 ) {
        fprintf(stderr,"WARN : a number at least 256 needed\n");
        fprintf(stderr,"     : we shall assume 256 and continue\n");
        sum_limit = 256;
    } else {
        sum_limit = (uint64_t)candidate_double;
    }

    if ( sum_limit > 16777216 ) {
        fprintf(stderr,"WARN : a number less than 16777216 needed\n");
        fprintf(stderr,"     : we shall assume 16777216 and continue\n");
        sum_limit = 16777216;
    }

    sum = 0.0L;

    /* some sort of fake error numbers that are different */
    error_prev = 1.0L;
    error_now = 1.1L;

    for ( n = 1; n < sum_limit; n++ ) {
        sum = sum + ( 1.0L / ( (long double)( n * n ) ) );
        error_prev = error_now;
        error_now = basel - sum;
        if ( fabsl( error_prev - error_now ) < 1.0e-14L ) {
            fprintf( stderr, "WARN : catestrophic loss of precision\n");
            printf (" %08lu :  n^2 = %8lu        ", n, n * n);
            printf ("%-18.16g", sum);
            printf ("        err = %-12.10e\n", basel - sum);
            return EXIT_FAILURE;
        }
    }

    return EXIT_SUCCESS;

}

