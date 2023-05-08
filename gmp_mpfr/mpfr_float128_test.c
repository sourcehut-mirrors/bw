
/* mpfr_float128_test.c
 *
 *    The MPFR test tset_float128 fails on IBM POWER9 hardware and
 *    this may be due to some undefined MPFR_WANT_FLOAT128. What
 *    baffles me is that this hardware has full long double hardware
 *    in place and should do all the required fp128 type computations
 *    with trivial opcodes such as xsmaddqp.
 *
 *            Written by Dennis Clarke, 2023
 */

/*********************************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 *********************************************************************/
#define _XOPEN_SOURCE 600

#pragma STDC FENV_ACCESS ON

#include <assert.h>
#include <errno.h>
#include <fenv.h>
#include <float.h>
#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>

int
main ( int argc, char **argv )
{

/* From Vincent Lefèvre :
 *
 * I suspect that this is d < -MPFR_FLOAT128_MAX that is wrong
 * or the conversion of the float128 0 to double.
 *
 * MPFR_FLOAT128_MAX is defined by
 *
 *     #if MPFR_WANT_FLOAT128 == 1
 *      * _Float128 type from ISO/IEC TS 18661 * 
 *     # define MPFR_FLOAT128_MAX 0x1.ffffffffffffffffffffffffffffp+16383f128
 *     #elif MPFR_WANT_FLOAT128 == 2
 *      * __float128 type (GNU C extension) * 
 *     # define MPFR_FLOAT128_MAX 0x1.ffffffffffffffffffffffffffffp+16383q
 *     #else
 *     # error "Unsupported value for MPFR_WANT_FLOAT128"
 *     #endif
 *
 * --------------------------------------------------------------------
 * However my tests show it is not defined at all in mpfr.h for some
 * config reason.
 */

    int fp_status, fp_round_mode, fpe_raised;
    setlocale(LC_ALL, "C" );

    printf("GMP  library version : %d.%d.%d\n",
            __GNU_MP_VERSION,
            __GNU_MP_VERSION_MINOR,
            __GNU_MP_VERSION_PATCHLEVEL );

    printf("         MPFR library: %-12s\n", mpfr_get_version ());
    printf("         MPFR header : %s (based on %d.%d.%d)\n",
                     MPFR_VERSION_STRING,
                     MPFR_VERSION_MAJOR,
                     MPFR_VERSION_MINOR,
                     MPFR_VERSION_PATCHLEVEL);

    if (mpfr_buildopt_tls_p()!=0)
        printf("                     : compiled as thread safe using TLS\n");

    if (mpfr_buildopt_float128_p()!=0) 
        printf("                     : __float128 support enabled\n");

    if (mpfr_buildopt_decimal_p()!=0)
        printf("                     : decimal float support enabled\n");

    if (mpfr_buildopt_gmpinternals_p()!=0)
        printf("                     : compiled with GMP internals\n");

    if (mpfr_buildopt_sharedcache_p()!=0)
        printf("                     : threads share cache per MPFR const\n");

    printf("                     : sizeof(mpfr_prec_t) = %i\n\n",
                                      sizeof(mpfr_prec_t));


    printf("MPFR thresholds file used at compile time %s\n\n",
                                      mpfr_buildopt_tune_case ());

#ifdef FLT_EVAL_METHOD
    printf ( "INFO : FLT_EVAL_METHOD == %d\n", FLT_EVAL_METHOD);
#endif

    fp_round_mode = fegetround();
    /* printf("DBUG : fp_round_mode = 0x%08x\n", fp_round_mode ); */
    printf("     : fp rounding mode is ");
    switch(fp_round_mode){
        case FE_TONEAREST:
            printf("FE_TONEAREST\n");
            break;
        case FE_TOWARDZERO:
            printf("FE_TOWARDZERO\n");
            break;
        case FE_UPWARD:
            printf("FE_UPWARD\n");
            break;
        case FE_DOWNWARD:
            printf("FE_DOWNWARD\n");
            break;
        default:
            printf("unknown!\n");
            break;
    }

    fp_status = fesetround( FE_TONEAREST );
    assert( fp_status == 0 );

    if ( feclearexcept(FE_ALL_EXCEPT) == 0 ) {
        printf("     : feclearexcept(FE_ALL_EXCEPT) done\n");
    } else {
        printf("\nFAIL : feclearexcept(FE_ALL_EXCEPT) fails\n");
        return EXIT_FAILURE;
    }

#if defined(__ISO_C_VISIBLE)
    printf("INFO : __ISO_C_VISIBLE id defined\n");
#endif

#ifdef DECIMAL_DIG
    printf("INFO : DECIMAL_DIG == %d\n", DECIMAL_DIG);
#endif

#ifdef FLT_DECIMAL_DIG
    printf("INFO : FLT_DECIMAL_DIG == %d\n", FLT_DECIMAL_DIG);
#endif

#ifdef DBL_DECIMAL_DIG
    printf("INFO : DBL_DECIMAL_DIG == %d\n", DBL_DECIMAL_DIG);
#endif

#ifdef LDBL_DECIMAL_DIG
    printf("INFO : LDBL_DECIMAL_DIG == %d\n", LDBL_DECIMAL_DIG);
#endif

#ifdef LDBL_DIG
    printf("INFO : LDBL_DIG == %d\n", LDBL_DIG);
#endif

/* from the mpfr.h header 
 *
 * #ifdef MPFR_WANT_FLOAT128
 * __MPFR_DECLSPEC int mpfr_set_float128 (mpfr_ptr, _Float128, mpfr_rnd_t);
 * __MPFR_DECLSPEC _Float128 mpfr_get_float128 (mpfr_srcptr, mpfr_rnd_t);
 * #endif
 */

    printf("\n----------------------------------------\n");
#ifdef MPFR_WANT_FLOAT128
    printf("INFO : MPFR_WANT_FLOAT128 == %d\n", MPFR_WANT_FLOAT128);
#else
    printf("INFO : MPFR_WANT_FLOAT128 is not defined.\n");
#endif
    printf("----------------------------------------\n");

    printf("INFO : MPFR_FLOAT128_MAX is ");
#ifdef MPFR_FLOAT128_MAX
    printf("defined.\n");
#else
    printf("not defined.\n");
#endif

    return 42;

}

