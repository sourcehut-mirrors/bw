
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
#include <stdlib.h>

int main( int argc, char **argv )
{

    long double u[48];
    int j;

    printf ("\n size of long double = %i\n", sizeof(long double));

    u[0] = 2.0L;
    u[1] = -4.0L;

    u[2] = 111.0L - 1130.0L / u[1] + 3000.0L / ( u[0] * u[1] );
    printf ("we have u[ 2] = %-42.38Le\n", u[2] );


    u[3] = 111.0L - 1130.0L / u[2] + 3000.0L / ( u[1] * u[2] );
    printf ("we have u[ 3] = %-42.38Le\n", u[3] );


    u[4] = 111.0L - 1130.0L / u[3] + 3000.0L / ( u[2] * u[3] );
    printf ("we have u[ 4] = %-42.38Le\n", u[4] );

    printf ("\n\n");
    for ( j=5; j<47; j++ ) {
        u[j] = 111.0L - 1130.0L / u[j-1] + 3000.0L / ( u[j-2] * u[j-1] );
        printf ("        u[%2i] = %-42.38Le\n", j, u[j] );
    }

    return EXIT_SUCCESS;

}

