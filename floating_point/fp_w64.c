
#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <stdlib.h>

int main( int argc, char **argv )
{

    double u[32];
    int j;

    u[0] = 2.0;
    printf ("set     u[ 0] = %-16.12e\n", u[0] );
    u[1] = -4.0;
    printf ("and     u[ 1] = %-16.12e\n", u[1] );

    /* vesta$ bc -lq
     * u0 = 2
     * u1 = -4
     * u2 = 111.0 - 1130.0 / u1 + 3000.0 / ( u0 * u1 )
     * u2
     * 18.50000000000000000000
     * u3 = 111.0 - 1130.0 / u2 + 3000.0 / ( u1 * u2 )
     * u3
     * 9.37837837837837837838
     * u4 = 111.0 - 1130.0 / u3 + 3000.0 / ( u2 * u3 )
     * u4
     * 7.80115273775216138330
     * vesta$
     */

    u[2] = 111.0 - 1130.0 / u[1] + 3000.0 / ( u[0] * u[1] );
    printf ("compute u[ 2] = %-16.12e\n", u[2] );
    u[3] = 111.0 - 1130.0 / u[2] + 3000.0 / ( u[1] * u[2] );
    printf ("        u[ 3] = %-16.12e\n", u[3] );
    u[4] = 111.0 - 1130.0 / u[3] + 3000.0 / ( u[2] * u[3] );
    printf ("        u[ 4] = %-16.12e\n", u[4] );

    for ( j=5; j<32; j++ ) {
        u[j] = 111.0 - 1130.0 / u[j-1] + 3000.0 / ( u[j-2] * u[j-1] );
        printf ("        u[%2i] = %-16.12e\n", j, u[j] );
    }

    return EXIT_SUCCESS;

}

