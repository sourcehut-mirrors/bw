
/*
 * pollard_rho_minimal.c   A baseline Pollard Rho Algorithm which does
 *                         need libgmp and libmpfr but not much else.
 *
 *                 NOTE : This will resize the bit width of parameters
 *                        if needed. Also will verify the input for a
 *                        given bit width.
 *
 * For the Pollard Rho factorization algorithm please
 * see page 976 of the "CLRS" Algorithms textbook.
 *
 * For a test try 189062773499962839573884702666722005472141132697
 * which should factor nicely in about 15 secs or less.
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
 * ------------------------------------------------------------------
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
#include <time.h>
#include <locale.h>
#include <sys/resource.h>
#include <sys/utsname.h>
#include <math.h>
#include <gmp.h>
#include <mpfr.h>

#include "tdiff.h"

#define PREC 113

int mpfr_check_flags(int mpfr_status, int debug_flag);
int gcd_mpfr(mpfr_t *a_in, mpfr_t *b_in, mpfr_t *g_in);
int gmp_mpfr_ver(int *status, int *mpfr_flags);

int main (int argc, char *argv[])
{
    uint64_t count, number, loop = 1;
    uint64_t x_fixed = 2, size = 2, x = 2, factor = 1;

    long bit_prec = PREC;
    long delta_bit_prec; /* used to increase precision if needed */
    char *endptr, *str, *masprintf_buf;

    struct timespec tn_0, tn_1;

    /* buffer to compare what we receive to what was actually input */
    char *buf;
    int width, chars_formatted;
    int input_attempt_loop = 0;

    int gmp_mpfr_ver_ret = 0;
    int mpfr_flags = 0;
    int err_clock, status = 0;
    size_t masprintf_buf_len, mpfr_precision_size = 0;

    mpfr_t number_m, x_m, x_fixed_m, size_m;
    mpfr_t factor_m, gcd_test_m, one_m, four_m, input_m;
    mpfr_t square_test_m;

    /* wide mpfr_t variables if needed */
    mpfr_t number_m_w, x_m_w, x_fixed_m_w, size_m_w,
           gcd_test_m_w, factor_m_w, one_m_w, input_m_w;

    mpfr_prec_t actual_prec; /* see _MPFR_PREC_FORMAT */
    int inex; /* mpfr retval */
    int debug = 0;

    /* determine if we have access to a system clock */
#if ! defined (CLOCK_MONOTONIC)
fprintf(stderr,"\nWARN : CLOCK_MONOTONIC not defined.\n");
#endif

    clockid_t clock_flag = CLOCK_MONOTONIC;
    tdiff_type delta_time;

    errno = 0;
    err_clock = clock_gettime(clock_flag, &tn_0);
    if ( err_clock != 0 ) {
        fprintf(stderr,"FAIL : ");
        if ( errno == ENOSYS ) {
            fprintf(stderr,"clock_gettime() not supported\n");
            return EXIT_FAILURE;
        }

        if ( errno == EINVAL ) {
            fprintf(stderr,"CLOCK_MONOTONIC not known\n");
            errno = 0;
            clock_flag = CLOCK_REALTIME;
            err_clock = clock_gettime(clock_flag, &tn_0);

            if ( err_clock != 0 ) {
                if ( errno == EINVAL ) {
                    /* Not very likely to ever happen as CLOCK_REALTIME
                     * shall always be implemented if the clock_gettime()
                     * function exists. */
                    fprintf(stderr,"FAIL : CLOCK_REALTIME not supported\n");
                    fprintf(stderr,"     : is your machine an IBM System 370?\n");
                    return EXIT_FAILURE;
                }
                fprintf(stderr,"FAIL : Bizarre clock error. Good luck.\n");
                return EXIT_FAILURE;
            }
        }
    }

    /* C or POSIX locale */
    if ( setlocale( LC_ALL, "POSIX" ) == NULL ) {
        fprintf(stderr,"FAIL : could not set LC_ALL=\"POSIX\"\n");
        return EXIT_FAILURE;
    }

    if ( setlocale( LC_CTYPE, "POSIX" ) == NULL ) {
        fprintf(stderr,"FAIL : could not set LC_CTYPE=\"POSIX\"\n");
        return EXIT_FAILURE;
    }

    if ( setlocale( LC_TIME, "C" ) == NULL ) {
        fprintf(stderr,"FAIL : could not set LC_TIME=\"C\"\n");
        return EXIT_FAILURE;
    }


    gmp_mpfr_ver_ret = gmp_mpfr_ver(&status, &mpfr_flags);


    /* TODO : interpret the status and flags
    printf("INFO : gmp_mpfr_ver() returns mpfr_flags = %02x\n", mpfr_flags);
    printf("     :                            status = %02x\n", status);
    printf("     :                  gmp_mpfr_ver_ret = %02x\n\n", gmp_mpfr_ver_ret);
    */

    /* set the default rounding mode to round to nearest, with the even
     * rounding rule (roundTiesToEven in IEEE 754) */
    mpfr_set_default_rounding_mode (MPFR_RNDN);
    
    mpfr_precision_size = sizeof(mpfr_prec_t);

    /* If the gmp_mpfr_ver_ret differs from mpfr_precision_size then
     * we likely have a problem somewhere.  Good luck. */
    if ( gmp_mpfr_ver_ret != ( (int) mpfr_precision_size ) ) {
        fprintf(stderr,"FAIL : gmp_mpfr_ver_ret != mpfr_precision_size\n");
        return EXIT_FAILURE;
    }

    /* check if a bit precision parameter was on the command line */
    if (argc>2) {
        errno = 0;
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
            return EXIT_FAILURE;
        }

        if (endptr == str) {
            fprintf(stderr, "No bit precision seen.\n");
            return EXIT_FAILURE;
        }

        if (*endptr != '\0'){ /* Not necessarily an error... */
            fprintf(stderr,"INFO : Further characters after bit");
            fprintf(stderr," precision ignored : %s\n", endptr);
        }

        if (bit_prec>1023){
            bit_prec = 1024;
            /* this is somewhat silly but worth a test phase */
            printf("\nWARNING : limit precision to 1024 bits.\n");
        }

    } else {
        bit_prec = PREC;
    }
    delta_bit_prec = bit_prec / 2;

    /* check if a test integer was on the command line */
    if (argc<3){
        fprintf(stderr,"FAIL : test number and bit precision?\n");
        fprintf(stderr,"FAIL : %s <integer> <bit precision>\n", argv[0]);
        return EXIT_FAILURE;
    }

    printf("\nWe shall use %li bits of precision.\n", bit_prec);

    mpfr_set_default_prec((mpfr_prec_t)bit_prec);
    mpfr_init2 (input_m, (mpfr_prec_t) bit_prec);
    mpfr_init2 (four_m, (mpfr_prec_t) bit_prec);

    /* check if a debug flag was on command line */
    if (argc>3){
        fprintf(stderr,"INFO : will assume debug is requested.\n");
        debug = 1;
    }

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

        if ( strcasecmp( argv[1], buf) == 0 ){
            printf("INFO : perfect match on data input.\n");
        }else{
            /*
            if(debug||(input_attempt_loop<1)){
                fprintf(stderr,"WARN : incorrect data on input.\n");
                fprintf(stderr,"     : this is most likely caused by ");
                fprintf(stderr,"insufficient bits\n     : of precision to ");
                fprintf(stderr,"represent the data correctly.\n");
            }
            */
            bit_prec = bit_prec + delta_bit_prec;
            /* check here is bit_prec is a multiple of 32 and
             * just add upwards similar to dc calc with 113 bits
             *   echo '113 32 + 113 32 % - pq' | dc */
            if ( bit_prec%32 != 0 ) bit_prec = bit_prec + 32 - bit_prec%32;
            mpfr_set_default_prec((mpfr_prec_t)bit_prec);
            /* make input variable wider */
            mpfr_set_prec(input_m,(mpfr_prec_t)bit_prec);
            actual_prec=mpfr_get_default_prec();
            printf("INFO : input re-initialized with");
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

    printf("\nWe shall find a factor of ");
    mpfr_printf("%22.Rf\n", input_m);


    /* give a test of this to see what we get 
     *
     * Function: int mpfr_asprintf (char **str, const char *template, …)
     * Write their output as a null terminated string in a block of 
     * memory allocated using the allocation function (see Memory Handling). 
     * A pointer to the block is stored in str. The block of memory must 
     * be freed using mpfr_free_str. The return value is the number of 
     * characters written in the string, excluding the null-terminator, or 
     * a negative value if an error occurred, in which case the contents 
     * of str are undefined.
     *
     *           ("%.8RNg", x)  
     *
     *           is the same as 
     *
     *           ("%.8R*g", MPFR_RNDN, x)  
     *
     */

    inex = mpfr_asprintf ( &masprintf_buf, "%.8ZNg", input_m);
    if ( inex < 0 ) {
        fprintf(stderr,"WARN : some sort of error from mpfr_asprintf\n");
        /* TODO determine what may have happened with the buff */
    } else {
        masprintf_buf_len = strlen( masprintf_buf );
        /*
        fprintf(stderr,"INFO : %zu chars into masprintf_buf\n", masprintf_buf_len);
        */
    }


    /* provide a width field doesn't seem to work
     *   mpfr_printf("%*.Rf\n", width, input_m);
     */

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
    printf("------------------------------------------------------\n");
    printf("Pollard Rho shall proceed with ");
    printf("%i bits of precision.\n", (int)actual_prec);
    printf("------------------------------------------------------\n");

    /* We already checked the error status above so this is just
     * a timestamp. */
    err_clock = clock_gettime(clock_flag, &tn_0);

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
            inex = gcd_mpfr(&number_m, &gcd_test_m, &factor_m);
        }
        inex = mpfr_mul_si(size_m,size_m,(long)2,MPFR_RNDN);
        inex = mpfr_set(x_fixed_m, x_m, MPFR_RNDN);
        printf("count = %12"PRIu64" ", count);
        if(debug){
            /* do not report a factor of 1 and perhaps a time delta
             * would be more useful here */

            err_clock = clock_gettime(clock_flag, &tn_1);

            /*
             * tdiff( &delta_time, tn_0, tn_1);
             *
             * printf("            delta = %10ld    %9ld\n",
             *                 delta_time.sec, delta_time.nsec);
             *
             * printf("             fp64 = %-+20.10g\n\n", delta_time.delta);
             *
             * we need to check the factor via one_m mpfr data
             *
             * why the hell is there a %26 in the format string ??
             */
            if ( mpfr_cmp(factor_m, one_m) == 0 ) {
                /* output the current value for x and a timestamp */
                mpfr_printf("  x = %26.Rf   t_delta = ", x_m);
                tdiff( &delta_time, tn_0, tn_1);
                printf("%-+20.10g", delta_time.delta);
            } else {
                mpfr_printf("  x = %26.Rf    factor = %.Rf", x_m, factor_m);
            }

        }
        printf("\n");
        loop = loop + 1;
    }

    printf("DONE : used %i bits of precision.\n", (int)actual_prec);
    mpfr_printf("     : factor of %.Rf is %.Rf\n", number_m, factor_m);

    /* TODO : gather another timestamp and also verify the result */

    mpfr_clears (number_m, x_m, x_fixed_m, size_m, factor_m, gcd_test_m,
                 one_m, (mpfr_ptr) 0);
    free(buf);

    return EXIT_SUCCESS;

}

