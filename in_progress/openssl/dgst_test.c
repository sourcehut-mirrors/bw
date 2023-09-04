
/**********************************************************************
  LICENSE ISSUES
  ==============

  The OpenSSL toolkit stays under a double license, i.e. both the
  conditions of the OpenSSL License and the original SSLeay license
  apply to the toolkit.  See below for the actual license texts.

  OpenSSL License
  ---------------

 * ====================================================================
 * Copyright (c) 1998-2019 The OpenSSL Project.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. All advertising materials mentioning features or use of this
 *    software must display the following acknowledgment:
 *    "This product includes software developed by the OpenSSL Project
 *    for use in the OpenSSL Toolkit. (http://www.openssl.org/)"
 *
 * 4. The names "OpenSSL Toolkit" and "OpenSSL Project" must not be used to
 *    endorse or promote products derived from this software without
 *    prior written permission. For written permission, please contact
 *    openssl-core@openssl.org.
 *
 * 5. Products derived from this software may not be called "OpenSSL"
 *    nor may "OpenSSL" appear in their names without prior written
 *    permission of the OpenSSL Project.
 *
 * 6. Redistributions of any form whatsoever must retain the following
 *    acknowledgment:
 *    "This product includes software developed by the OpenSSL Project
 *    for use in the OpenSSL Toolkit (http://www.openssl.org/)"
 *
 * THIS SOFTWARE IS PROVIDED BY THE OpenSSL PROJECT ``AS IS'' AND ANY
 * EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE OpenSSL PROJECT OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 * ====================================================================
 *
 * This product includes cryptographic software written by Eric Young
 * (eay@cryptsoft.com).  This product includes software written by Tim
 * Hudson (tjh@cryptsoft.com).
 *
 *

 Original SSLeay License
 -----------------------

 * Copyright (C) 1995-1998 Eric Young (eay@cryptsoft.com)
 * All rights reserved.
 *
 * This package is an SSL implementation written
 * by Eric Young (eay@cryptsoft.com).
 * The implementation was written so as to conform with Netscapes SSL.
 *
 * This library is free for commercial and non-commercial use as long as
 * the following conditions are aheared to.  The following conditions
 * apply to all code found in this distribution, be it the RC4, RSA,
 * lhash, DES, etc., code; not just the SSL code.  The SSL documentation
 * included with this distribution is covered by the same copyright terms
 * except that the holder is Tim Hudson (tjh@cryptsoft.com).
 *
 * Copyright remains Eric Young's, and as such any Copyright notices in
 * the code are not to be removed.
 * If this package is used in a product, Eric Young should be given attribution
 * as the author of the parts of the library used.
 * This can be in the form of a textual message at program startup or
 * in documentation (online or textual) provided with the package.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *    "This product includes cryptographic software written by
 *     Eric Young (eay@cryptsoft.com)"
 *    The word 'cryptographic' can be left out if the rouines from the library
 *    being used are not cryptographic related :-).
 * 4. If you include any Windows specific code (or a derivative thereof) from
 *    the apps directory (application code) you must include an acknowledgement:
 *    "This product includes software written by Tim Hudson (tjh@cryptsoft.com)"
 *
 * THIS SOFTWARE IS PROVIDED BY ERIC YOUNG ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 * The licence and distribution terms for any publically available version or
 * derivative of this code cannot be changed.  i.e. this code cannot simply be
 * copied and put under another distribution licence
 * [including the GNU Public Licence.]
 */


/* dgst_test.c  Trivial sample code to call into the OpenSSL libraries
 *              wherein we may perform hash functions on sample test
 *              vector data.
 *
 *              This code is modified and will likely continue to be
 *              hacked at by me.
 *
 * Copyright (C) Dennis Clarke 2022
 *
 * For information regarding the OpenSSL licenses please see :
 *
 *         https://www.openssl.org/source/license.html
 */

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
 *
 *********************************************************************
 * Special note here regarding OpenSSL which has a technical committee
 * and even a suggested C language standard to comply with. Good luck.
 * No promise at all that the OpenSSL code base complies with any sort
 * of a C language specification at all.
 *********************************************************************/
#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <string.h>
#include <openssl/evp.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    EVP_MD_CTX *mdctx;
    const   EVP_MD *md;

    /* please see the reference test vector discussion at
     * https://datatracker.ietf.org/doc/html/rfc7693#appendix-A
     *
     * Here we see the input "abc" should produce the output
     * for BLAKE2b-512 algorithm :
     *
     *  BA 80 A5 3F 98 1C 4D 0D 6A 27 97 B6 9F 12 F6 E9
     *  4C 21 2F 14 68 5A C4 B7 4B 12 BB 6F DB FF A2 D1
     *  7D 87 C5 39 2A AB 79 2D C2 52 D5 DE 45 33 CC 95
     *  18 D3 8A A8 DB F1 92 5A B9 23 86 ED D4 00 99 23
     */
    char    default_message[4] = "abc";
    char    *message = NULL;

    unsigned char   md_value[EVP_MAX_MD_SIZE];
    unsigned int    md_len, j;

    if (argv[1] == NULL) {
        fprintf(stderr,"Usage: %s digest_algorithm_name\n", argv[0]);
        return EXIT_FAILURE;
    }

    if (argc > 2) {
        message = calloc(strlen(argv[2])+1,sizeof(unsigned char));
        strncpy(message,argv[2],strlen(argv[2]));
    } else {
        message = calloc(4,sizeof(unsigned char));
        strncpy(message,default_message,3);
    }

    md = EVP_get_digestbyname(argv[1]);
    if (md == NULL) {
        /*
         * Please see OpenSSL manual for EVP_DigestInit
         * and also see EVP_MD_meth_new.
         *
         * Digest algorithms may be listed thus :
         *
         * $ openssl list --digest-commands
         * blake2b512        blake2s256        md5
         * sha1              sha224            sha256            sha3-224
         * sha3-256          sha3-384          sha3-512          sha384
         * sha512            sha512-224        sha512-256        shake128
         * shake256          sm3
         *
         * $ openssl dgst -list
         * Supported digests:
         * -blake2b512      -blake2s256      -md4
         * -md5             -md5-sha1        -mdc2
         * -ripemd          -ripemd160       -rmd160
         * -sha1            -sha224          -sha256
         * -sha3-224        -sha3-256        -sha3-384
         * -sha3-512        -sha384          -sha512
         * -sha512-224      -sha512-256      -shake128
         * -shake256        -sm3             -ssl3-md5
         * -ssl3-sha1       -whirlpool
         */
        fprintf(stderr,"FAIL : Unknown message digest %s\n", argv[1]);

        fprintf(stderr,"    : Please check your available methods :\n");
        fprintf(stderr,"    :   openssl list --digest-commands\n");
        fprintf(stderr,"    :   openssl dgst -list\n");

        return EXIT_FAILURE;
    }

    mdctx = EVP_MD_CTX_new();
    EVP_DigestInit_ex(mdctx, md, NULL);

    EVP_DigestUpdate(mdctx, message, strlen(message));

    EVP_DigestFinal_ex(mdctx, md_value, &md_len);
    EVP_MD_CTX_free(mdctx);

    printf("Input is %i bytes : \"%s\"\n    ", strlen(message),message);
    for (j = 0; j < strlen(message); j++) {
        if (((j%16)==0)&&(j>0)) printf("\n    ");
        printf("%02X ", (uint8_t)*(message+j));
    }
    printf("\n\n");

    printf("Message digest algorithm %s :\n    ", argv[1]);
    for (j = 0; j < md_len; j++) {
        if (((j%16)==0)&&(j>0)) printf("\n    ");
        printf("%02X ", md_value[j]);
    }
    printf("\n");

    free(message);

    return EXIT_SUCCESS;

}

