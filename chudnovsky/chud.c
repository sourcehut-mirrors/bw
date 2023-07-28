
/*
 * chud.c  An implementation of the Chudnovsky algorithm
 * Copyright (C) Dennis Clarke 2020
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
int mpfr_check_flags(int mpfr_status, int debug_flag );
size_t gmp_mpfr_ver(int *mpfr_flags);

int main(int argc, char *argv[])
{

    int k = 0;
    int candidate_int, iteration_limit, inex = 0;
    int debug = 1;
    size_t mpfr_precision_size = 0;
    mpfr_prec_t actual_prec, effective_prec, prec = 64;
    int mpfr_flags = 0;

    sysinfo(VERBOSE);

    setlocale(LC_ALL, "C");

    mpfr_precision_size = gmp_mpfr_ver(&mpfr_flags);
    printf("INFO : gmp_mpfr_ver() returns mpfr_flags = %02x\n\n", mpfr_flags);

    mpfr_t pi_mpfr, ell_k_mpfr, x_k_mpfr, bigk_mpfr, pre_k_mpfr,
           big5_mpfr, big_neg2_mpfr, twelve_mpfr, sixteen_mpfr,
           one_mpfr, big_m_mpfr, constant_mpfr, sigma_mpfr,
           inter0_mpfr, inter1_mpfr, inter2_mpfr;

    if ( argc < 2 ) {
        fprintf(stderr,"USAGE : %s precision num_of_loops\n", argv[0]);
        fprintf(stderr,"      : precision is the bitwidth\n");
        fprintf(stderr,"      : num_of_loops is optional.\n");
        return 42;  /* this is the ultimate answer you need */
    }

    /* note that we have prec = 64 initialized above */
    errno = 0;
    candidate_int = (int)strtol(argv[1], (char **)NULL, 10);
    if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
        fprintf(stderr,"FAIL : bit precision not understood\n");
        perror("     ");
        return EXIT_FAILURE;
    }
    if ( ( candidate_int < 64 ) || ( candidate_int > 1048576 ) ){
        fprintf(stderr,"WARN : bit precision is unreasonable\n");
        fprintf(stderr,"     : we shall assume 64 and proceed.\n");
        prec = 64;
    } else {
        printf("INFO : bit precision will be %i\n", candidate_int);
        prec = candidate_int;
    }
    printf("INFO : request is %li bits of precision.\n\n", (long)prec );
    /* set the default mpfr precision */
    mpfr_set_default_prec(prec);
    /* verify that the default precision is as requested */
    actual_prec = mpfr_get_default_prec();
    printf("INFO : the actual_prec is %lu\n", (long)actual_prec );
    if ( (long)prec != (long)actual_prec ) {
        fprintf(stderr,"FAIL : the precision request failed\n");
        return EXIT_FAILURE;
    }

    /* note that we can get a lot of goodness from the Chudnovsky
     * algorithm in only 4 iterations */
    iteration_limit = 4;

    /* check if the user specified the number of iterations */
    if ( argc > 2 ) {
        errno = 0;
        candidate_int = (int)strtol(argv[2], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : iteration not understood\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        if ( ( candidate_int < 4 ) || ( candidate_int > 64 ) ){
            fprintf(stderr,"WARN : iteration may be unreasonable\n");
            fprintf(stderr,"     : we shall assume 4 and proceed.\n");
            iteration_limit = 4;
        } else {
            printf("INFO : iterations will be %i\n", candidate_int);
            iteration_limit = candidate_int;
        }
    }

    mpfr_inits2( prec, pi_mpfr, ell_k_mpfr, x_k_mpfr, bigk_mpfr,
                       pre_k_mpfr, big5_mpfr, big_neg2_mpfr,
                       twelve_mpfr, sixteen_mpfr, one_mpfr,
                       big_m_mpfr, constant_mpfr, sigma_mpfr,
                       inter0_mpfr, inter1_mpfr, inter2_mpfr,
                       (mpfr_ptr*) 0 );

    /* setup the constant 426880 * sqrt( 10005 ) */
    mpfr_clear_flags();
    inex = mpfr_set_d(inter0_mpfr, 426880.0, MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_set_d() raised a flag\n");
        return EXIT_FAILURE;
    }

    mpfr_clear_flags();
    inex = mpfr_set_d(inter1_mpfr, 10005.0, MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_set_d() raised a flag\n");
        return EXIT_FAILURE;
    }


    mpfr_clear_flags();
    inex = mpfr_sqrt(inter1_mpfr, inter1_mpfr, MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_sqrt returns %i\n", inex);
        inex = mpfr_check_flags(inex,debug);
        if ( inex != 0 ){
            if(debug){
                fprintf(stderr,"WARN : mpfr_sqrt() raised a flag\n");
            }
        }
        if ( mpfr_inexflag_p() != 0 ){
            fprintf(stderr,"WARN : inexact computation.\n");
        } else {
            fprintf(stderr,"FAIL : sqrt\n");
            fprintf(stderr,"     : inter1_mpfr = ");
            mpfr_printf ("%Re\n", inter1_mpfr);
            return EXIT_FAILURE;
        }
    }
    printf("INFO : sqrt(10005) = ");
    mpfr_printf ("%Re\n", inter1_mpfr);
    /*
    effective_prec = mpfr_get_prec (inter1_mpfr);
    mpfr_printf ("variable inter1_mpfr with %Pu bits\n\n", effective_prec);
    */

    mpfr_clear_flags();
    inex = mpfr_mul(constant_mpfr, inter0_mpfr, inter1_mpfr,
                           MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_mul returns %i\n", inex);
        inex = mpfr_check_flags(inex,debug);
        if ( inex != 0 ){
            if(debug){
                fprintf(stderr,"WARN : mpfr_mul() raised a flag\n");
            }
        }
        if ( mpfr_inexflag_p() != 0 ){
            fprintf(stderr,"WARN : inexact computation.\n");
        } else {
            fprintf(stderr,"FAIL : mul\n");
            fprintf(stderr,"     : constant_mpfr = ");
            mpfr_printf ("%Re\n", constant_mpfr);
            return EXIT_FAILURE;
        }
    }
    printf("INFO : constant C = ");
    mpfr_printf ("%Re\n", constant_mpfr);



    mpfr_clear_flags();
    inex = mpfr_set_d( sigma_mpfr, 0.0, MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_set_d() raised a flag\n");
        return EXIT_FAILURE;
    }

    inex = mpfr_set_d( ell_k_mpfr, 13591409.0, MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_set_d() raised a flag\n");
        return EXIT_FAILURE;
    }
    printf("INFO : L_0 = ");
    mpfr_printf ("%Re\n", ell_k_mpfr);

    inex = mpfr_set_d( x_k_mpfr, 1.0, MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_set_d() raised a flag\n");
        return EXIT_FAILURE;
    }
    printf("INFO : X_0 = ");
    mpfr_printf ("%Re\n", x_k_mpfr);

    inex = mpfr_set_d( bigk_mpfr, 6.0, MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_set_d() raised a flag\n");
        return EXIT_FAILURE;
    }
    printf("INFO : K_0 = ");
    mpfr_printf ("%Re\n", bigk_mpfr);

    inex = mpfr_set_d( big_m_mpfr, 1.0, MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_set_d() raised a flag\n");
        return EXIT_FAILURE;
    }
    printf("INFO : M_0 = ");
    mpfr_printf ("%Re\n", big_m_mpfr);

    inex = mpfr_set_d( big5_mpfr, 545140134.0, MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_set_d() raised a flag\n");
        return EXIT_FAILURE;
    }
    printf("INFO : big5_mpfr = ");
    mpfr_printf ("%Re\n", big5_mpfr);

    inex = mpfr_set_d( big_neg2_mpfr, -262537412640768000.0,
                           MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_set_d() raised a flag\n");
        return EXIT_FAILURE;
    }
    printf("INFO : big_neg2_mpfr = ");
    mpfr_printf ("%Re\n", big_neg2_mpfr);

    inex = mpfr_set_d( twelve_mpfr, 12.0,
                           MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_set_d() raised a flag\n");
        return EXIT_FAILURE;
    }

    inex = mpfr_set_d( sixteen_mpfr, 16.0, MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_set_d() raised a flag\n");
        return EXIT_FAILURE;
    }

    inex = mpfr_set_d( one_mpfr, 1.0, MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_set_d() raised a flag\n");
        return EXIT_FAILURE;
    }

    /* The first term for the sigma is merely L_0.
     *
     * Then we need the reciprocal of sigma multiplied by
     * constant C. So therefore C/L_0 should be our first
     * value for pi. */

    inex = mpfr_init_set (sigma_mpfr, ell_k_mpfr, MPFR_RNDN);
    printf("INFO : sigma_0 = ");
    mpfr_printf ("%Re\n", sigma_mpfr);



    mpfr_clear_flags();
    inex = mpfr_div(pi_mpfr, constant_mpfr, sigma_mpfr, MPFR_RNDN);
    if ( inex != 0 ){
        fprintf(stderr,"WARN : mpfr_div returns %i\n", inex);
        inex = mpfr_check_flags(inex,debug);
        if ( inex != 0 ){
            if(debug){
                fprintf(stderr,"WARN : mpfr_div() raised a flag\n");
            }
        }
        if ( mpfr_inexflag_p() != 0 ){
            fprintf(stderr,"WARN : inexact computation.\n");
        } else {
            fprintf(stderr,"FAIL : trivial division\n");
            fprintf(stderr,"     : pi_mpfr = ");
            mpfr_printf ("%Re\n", pi_mpfr);
            return EXIT_FAILURE;
        }
    }
    printf("INFO : pi_0 = ");
    mpfr_printf ("%Re\n", pi_mpfr);

    /* do ten iterations */
    for ( k = 1; k < iteration_limit; k++ ) {

        printf("\n-----\nk = %-2i\n\n", k);



        mpfr_clear_flags();
        printf("INFO : L_%-2i = ", k-1);
        mpfr_printf ("%Re\n", ell_k_mpfr);
        inex = mpfr_add(ell_k_mpfr, ell_k_mpfr, big5_mpfr,
                               MPFR_RNDN);
        if ( inex != 0 ){
            fprintf(stderr,"FAIL : Lk + 545140134 for k = %i\n", k);
            return EXIT_FAILURE;
        }
        printf("     : done L_%-2i = L_%-2i + 545140134\n", k, k-1);
        printf("     : L_%-2i = ", k);
        mpfr_printf ("%Re\n\n", ell_k_mpfr);



        mpfr_clear_flags();
        printf("INFO : X_%-2i = ", k-1);
        mpfr_printf ("%Re\n", x_k_mpfr);
        inex = mpfr_mul(x_k_mpfr, x_k_mpfr, big_neg2_mpfr,
                               MPFR_RNDN);
        if ( inex != 0 ){
            fprintf(stderr,"WARN : Xk * -262537412640768000\n");
            inex = mpfr_check_flags(inex,debug);
            if ( inex != 0 ){
                if(debug){
                    fprintf(stderr,"     : mpfr_mul raised a flag\n");
                }
            }
            if ( mpfr_inexflag_p() != 0 ){
                fprintf(stderr,"     : inexact computation.\n");
            } else {
                fprintf(stderr,"FAIL : Xk * -262537412640768000\n");
                fprintf(stderr,"     : x_k_mpfr = ");
                mpfr_printf ("%Re\n", x_k_mpfr);
                return EXIT_FAILURE;
            }
        }
        printf("     : X_%-2i = X_%-2i * (-262537412640768000)\n",
                                        k, k-1 );
        printf("     : X_%-2i = ", k);
        mpfr_printf ("%Re\n\n", x_k_mpfr);



        mpfr_clear_flags();
        printf("INFO : K_%-2i = ", k-1);
        mpfr_printf ("%Re\n", bigk_mpfr);
        /* we will need this previous iteration val of K soon */
        inex = mpfr_set (pre_k_mpfr, bigk_mpfr, MPFR_RNDN);
        if ( inex != 0 ){
            fprintf(stderr,"FAIL : set pre_k_mpfr from bigk_mpfr\n");
            return EXIT_FAILURE;
        }

        inex = mpfr_add(bigk_mpfr, bigk_mpfr, twelve_mpfr, MPFR_RNDN);
        if ( inex != 0 ){
            fprintf(stderr,"FAIL : K_%-2i += 12\n", k);
            return EXIT_FAILURE;
        }
        printf("     : K_%-2i = K_%-2i + 12\n", k, k-1 );
        printf("     : K_%-2i = ", k);
        mpfr_printf ("%Re\n\n", bigk_mpfr);

        /* we need a previously saved copy of K here */
        inex = mpfr_pow_ui(inter0_mpfr, pre_k_mpfr,
                                        (unsigned long int)3,
                                        MPFR_RNDN);
        if ( inex != 0 ){
            fprintf(stderr,"FAIL : inter0 calc\n");
            return EXIT_FAILURE;
        }
        printf("     : ( K_%-2i )^3 =\n", k-1);
        printf("     :  inter0_mpfr = ");
        mpfr_printf ("%Re\n", inter0_mpfr);

        mpfr_clear_flags();
        inex = mpfr_mul(inter1_mpfr, pre_k_mpfr, sixteen_mpfr,
                               MPFR_RNDN);
        if ( inex != 0 ){ 
            fprintf(stderr,"FAIL : inter1 calc\n");
            return EXIT_FAILURE;
        }
        printf("INFO : 16 * K_%-2i =\n", k-1);
        printf("     : inter1_mpfr = ");
        mpfr_printf ("%Re\n", inter1_mpfr);


        mpfr_clear_flags();
        inex = mpfr_sub(inter0_mpfr, inter0_mpfr, inter1_mpfr,
                               MPFR_RNDN);
        if ( inex != 0 ){ 
            fprintf(stderr,"FAIL : intermediate calc third pass\n");
            return EXIT_FAILURE;
        }
        printf("INFO : ( K_%-2i )^3 - 16 * K_%-2i =\n", k-1, k-1);
        printf("     : inter0_mpfr = ");
        mpfr_printf ("%Re\n", inter0_mpfr);


        mpfr_clear_flags();
        inex = mpfr_init_set_si(inter1_mpfr, (long)(k - 1), MPFR_RNDN);
        if ( inex != 0 ){
            fprintf(stderr,"FAIL : set (k - 1) val\n");
            return EXIT_FAILURE;
        }


        mpfr_clear_flags();
        inex = mpfr_add(inter1_mpfr, inter1_mpfr, one_mpfr, MPFR_RNDN);
        if ( inex != 0 ){
            fprintf(stderr,"FAIL : k + 1\n");
            return EXIT_FAILURE;
        }


        mpfr_clear_flags();
        inex = mpfr_pow_ui(inter1_mpfr, inter1_mpfr, (unsigned long int)3,
                               MPFR_RNDN);
        if ( inex != 0 ){
            fprintf(stderr,"FAIL : intermediate 1 k+1 cube\n");
            return EXIT_FAILURE;
        }
        printf("INFO : ( (k-1) + 1 )^3 = ");
        mpfr_printf ("%Re\n", inter1_mpfr);



        mpfr_clear_flags();
        inex = mpfr_div(inter0_mpfr, inter0_mpfr, inter1_mpfr,
                               MPFR_RNDN);
        if ( inex != 0 ){
            fprintf(stderr,"WARN : mpfr_div) returns %i\n", inex);
            inex = mpfr_check_flags(inex,debug);
            if ( inex != 0 ){
                if(debug){
                    fprintf(stderr,"WARN : mpfr_div() raised a flag\n");
                }
            }
            if ( mpfr_inexflag_p() != 0 ){
                fprintf(stderr,"WARN : inexact computation.\n");
            } else {
                fprintf(stderr,"FAIL : intermediate division\n");
                fprintf(stderr,"     : inter0_mpfr = ");
                mpfr_printf ("%Re\n", inter0_mpfr);
                return EXIT_FAILURE;
            }
        }
        printf("INFO : inter0_mpfr = ");
        mpfr_printf ("%Re\n", inter0_mpfr);

        printf("INFO : M_%-2i = ", k-1);
        mpfr_printf ("%Re\n", big_m_mpfr);


        mpfr_clear_flags();
        inex = mpfr_mul(big_m_mpfr, big_m_mpfr, inter0_mpfr,
                               MPFR_RNDN);
        if ( inex != 0 ){
            fprintf(stderr,"WARN : big_m mul\n");
            inex = mpfr_check_flags(inex,debug);
            if ( inex != 0 ){
                if(debug){
                    fprintf(stderr,"WARN : mpfr_mul() raised a flag\n");
                }
            }
            if ( mpfr_inexflag_p() != 0 ){
                fprintf(stderr,"WARN : inexact computation.\n");
            } else {
                fprintf(stderr,"FAIL : multiply failed\n");
                fprintf(stderr,"     : big_m_mpfr = ");
                mpfr_printf ("%Re\n", big_m_mpfr);
                return EXIT_FAILURE;
            }
        }
        printf("INFO : M_%-2i = ", k);
        mpfr_printf ("%Re\n\n", big_m_mpfr);



        mpfr_clear_flags();
        inex = mpfr_mul(inter0_mpfr, big_m_mpfr, ell_k_mpfr, MPFR_RNDN);
        if ( inex != 0 ){
            fprintf(stderr,"WARN : multiply Mk * Lk\n");
            inex = mpfr_check_flags(inex,debug);
            if ( inex != 0 ){
                if(debug){
                    fprintf(stderr,"WARN : mpfr_mul() raised a flag\n");
                }
            }
            if ( mpfr_inexflag_p() != 0 ){
                fprintf(stderr,"WARN : inexact computation.\n");
            } else {
                fprintf(stderr,"FAIL : multiply failed\n");
                fprintf(stderr,"     : inter0_mpfr = ");
                mpfr_printf ("%Re\n", inter0_mpfr);
                return EXIT_FAILURE;
            }
        }
        printf("INFO : M_%-2i * L_%-2i = ", k, k);
        mpfr_printf ("%Re\n", inter0_mpfr);



        mpfr_clear_flags();
        printf("INFO : X_%-2i = ", k);
        mpfr_printf ("%Re\n", x_k_mpfr);
        inex = mpfr_div(inter1_mpfr, inter0_mpfr, x_k_mpfr,
                               MPFR_RNDN);
        if ( inex != 0 ){
            fprintf(stderr,"WARN : division (M_%-2i * L_%-2i) / X_%-2i\n",
                                            k, k, k);

            inex = mpfr_check_flags(inex,debug);
            if ( inex != 0 ){
                if(debug){
                    fprintf(stderr,"WARN : mpfr_div() raised a flag\n");
                }
            }
            if ( mpfr_inexflag_p() != 0 ){
                fprintf(stderr,"WARN : inexact computation.\n");
            } else {
                fprintf(stderr,"FAIL : division failed\n");
                fprintf(stderr,"     : inter1_mpfr = ");
                mpfr_printf ("%Re\n", inter1_mpfr);
                return EXIT_FAILURE;
            }
        }
        printf("INFO : ( M_%-2i * L_%-2i ) / X_%-2i = ", k, k, k);
        mpfr_printf ("%Re\n", inter1_mpfr);


        /* accumulate a sigma value term */
        mpfr_clear_flags();
        inex = mpfr_add(sigma_mpfr, sigma_mpfr, inter1_mpfr,
                               MPFR_RNDN);

        if ( inex != 0 ){
            fprintf(stderr,"WARN : Sigma ( M_%-2i * L_%-2i ) / X_%-2i\n",
                                             k, k, k);

            inex = mpfr_check_flags(inex,debug);
            if ( inex != 0 ){
                if(debug){
                    fprintf(stderr,"WARN : mpfr_add() raised a flag\n");
                }
            }
            if ( mpfr_inexflag_p() != 0 ){
                fprintf(stderr,"WARN : inexact computation.\n");
            } else {
                fprintf(stderr,"FAIL : sigma addition failed\n");
                fprintf(stderr,"     : sigma_mpfr = ");
                mpfr_printf ("%Re\n", sigma_mpfr);
                return EXIT_FAILURE;
            }
        }
        printf("INFO : Sigma_%-2i = ", k);
        mpfr_printf ("%Re\n", sigma_mpfr);



        mpfr_clear_flags();
        inex = mpfr_ui_div(inter2_mpfr, (unsigned long int)1, sigma_mpfr,
                               MPFR_RNDN);
        if ( inex != 0 ){
            fprintf(stderr,"WARN : division 1 / sigma\n");
            inex = mpfr_check_flags(inex,debug);
            if ( inex != 0 ){
                if(debug){
                    fprintf(stderr,"WARN : mpfr_ui_div() raised a flag\n");
                }
            }
            if ( mpfr_inexflag_p() != 0 ){
                fprintf(stderr,"WARN : inexact computation.\n");
            } else {
                fprintf(stderr,"FAIL : division failed\n");
                fprintf(stderr,"     : inter2_mpfr = ");
                mpfr_printf ("%Re\n", inter2_mpfr);
                return EXIT_FAILURE;
            }
        }
        printf("INFO : 1 / sigma = ");
        mpfr_printf ("%Re\n", inter2_mpfr);



        mpfr_clear_flags();
        inex = mpfr_mul(inter2_mpfr, constant_mpfr, inter2_mpfr,
                               MPFR_RNDN);
        if ( inex != 0 ){
            fprintf(stderr,"WARN : multiply C * ( 1 / sigma )\n");
            inex = mpfr_check_flags(inex,debug);
            if ( inex != 0 ){
                if(debug){
                    fprintf(stderr,"WARN : mpfr_mul() raised a flag\n");
                }
            }
            if ( mpfr_inexflag_p() != 0 ){
                fprintf(stderr,"WARN : inexact computation.\n");
            } else {
                fprintf(stderr,"FAIL : multiply failed\n");
                fprintf(stderr,"     : inter2_mpfr = ");
                mpfr_printf ("%Re\n", inter2_mpfr);
                return EXIT_FAILURE;
            }
        }
        printf("INFO : C * ( 1 / sigma ) = ");
        mpfr_printf ("%Re\n\n", inter2_mpfr);

    }

    printf("A good result would be   = ");
    printf("3.14159265358979323846264338327950288...\n\n");

    mpfr_clears (  pi_mpfr, ell_k_mpfr, x_k_mpfr, bigk_mpfr,
                   pre_k_mpfr, big5_mpfr, big_neg2_mpfr,
                   twelve_mpfr, sixteen_mpfr, one_mpfr, 
                   big_m_mpfr, constant_mpfr, sigma_mpfr, 
                   inter0_mpfr, inter1_mpfr, inter2_mpfr,
                   (mpfr_ptr*) 0 );

    return EXIT_SUCCESS;
}

