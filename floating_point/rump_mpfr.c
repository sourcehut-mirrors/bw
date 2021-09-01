
/*
 * rump_mpfr.c A look at the Rump(1988) problem with arbitrary precision
 * Copyright (C) Dennis Clarke 2021
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

#define PREC 128 /* lowest reasonable precision */
#define VERBOSE 1

int mpfr_check_flags(int status, int debug_flag);

int main(int argc, char **argv)
{

    /* we may accept bit precision on the command line */
    long bit_prec = PREC;

    /* We may implement a method to detect loss of precision
     * and then automatic adjustment of the variable bit width */
    long delta_bit_prec;
    char *endptr, *str;

    setlocale( LC_ALL, "C" );

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

    if (mpfr_buildopt_tls_p()!=0)
        printf("            : compiled as thread safe using TLS\n");

    if (mpfr_buildopt_float128_p()!=0) 
        printf("            : __float128 support enabled\n");

    if (mpfr_buildopt_decimal_p()!=0)
        printf("            : decimal float support enabled\n");

    if (mpfr_buildopt_gmpinternals_p()!=0)
        printf("            : compiled with GMP internals\n");

    if (mpfr_buildopt_sharedcache_p()!=0)
        printf("            : threads share cache per MPFR const\n");

    printf("            : sizeof(mpfr_prec_t) = %i\n",
                                      sizeof(mpfr_prec_t));

    printf("MPFR thresholds file used at compile time : %s\n\n",
                                      mpfr_buildopt_tune_case ());


    mpfr_t a, b, t0, t1, t2, t3, t4, t5, t6,
                 t7, t8, t9, t10, t11, t12,
                 final;

    /* wide mpfr_t variables if needed
    mpfr_wt tw0, tw1, tw2, tw3, tw4, tw5, tw6;
    *
    * * We may need these later .... not now 
    */

    delta_bit_prec = 32;

    mpfr_prec_t actual_prec; /* see _MPFR_PREC_FORMAT */
    int inex; /* mpfr retval */
    int debug = 0;

    /* check if a bit precision parameter was on the command line */
    if (argc>1){
        errno = 0; /* To distinguish success/failure after call */
        str = argv[1];
        bit_prec = strtol(str, &endptr, 10);

        if ( ( (errno == ERANGE)
               &&
               ( (bit_prec == LONG_MAX)
                 || 
                 (bit_prec == LONG_MIN)
               ) )
             || (errno != 0 && bit_prec == 0)) {
            perror("FAIL : strtol could not parse bit precision.");
            exit(EXIT_FAILURE);
        }

        if (endptr == str) {
            fprintf(stderr, "No bit precision seen.\n");
            exit(EXIT_FAILURE);
        }

        if (*endptr != '\0'){ /* Not necessarily an error... */
            fprintf(stderr,"INFO : Further characters after bit");
            fprintf(stderr," precision ignored : %s\n", endptr);
        }

        if (bit_prec>8191){
            bit_prec = 8192;
            printf("\nWARNING : limit precision to 1024 bits.\n");
        }

        if (bit_prec<128) {
            bit_prec = 128;
            printf("\nWARNING : precision minimum is 128 bits.\n");
        }

        if ( bit_prec%32 ) {
            /* note that this always adjusts upwards and not
             * to the nearest 32 bit boundary */
            bit_prec = bit_prec + 32 - bit_prec%32;
        }

    } else {
        bit_prec = PREC;
    }
    delta_bit_prec = bit_prec / 2;
    mpfr_set_default_prec((mpfr_prec_t)bit_prec);
    actual_prec=mpfr_get_default_prec();
    if ( actual_prec == bit_prec ) {
        printf("Requested %i bits of precision accepted.\n", bit_prec);
    } else {
        printf("WARN : we shall use %i bits of precision.\n", bit_prec);
    }

    mpfr_inits2( bit_prec, a, b, t0, t1, t2, t3, t4, t5, t6,
                                 t7, t8, t9, t10, t11, t12,
                                 final, (mpfr_ptr*) 0 );

    /* TODO check the MPFR return values and exceptions */

    /* init a */
    mpfr_set_ui(a, 77617, MPFR_RNDN);
    mpfr_printf ("\n\n        a = %.Re\n", a);

    /* init b */
    mpfr_set_ui(b, 33096, MPFR_RNDN);
    mpfr_printf ("        b = %.Re\n", b);

    /* compute b^6 */
    mpfr_pow_ui(t0, b, 6, MPFR_RNDN);
    mpfr_printf ("       t0 = %.Re\n", t0);

    /* compute 333.75 * t0 = 333.75 * b^6 */
    mpfr_mul_d(t0, t0, 333.75, MPFR_RNDN);
    mpfr_printf ("       t0 = %.Re\n", t0);

    /* compute a^2 */
    mpfr_pow_ui(t1, a, 2, MPFR_RNDN);
    mpfr_printf ("       t1 = %.Re\n", t1);

    /* compute b^2 */
    mpfr_pow_ui(t2, b, 2, MPFR_RNDN);
    mpfr_printf ("       t2 = %.Re\n", t2);

    /* compute a^2  *   b^2   ==   t1 * t2 */
    mpfr_mul(t3, t1, t2, MPFR_RNDN);
    mpfr_printf ("       t3 = %.Re\n", t3);

    /* compute 11 * a^2 * b^2 == 11 * t3 */
    mpfr_mul_ui(t3, t3, 11, MPFR_RNDN);
    mpfr_printf ("       t3 = %.Re\n", t3);

    /* compute b^6 */
    mpfr_pow_ui(t4, t2, 3, MPFR_RNDN);
    mpfr_printf ("       t4 = %.Re\n", t4);

    /* compute b^4 */
    mpfr_pow_ui(t5, t2, 2, MPFR_RNDN);
    mpfr_printf ("       t5 = %.Re\n", t5);

    /* compute 121 * b^4 */
    mpfr_mul_ui(t6, t5, 121, MPFR_RNDN);
    mpfr_printf ("       t6 = %.Re\n", t6);

    /* compute 11 * a^2 * b^2  -  b^6 */
    /* -1314174461784456350457997632 */
    mpfr_sub(t7, t3, t4, MPFR_RNDN);
    mpfr_printf ("       t7 = %.Re\n", t7);

    /* now subtract 121 * b^4 from that */
    /* -1314174606957974558362483008 */
    mpfr_sub(t8, t7, t6, MPFR_RNDN);
    mpfr_printf ("       t8 = %.Re\n", t8);

    /* now subtract 2 from that */
    /* -1314174606957974558362483010 */
    mpfr_sub_ui(t8, t8, 2, MPFR_RNDN);
    mpfr_printf ("       t8 = %.Re\n", t8);

    /* multiply a^2 * ( 11 * a^2 * b^2 - b^6 - 121 * b^4 - 2 ) */
    /*  -7917111779274712207494296632228773890  */
    mpfr_mul(t9, t1, t8, MPFR_RNDN);
    mpfr_printf ("       t9 = %.Re\n", t9);

    /* compute b^8 from the previous b^4 */
    /* 1439474789212538429291115400277262336 */
    mpfr_pow_ui(t10, t5, 2, MPFR_RNDN);
    mpfr_printf ("b^8 = t10 = %.Re\n", t10);
    
    /* now multiply 5.5 */
    /* 7917111340668961361101134701524942848 */
    mpfr_mul_d(t10, t10, 5.5, MPFR_RNDN);
    mpfr_printf ("5.5*      = %.Re\n", t10);

    /* compute  a / b */
    mpfr_div(t11, a, b, MPFR_RNDN);
    mpfr_printf ("a/b = t11 = %.Re\n", t11);

    /* now divide that by 2 */
    mpfr_div_ui(t12, t11, 2, MPFR_RNDN);
    mpfr_printf ("a/(b*2)   = %.Re\n", t12);

    /* add in the components to a final accumulator */
    mpfr_add(final, t0, t9, MPFR_RNDN);
    mpfr_add(final, final, t10, MPFR_RNDN);
    mpfr_add(final, final, t12, MPFR_RNDN);
    mpfr_printf ("\n\n    final = %.Re\n", final);

    printf("  correct = -8.2739605994682136814116509547981629199903311578438481991781e-01\n");

    mpfr_clears( a, b, 
                 t0, t1, t2, t3, t4, t5, t6,
                 t7, t8, t9, t10, t11, t12,
                 final, (mpfr_ptr*) 0 );


    return EXIT_SUCCESS;

}

int mpfr_check_flags( int mpfr_status, int debug_flag )
{
    /* some mpfr call resulted in a mpfr_status value
     * so lets check the flags and determine if the
     * status should be cleared to zero or not */

    int mpfr_underflow_flag, mpfr_overflow_flag, mpfr_divby0_flag,
        mpfr_nanflag_flag, mpfr_inexflag_flag, mpfr_erangeflag_flag;

    mpfr_underflow_flag = mpfr_underflow_p();
    if ( mpfr_underflow_flag != 0 ){
        printf ("INFO : mpfr_underflow_flag is set.\n" );
        /* treat underflow as an error situation */
        mpfr_status = -1;
    }

    mpfr_overflow_flag = mpfr_overflow_p();
    if ( mpfr_overflow_flag != 0 ){
        printf ("INFO : mpfr_overflow_flag is set.\n" );
        /* treat overflow as an error situation */
        mpfr_status = -1;
    }

    mpfr_divby0_flag = mpfr_divby0_p();
    if ( mpfr_divby0_flag != 0 ){
        printf ("INFO : mpfr_divby0_flag is set.\n" );
        /* divide by zero is definately an error */
        mpfr_status = -1;
    }

    mpfr_nanflag_flag = mpfr_nanflag_p();
    if ( mpfr_nanflag_flag != 0 ){
        printf ("INFO : mpfr_nanflag_flag is set.\n" );
        /* a NaN may not be an error condition */
        mpfr_status = 0;
    }

    mpfr_inexflag_flag = mpfr_inexflag_p();
    if ( mpfr_inexflag_flag != 0 ){
        /* a computation was not exact */
        if (debug_flag) fprintf (stderr,"WARN : mpfr_inexflag_flag is set.\n");
        mpfr_status = -1;
    }

    mpfr_erangeflag_flag = mpfr_erangeflag_p();
    if ( mpfr_erangeflag_flag != 0 ){
        printf ("INFO : mpfr_erangeflag_flag is set.\n" );
        /* treat a range error as a valid error */
        mpfr_status = -1;
    }

    return mpfr_status;

}

