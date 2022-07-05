
/*************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *************************************************/
#define _XOPEN_SOURCE 600

#include <ctype.h>
#include <errno.h>
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <sys/utsname.h>

static int endian( void )
{
    /* consistent width upper case hex address from
     * an n-bit value in v such that we return a 
     * string like 0xFEEDBEEFBADCAFFE
     *                    ffffffff7ffff2d0         */
    int eflag = 1; /* in mem 0x00000001 big endian */
    eflag = (*(uint8_t*)&eflag == 1) ? 0 : 1;
    /* fprintf ( stderr, "DBG : eflag = %i\n", eflag ); */
    return ( eflag );
}

int main ( int argc, char *argv[] ) {

    /*
     * esther kicks out weird results that look like
     *
     *     real  00 00 b6 05 85 95 d9 3f
     * imaginary 00 00 d4 ce b0 45 ca 3f
     *
     * An off by one mandelbrot result there 73 0d 00 00
     *
     */
    size_t j;

    struct utsname uname_data;

    setlocale( LC_MESSAGES, "C" );
    if ( uname( &uname_data ) < 0 ) {
        fprintf ( stderr,
                 "WARNING : Could not attain system uname data.\n" );
        perror ( "uname" );
    } else {
        printf ( "-------------------------------" );
        printf ( "------------------------------\n" );
        printf ( "        system name = %s\n", uname_data.sysname );
        printf ( "          node name = %s\n", uname_data.nodename );
        printf ( "            release = %s\n", uname_data.release );
        printf ( "            version = %s\n", uname_data.version );
        printf ( "            machine = %s\n", uname_data.machine );
        printf ( "             endian = ");
        if ( endian() ){
            printf ("big");
        } else {
            printf ("little");
        }
        printf (" endian\n");
        printf ( "-------------------------------" );
        printf ( "------------------------------" );
    }
    printf ("\n");

    uint8_t real_fp64le[8] = { 0x00, 0x00, 0xb6, 0x05, 0x85, 0x95, 0xd9, 0x3f };

    printf("out ");
    for ( j=0; j<8; j++ ) {
        printf("0x%02x ", ((uint8_t *)&real_fp64le)[j] );
    }
    printf("\n");
    printf("   real value may be %-+36.22e\n", *(double*)&real_fp64le);

    uint8_t imag_fp64le[8] = { 0x00, 0x00, 0xd4, 0xce, 0xb0, 0x45, 0xca, 0x3f };

    printf("out ");
    for ( j=0; j<8; j++ ) {
        printf("0x%02x ", ((uint8_t *)&imag_fp64le)[j] );
    }
    printf("\n");
    printf("   imag value may be %-+36.22e\n", *(double*)&imag_fp64le);

    return EXIT_SUCCESS;

}

