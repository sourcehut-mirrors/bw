
/* why does this code exist at all?
 *
 * If one looks at the NIST FIPS 180-4 document for the SHA512
 * algorithm then one will see section 4.2.3 which talks about
 * the fractional hex data for the first eighty prime numbers.
 *
 * Well ... the cube root of two is the first one to look at
 * where the fraction hex data is :
 *
 *    0x42 8a 2f 98 d7 28 ae 22 3d da b7 15 be 25 etc etc
 *
 * Therefore the first constant is 42 8a 2f 98 d7 28 ae 22
 *
 * You can easily see that in the memory representation of
 * the data below. Works great on SPARC and IBM POWER and
 * maybe RISC-V.  Everyone else ... good luck.
 */

#define _XOPEN_SOURCE 500

#include <stdio.h>
#include <fenv.h>

int
main ( int argc, char** argv )
{
    long double quad_root_two = 1.259921049894873164767210607278228350570250L;

    printf("go get that yourself %-36.22Le\n", quad_root_two);

    return 42;
}
