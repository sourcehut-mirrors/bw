
/* prime_check.c    The GMP manual seems to list a few functions in a
 *                  category named "Number Theoretic Functions". These
 *                  include mpz_probab_prime_p() and mpz_nextprime().
 *                  The names seem fairly clear in that we may ask for
 *                  the probability that a number is prime as well as
 *                  ask for the next prime larger than some number n.
 *                  One of them seems to work whereas the other may only
 *                  work somewhat. See : 
 *
 *          https://gmplib.org/manual/Number-Theoretic-Functions
 *
 *                  The test number that concerns me is : 
 *
 *     n = 93461639715357977769163558199606896584051237541638188580280321
 *
 * Copyright (C) Dennis Clarke 2023
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

#define MAX_CHECKS 100

int main (int argc, char *argv[]) {

    mpz_t prime_check_input, less_one, next_prime;

    char *cli, *cli_verify;
    size_t len;
    int prime_check_reps, prime_check_test, cli_check;

    setlocale(LC_ALL, "C");

    /* argv[1] must provide an integer */
    if ( argc < 2 ) {
        fprintf(stderr,"please provide a decimal integer\n");
        return EXIT_FAILURE;
    }

    /* for the sake of quick testing we shall assume
     * that the user did provide a decimal number */
    errno = 0;
    len = strlen(argv[1]);
    cli = calloc(len+1,sizeof(unsigned char));
    if ( cli == NULL ) {
        fprintf(stderr,"BORK BORK BORK at %d in %s\n", __LINE__, __FILE__);
        perror("ERR ");
        return EXIT_FAILURE;
    }

    errno = 0;
    cli_verify = calloc(len+1,sizeof(unsigned char));
    if ( cli_verify == NULL ) {
        fprintf(stderr,"BORK BORK BORK at %d in %s\n", __LINE__, __FILE__);
        perror("ERR ");
        return EXIT_FAILURE;
    }

    /* initialize the libgmp data struct */
    mpz_init(prime_check_input);

    /* we will likely want to check if the input was
     * accepted and processed correctly. Therefore we
     * need a copy of the input string.
     * NOTE : would it not be lovely to use a variable
     *        name such as : 
     *
     *  char *command_line_interface_user_input_argument_1
     *
     * However my old old Fortran77 punch card brain seems
     * to just cut loose a high pitch scream at that.
     */
    strncpy(cli,argv[1],len);

    if ( mpz_set_str(prime_check_input, cli, 10) < 0 ) {
        /* well something went horribly wrong with the input */
        fprintf(stderr,"BORK BORK BORK at %d in %s\n", __LINE__, __FILE__);
        return EXIT_FAILURE;
    }

    /* this is a visual eyeball check if the input matches the 
     * data represented inside the mpz_t struct
    printf("INFO : cli is \"%s\"\n",cli);
    gmp_printf ("     : gmp_printf mpz reports %Zd\n", prime_check_input);

     we have the beautiful func : 

        int gmp_snprintf (char *buf, size_t size, const char *fmt, ...)

            so lets use it 

     */

    cli_check = gmp_snprintf(cli_verify, len, "%Zd",prime_check_input);

    if ( cli_check != len ) {
        fprintf(stderr,"BORK BORK BORK\n");
        fprintf(stderr,"\n\nThe input string was \n\n    \"");
        fprintf(stderr,"%s\"\n\n", cli);
        fprintf(stderr,"\n\ngmp_snprintf() resulted in \n\n    \"");
        fprintf(stderr,"%s\"\n\n", cli_verify);
        fprintf(stderr,"BORK BORK BORK\n");
        return EXIT_FAILURE;
    }


    /*
     * Function: int mpz_probab_prime_p (const mpz_t n, int reps)
     *
     * Determine whether n is prime. Return 2 if n is definitely
     * prime, return 1 if n is probably prime (without being
     * certain), or return 0 if n is definitely non-prime.
     */

    prime_check_reps = 20;
prime_check:
    prime_check_test = mpz_probab_prime_p(prime_check_input, prime_check_reps);

    if ( prime_check_test == 2 ) {
        /* well we are done here ! this is a prime */
        printf("INFO : that number is a prime!\n");
        return EXIT_SUCCESS;
    }

    if ( ( prime_check_test == 1 ) && ( prime_check_reps < MAX_CHECKS ) ) {
        prime_check_reps += 10;
        fprintf(stderr,"INFO : we do not know about that number.\n");
        fprintf(stderr,"     : reps = %i\n", prime_check_reps);
        goto prime_check;
    }

    fprintf(stderr,"INFO : prime_check_test = %i\n", prime_check_test);
    fprintf(stderr,"     : mpz_probab_prime_p() does not know!\n");

    /* if we landed here then we know that the prime check 
     * does not help us. Therefore we may try a trivial 
     * trick with : 
     *
     * Function: void mpz_sub_ui (mpz_t rop, const mpz_t op1,
     *                            unsigned long int op2)
     *
     * Essentially we subtract one and then search for the
     * next prime number.
     *
     */

    mpz_init(less_one);
    mpz_sub_ui(less_one, prime_check_input, 1);

    gmp_printf ("\nINFO : input minus one is is %Zd\n", less_one);
    
    /* Now we fire off
     *     Function: void mpz_nextprime (mpz_t rop, const mpz_t op)
     */
    mpz_init(next_prime);
    mpz_nextprime(next_prime,less_one);

    gmp_printf ("     : mpz_nextprime claims  %Zd\n", next_prime);

    if ( mpz_cmp(prime_check_input, next_prime) == 0 ) {
        printf("DONE : the input is a prime. Most likely.\n");
        printf("     : Maybe. Good luck.\n");
        return EXIT_SUCCESS;
    }

    fprintf(stderr,"FAIL : we do not know anything about the input number.\n");

    return EXIT_FAILURE;

}

