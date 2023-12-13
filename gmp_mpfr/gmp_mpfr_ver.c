
/*
 * gmp_mpfr_ver.c  Reports the libgmp and libmpfr version as well as
 *                 some capabilities in the form of a flag with bits
 *                 flipped from a 0 to 1 for various features.
 *
 *                 Tested on a pile of machines and that even includes
 *                 an old SPARCStation 20 running Solaris 8.
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2019 Dennis Clarke
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
 * The flags that may get returned will be in the five lowest bits :
 *
 *    bit 0 --> thread safe using TLS
 *    bit 1 --> __float128 support
 *    bit 2 --> decimal float support
 *    bit 3 --> compiled with GMP internals
 *    but 4 --> threads share cache per MPFR const
 *
 * There is an integer status flag which may return three values :
 *
 *     (a) ENOMEM if the calloc() fails
 *     (b) 999 for "nein nein nein" if something really bad
 *         happens. This means calloc() failed and it was not
 *         just ENOMEM. That is what I call "really bad".
 * 
 * The entire subroutine will return a zero if anything goes wrong.
 * A non-zero return value will be the size of the mpfr_prec_t type.
 *
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
 *********************************************************************/
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <errno.h>
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <stdint.h>
#define __STDC_FORMAT_MACROS
#include <inttypes.h>
#include <string.h>
#include <strings.h>
#include <locale.h>
#include <sys/resource.h>
#include <sys/utsname.h>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>

int
gmp_mpfr_ver(int *status, int *mpfr_flags)
{

    int ret_val;

    printf("GMP  library version : %d.%d.%d\n",
            __GNU_MP_VERSION,
            __GNU_MP_VERSION_MINOR,
            __GNU_MP_VERSION_PATCHLEVEL );

    printf("MPFR library: %-12s\n", mpfr_get_version ());
    printf("MPFR header : %s (based on %d.%d.%d)\n",
            MPFR_VERSION_STRING,
            MPFR_VERSION_MAJOR,
            MPFR_VERSION_MINOR,
            MPFR_VERSION_PATCHLEVEL);

    errno = 0;
    /* did the caller provide nothing but a NULL pointer ? */
    if (status == NULL) {
        status = calloc(1, sizeof(int));
        if ( status == NULL ) {
            if ( errno == ENOMEM ) {
                ret_val = errno;
            } else {
                 /* barf nein nein nein */
                ret_val = 999;
            }
            return ret_val;
        }
    } else {
        *status = 0;
    }

    errno = 0;
    if (mpfr_flags == NULL) {
        mpfr_flags = calloc(1, sizeof(int));
        if ( mpfr_flags == NULL ) {
            /* possible ENOMEM? */
            if ( errno == ENOMEM ) {
                /* this is nasty. I do not think it is
                 * the task of this little subroutine
                 * to barf text all over the stderr
                 * stream. However it is a good idea
                 * to return some sort of an error state
                 * flag. Here we return the ENOMEM. */
                ret_val = errno;
            } else {
                /* just lovely. something really bad has
                 * happened and it is not ENOMEM. As they
                 * may exclaim in Germany this is Scheiße
                 * but we can not return that. So here we
                 * throw out nein nein nein */
                ret_val = 999;
            }
            /* NOTE : this is nasty */
            return ret_val;
        }
    } else {
        /* not really needed given that we used calloc() */
        *mpfr_flags = 0;
    }

    if (mpfr_buildopt_tls_p()!=0) {
        printf("            : compiled as thread safe using TLS\n");
        *mpfr_flags += 1;
    }

    if (mpfr_buildopt_float128_p()!=0) {
        printf("            : __float128 support enabled\n");
        *mpfr_flags += 2;
    }

    if (mpfr_buildopt_decimal_p()!=0) {
        printf("            : decimal float support enabled\n");
        *mpfr_flags += 4;
    }

    if (mpfr_buildopt_gmpinternals_p()!=0) {
        printf("            : compiled with GMP internals\n");
        *mpfr_flags += 8;
    }

    if (mpfr_buildopt_sharedcache_p()!=0) {
        printf("            : threads share cache per MPFR const\n");
        *mpfr_flags += 16;
    }

    ret_val = sizeof(mpfr_prec_t);

    printf("            : sizeof(mpfr_prec_t) = %i\n", ret_val);

    printf("MPFR thresholds file used at compile time : %s\n\n",
                                      mpfr_buildopt_tune_case ());


    return ret_val;

}

