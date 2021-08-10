
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

int mpfr_check_flags( int mpfr_status, int debug_flag );

int main(int argc, char *argv[])
{
   mpfr_prec_t prec = 1024;
   int candidate_int, inex = 0,k;
   printf("GMP  library version : %d.%d.%d\n",
            __GNU_MP_VERSION,
            __GNU_MP_VERSION_MINOR,
            __GNU_MP_VERSION_PATCHLEVEL );

    printf("MPFR library: %-12s\n", mpfr_get_version());
    printf("MPFR header : %s (based on %d.%d.%d)\n",
            MPFR_VERSION_STRING,
            MPFR_VERSION_MAJOR,
            MPFR_VERSION_MINOR,
            MPFR_VERSION_PATCHLEVEL);
   
   mpfr_t pi, bigC, sigma, bigM, bigL, bigX, bigK, termA, termB, bigFive, bigNeg,
                    one, twelve,sixteen;
   
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
    
    mpfr_inits2(prec,pi, bigC, sigma, bigM, bigL, bigX,
                         bigK, bigL, termA, termB, bigFive, 
                         bigNeg, one, twelve,sixteen, (mpfr_ptr*) 0 );
    mpfr_clear_flags();                                           
    inex = mpfr_set_d( termA,  10005.0, MPFR_RNDN);
    inex = mpfr_sqrt( bigC, termA, MPFR_RNDN);
    inex = mpfr_set_d( termA,  426880.0, MPFR_RNDN);
    inex = mpfr_mul(bigC, bigC, termA, MPFR_RNDN);
    
    inex = mpfr_set_d( bigFive,  545140134.0, MPFR_RNDN);
    inex = mpfr_set_d( bigNeg,  -262537412640768000.0, MPFR_RNDN);
    
    inex = mpfr_set_d( sigma, 0.0, MPFR_RNDN);
    inex = mpfr_set_d( bigK, 6.0, MPFR_RNDN);
    
    inex = mpfr_set_d( bigM, 1.0, MPFR_RNDN);
    inex = mpfr_set_d( bigL,  13591409.0, MPFR_RNDN);
    /*inex = mpfr_set_d( bigX, 1.0, MPFR_RNDN);*/
    
    inex = mpfr_set_d( one, 1.0, MPFR_RNDN);
    inex = mpfr_set_d(twelve, 12.0, MPFR_RNDN);
    inex = mpfr_set_d(sixteen, 16.0, MPFR_RNDN);
    

    for (k=0; k<10; k++){
       printf("\n-----\nk = %3i\n\n", k);
    
       mpfr_clear_flags();
          
       printf("INFO : M = ");
       mpfr_printf ("%.Re\n", bigM);
       printf("INFO : L = ");
       mpfr_printf ("%.Re\n", bigL);

       printf("INFO : K = "); 
       mpfr_printf ("%.Re\n", bigK);
       mpfr_mul(termA, bigM, bigL,MPFR_RNDN);
       printf("INFO : M*L = ");
       mpfr_printf ("%.Re\n", termA);
       printf("INFO : X = ");
       inex = mpfr_pow_ui(bigX, bigNeg, (unsigned long int)k,  MPFR_RNDN);
       mpfr_printf ("%.Re\n", bigX);          
       inex = mpfr_div(termA, termA, bigX, MPFR_RNDN);
            
       printf("INFO : (M*L)/X = ");
       mpfr_printf ("%.Re\n", termA);    
       inex = mpfr_add(sigma,sigma,termA,MPFR_RNDN);
       printf("INFO : sigma = ");
       mpfr_printf ("%.Re\n", sigma); 
       inex = mpfr_pow_si(termA, sigma, (signed long int)-1,  MPFR_RNDN);
       printf("INFO : sigma^-1 = ");
       mpfr_printf ("%.Re\n", termA);
       inex = mpfr_mul(pi, bigC, termA, MPFR_RNDN);

       
       
       inex = mpfr_add(bigL, bigL, bigFive, MPFR_RNDN);  
       
       inex = mpfr_pow_ui(termA, bigK, (unsigned long int)3, MPFR_RNDN);
       inex = mpfr_mul(termB, bigK, sixteen,  MPFR_RNDN);
       inex = mpfr_sub(termA, termA, termB, MPFR_RNDN);    
       inex = mpfr_init_set_si(termB, (long)k, MPFR_RNDN);
       inex = mpfr_add(termB, termB, one, MPFR_RNDN);
       inex = mpfr_pow_ui(termB, termB, (unsigned long int)3,  MPFR_RNDN);
       inex = mpfr_div(termA, termA, termB, MPFR_RNDN);
       inex = mpfr_mul(bigM, termA, bigM, MPFR_RNDN);
       inex = mpfr_add(bigK, bigK, twelve, MPFR_RNDN); 
       
       
    }
    printf("INFO : pi = ");
    mpfr_printf ("%.Re\n\n", pi); 
    
    return EXIT_SUCCESS;
}

