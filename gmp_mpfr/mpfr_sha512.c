
/*
 * mpfr_sha512.c   Quick hack at calling SHA512 hash functions from
 *                 the OpenSSL libs. Just trying to get a hash result
 *                 for internal MPFR data.
 *
 *           W A R N I N G : none of this will work unless you have
 *                           test code in the MPFR git tree
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2025 Dennis Clarke
 *
 *    Permission is hereby granted, free of charge, to any person
 *    obtaining a copy of this software and associated documentation
 *    files (the "Software"), to deal in the Software without
 *    restriction, including without limitation the rights to use,
 *    copy, modify, merge, publish, distribute, sublicense, and/or
 *    sell copies of the Software, and to permit persons to whom the
 *    Software is furnished to do so, subject to the following
 *    conditions:
 *
 *    The above copyright notice and this permission notice shall be
 *    included in all copies or substantial portions of the Software.
 *
 *        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
 *        KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 *        WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 *        PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
 *        OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 *        OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 *        OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 *        SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * ------------------------------------------------------------------
 * The above text is the "MIT License" which is a permissive free
 * software license originating at the Massachusetts Institute of
 * Technology (MIT) somewhere around 1987 maybe. Who knows? Feel
 * free to read the file README_MIT_LICENSE
 * ------------------------------------------------------------------
 *
 */

#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <openssl/sha.h>
#include <openssl/evp.h>
#include <mpfr.h>

int sha512(unsigned char *hash, mpfr_bytes_t bytes)
{
    int ret_val = 0;
    unsigned int len;
    EVP_MD_CTX *ctx = EVP_MD_CTX_new();
    if (ctx == NULL) return;

    if (EVP_DigestInit_ex(ctx, EVP_sha512(), NULL) != 1) {
        /* TODO handle this better */
        ret_val = 1;
        goto cleanup;
    }

    if (EVP_DigestUpdate(ctx, bytes.content, bytes.len) != 1) {
        ret_val = 2;
        goto cleanup;
    }

    if (EVP_DigestFinal_ex(ctx, hash, &len) != 1) {
        ret_val = 3;
        goto cleanup;
    }

cleanup:
    EVP_MD_CTX_free(ctx);
    return ret_val;

}

int main() {
    
    int j, err_state = 0;
    mpfr_t pi;
    mpfr_init2(pi, 128);
    mpfr_const_pi(pi, MPFR_RNDD);
    unsigned char hash[SHA512_DIGEST_LENGTH];
    
    mpfr_bytes_t bytes = mpfr_unique_bytes(pi);
    err_state = sha512(hash, bytes);

    if ( err_state ) {
        fprintf(stderr,"FAIL : well oops sha512() returns %i\n", err_state);
        free(bytes.content);
        return EXIT_FAILURE;
    }

    free(bytes.content);
    
    for ( j = 0; j < SHA512_DIGEST_LENGTH; j++) {
        printf("%02x", hash[j]);
    }

    printf("\n");

    return EXIT_SUCCESS;

}

