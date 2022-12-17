
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
#define _XOPEN_SOURCE 600

#define TESTLEN 10

#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>

extern int isbase64 (char ch);
extern void base64_encode (const char *restrict in, size_t inlen,
                           char *restrict out, size_t outlen);
extern size_t base64_encode_alloc (const char *in, size_t inlen, char **out);
extern int base64_decode (const char *restrict in, size_t inlen,
                           char *restrict out, size_t *outlen);
extern int base64_decode_alloc (const char *in, size_t inlen,
                                 char **out, size_t *outlen);


int main ( int argc, char *argv[] ) {

    /*******************************************************************
       Test vectors taken directly from section 10 of RFC 4648

           BASE64("") = ""

           BASE64("f") = "Zg=="

           BASE64("fo") = "Zm8="

           BASE64("foo") = "Zm9v"

           BASE64("foob") = "Zm9vYg=="

           BASE64("fooba") = "Zm9vYmE="

           BASE64("foobar") = "Zm9vYmFy"
    *******************************************************************/

    char *istr;
    char *out;
    size_t inlen, outlen;
    int j;

    char *test_string[] =
    {
        "",
        "f",
        "fo",
        "foo",
        "foob",
        "fooba",
        "foobar",
        "Hello World.",
        "Now is the time for all good men to come to the aid of the party",
        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    };
    char buffer[1024] = "\0";

    for ( j = 0; j<TESTLEN; ++j ) {

        istr = calloc(strlen(test_string[j])+1, sizeof(unsigned char));
        strncpy ( istr, test_string[j], strlen(test_string[j]) );
        inlen = strlen ( istr );

        outlen = base64_encode_alloc ( istr, inlen, &out);

        if ( ( out == NULL ) && ( outlen == 0 ) && ( inlen != 0 ) ) {
            printf ( "FAIL : input too long\n" );
            return ( EXIT_FAILURE );
        }

        if ( out == NULL ) { 
            printf ( "FAIL: memory allocation error\n" );
            return ( EXIT_FAILURE );
        }

        printf ( "input string was \"%s\"\n", istr );
        printf ( "output string is \"%s\"\n", out );
        free ( istr );

        istr = calloc( strlen(out), (size_t) sizeof( unsigned char ) );
        strncpy ( istr, out, strlen(out) );
        free ( out );
        inlen = strlen ( istr );
        int ok = base64_decode_alloc ( istr, inlen, &out, &outlen);

        if ( !ok ) { 
            printf ( "FAIL : input was not valid base64\n" );
            return ( EXIT_FAILURE );
        }

        if ( out == NULL ) {
            printf ( "FAIL: memory allocation error\n" );
            return ( EXIT_FAILURE );
        }

        strncpy ( buffer, out, outlen );
        printf ( "decode length is %li\n", outlen );
        printf ( "decode string is \"%s\"\n\n", buffer );

    }

    return EXIT_SUCCESS;

}
