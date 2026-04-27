
/* pair.c Guess with Miller–Rabin mpz_probab_prime_p to
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
 * Test with a really big prime p-1
 *
 * ./pair 8077404293306336334458524721317491771057862034946702867674746686995494278134865509068057634482068480493150002
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

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gmp.h>

int sysinfo(int verbose);
static int is_digits_only(const char *s);
static void print_mpz(const mpz_t x);
static int miller_rabin_reps(const char *s);

/* check if the user string is just decimal digits */
static int is_digits_only(const char *s)
{
    unsigned char c;
    /* only you can stop the abuse of "i" */
    size_t j;

    /* check for dumb bork */
    if (s == NULL) {
        return 0;
    }

    /* check for a NUL string which is a string ya know? */
    if (s[0] == '\0') {
        return 0;
    }

    /* walk the string and if anything is borked ... then bork */
    for (j = 0; s[j] != '\0'; ++j) {

        c = (unsigned char)s[j];

        /* use 0x30 to 0x39 as ascii values */
        if ( (c < 0x30) || (c > 0x39) ) {
            /* could have used isdigit() */
            return 0;
        }
    }
    return 1;
}

/* do base 10 output and note there is no newline */
static void print_mpz(const mpz_t x)
{
    mpz_out_str(stdout, 10, x);
}

static int miller_rabin_reps(const char *s)
{
    long candidate_input;

    if (is_digits_only(s)) {

        errno = 0;
        candidate_input = strtol(s, (char **)NULL, 10);

        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ) {
            fprintf(stderr,"  WARN : Miller-Rabin reps not understood\n");
            perror("     ");
defaults:
            fprintf(stderr,"       : we assume %i loops.\n", DEFAULT_MR_LOOP);
            return DEFAULT_MR_LOOP;
        }

        if ( ( candidate_input < 15 ) || ( candidate_input > 50 ) ) {
            fprintf(stderr,"  WARN : out of reasonable range Miller-Rabin reps\n");
            goto defaults;
        } else {
            return (int)candidate_input;
        }

    } else {
        fprintf(stderr,"  WARN : no Miller-Rabin loop limit entered\n");
        goto defaults;
    }

}

int
main( int argc, char **argv )
{
    /* a starting number and then two candidates */
    mpz_t start, cand, cand_plus2;

    /* mpz_probab_prime_p() is a guess */
    int twin_count, possible_twin_count, r_cand, r_cand2;

    /* how many times will the Miller-Rabin loop? */
    int mr_reps;

    /* check of the user is a moron and also we are
     * going into the gates of hell with large numbers */
    int hell_freeze_over;

    if (argc < 2) {
        fprintf(stderr, "Use: %s start_number\n", argv[0]);
        fprintf(stderr, "   : optional to add Miller-Rabin loops.\n");
        fprintf(stderr, "   : %s start_number loop_number\n");
        return EXIT_FAILURE;
    }

    if (!is_digits_only(argv[1])) {
        fprintf(stderr, "FAIL : decimal only please\n");
        return EXIT_FAILURE;
    }

    /* Miller-Rabin loops or repetitions and good luck */
    mr_reps = DEFAULT_MR_LOOP;

    if (argc>2) {
        /* just ignore any extra trash on the command line */
        mr_reps = miller_rabin_reps(argv[2]);
    }

    sysinfo(VERBOSE);

    printf("GMP  library version : %d.%d.%d\n",
            __GNU_MP_VERSION,
            __GNU_MP_VERSION_MINOR,
            __GNU_MP_VERSION_PATCHLEVEL );

    /* init the GMP data things */
    mpz_init(start);
    mpz_init(cand);
    mpz_init(cand_plus2);

    /* can the input number be understood? */
    if (mpz_set_str(start, argv[1], 10) != 0) {
        fprintf(stderr, "whoa .. that number does not grok\n");
        /* be polite and clean up and then fuk off */
        mpz_clear(start);
        mpz_clear(cand);
        mpz_clear(cand_plus2);
        return EXIT_FAILURE;
    } else {
        mpz_set(cand, start);
        /* If the user is a moron and provides an even number then
         * tazer them gently and then add 1 to the dumb input */
        if ( mpz_even_p(cand) ) {
            fprintf(stderr, "\n bork even number ... lets add 1\n\n");
            mpz_add_ui(cand, cand, 1);
            print_mpz(cand);
            printf(" <-- how about an odd number?\n\n");
        }
    }

    twin_count = 0;
    possible_twin_count = 0;

    printf("\nINFO : mpz_probab_prime_p() and Miller-Rabin loops %i\n",
              mr_reps);
    printf("     : stop after %i prime pairs are found.\n\n", TWIN_LIMIT);

hell:
    hell_freeze_over = 0;

    do {
        r_cand = mpz_probab_prime_p(cand, mr_reps);
        /* so that is a guess and we get 1 if the number
         * is likely prime. No promise. We get 2 is the
         * thing is really prime! We get 0 otherwise.
         */
        if (r_cand > 0) {
            /* okay .. workable guess. Now add 2 */
            mpz_add_ui(cand_plus2, cand, 2);
            /* same deal ... is that p+2 prime smelling? */
            r_cand2 = mpz_probab_prime_p(cand_plus2, mr_reps);
            if (r_cand2 > 0) {
                /* cool ... just output the basics */
                fputc('\n', stdout);
                if ( (r_cand == 2) && (r_cand2 == 2) ) {
                    /* holy balls .. these are really prime! */
                    twin_count += 1;
                    fputs("certain ", stdout);
                } else {
                    possible_twin_count += 1;
                }

                fputs("twin p and p+2\n", stdout);

                print_mpz(cand);
                fputc('\n', stdout);
                print_mpz(cand_plus2);
                fputc('\n', stdout);
                hell_freeze_over = 1;
                break;
            }
        }

        /* if we fell to here then just add two and keep going */
        mpz_add_ui(cand, cand, 2);

    } while ( hell_freeze_over == 0 );

    /* now do the loop from hell ... forever */
    mpz_add_ui(cand, cand, 4);

    if ( ( twin_count + possible_twin_count ) < TWIN_LIMIT ) {
        goto hell;
    }

    fprintf(stdout,"\n\n Possible prime pairs = %i\n", possible_twin_count);
    fprintf(stdout,"  Certain prime pairs = %i\n\n", twin_count);

    mpz_clear(start);
    mpz_clear(cand);
    mpz_clear(cand_plus2);

    return EXIT_SUCCESS;

}

