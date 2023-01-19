
/*
 * gmp_mpfr_ver.c  Reports the libgmp and libmpfr version as well as
 *                 some capabilities flag.
 *
 *                 Tested on a SPARCStation 20 and Solaris 8.
 * Copyright (C) Dennis Clarke 2019
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * https://www.gnu.org/licenses/gpl-3.0.txt
 */

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

size_t gmp_mpfr_ver(int *mpfr_flags)
{

    size_t ret_val;

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
    if (mpfr_flags == NULL) {
        mpfr_flags = calloc(1, sizeof(int));

        if ( mpfr_flags == NULL ) {
            /* really? possible ENOMEM? */
            if ( errno == ENOMEM ) {
                fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                         __FILE__, __LINE__ );
            } else {
                fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                   __FILE__, __LINE__ );
            }
            perror("FAIL ");
            /* NOTE : it is very nasty to bail out this way
             *        but why bother to continue ?
             */
            exit (EXIT_FAILURE);
        }

    } else {
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
    printf("            : sizeof(mpfr_prec_t) = %zu\n", ret_val);

    printf("MPFR thresholds file used at compile time : %s\n\n",
                                      mpfr_buildopt_tune_case ());


    return ret_val;

}

