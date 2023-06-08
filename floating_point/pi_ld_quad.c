
/* This all started with a trivial test on an IBM POWER9
 * server which really should know all about long double
 * floating point data types. Which it does. However it is
 * a battle to get the compiler and glibc to agree.
 *
 * On the IBM POWER9 we really should not need to do this
 * crap but such is life in the big city .. at the moment.
 * We can use _Float128 datatype but not use printf. We
 * have to call the libquadmath stuff.
 *
 * Things like this drive me bonkers.
 *
 */
#define _XOPEN_SOURCE 600

#include <errno.h>
#include <locale.h>
#include <math.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/utsname.h>

/* stuff seen on NetBSD 9.3 sparcv9
 * by using  $CC $CFLAGS $CPPFLAGS -E -dD -o foo pi_ld_quad.c
 *
 *    #define sparc 1
 *    #define __NetBSD__ 1
 *    #define __unix__ 1
 *    #define __sparc64__ 1
 *    #define __sparc_v9__ 1
 *    #define __sparcv9 1
 *
 * However the AMD64 based NetBSD 9.3 defines a pile of
 * other things :
 *
 *    #define __amd64 1
 *    #define __amd64__ 1
 *    #define __x86_64 1
 *    #define __x86_64__ 1
 *    #define __NetBSD__ 1
 *    #define __unix__ 1
 *
 *
 * Seen on AMD64 based FreeBSD 14.0 with LLVM/Clang and
 * using "echo | clang -dM -E -" we see many things :
 *
 *    #define __FreeBSD__ 14
 *    #define __FreeBSD_cc_version 1400004
 *    #define __VERSION__ "FreeBSD Clang 15.0.7 (https://github.com/llvm/llvm-project.git llvmorg-15.0.7-0-g8dfdcc7b7bf6)"
 *    #define __amd64 1
 *    #define __amd64__ 1
 *    #define __clang__ 1
 *    #define __clang_major__ 15
 *    #define __clang_minor__ 0
 *    #define __clang_patchlevel__ 7
 *    #define __clang_version__ "15.0.7 (https://github.com/llvm/llvm-project.git llvmorg-15.0.7-0-g8dfdcc7b7bf6)"
 *    #define __llvm__ 1
 *    #define __x86_64 1
 *    #define __x86_64__ 1
 *    #define unix 1
 */

#if defined(__GNUC__) && (__GNUC__ > 9) && !defined(sparc)
#include <quadmath.h>
#endif

int main( int argc, char **argv )
{

    int j, little_endian, num_chars;
    char buffer[128];
    size_t buffer_size;
    struct utsname uname_data;

    /* good old SPARC64 has no problems with this number in memory
     * as a correct 128-bit value. Same with IBM POWER9 but only
     * if we use the _Float128 datatype which is NOT really a
     * long double.
     */
#if defined(__GNUC__) && (__GNUC__ > 9) && !defined(sparc)
    _Float128 pi = 3.141592653589793238462643383279502884Q;
#else
    long double pi = 3.141592653589793238462643383279502884L;
#endif

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

#if defined(__GNUC__)
    printf("INFO : seems to be GCC with version %i.%i.%i\n",
            __GNUC__, __GNUC_MINOR__, __GNUC_PATCHLEVEL__);
#endif

    j = 1;
    little_endian = (*(uint8_t*)&j == 1) ? 1 : 0;
    printf("This is a ");
    if (!little_endian) {
        printf("big");
    } else {
        printf("little");
    }
    printf(" endian machine.\n");

#if defined(__GNUC__) && (__GNUC__ > 9) && !defined(sparc)
    printf ("Size of _Float128 = %i\n\n", sizeof(_Float128));
    printf ("A correct _Float128 ");
#else
    printf ("Size of long double = %i\n\n", sizeof(long double));
    printf ("A correct long double ");
#endif

    printf ("should be :");
    printf ("\n    0x40 00 92 1f b5 44 42 d1 ");
    printf ("84 69 89 8c c5 17 01 b8\n\n");

    printf("Address in memory of pi is 0x%" PRIXPTR " : \n", (uintptr_t)&pi);
    printf("This machine claims long double pi is\n    0x");
    if (little_endian) {
        for ( j=(sizeof(long double)-1); j>(-1); j-- ) {
            printf("%02x ", ((unsigned char *)&pi)[j] );
        }
    } else {
        for ( j=0; j<sizeof(long double); j++ ) {
            printf("%02x ", ((unsigned char *)&pi)[j] );
        }
    }
    printf("\n\n" );

    buffer_size = 44;

#if defined(__GNUC__) && (__GNUC__ > 9) && !defined(sparc)
    num_chars = quadmath_snprintf(buffer,
                                  buffer_size, "%44.42Qg", pi);

    if ( num_chars > 0 ) {

        printf("quadmath_snprintf formatted %i chars.\n",
                 num_chars);

    } else {

        fprintf(stderr,"FAIL : quadmath_snprintf failed.\n");
        return EXIT_FAILURE;

    }
#else
    snprintf(buffer, buffer_size, "%44.42Le", pi);
#endif

    printf("Maybe pi is %s\n\n", buffer);
    printf("Actually is 3.141592653589793238462643383279502884197169...\n");

    return EXIT_SUCCESS;

}

