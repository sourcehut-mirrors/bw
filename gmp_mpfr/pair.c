
/* pair.c Guess with Miller-Rabin mpz_probab_prime_p to
 *        find a prime pair p and p+2
 *
 * Compile as clean ISO9899:1999 clean as you can. Be sure
 * to set _XOPEN_SOURCE=600 on most sane systems. Works on
 * FreeBSD 16.0-CURRENT on AMD64 Xeon boxen.
 *
 * No promise the results are correct.
 *  The mpz_probab_prime_p is a guess. Probably correct.
 *  No promise. Good luck.
 *
 * See https://gmplib.org/manual/Number-Theoretic-Functions
 *
 *     5.9 Number Theoretic Functions
 *
 *         Function: int mpz_probab_prime_p (const mpz_t n, int reps)
 *
 *         Determine whether n is prime. Return 2 if n is definitely
 *         prime, return 1 if n is probably prime ( guess ), or
 *         return 0 if n is definitely non-prime.
 *
 *         This function performs some trial divisions, a Baillie-PSW
 *         probable prime test, then reps-24 Miller-Rabin probabilistic
 *         primality tests. A higher reps value will reduce the chances
 *         of a non-prime being identified as “probably prime”.
 *         A composite number will be identified as a prime with an
 *         asymptotic probability of less than 4^(-reps).
 *         Reasonable values of reps are between 15 and 50.
 *
 *    * * * NOTE : read that twice as needed. * * * 
 *
 *
 * Test with a big prime p-1
 *
 * ./pair 8077404293306336334458524721317491771057862034946702867674746686995494278134865509068057634482068480493150002
 *
 * Also worth looking at the start number 2462906046175243 where
 * we get a mixture of certainty and maybe :
 *
 * $ ./pair 2462906046175243 | tail -4
 *   Possible prime pairs = 50
 *    Certain prime pairs = 50
 *
 *    Range = 84032
 *
 *
 * Good luck checking that.
 * --------------------------------------------------------------------
 * Copyright (C) Dennis Clarke 2026
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

#define VERBOSE 1
#define DEFAULT_MR_LOOP 25
#define TWIN_LIMIT 100
#define PAGE_SIZE 4096

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <inttypes.h>
#include <gmp.h>

/* to get decent time delta measurements */
#include "tdiff.h"

int sysinfo(int verbose);
static int digits_only(const char *s);
static int miller_rabin_reps(const char *s);

/* check if the user input string is just decimal digits
 * and return the count of digits if all is well, otherwise
 * return a zero. */
static int digits_only(const char *string_of_digits)
{
    /* we need to look at this one char at a time */
    unsigned char c;

    /* only you can stop the abuse of "i" */
    int j;

    /* check for dumb bork */
    if (string_of_digits == NULL) {
        return 0;
    }

    /* check for a NUL string which is a string ya know? */
    if (string_of_digits[0] == '\0') {
        return 0;
    }

    /* walk the string and if anything is borked ... then bork */
    for (j = 0; string_of_digits[j] != '\0'; ++j) {

        c = (unsigned char)string_of_digits[j];

        /* use 0x30 to 0x39 as ascii values */
        if ( (c < 0x30) || (c > 0x39) ) {
            /* should have used isdigit() where EBCDIC may work */
            return 0;
        }
    }
    /* we should have the count of valid decimal digits */
    return j;
}

int
main( int argc, char **argv )
{
    /* we need a few char buffers */
    char *input_num, *tmp;

    /* a starting number and then two candidates */
    mpz_t start, cand, cand_plus2;

    /* track the first probable prime as well as the last
     * found after 100 twins
     */
    mpz_t first, last, range;

    /* mpz_probab_prime_p() is a guess */
    int twin_count, possible_twin_count, r_cand, r_cand2;

    /* how many times will the Miller-Rabin loop? */
    int mr_reps;

    /* check of the user is a moron and also we are
     * going into the gates of hell with large numbers */
    int progress, hundred;

    /* I will want pages of memory to represent the input
     * number as well as other large numbers later. However
     * it is unlikely that one would ever get into numbers
     * with more than 4000 digits. Good luck.
     */
    int page_count, err_status, err_clock, candidate_int;
    int num_of_digits;
    size_t str_chars;

    /* to measure time delta */
    clockid_t clock_flag;
    struct timespec tn_0, tn_1, tn_begin, tn_end;
    tdiff_type delta_time;
    double sum_of_dt = 0.0;

    if (argc < 2) {
        fprintf(stderr, "INFO : %s start_number\n", argv[0]);
        fprintf(stderr, "     : optional to add Miller-Rabin loops.\n");
        fprintf(stderr, "     : %s start_number loop_number\n", argv[0]);
        return EXIT_FAILURE;
    }

    /* we will need at least one full page of memory */
    str_chars = strlen(argv[1]);
    page_count = 1 + str_chars/PAGE_SIZE;

    /* create a buffer for the input number */
    input_num = calloc( page_count * PAGE_SIZE, sizeof(unsigned char));
    if ( input_num == NULL ) {
        /* really? possible ENOMEM? */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc ENOMEM at %s:%d\n",
                    __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                    __FILE__, __LINE__ );
        }
        perror("FAIL ");
        /* NOTE : it is very nasty to bail out this way
         *        but why bother to continue ?
         */
        return EXIT_FAILURE;
    }

    strncpy( input_num, argv[1], str_chars);
    num_of_digits = digits_only(input_num);
    if ( num_of_digits == 0 ) {
        fprintf(stderr, "\nFAIL : decimal digits only please\n");
        return EXIT_FAILURE;
    }

    sysinfo(VERBOSE);

    /* Miller-Rabin loops or repetitions and good luck because a
     * little testing shows this affects nothing much. Nothing
     * changes if we choose a higher number of reps. No idea why
     * and the explanation in the libgmp maillist was really nice
     * and clearup up not much.
     */
    mr_reps = DEFAULT_MR_LOOP;

    if (argc>2) {
        /* a few trivial experiments suggest that the number of loops
         * in the Miller-Rabin probabilistic test is of no concern.
         * Leave the number at 25 which is DEFAULT_MR_LOOP.
         * Again .. good luck.
         */
        errno = 0;
        err_status = sscanf(argv[2],"%" PRIu8, &candidate_int);
        if ( err_status == 0 ) {
            fprintf(stderr,"INFO : Miller-Rabin reps not understood\n");
            if ( errno != 0 ) perror("dBUG ");

            /* we failed to process argv[2] as an unsigned int */
            errno = 0;
            candidate_int = (int)strtol(argv[2], (char **)NULL, 10);
            if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
                fprintf(stderr,"FAIL : Miller-Rabin reps not valid\n");
                perror("     ");
                return EXIT_FAILURE;
            }
            if ( ( candidate_int < 15 ) || ( candidate_int > 50 ) ){
                fprintf(stderr,"WARN : Miller-Rabin reps invalid\n");
                fprintf(stderr,"     : we shall assume 24 and proceed.\n");
                mr_reps = 24;
            } else {
                mr_reps = candidate_int;
            }
        } else {
            if ( ( candidate_int < 15 ) || ( candidate_int > 50 ) ){
                fprintf(stderr,"WARN : Miller-Rabin reps invalid\n");
                fprintf(stderr,"     : we shall assume 25 and proceed.\n");
                mr_reps = 25;
            } else {
                fprintf(stderr,"INFO : Miller-Rabin reps accepted\n");
                mr_reps = candidate_int;
            }
        }
    }

    /* The LLVM/Clang compiler can be a real whiner about
     * things declared and not defined. Thus this is a way
     * to tell the LLVM/Clang compiler to shut up. */
    tn_0.tv_sec     = 0; tn_0.tv_nsec     = 0;
    tn_1.tv_sec     = 0; tn_1.tv_nsec     = 0;
    tn_begin.tv_sec = 0; tn_begin.tv_nsec = 0;
    tn_end.tv_sec   = 0; tn_end.tv_nsec   = 0;
 
    /* determine what sort of clock we can use. if any */
    errno = 0;
    clock_flag = CLOCK_MONOTONIC;
    err_clock = clock_gettime(clock_flag, &tn_begin);
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
            err_clock = clock_gettime(clock_flag, &tn_begin);
 
            if ( err_clock != 0 ) {
                if ( errno == EINVAL ) {
                    /* Not very likely to ever happen as CLOCK_REALTIME
                     * shall always be implemented if the clock_gettime()
                     * function exists. */
                    fprintf(stderr,"FAIL : CLOCK_REALTIME not supported\n");
                    fprintf(stderr,"     : your system is bork bork bork\n");
                    return EXIT_FAILURE;
                }
                fprintf(stderr,"FAIL : bizarre error. good luck.\n");
                return EXIT_FAILURE;
            }
        }
    }

    /* init the GMP data stuff */
    mpz_init(start);
    mpz_init(cand);
    mpz_init(cand_plus2);
    mpz_init(first);
    mpz_init(last);
    mpz_init(range);

    /* can the input number be understood? */
    if (mpz_set_str(start, input_num, 10) != 0) {
        fprintf(stderr, "whoa .. that number does not grok\n");
        /* be polite and clean up */
        mpz_clear(start);
        mpz_clear(cand);
        mpz_clear(cand_plus2);
        return EXIT_FAILURE;
    } else {
        mpz_set(cand, start);
        /* If the user is a moron and provides an even number then
         * tazer them gently and then add 1 to the dumb input */
        if ( mpz_even_p(cand) ) {
            fprintf(stderr, "\nBORK : even number? we shall add 1\n");
            fprintf(stderr, "     : prime numbers are the idea\n");
            mpz_add_ui(cand, cand, 1);
            mpz_out_str(stdout, 10, cand);
        }
        /* how many decimal digits is that input number? */
        tmp = calloc( PAGE_SIZE, sizeof(unsigned char));
        if ( tmp == NULL ) {
            /* possible ENOMEM? */
            if ( errno == ENOMEM ) {
                fprintf(stderr,"FAIL : calloc ENOMEM at %s:%d\n",
                        __FILE__, __LINE__ );
            } else {
                fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                        __FILE__, __LINE__ );
            }
            perror("FAIL ");
            /* bail out ! */
            free(input_num);
            return EXIT_FAILURE;
        }
        /*
        j = gmp_snprintf (char *buf, size_t size, const char *fmt, …);
        */
    }

    twin_count = 0;
    possible_twin_count = 0;

    printf("\nINFO : given a %i digit number\n", num_of_digits);

    printf("     : GMP library version : %d.%d.%d\n",
            __GNU_MP_VERSION,
            __GNU_MP_VERSION_MINOR,
            __GNU_MP_VERSION_PATCHLEVEL );

    printf("     : mpz_probab_prime_p() and Miller-Rabin loops %i\n",
              mr_reps);
    printf("     : stop after %i prime pairs are found.\n\n", TWIN_LIMIT);

    err_clock = clock_gettime(clock_flag, &tn_0);

    /* some sort of progress */
    progress = 0;
hundred:
    hundred = 0;

    do {
        r_cand = mpz_probab_prime_p(cand, mr_reps);
        /* so that is a guess and we get 1 if the number
         * is likely prime. No promise. We get 2 if the
         * thing is really prime! We get 0 otherwise.
         */
        if (r_cand > 0) {
            /* okay .. workable guess. Now add 2 */
            mpz_add_ui(cand_plus2, cand, 2);
            /* same deal ... is that p+2 prime smelling? */
            r_cand2 = mpz_probab_prime_p(cand_plus2, mr_reps);
            if (r_cand2 > 0) {
                /* found a twin prime */
                progress += 1;

                fputc('\n', stdout);
                printf("%03i",progress);
                if ( (r_cand == 2) && (r_cand2 == 2) ) {
                    /* these are really primes */
                    twin_count += 1;
                    fputs("P ", stdout);
                } else {
                    possible_twin_count += 1;
                    fputs("p ", stdout);
                }

                if ( ( twin_count + possible_twin_count ) == 1 ) {
                    /* copy the candidate found into first found */
                    mpz_set (first, cand);
                }

                mpz_out_str(stdout, 10, cand);
                /* fputc('\n', stdout); */

                /* terrible flag name. really we just loop until
                 * we get a hundred twin primes */
                hundred = 1;
                break;
            }
        }

        /* if we fell to here then just add two and keep going */
        mpz_add_ui(cand, cand, 2);

    } while ( hundred == 0 );

    /* now do the loop to a hundred twin primes */
    mpz_add_ui(cand, cand, 4);

    if ( ( twin_count + possible_twin_count ) < TWIN_LIMIT ) {

        err_clock = clock_gettime(clock_flag, &tn_1);
        tdiff( &delta_time, tn_0, tn_1);
        /* we do not need another newline here due to the
         * one fputc() above in this loop */
        printf(" dt = %-+20.10g", delta_time.delta);

        sum_of_dt += delta_time.delta;

        err_clock = clock_gettime(clock_flag, &tn_0);
        goto hundred;
    }

    err_clock = clock_gettime(clock_flag, &tn_end);
    tdiff( &delta_time, tn_0, tn_end);
    printf(" dt = %-+20.10g", delta_time.delta);

    tdiff( &delta_time, tn_begin, tn_end);
    printf("\n\nTotal time DT = %-+20.10g\n", delta_time.delta);
    printf("Sum of the dt = %-+20.10g\n", sum_of_dt);
    printf("         diff = %-+20.10g\n", delta_time.delta - sum_of_dt);
    printf("All other tests and non-prime pairs required \"diff\"\n");


    if ( twin_count ) {
        fprintf(stdout,"Possible prime pairs = %i\n", possible_twin_count);
        fprintf(stdout," Certain prime pairs = %i\n\n", twin_count);
    } else {
        fprintf(stdout,"None of the above are certain to be primes.\n");
    }

    /* snag the last prime candidate to compute the range */
    mpz_set (last, cand_plus2);
    /* compute the range over which out TWIN_LIMIT primes were found */
    mpz_sub (range, last, first);

    printf("Range = ");
    mpz_out_str(stdout, 10, range);
    fputc('\n', stdout);

    /* TODO : compute the density of prime pairs given the magnitude
     *        of the starting number.
     */

    mpz_clear(start);
    mpz_clear(cand);
    mpz_clear(cand_plus2);
    mpz_clear(first);
    mpz_clear(last);
    mpz_clear(range);

    return EXIT_SUCCESS;

}

