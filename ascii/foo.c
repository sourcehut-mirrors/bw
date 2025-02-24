
/*********************************************************************
 *    The intention here is that the code be strictly compliant
 *    with IEEE  Std  1003.1-200x and earlier for ISO/IEC 9899:1990
 *    spec C.
 *
 *********************************************************************/
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 500
#endif

#include <math.h>
#include <stdlib.h>
#include <stdio.h>

int hex_dump( void *foo, size_t n);

int 
main ( int argc, char **argv )
{

    double pi = M_PI;
    long double pi_l = 3.141592653589793238462643383279502884197169399372L;

    double tenth = 0.1L;
    double two_tenths = 0.2L;
    double sum;

    long double tenth_l = 0.1L;
    long double two_tenths_l = 0.2L;
    long double sum_l;

    printf("\nA  64-bit value for pi is :\n\n");
    hex_dump( &pi, sizeof(double) );
    printf("\n");

    printf("Be happy because that is decimal %-+32.26e\n", pi);

    printf("\nA 128-bit value for pi is :\n\n");
    hex_dump( &pi_l, sizeof(long double) );

    printf("\n\n");

    printf("\nA  64-bit value for 0.1 is :\n\n");
    hex_dump( &tenth, sizeof(double) );
    printf("\n");

    printf("\nA  64-bit value for 0.2 is :\n\n");
    hex_dump( &two_tenths, sizeof(double) );
    printf("\n");

    sum = tenth + two_tenths;
    printf("\nThe 64-bit sum of 0.1 + 0.2 = %-+32.26e\n", sum);
    printf("\nDump of that messy thing is \n");
    hex_dump( &sum, sizeof(double) );
    printf("\n");


    printf("\n\n--------- lets try 128 bit for fun and profit ---\n\n");



    printf("\nA 128-bit value for 0.1 is :\n\n");
    hex_dump( &tenth_l, sizeof(long double) );
    printf("\n");

    printf("\nA 128-bit value for 0.2 is :\n\n");
    hex_dump( &two_tenths_l, sizeof(long double) );
    printf("\n");

    sum_l = tenth_l + two_tenths_l;
    printf("\nThe 128-bit sum of 0.1 + 0.2 = %-+48.42Le\n", sum_l);
    printf("\nDump of that 128 bit shit show is \n");
    hex_dump( &sum_l, sizeof(long double) );
    printf("\n");

    return EXIT_SUCCESS;

}

