
/* trivial_dgst.c  Trivial sample code to call into the OpenSSL lib
 *
 * Copyright (C) Dennis Clarke 2025
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
#include <stdlib.h>
#include <string.h>
#include <openssl/evp.h>

int main(int argc, char *argv[])
{
    EVP_MD_CTX *mdctx;
    const EVP_MD *md;

    /* trivial test data */
    char mess1[] = "Test Message\n";
    char mess2[] = "Hello World\n";

    unsigned char md_value[EVP_MAX_MD_SIZE];
    unsigned int md_len;
    int j;

    if (argv[1] == NULL) {
        fprintf(stderr,"INFO : Usage: %s digestname\n", argv[0]);
        return EXIT_FAILURE;
    }

    md = EVP_get_digestbyname(argv[1]);
    if (md == NULL) {
        fprintf(stderr,"FAIL : unknown message digest %s\n", argv[1]);
        fprintf(stderr,"     : see line %i\n", __LINE__);
        return EXIT_FAILURE;
    }

    mdctx = EVP_MD_CTX_new();
    if (mdctx == NULL) {
        fprintf(stderr,"FAIL : EVP_MD_CTX_new()\n");
        fprintf(stderr,"     : see line %i\n", __LINE__);
        return EXIT_FAILURE;
    }

    if (!EVP_DigestInit_ex2(mdctx, md, NULL)) {
        fprintf(stderr,"FAIL : EVP_DigestInit_ex2()\n");
        fprintf(stderr,"     : see line %i\n", __LINE__);
        EVP_MD_CTX_free(mdctx);
        return EXIT_FAILURE;
    }

    if (!EVP_DigestUpdate(mdctx, mess1, strlen(mess1))) {
        fprintf(stderr,"FAIL : EVP_DigestUpdate()\n");
        fprintf(stderr,"     : see line %i\n", __LINE__);
        EVP_MD_CTX_free(mdctx);
        return EXIT_FAILURE;
    }

    if (!EVP_DigestFinal_ex(mdctx, md_value, &md_len)) {
        fprintf(stderr,"FAIL : EVP_DigestFinal_ex()\n");
        fprintf(stderr,"     : see line %i\n", __LINE__);
        EVP_MD_CTX_free(mdctx);
        return EXIT_FAILURE;
    }

    printf("INFO : input --> %s", mess1);
    printf("\n%04i bytes\n", md_len);
    printf("DATA : ");
    for (j = 0; j < md_len; j++) {
        printf("%02x", md_value[j]);
    }
    printf("\n");

    EVP_MD_CTX_free(mdctx);

    /* once more with feeling */
    mdctx = EVP_MD_CTX_new();
    if (mdctx == NULL) {
        fprintf(stderr,"FAIL : EVP_MD_CTX_new()\n");
        fprintf(stderr,"     : see line %i\n", __LINE__);
        return EXIT_FAILURE;
    }

    if (!EVP_DigestInit_ex2(mdctx, md, NULL)) {
        fprintf(stderr,"FAIL : EVP_DigestInit_ex2()\n");
        fprintf(stderr,"     : see line %i\n", __LINE__);
        EVP_MD_CTX_free(mdctx);
        return EXIT_FAILURE;
    }

    if (!EVP_DigestUpdate(mdctx, mess2, strlen(mess2))) {
        fprintf(stderr,"FAIL : EVP_DigestUpdate()\n");
        fprintf(stderr,"     : see line %i\n", __LINE__);
        EVP_MD_CTX_free(mdctx);
        return EXIT_FAILURE;
    }

    if (!EVP_DigestFinal_ex(mdctx, md_value, &md_len)) {
        fprintf(stderr,"FAIL : EVP_DigestFinal_ex()\n");
        fprintf(stderr,"     : see line %i\n", __LINE__);
        EVP_MD_CTX_free(mdctx);
        return EXIT_FAILURE;
    }

    EVP_MD_CTX_free(mdctx);

    printf("INFO : input --> %s", mess2);
    printf("\n%04i bytes\n", md_len);
    printf("DATA : ");
    for (j = 0; j < md_len; j++) {
        printf("%02x", md_value[j]);
    }
    printf("\n");

    return EXIT_SUCCESS;

}

