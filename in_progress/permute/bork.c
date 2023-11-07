
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

int main(void)
{

    double x, y, z, foo;

    srand48(314159265);

    x = drand48();

    y = drand48();

    z = drand48();

    foo = fma(x,y,z);

    printf("fma( %-+26.18e, %-+26.18e, %-+26.18e ) = %-+26.18e\n", 
                 x, y , z, foo );

    return 0;

}

