/*************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *************************************************/
#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <sys/utsname.h>

int main ( int argc, char *argv[] ) {

    int j;
    struct utsname uname_data;
    long double pi = 3.14159265358979323846264338327950288419716939937510L;
    long double one = 1.0L;
    long double two = 2.0L;
    long double neg_one = -1.0L;
    long double neg_two = -2.0L;

    setlocale( LC_MESSAGES, "C" );
    if ( uname( &uname_data ) < 0 ) {
        fprintf ( stderr,
                 "WARNING : Could not attain system uname data.\n" );
        perror ( "uname" );
    } else {
        printf ("        system name = %s\n", uname_data.sysname );
        printf ("          node name = %s\n", uname_data.nodename );
        printf ("            release = %s\n", uname_data.release );
        printf ("            version = %s\n", uname_data.version );
        printf ("            machine = %s\n", uname_data.machine );
    }
    printf ("\n");

    /* correct 128 bit big endian hex representation of pi is 
     *   0x40 00 92 1f b5 44 42 d1 84 69 89 8c c5 17 01 b8
     *
     * Never expect more than 34 decimal digits of data from
     *
     *    l(10)/l(2)
     *    3.3219280948873622
     *    113 / 3.3219280948873622
     *    34.0163895100298765
     *    
     */

    printf("The correct 128 bit floating point format :\n");
    printf("    1 sign bit which is 1 for negative\n");
    printf("   15 bits of exponent with 16383 offset\n");
    printf("    1 implied bit that we do not see\n");
    printf("  112 bits of data\n");
    printf("This gives us 113 bits of binary data.\n");
    printf("    log(10)/log(2) ~= 3.321929\n");
    printf("    113/3.321929 = 34.02 decimal digits\n\n");

    printf("\naddr \"pi\" is %p\n", (void *)&pi );
    printf("\ncontents : " );
    for ( j=0; j<sizeof(long double); j++ )
        printf("%02x ", ((unsigned char *)&pi)[j] );
    printf("\n" );

    printf("%+42.38Lf\n", pi );
    printf(" +3.1415926535897932384626433832795028841971 <- pi\n" );

    printf("\n\naddr \"one\" is %p\n", (void *)&one );
    printf("\ncontents : " );
    for ( j=0; j<sizeof(long double); j++ )
        printf("%02x ", ((unsigned char *)&one)[j] );
    printf("\n" );

    printf("%+42.38Lf\n", one );

    printf("\n\naddr \"two\" is %p\n", (void *)&two );
    printf("\ncontents : " );
    for ( j=0; j<sizeof(long double); j++ )
        printf("%02x ", ((unsigned char *)&two)[j] );
    printf("\n" );

    printf("%+42.38Lf\n", two );

    printf("\n\naddr \"neg_one\" is %p\n", (void *)&neg_one );
    printf("\ncontents : " );
    for ( j=0; j<sizeof(long double); j++ )
        printf("%02x ", ((unsigned char *)&neg_one)[j] );
    printf("\n" );

    printf("%+42.38Lf\n", neg_one );

    printf("\n\naddr \"two\" is %p\n", (void *)&neg_two );
    printf("\ncontents : " );
    for ( j=0; j<sizeof(long double); j++ )
        printf("%02x ", ((unsigned char *)&neg_two)[j] );
    printf("\n" );

    printf("%+42.38Lf\n", neg_two );

    return EXIT_SUCCESS;
}

