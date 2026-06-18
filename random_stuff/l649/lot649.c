
/*
 * lot649.c  :  Pick Lotto 649 ticket numbers for morons who do that
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
 * ------------------------------------------------------------------
 */

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

#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>
#include <unistd.h>

int32_t bag_of_nums[49];

/* Prints out a combination like {1, 2} */
void	printc(int comb[], int k) 
{
	int	i;
	for (i = 0; i < k; ++i)
		printf("%2d ", bag_of_nums[ ( comb[i] + 1 ) ] );
}


/*
	next_comb(int comb[], int k, int n)
		Generates the next combination of n elements as k after comb

	comb => the previous combination ( use (0, 1, 2, ..., k) for first)
	k => the size of the subsets to generate
	n => the size of the original set

	Returns: 1 if a valid combination was found
		0, otherwise
*/
int	next_comb(int comb[], int k, int n) 
{
	int	i = k -1;
	++comb[i];

	while ((i > 0) && (comb[i] >= n - k + 1 + i)) {
		--i;
		++comb[i];
	}

	if (comb[0] > n - k) /* Combination (n-k, n-k+1, ..., n) reached */
		return 0; /* No more combinations can be generated */

	/* comb now looks like (..., x, n, n, n, ..., n).
		Turn it into (..., x, x + 1, x + 2, ...) */
	for (i = i + 1; i < k; ++i)
		comb[i] = comb[i - 1] + 1;

	return 1;
}

/*define a function to calculate the factorial of n */
long int        factorial(int n) 
{
        int     i;
        long int        a = 1;
        if (n > 1 )
                for (i = 2; i <= n; ++i)
                        a *= i;
        return(a);
}


/*function to find combination*/
long int        combination(int x, int y)
{
        /* This FAILS rather badly for large values of x */
        long int        a, b, value;
        a = factorial(x);
        b = ( factorial(y) * factorial(x - y) );
        value = a / b;
        return ( value );
}


/********************************
  while this is cute it is hellish
  slow to process so many function
  calls over and over. BAD BAD BAD 

ulong int factorial(int n)
 {
  if (n<=1)
        return(1);
  else
        n=n*factorial(n-1);
        return(n);
 }
*********************************/


int	main(int argc, char *argv[]) 
{
	int	n = 9; /* The size of the set; for {1, 2, 3, 4} it's 4 */
	int	k = 6; /* The size of the subsets; for {1, 2}, {1, 3}, ... it's 2 */
        int32_t i; /* index of some sort */
	int	comb[16]; /* comb[i] is the index of the i-th element in the combination */

        /* check if we have at least some input
           args like 6 6 3 7 16 17 19 21 imply that
           we pick six numbers from the six numbers provided.

           input like 6 8 3 7 16 17 19 21 27 42 
           means pick six numbers from the eight that 
           follow the digit 8 */

        if ( argc < 2 ) {
            printf ( "Usage : N K n1 n2 n3 n4 ... nk\n" );
            exit ( 1 );
        }

        /* lets hope the first digit makes sense */
        k = atoi ( argv[1] );
        printf ( "  k = %2i\n", k );
        if ( k < 1 ) {
            printf ( "\n picking negative or zero numbers is not allowed.\n" );
            exit ( 1 );
        }

        n = atoi ( argv[2] );
        printf ( "  n = %2i\n", n );
        if ( ( n < 1 ) | ( n > 49 ) ) {
            printf ( "\n you're being foolish.\n" );
            exit ( 1 );
        }
                
        /* printf ( "\nExpect %li results\n", combination ( n, k ) ); */

        /* Now get the bag of numbers from which we pick */
        if ( argc <= ( n + 2 ) ) /* seems hacky but we need enough input data */
            printf ( "Usage : N K n1 n2 n3 n4 ... n%i <-- you need %i \n", n, n );
        else
            {

                for ( i = 3 ; i <= ( n + 2 ) ; i++ ) {
                    bag_of_nums[ i - 2 ] = atoi ( argv[i] );
                    printf ( " N[%2i] = %3i\n", ( i - 2 ),  bag_of_nums[ i - 2 ] );
                }

        	/* Setup comb for the initial combination */
        	int	i;
        	for (i = 0; i < k; ++i)
        		comb[i] = i;

        	/* Print the first combination */
                printf ( "\n%4i | ", 1 );
        	printc(comb, k);

        	/* Generate and print all the other combinations */
                i = 1;
        	while (next_comb(comb, k, n)) {
                        i = i + 1 ; /* count them */
                        printf ( "\n%4i | ", i );
        		printc(comb, k);
                }

        }

        printf ( "\n" );

	return 0;
}

