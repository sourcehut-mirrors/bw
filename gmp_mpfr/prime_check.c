
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

#define MAX_CHECKS 4096

int main (int argc, char *argv[]) {

    mpz_t prime_check_input;
    char *prime_check_string;
    int prime_check_reps, prime_check_test;

    setlocale(LC_ALL, "C");

    /* if argv[1] does not exist than the user is an idiot */

    if ( argc < 1 ) {
        fprintf(stderr,"fer the luv of fuk yer asshat you\n");
        return EXIT_FAILURE;
    }

    prime_check_string = calloc(strlen(argv[1])+1,sizeof(unsigned char));
    /* if that did not work then we are fukked */

    mpz_init(prime_check_input);

    strncpy(prime_check_string,argv[1],strlen(argv[1]));

    if ( mpz_set_str (prime_check_input, prime_check_string, 10) < 0 ) {
        /* well something went horribly wrong here damn it */
        printf("\nBORK BORK BORK at %d in %s\n", __LINE__, __FILE__);
        return EXIT_FAILURE;
    }

    printf("INFO : prime_check_string is \"%s\"\n",prime_check_string);

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
        fprintf(stderr,"BORK : that number is a prime!\n");
        return EXIT_FAILURE;
    }

    if ( ( prime_check_test == 1 ) && ( prime_check_reps < MAX_CHECKS ) ) {
        prime_check_reps += 10;
        fprintf(stderr,"INFO : we do not know about that number.\n");
        fprintf(stderr,"     : reps = %i\n", prime_check_reps);
        goto prime_check;
    }

    fprintf(stderr,"INFO : prime_check_test = %i\n", prime_check_test);

}

