
/* Code was initially supplied by The Wild Greek a.k.a. Charilaos.
 * Then hacked at to figure out why it blows up.
 *
 * This should compute the Fred Gruenburger loop with all 28
 * loops where the first loop is just the entry data 1.0000001
 * raised to the power of 1. We need 939524102 digits in the
 * final loop. That is decimal of course. For a perfect binary
 * representation we need ( 939524102 + 1 ) * log(10)/log(2)
 * total bits of precision. That is 3121031514 bits at least.
 */

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <locale.h>
#include <unistd.h>
#include <assert.h>
#include <gmp.h>
#include <mpfr.h>

#define PREC 3121032000
#define VERBOSE 1

int sysinfo(int verbose);
int gmp_mpfr_ver(int *status, int *mpfr_flags);
int mpfr_check_flags( int mpfr_status, int debug_flag );

int main (void)
{
    mpfr_t ten_million, ten_million_and_one, gruenberger;

    /* only you can stop the abuse of i as an iterator var */
    int mpfr_flag_status, inex, j;
    int mpfr_flags = 0;
    int status = 0;

    long bit_prec = PREC;
    size_t mpfr_precision_size = 0;

    setlocale(LC_ALL, "C");
    sysinfo(VERBOSE);

    mpfr_precision_size = gmp_mpfr_ver(&status, &mpfr_flags);
    if ( status == 999 ) {
        printf("FAIL : gmp_mpfr_ver() returns nein nein nein!\n");
        return EXIT_FAILURE;
    }
    printf("INFO : gmp_mpfr_ver() returns mpfr_flags = %02x\n\n", mpfr_flags);

    printf("\nWe shall use %li bits of precision.\n", bit_prec);
    mpfr_set_default_prec((mpfr_prec_t)bit_prec);

    mpfr_inits2( (mpfr_prec_t) bit_prec, ten_million,
            ten_million_and_one, gruenberger, (mpfr_ptr) NULL);

    char *buf = calloc( 256, sizeof(unsigned char));
    mpfr_flags_clear ( MPFR_FLAGS_ALL );

    /* we need reasonable input precision and that can
     * only be done with a trivial division operation
     * in the specified precision.
     *
     *           10000001
     *           -------- == 1.0000001
     *           10000000
     */

    printf("INFO : will try mpfr_set_flt( ten_million....\n");
    inex = mpfr_set_flt( ten_million, 10000000.0, MPFR_RNDN);
    printf("INFO : will try mpfr_set_flt( ten_million_and_one....\n");
    inex = mpfr_set_flt( ten_million_and_one, 10000001.0, MPFR_RNDN);

    printf("INFO : will try mpfr_div( gruenberger, ten_million_and_one, ten_million,...\n");
    inex = mpfr_div( gruenberger, ten_million_and_one, ten_million, MPFR_RNDN);

    if ( inex == 0 ) {
        /* all is good but lets check the flags */
        mpfr_flag_status = mpfr_check_flags( inex, 1 );
    } else {
        printf("INFO : no surprise, the mpfr_set_d returns non-zero\n");
        printf("     : inex = %i\n", inex);
    }

printf("%-2i    ", 0);
inex = mpfr_snprintf (buf, 72, "%.248RNf", gruenberger);
         printf("%s",buf);
  if ( inex < 0 ) {
        printf("\nINFO : mpfr_snprintf went oopsie doodle\n");
    }
     printf("\n");
    fflush(stdout);
      buf[0] = '\0';

    for ( j=0; j<27; j++) {
        mpfr_flags_clear ( MPFR_FLAGS_ALL );
        printf("INFO : will try mpfr_mul( gruenberger...\n");
        inex = mpfr_mul( gruenberger, gruenberger, gruenberger, MPFR_RNDN);
        /* we need to check the documentation regarding
         * that return value inex as it may NOT always
         * be zero and yet things still work fine. */
        if ( inex != 0 ) {
            mpfr_flag_status = mpfr_check_flags( inex, 1 );
        }
        /* printf("\ri:%2d", j); */
        printf("%-2i    ", j);
        inex = mpfr_snprintf (buf, 72, "%.248RNf", gruenberger);
        printf("%s",buf);
        if ( inex < 0 ) {
            printf("\nINFO : mpfr_snprintf went oopsie doodle\n");
        }
        printf("\n");
        fflush(stdout);
        buf[0] = '\0';
    }
    printf("\n");
    /* mpfr_out_str (stdout, 10, 0, gruenberger, MPFR_RNDN); */

    free (buf);
    printf("\n\n\nf : ");

    /* all the digits we can get on a 64kB page size allocator 
     *     echo ' 14338  65536* pq' | dc 
     *     939655168
     *
     */
    errno = 0;
    buf = calloc( 939655168, sizeof(unsigned char)); 

    if ( buf == NULL ) {
        /* really? possible ENOMEM? */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : malloc returns ENOMEM at %s:%d\n",
                    __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : malloc fails at %s:%d\n",
                    __FILE__, __LINE__ );
        }
        perror("FAIL ");
        return ( EXIT_FAILURE );
    }

    inex = mpfr_snprintf (buf, 939655100, "%.248RNf", gruenberger);
    printf("%s",buf);
    printf("\n");
    fflush(stdout);

    mpfr_clears(gruenberger, ten_million_and_one, ten_million, (mpfr_ptr*)0);
    free (buf);
    return EXIT_SUCCESS;

}

