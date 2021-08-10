
/*******************************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *
 *  An XSI-conforming application should ensure that the feature
 *  test macro _XOPEN_SOURCE is defined with the value 600 before
 *  inclusion of any header. This is needed to enable the
 *  functionality described in The _POSIX_C_SOURCE Feature Test
 *  Macro and in addition to enable the XSI extension.
 *******************************************************************/
#define _XOPEN_SOURCE 600

#include <errno.h>
#include <inttypes.h>
#include <locale.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>
#include <sys/utsname.h>
#include <time.h>
#include <unistd.h>

#include <gmp.h>
#include <mpfr.h>

#define VERBOSE 1

int sysinfo(int verbose);
int mpfr_check_flags( int mpfr_status, int debug_flag );

int main(int argc, char *argv[])
{

    mpfr_prec_t prec = 128;
    int k, candidate_int, inex = 0;
    int debug = 1;

    int err_flag = sysinfo(VERBOSE);
    if ( err_flag == EXIT_FAILURE ) {
        fprintf(stderr,"FAIL : sysinfo returns EXIT_FAILURE\n");
        return EXIT_FAILURE;
    }

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

    printf("MPFR thresholds file used at compile time : %s\n",
                                      mpfr_buildopt_tune_case ());

    printf ("-------------------------------");
    printf ("------------------------------\n");

    mpfr_t foo0_m, foo1_m, foo2_m;

    if ( argc > 1 ) {
        candidate_int = (int)strtol(argv[1], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : bit precision not understood\n");
            perror("     ");
            return ( EXIT_FAILURE );
        }
        if ( ( candidate_int < 64 ) || ( candidate_int > 4096 ) ){
            fprintf(stderr,"WARN : bit precision is unreasonable\n");
            fprintf(stderr,"     : we shall assume 64 and proceed.\n");
            prec = 64;
        } else {
            printf("INFO : bit precision will be %i\n", candidate_int);
            prec = candidate_int;
        }
    }

    printf("INFO : using %li bits of precision.\n\n", (long)prec );

    mpfr_inits2( prec, foo0_m, foo1_m, foo2_m, (mpfr_ptr*) 0 );

    mpfr_clear_flags();
    inex = mpfr_set_d( foo0_m, 13591409.0, MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_set_d() raised a flag\n");
        return EXIT_FAILURE;
    }
    printf("INFO : foo0 = ");
    mpfr_printf ("%.Re\n", foo0_m);

    mpfr_clear_flags();
    inex = mpfr_set_d( foo1_m, 545140134.0, MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_set_d() raised a flag\n");
        return EXIT_FAILURE;
    }
    printf("INFO : foo1 = ");
    mpfr_printf ("%.Re\n", foo1_m);

    /* try a trivial addition */
    mpfr_clear_flags();
    inex = mpfr_add(foo2_m, foo0_m, foo1_m, MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_add returns %i\n", inex);
        inex = mpfr_check_flags(inex,debug);
        if ( inex != 0 ){
            if(debug){
                fprintf(stderr,"WARN : mpfr_add() raised a flag\n");
            }
        }
        if ( mpfr_inexflag_p() != 0 ){
            fprintf(stderr,"WARN : inexact computation.\n");
        } else {
            fprintf(stderr,"FAIL : addition failed\n");
            fprintf(stderr,"     : foo2 = ");
            mpfr_printf ("%.Re\n", foo2_m);
            return EXIT_FAILURE;
        }
    }
    printf("INFO : foo2 = ");
    mpfr_printf ("%.Re\n", foo2_m);


    mpfr_clears ( foo0_m, foo1_m, foo2_m, (mpfr_ptr*) 0 );

    return EXIT_SUCCESS;

}

