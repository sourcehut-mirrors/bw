
/*
 * pr_mpfr_quiet.c Pollard Rho Algorithm with arbitrary precision.
 *                 Less verbose output here unless you ask for it.
 *
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
#include <time.h>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>

/* lowest reasonable precision */
#define PREC 113

/* largest precision accepted on input */
#define MAX_PREC 8192

int mpfr_check_flags(int status, int debug_flag);
int gmp_mpfr_ver(int *status, int *mpfr_flags);

uint64_t timediff( struct timespec start_time,
                   struct timespec end_time );


#define VERBOSE 1
int sysinfo(int verbose);

/* Note that a recusrsive algorithm may be faster here.
 * For that matter the GMP Library provides a gcd
 * function that is very optimal.
 *
 * However this is dirt simple.
 */
int gcd_m(mpfr_t *a_in, mpfr_t *b_in, mpfr_t *g_in)
{
    /* we will make a copy of the input data and
     * also we will need to check the modulo
     * remainder in rem_m */
    mpfr_t rem_m, a, b, g;
    mpfr_inits(rem_m, a, b, g, (mpfr_ptr) NULL);
    /* now copy the input data */
    mpfr_set(a, *a_in, MPFR_RNDN);
    mpfr_set(b, *b_in, MPFR_RNDN);
    mpfr_set(g, *g_in, MPFR_RNDN);

    while ( mpfr_zero_p(b) == 0 ) {
        mpfr_fmod(rem_m, a, b, MPFR_RNDN);
        mpfr_set(a, b, MPFR_RNDN);
        mpfr_set(b, rem_m, MPFR_RNDN);
    }
    /* whatever is left in a is what we need */
    mpfr_set(*g_in, a, MPFR_RNDN);
    /* clear out those copies */
    mpfr_clears (rem_m, a, b, g, (mpfr_ptr) 0);
    return EXIT_SUCCESS;
}

/* For the Pollard Rho factorization algorithm please
 * see page 976 of the "CLRS" Algorithms textbook.
 *
 * Feel free to test with a prime pair that Jenny gave us :
 *
 *     75261003596099 = 8675309 * 8675311
 * Should factor neatly in about 16 secs or so :
 *
 *     count = 382124  x = 24317867926243  factor = 8675309
 *     A factor of 75261003596099 is 8675309
 *     
 */

int main (int argc, char *argv[])
{
    struct timespec t0, t1;
    uint64_t t_delta;
    uint64_t count, number, loop = 1;
    uint64_t x_fixed = 2, size = 2, x = 2, factor = 1;

    long bit_prec = PREC;
    long delta_bit_prec; /* used to increase precision if needed */
    char *endptr, *str;

    /* buffer to compare what we receive to what was actually input */
    char *buf, *prime_check_string;
    int width, chars_formatted;
    int input_attempt_loop = 0;

    int mpfr_flags = 0;
    int status = 0;
    size_t mpfr_precision_size = 0;

    setlocale(LC_ALL, "C");
    sysinfo(VERBOSE);

    int prime_check_reps, prime_check_test;
    mpz_t prime_check_input;

    mpfr_precision_size = gmp_mpfr_ver(&status, &mpfr_flags);
    if ( status == 999 ) {
        printf("FAIL : gmp_mpfr_ver() returns nein nein nein!\n");
        return EXIT_FAILURE;
    }

    printf("INFO : gmp_mpfr_ver() returns mpfr_flags = %02x\n\n", mpfr_flags);

    mpfr_t number_m, x_m, x_fixed_m, size_m;
    mpfr_t factor_m, gcd_test_m, one_m, four_m, input_m;
    mpfr_t square_test_m;

    /* wide mpfr_t variables if needed */
    mpfr_t number_m_w, x_m_w, x_fixed_m_w, size_m_w,
           gcd_test_m_w, factor_m_w, one_m_w, input_m_w;

    mpfr_prec_t actual_prec; /* see _MPFR_PREC_FORMAT */
    int inex; /* mpfr retval */
    int debug = 0;

    /* only function with for the C or POSIX class. */
    if ( setlocale( LC_ALL, "POSIX" ) == NULL ) {
        fprintf(stderr,"FAIL : could not set LC_ALL=\"POSIX\"\n");
        return (EXIT_FAILURE);
    }

    /* only function with for the C or POSIX class. */
    if ( setlocale( LC_CTYPE, "POSIX" ) == NULL ) {
        fprintf(stderr,"FAIL : could not set LC_CTYPE=\"POSIX\"\n");
        return (EXIT_FAILURE);
    }

    /* check if a debug flag was on command line */
    if (argc>3){
        fprintf(stderr,"INFO : will assume debug is requested.\n");
        debug = 1;
    }

    /* check if a test integer was on the command line */
    if (argc<3){
        fprintf(stderr,"FAIL : test number and bit precision?\n");
        fprintf(stderr,"FAIL : %s <integer> <bit precision>\n", argv[0]);
        return (EXIT_FAILURE);
    }

    /* check if a bit precision parameter was on the command line */
    if (argc>2){
        errno = 0; /* To distinguish success/failure after call */
        str = argv[2];
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

        if (bit_prec>MAX_PREC){
            bit_prec = MAX_PREC;
            printf("\nWARNING : limit to %i bits.\n", MAX_PREC);
        }

    } else {
        bit_prec = PREC;
    }

    delta_bit_prec = bit_prec / 2;
    printf("\nWe shall use %li bits of precision.\n", bit_prec);
    mpfr_set_default_prec((mpfr_prec_t)bit_prec);
    mpfr_init2 (input_m, (mpfr_prec_t) bit_prec);
    mpfr_init2 (four_m, (mpfr_prec_t) bit_prec);

    /* here we try to accept the input data within the bit
     * precision specified. This may fail in that the
     * input data can not be represented within the bit
     * precision. In which case we expand the precision.
     *
     * TODO : Perhaps we do not accept silly large numbers
     */
input_try:
    if (argc>1){
        if (debug && (input_attempt_loop>0)) {
            printf("INFO : we shall attempt to read input again.\n");
        }

        inex = mpfr_set_str(input_m, argv[1], 10, MPFR_RNDN);
        if ( inex < 0 ) {
            printf("\nFAIL : some mysterious problem happened!\n");
            printf("     : we tried to interpret %s\n", argv[1]);
            printf("     : however we seemed to get ");
            mpfr_printf("%.Rf\n", input_m);
            return EXIT_FAILURE;
        }

        /* check if the data we received is correctly represented
         * in the mpfr_t input_m */

        /* buffer big enough for the string plus a trailing null */
        width = strlen(argv[1])+1;
        buf = calloc((size_t)width, (size_t)sizeof(unsigned char));
        chars_formatted = mpfr_snprintf(buf,(size_t)width,"%.Rf\n", input_m);
        if (chars_formatted < 0 ){
            fprintf(stderr,"FAIL : mpfr_snprintf tossed an error.\n");
            return EXIT_FAILURE;
        }

        if(debug||(input_attempt_loop<1)){
            printf("INFO : chars_formatted = %i\n", chars_formatted);
            printf("INFO : buf = \'%s\'\n", buf);
        }

        if (strcasecmp(argv[1], buf) == 0 ){
            printf("INFO : perfect match on data input.\n");
            /* Now we have good data so we save it for a prime check */
            prime_check_string = calloc(width,(size_t)sizeof(unsigned char));
            /* TODO test if the calloc works */
            strncpy(prime_check_string,buf,width);
        } else {
            if(debug||(input_attempt_loop<1)){
                fprintf(stderr,"WARN : incorrect data on input.\n");
                fprintf(stderr,"     : this is most likely caused by ");
                fprintf(stderr,"insufficient bits\n     : of precision to ");
                fprintf(stderr,"represent the data correctly.\n");
            }
            bit_prec = bit_prec + delta_bit_prec;
            /* check here is bit_prec is a multiple of 32 and
             * just add upwards similar to dc calc with 113 bits
             *   echo '113 32 + 113 32 % - pq' | dc */
            if ( bit_prec%32 != 0 ) bit_prec = bit_prec + 32 - bit_prec%32;
            mpfr_set_default_prec((mpfr_prec_t)bit_prec);
            /* make input variable wider */
            mpfr_set_prec(input_m,(mpfr_prec_t)bit_prec);
            actual_prec=mpfr_get_default_prec();
            printf("INFO : Input variable re-initialized with");
            printf(" %i bits of precision.\n", (int)actual_prec);
            free(buf);
            buf = NULL;
            input_attempt_loop += 1;
            goto input_try;
        }

        if (mpfr_number_p(input_m)==0){
            printf("\nFAIL : provide a reasonable decimal number.\n");
            return EXIT_FAILURE;
        }

        mpfr_set_si(four_m, (long)4, MPFR_RNDN);
        if (mpfr_cmp (input_m, four_m) < 0 ) {
            printf("\nFAIL : provide a reasonable composite integer.\n");
            return EXIT_FAILURE;
        }

    }

    /* TODO it would be of some value to check if the number
     * provided was a prime. We may not be able to prove that
     * any given input is a prime but we may be able to rule
     * out an obvious prime. */
    mpz_init(prime_check_input);
    if ( mpz_set_str (prime_check_input, prime_check_string, 10) < 0 ) {
        /* well something went horribly wrong here damn it */
        printf("\nBORK BORK BORK at %d in %s\n", __LINE__, __FILE__);
        return EXIT_FAILURE;
    }

    printf("INFO : prime_check_string is \"%s\"\n",prime_check_string);

    /* Get the REALTIME_CLOCK time in a timespec struct */
    if ( clock_gettime(CLOCK_REALTIME, &t0 ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERR  : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }

    /* Here we take a whirl at checking if that number is
     * a composite or a prime. There is no promise this
     * works. See the manual for MPFR : 
     *
     *     int mpz_probab_prime_p (const mpz_t n, int reps)
     *
     *     Determine whether n is prime.
     *     Return :  2 if n is definitely prime
     *               1 if n is probably prime (maybe)
     *               0 if n is definitely non-prime.
     *
     * Good luck.
     */

    prime_check_reps = 20;
prime_check:
    prime_check_test = mpz_probab_prime_p(prime_check_input, prime_check_reps);

    if ( clock_gettime(CLOCK_REALTIME, &t1 ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERR  : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }

    t_delta = timediff(t0, t1);
    printf("INFO : mpz_probab_prime_p() = %14" PRIu64 " nsec\n", t_delta);

    if ( prime_check_test == 2 ) {
        /* well we are done here ! this is a prime number */
        fprintf(stderr,"BORK : that number is a prime!\n");
        fprintf(stderr,"     : you used %" PRIu64 " nsecs\n", t_delta);
        return EXIT_FAILURE;
    }

    if ( ( prime_check_test == 1 ) && ( prime_check_reps < 50 ) ) {
        prime_check_reps += 10;
        fprintf(stderr,"INFO : we do not know yet... try again\n");
        goto prime_check;
    }

    free(buf);
    buf = NULL;

    fprintf(stderr,"INFO : we know for certain that input is composite.\n");
    fprintf(stderr,"     : you used  %" PRIu64 " nsecs to verify.\n", t_delta);

    printf("------------------------------------------------------\n");
    printf("     : We shall find a factor of ");
    mpfr_printf("%22.Rf\n", input_m);

    mpfr_set_default_prec((mpfr_prec_t)bit_prec);

    mpfr_inits(number_m, x_m, x_fixed_m,
               size_m, gcd_test_m, factor_m,
               one_m, square_test_m, (mpfr_ptr) NULL);

    mpfr_set(number_m, input_m, MPFR_RNDN);

    /* we don't need input_m or four_m anymore */
    mpfr_clear(input_m);
    mpfr_clear(four_m);

    mpfr_set_si(x_fixed_m, (long)x_fixed, MPFR_RNDN);
    mpfr_set_si(x_m, (long)x, MPFR_RNDN);
    mpfr_set_si(size_m, (long)size, MPFR_RNDN);
    mpfr_set_si(factor_m, (long)factor, MPFR_RNDN);
    mpfr_set_si(gcd_test_m, (long)0, MPFR_RNDN);
    mpfr_set_si(one_m, (long)1, MPFR_RNDN);

    actual_prec=mpfr_get_default_prec();
    printf("Pollard Rho shall proceed with ");
    printf("%i bits of precision.\n", (int)actual_prec);
    printf("------------------------------------------------------\n");

    while ( mpfr_cmp( factor_m, one_m) == 0 ) {
        printf("loop %6"PRIu64"    ", loop);
        for ( count = 1;
                 (mpfr_cmp_si(size_m,(long)count)>=0)
                 &&
                 (mpfr_cmp_si(factor_m,(long)1)<=0); count++) {

do_square:
            mpfr_clear_flags();
            inex = mpfr_mul(square_test_m, x_m, x_m, MPFR_RNDN);
            inex = mpfr_check_flags(inex,debug);
            if ( inex != 0 ){
                if(debug){
                    fprintf(stderr,"WARN : mpfr_mul() raised a flag\n");
                }
                mpfr_clear_flags();
                /* check here is bit_prec is a multiple of 32 and
                 * just add upwards similar to dc calc with 113 bits
                 *   echo '113 32 + 113 32 % - pq' | dc */
                bit_prec = bit_prec + delta_bit_prec;
                if ( bit_prec%32 != 0 ) bit_prec = bit_prec + 32 - bit_prec%32;
                mpfr_set_default_prec((mpfr_prec_t)bit_prec);
                /* make all variables wider */
                mpfr_inits2( (mpfr_prec_t) bit_prec,
                           number_m_w, x_m_w, x_fixed_m_w,
                           size_m_w, gcd_test_m_w, factor_m_w,
                           one_m_w, (mpfr_ptr) NULL);

                inex = mpfr_set(number_m_w, number_m, MPFR_RNDN);
                inex = mpfr_set(x_m_w, x_m, MPFR_RNDN);
                inex = mpfr_set(x_fixed_m_w, x_fixed_m, MPFR_RNDN);
                inex = mpfr_set(size_m_w, size_m, MPFR_RNDN);
                inex = mpfr_set(gcd_test_m_w, gcd_test_m, MPFR_RNDN);
                inex = mpfr_set(factor_m_w, factor_m, MPFR_RNDN);
                inex = mpfr_set(one_m_w, one_m, MPFR_RNDN);
                /* clear the old vars that were not wide enough */
                mpfr_clears(number_m, x_m, x_fixed_m, size_m,
                            factor_m, gcd_test_m, one_m, (mpfr_ptr) 0);
                /* re-init them all again as new wider vars */
                mpfr_inits2( (mpfr_prec_t) bit_prec,
                           number_m, x_m, x_fixed_m,
                           size_m, gcd_test_m, factor_m,
                           one_m, (mpfr_ptr) NULL);
                /* transfer the data back into the new wider vars */
                inex = mpfr_set(number_m, number_m_w, MPFR_RNDN);
                inex = mpfr_set(x_m, x_m_w, MPFR_RNDN);
                inex = mpfr_set(x_fixed_m, x_fixed_m_w, MPFR_RNDN);
                inex = mpfr_set(size_m, size_m_w, MPFR_RNDN);
                inex = mpfr_set(gcd_test_m, gcd_test_m_w, MPFR_RNDN);
                inex = mpfr_set(factor_m, factor_m_w, MPFR_RNDN);
                inex = mpfr_set(one_m, one_m_w, MPFR_RNDN);

                /* clear the tmp vars we don't need any more */
                mpfr_clears(number_m_w, x_m_w, x_fixed_m_w,
                            size_m_w, factor_m_w, gcd_test_m_w,
                            one_m_w, (mpfr_ptr) 0);

                /* we don't need the square_test_m data anymore as it
                 * is not correct anyways ... thus :
                 *
                 * void mpfr_set_prec (mpfr_t x, mpfr_prec_t prec)
                 *
                 *    Reset the precision of x to be exactly prec bits,
                 *    and set its value to NaN. The previous value stored
                 *    in x is lost.
                 *
                 *    It is equivalent to a call to mpfr_clear(x)
                 *    followed by a call to mpfr_init2(x, prec), but more
                 *    efficient  ...   see manpages for more info ...
                 */
                mpfr_set_prec(square_test_m,(mpfr_prec_t) bit_prec);
                actual_prec=mpfr_get_default_prec();
                if(debug){
                    printf("All variables are");
                    printf(" re-initialized with");
                    printf(" %i bits of precision.\n",
                                                     (int)actual_prec);
                } else {
                    printf("  try again with %i bits of precision.\n",
                                                     (int)actual_prec);
                }
                printf("loop %6"PRIu64"    ", loop);
                goto do_square;
            }

            inex = mpfr_set(x_m, square_test_m, MPFR_RNDN);
            inex = mpfr_add_si(x_m, x_m, (long) 1, MPFR_RNDN);
            inex = mpfr_fmod(x_m, x_m, number_m, MPFR_RNDN);
            inex = mpfr_sub(gcd_test_m, x_m, x_fixed_m, MPFR_RNDN);
            inex = mpfr_abs(gcd_test_m, gcd_test_m, MPFR_RNDN);
            inex = gcd_m(&number_m, &gcd_test_m, &factor_m);
        }
        inex = mpfr_mul_si(size_m,size_m,(long)2,MPFR_RNDN);
        inex = mpfr_set(x_fixed_m, x_m, MPFR_RNDN);
        printf("count = %12"PRIu64" ", count);
        if(debug){
            mpfr_printf("  x = %26.Rf   factor = %.Rf", x_m, factor_m);
        }
        printf("\n");
        loop = loop + 1;
    }

    printf("DONE : used %i bits of precision.\n", (int)actual_prec);
    mpfr_printf("     : factor of %.Rf is %.Rf\n", number_m, factor_m);

    /* TODO : check the result to verify that indeed we have a 
     *        perfect integer factor */

    mpfr_clears (number_m, x_m, x_fixed_m, size_m, factor_m, gcd_test_m,
                 one_m, (mpfr_ptr) 0);

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

