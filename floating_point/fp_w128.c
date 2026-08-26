
/* Please see section 1.3.2 Difficult problems in
 * "Handbook of Floating Point Arithmetic", 2nd Ed.
 * ISBN 978-3-319-76525-9
 * Springer International Publishing AG, 2010, 2018
 *
 * Also :
 * William Kahan, "How futile are mindless assessments
 * of roundoff in floating-point computation?"
 * https://people.eecs.berkeley.edu/~wkahan/MxMulEps.pdf
 *
 * Jean-Michel Muller, "Arithmetique des Ordinateurs",
 * Masson, Paris, 1989
 */

#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <stdlib.h>

int main( int argc, char **argv )
{

    long double u[48];
    int j;

    u[0] = 2.0L;
    printf ("set     u[ 0] = %+-42.38Le\n", u[0] );
    u[1] = -4.0L;
    printf ("and     u[ 1] = %+-42.38Le\n", u[1] );

    u[2] = 111.0L - 1130.0L / u[1] + 3000.0L / ( u[0] * u[1] );
    printf ("compute u[ 2] = %+-42.38Le\n", u[2] );

    for ( j=3; j<48; j++ ) {
        u[j] = 111.0 - 1130.0 / u[j-1] + 3000.0 / ( u[j-2] * u[j-1] );
        printf ("        u[%2i] = %+-42.38Le\n", j, u[j] );
    }

    return EXIT_SUCCESS;

}

