
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

int mpfr_check_flags( int mpfr_status, int debug_flag );

int piChud(mpfr_t pi, int steps, int precision)
{
    mpfr_prec_t prec = precision;
    int inex=0, k=0;
    
    
    mpfr_t bigC, sigma, bigM, bigL, bigX, bigK, termA, termB,
                                    bigFive, bigNeg,one, twelve,sixteen;
                      
    printf("INFO : using %li bits of precision.\n", (long)precision );
    mpfr_inits2(prec, bigC, sigma, bigM, bigL, bigX, bigK, bigL, termA, termB,
                        bigFive,bigNeg, one, twelve,sixteen, (mpfr_ptr*) 0 );
                        
    /* constant terms */          
    /* C = 426880 * sqrt(10005) */                
    mpfr_clear_flags();                                                 
    inex = mpfr_set_d( termA,  10005.0, MPFR_RNDN);
    mpfr_clear_flags();
    inex = mpfr_sqrt( bigC, termA, MPFR_RNDN);
    mpfr_clear_flags();
    inex = mpfr_set_d( termA,  426880.0, MPFR_RNDN);
    mpfr_clear_flags();
    inex = mpfr_mul(bigC, bigC, termA, MPFR_RNDN);
    
    mpfr_clear_flags();
    inex = mpfr_set_d( bigFive,  545140134.0, MPFR_RNDN);
    mpfr_clear_flags();
    inex = mpfr_set_d( bigNeg,  -262537412640768000.0, MPFR_RNDN);
    
    /* this is k=0, or initial values of terms */                              
    mpfr_clear_flags();
    inex = mpfr_set_d( sigma, 0.0, MPFR_RNDN);
    mpfr_clear_flags();
    inex = mpfr_set_d( bigK, 6.0, MPFR_RNDN);
    
    mpfr_clear_flags();
    inex = mpfr_set_d( bigM, 1.0, MPFR_RNDN);
    mpfr_clear_flags();
    inex = mpfr_set_d( bigL,  13591409.0, MPFR_RNDN);
    mpfr_clear_flags();
   
    mpfr_clear_flags();
    inex = mpfr_set_d( one, 1.0, MPFR_RNDN);
    mpfr_clear_flags();
    inex = mpfr_set_d(twelve, 12.0, MPFR_RNDN);
    mpfr_clear_flags();
    inex = mpfr_set_d(sixteen, 16.0, MPFR_RNDN);
    
    do {
        

        printf("\n-----\nk = %3i %d\n\n", k, precision);
        printf("INFO : K = "); 
        mpfr_printf ("%.Re\n", bigK);


        mpfr_clear_flags();
        mpfr_mul(termA, bigM, bigL,MPFR_RNDN);

        
        printf("INFO : M * L = ");
        mpfr_printf ("%.Re * %.Re = %.Re\n", bigM, bigL, termA);      
 
        mpfr_clear_flags();
        inex = mpfr_pow_ui(bigX, bigNeg, (unsigned long int)k,  MPFR_RNDN);
        
        printf("INFO : X = ");
        mpfr_printf ("%.Re\n", bigX);

        
        mpfr_clear_flags();    
        inex = mpfr_div(termA, termA, bigX, MPFR_RNDN);


        printf("INFO : (M*L)/X = ");
        mpfr_printf ("%.Re\n", termA);       
        printf("INFO :(prev) sigma = ");
        mpfr_printf ("%.Re\n", sigma);
        
        mpfr_clear_flags();
        mpfr_init_set_si(termB,0, MPFR_RNDN);
        mpfr_clear_flags();
        inex = mpfr_add(termB,termB,sigma,MPFR_RNDN);
        
        mpfr_clear_flags();
        inex = mpfr_add(sigma,sigma,termA,MPFR_RNDN);
        printf("INFO :( new) sigma = ");
        mpfr_printf ("%.Re\n", sigma);
        
        mpfr_clear_flags();
        inex = mpfr_sub (termA, termB, sigma, MPFR_RNDN);
        printf("INFO :  diff sigma = ");
        mpfr_printf ("%.Re\n", termA);
        
        
        mpfr_clear_flags();
        inex = mpfr_pow_si(termA, sigma, (signed long int)-1,  MPFR_RNDN); 
        printf("INFO : sigma^-1 = ");
        mpfr_printf ("%.Re\n", termA);

        inex = mpfr_mul(pi, bigC, termA, MPFR_RNDN);  
        printf("\nINFO : pi = ");
        mpfr_printf ("%.Re\n", pi);        
             

        if (k==steps) {
            break;
        }
        mpfr_clear_flags();
        inex = mpfr_add(bigL, bigL, bigFive, MPFR_RNDN);  

        mpfr_clear_flags();
        inex = mpfr_pow_ui(termA, bigK, (unsigned long int)3, MPFR_RNDN);// K^3 
        mpfr_clear_flags();
        inex = mpfr_mul(termB, bigK, sixteen,  MPFR_RNDN);// 16*K
        mpfr_clear_flags();
        inex = mpfr_sub(termA, termA, termB, MPFR_RNDN);// K^3 - 16*K

        k+=1;
        mpfr_clear_flags();
        inex = mpfr_init_set_si(termB, (long)k, MPFR_RNDN);

        mpfr_clear_flags();
        inex = mpfr_pow_ui(termB, termB, (unsigned long int)3,  MPFR_RNDN);//(k+1)^3
        mpfr_clear_flags();
        inex = mpfr_div(termA, termA, termB, MPFR_RNDN);//(K^3 - 16*K)/(k+1)^3

        mpfr_clear_flags();
        inex = mpfr_mul(bigM, bigM, termA, MPFR_RNDN);// Mk * [(K^3 - 16*K)/(k+1)^3]
        mpfr_clear_flags();
        inex = mpfr_add(bigK, bigK, twelve, MPFR_RNDN); // K+=12;

    }while(1);
 
/*
    mpfr_clears (bigC, sigma, bigM, bigL, bigX, bigK, bigL, termA, termB,
                        bigFive,bigNeg, one, twelve,sixteen, (mpfr_ptr*) 0 );
*/
    return EXIT_SUCCESS;                                
}



int main(int argc, char *argv[])
{

   int candidate_int =0, prec=2048, steps=5;
   mpfr_t pi;
   size_t lenPI, digit=0, lastCount=0;               
   char strPI[] = "3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989";
   char bufPI[4096] = {0}; 
    if (mpfr_buildopt_tls_p()!=0)
         printf("             : compiled as thread safe using TLS\n");

    if (mpfr_buildopt_float128_p()!=0) 
         printf("             : __float128 support enabled\n");

    if (mpfr_buildopt_decimal_p()!=0)
         printf("             : decimal float support enabled\n");

    if (mpfr_buildopt_gmpinternals_p()!=0)
         printf("             : compiled with GMP internals\n");

    if (mpfr_buildopt_sharedcache_p()!=0)
         printf("             : threads share cache per MPFR const\n");

    printf("MPFR thresholds file used at compile time : %s\n",
                                           mpfr_buildopt_tune_case ());

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
        
    do
    {
        mpfr_inits2(prec,pi,(mpfr_ptr*) 0 );
        
        printf("\n\n%d steps\n", steps);
        
        piChud(pi, steps, prec);
//        mpfr_printf ("%.Re\n", pi);
        mpfr_sprintf(bufPI,"%.Re",pi);
        mpfr_clears (pi,(mpfr_ptr) 0);
        
        lenPI = strlen(bufPI);
        digit=2;
        while( strPI[digit] == bufPI[digit])
        {
            digit++;
        }
        printf("Found %ld digits\n",digit-2);
        if(digit<lenPI)
        {
            steps+=5;
        }
        if(digit==lastCount)
        {
            prec*=2;
        }
        lastCount = digit;
        
    }while( lastCount <= 1000);
    
/*
    mpfr_inits2(4096,pi,(mpfr_ptr*) 0 );   
    piChud(pi, 70,4096,0);
    mpfr_printf ("%.Re\n", pi);     
    mpfr_clears (pi,(mpfr_ptr) 0);
*/

    return EXIT_SUCCESS;
}

