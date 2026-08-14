
/* foo.c  trivial usage of BLAKE2 hash
 *
 * which does not work .. yet
 *
 * using strict C90 compiler flags and -D_XOPEN_SOURCE 500
 *
 * $ $CC $CFLAGS $CPPFLAGS -c -o blake2s.o blake2s.c
 * $ $CC $CFLAGS $CPPFLAGS -c -o foo.o foo.c
 * $ $CC $CFLAGS $CPPFLAGS -o foo foo.o blake2s.o
 * $ ./foo
 * 8bd3ccf8b0ad6a7ff10bb345830b66d3abc3cf1d206cff81f335c7c7f1ecca96
 * 
 *        * * *    T H A T    I S    W R O N G    * * *
 *
 */

#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 500
#endif

/* until we can actually get system architecture data */
#define PAGE_SIZE 4096
#define OUTPUT_LEN 32

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#include "blake2s.h"

int
main ( int argc, char **argv )
{

    /* we may add more strings into the array later */
    static const char *foo[] = { "foo", NULL };
    size_t outlen = OUTPUT_LEN;
    uint8_t hash_out[OUTPUT_LEN];

    blake2s_ctx ctx;
    int error_status = 0;

    /* a trivial loop var */
    size_t j;

    /* stuff for the blake2s call */
    size_t inlen = strlen(foo[0]);

    /* 32 bytes and the key is NULL with 0 len key */
    error_status = blake2s(hash_out,outlen,foo[0],inlen,NULL,0);

    if ( error_status != 0 ) {
        fprintf(stderr,"FAIL : blake2s() bork bork bork\n");
        return EXIT_FAILURE;
    }

    /* verify with OpenSSL thus :
     *
     * $ /usr/bin/printf "foo" | openssl dgst -blake2s256 -r
     * 08d6cad88075de8f192db097573d0e829411cd91eb6ec65e8fc16c017edfdb74 *stdin
     *
     * NOTE there is no "\n" on the end of the input string "foo"
     */
    printf("\n");
    for (j = 0; j < OUTPUT_LEN; j++) {
        printf("%02x", hash_out[j]);
    }
    printf("\n");

    return EXIT_SUCCESS;

}

