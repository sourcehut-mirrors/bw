
/*
 * fp128_q.c  mess around with the libquadmath to see IEEE-754 2008
 *            floating point stuff sort of work in an emulated way
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

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <quadmath.h>
#include <float.h>
#include <fenv.h>

#define BUFFERSIZE 128

int main(int argc, char *argv[]){

    __float128 fp0, fp1, fp2, pi;
    const size_t buffer_size = BUFFERSIZE;
    char *buffer = calloc(buffer_size,sizeof(unsigned char));
    int num_chars;

#ifdef FLT_EVAL_METHOD
    printf ( "INFO : FLT_EVAL_METHOD == %d\n", FLT_EVAL_METHOD);
#endif

#ifdef DECIMAL_DIG
    printf ( "INFO : DECIMAL_DIG == %d\n", DECIMAL_DIG);
#endif

/* LDBL_DIG, FLT_DECIMAL_DIG, DBL_DECIMAL_DIG, LDBL_DECIMAL_DIG */
#ifdef FLT_DECIMAL_DIG
    printf ( "INFO : FLT_DECIMAL_DIG == %d\n", FLT_DECIMAL_DIG);
#endif

#ifdef DBL_DECIMAL_DIG
    printf ( "INFO : DBL_DECIMAL_DIG == %d\n", DBL_DECIMAL_DIG);
#endif

#ifdef LDBL_DECIMAL_DIG
    printf ( "INFO : LDBL_DECIMAL_DIG == %d\n", LDBL_DECIMAL_DIG);
#endif

#ifdef LDBL_DIG
    printf ( "INFO : LDBL_DIG == %d\n", LDBL_DIG);
#endif


    /* NOTE : floating point can NOT precisely represent the
     *        test values being used here. Such is life in
     *        the real world of floating point. Good luck.
     */
    fp0 = 36.584Q;

    printf ( "the sizeof(fp0) is %i\n", sizeof(fp0) );

    num_chars = quadmath_snprintf(buffer,
                                  buffer_size, "%40.36Qg", fp0);

    if ( num_chars > 0 ) {

        printf ("INFO : quadmath_snprintf formatted %i chars.\n",
                 num_chars);

    } else {

        fprintf(stderr,"FAIL : quadmath_snprintf failed.\n");
        return EXIT_FAILURE;

    }

    printf ("the value of fp0 is %s\n", buffer);

    fp1 =  7.812Q;

    num_chars = quadmath_snprintf(buffer,
                                  buffer_size, "%40.36Qg", fp1);

    if ( num_chars > 0 ) {

        printf ("INFO : quadmath_snprintf formatted %i chars.\n",
                 num_chars);

    } else {

        fprintf(stderr,"FAIL : wtf quadmath_snprintf failed.\n");
        return EXIT_FAILURE;

    }

    printf ("the value of fp1 is %s\n", buffer);

    fp2 = fp0 + fp1;

    num_chars = quadmath_snprintf(buffer,
                                  buffer_size, "%40.36Qg", fp2);

    if ( num_chars > 0 ) {

        printf("INFO : quadmath_snprintf formatted %i chars.\n",
                num_chars);

    } else {

        fprintf(stderr,"FAIL : wat? quadmath_snprintf failed.\n");
        return EXIT_FAILURE;

    }

    printf("fp2 = fp0 + fp1 = %s\n", buffer);

    /* more than reasonable value for pi which is a few more
     * decimal digits past the stuff in math.h */
    pi = 3.1415926535897932384626433832795028841971693993751Q;

    num_chars = quadmath_snprintf(buffer,
                                  buffer_size, "%46.40Qe", pi );

    if ( num_chars > 0 ) {
        printf ("INFO : quadmath_snprintf formatted %i chars.\n",
                 num_chars);
    } else {
        fprintf(stderr,"FAIL : wat? quadmath_snprintf failed.\n");
        return EXIT_FAILURE;
    }

    printf("libquadmath says pi = %s\n", buffer);
    printf("the real thing is  ~= ");
    printf("3.1415926535897932384626433832795028841971693993...\n");

    free(buffer);
    return EXIT_SUCCESS;  /* or 42 if you prefer */

}

