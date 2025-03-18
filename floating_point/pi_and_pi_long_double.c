#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int
main( int argc, char **argv )
{

    double pi, pi2;
    long double pi_l, pi2_l;

    pi = M_PI;
    pi2 = pow(pi,2.0);

    printf("pi   = %-+32.26e\n", pi );
    printf("    ->  3.14159265358979323846264338327950...\n");
    printf("\n");

    printf("pi^2 = %-+32.26e\n", pi2 );
    printf("    ->  9.86960440108935861883449099987615...\n");
    printf("\n");

    /*
     * The sad lie is that a long double on most x86_64 hardware
     * will use 16 bytes of memory and then only use 10 of them.
     * So it sucks.
     *
     * Address of pi_l is 0x60000fffffffb4e0 where we see :
     *
     * (gdb) x/16xb 0x60000fffffffb4e0
     * 0x60000fffffffb4e0: 0x35 c2 68 21 a2 da 0f c9
     * 0x60000fffffffb4e8: 0x00 40 00 00 00 00 00 00
     *
     * So yeah, that sucks.
     * Check the same thing on a RISC-V and you get the real thing.
     *
     * (gdb) print &pi_l
     * $1 = (long double *) 0x7ffffffff700
     * (gdb) x/16xb 0x7ffffffff700
     * 0x7ffffffff700: 0xb8 01 17 c5 8c 89 69 84
     * 0x7ffffffff708: 0xd1 42 44 b5 1f 92 00 40
     * 
     * That is perfectly fine usage of 16 bytes of memory for data.
     */
    pi_l = 3.1415926535897932384626433832795028841971693993751058209749445923L;
    pi2_l = powl(pi_l,2.0L);

    printf("\nsizeof(long double) = %li\n\n", sizeof(long double));
    printf("pi   = %-+44.38Le\n", pi_l );
    printf("    ->  3.1415926535897932384626433832795028841971693993751...\n");
    printf("\n");

    printf("pi^2 = %-+44.38Le\n", pi2_l );
    printf("    ->  9.8696044010893586188344909998761511353136994072407906...\n");
    printf("\n");


    return EXIT_SUCCESS;

}
