
#define _XOPEN_SOURCE 600

#include <errno.h>
#include <locale.h>
#include <math.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/utsname.h>

int main( int argc, char **argv )
{

    int j, little_endian;
    struct utsname uname_data;

    /* good old SPARC64 has no problems with this number in memory
     * as a correct 128-bit value.
     */
    long double pi = 3.141592653589793238462643383279502884L;

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
        printf ( "-------------------------------" );
        printf ( "------------------------------" );
    }
    printf ("\n");

    j = 1;
    little_endian = (*(uint8_t*)&j == 1) ? 1 : 0;
        printf("This is a ");
    if (!little_endian) {
        printf("big");
    } else {
        printf("little");
    }
    printf(" endian machine.\n");

    printf ("Size of long double = %i\n\n", sizeof(long double));
    printf ("A correct long double should be :\n");
    printf ("\n    0x40 00 92 1f b5 44 42 d1 ");
    printf ("84 69 89 8c c5 17 01 b8\n\n");

    printf("This machine claims long double pi is\n    0x");
    for ( j=0; j<sizeof(long double); j++ ) {
        printf("%02x ", ((unsigned char *)&pi)[j] );
    }
    printf("\n\n" );

    return EXIT_SUCCESS;

}

