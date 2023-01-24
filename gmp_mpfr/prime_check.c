
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

    char *prime_check_string;
    int prime_check_reps, prime_check_test;

    setlocale(LC_ALL, "C");

    /* argv[1] must provide an integer */

    if ( argc < 1 ) {
        fprintf(stderr,"please provide a decimal integer\n");
        return EXIT_FAILURE;
    }


    /* for the sake of quick testing we shall assume
     * that the user did provide a decimal number
     */
    prime_check_string = calloc(strlen(argv[1])+1,sizeof(unsigned char));

    /* initialize the libgmp data struct */
    mpz_init(prime_check_input);

    /* we will likely want to check if the input was
     * accepted and processed correctly. Therefore we
     * need a copy of the input string. */
    strncpy(prime_check_string,argv[1],strlen(argv[1]));

    if ( mpz_set_str(prime_check_input, prime_check_string, 10) < 0 ) {
        /* well something went horribly wrong with the input */
        printf("\nBORK BORK BORK at %d in %s\n", __LINE__, __FILE__);
        return EXIT_FAILURE;
    }

    printf("INFO : prime_check_string is \"%s\"\n",prime_check_string);
    gmp_printf ("     : gmp_printf mpz reports %Zd\n", prime_check_input);

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

