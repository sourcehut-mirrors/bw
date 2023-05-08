
/*
 * fp_w128.c  demonstrate catestrophic loss of precision
 *
 * Copyright (C) Dennis Clarke 2018
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
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 *********************************************************************/
#define _XOPEN_SOURCE 600

#define BUFFERSIZE 64;

#include <stdio.h>
#include <stdlib.h>
#include <quadmath.h>
#include <float.h>
#include <fenv.h>

int main( int argc, char **argv )
{

    _Float128 u[48];
    int j;

    const size_t buffer_size = BUFFERSIZE;
    char *buffer = calloc(buffer_size,sizeof(unsigned char));
    int num_chars;

#if defined(__ISO_C_VISIBLE)
    printf("INFO : __ISO_C_VISIBLE id defined\n");
#endif

#ifdef FLT_EVAL_METHOD
    printf("INFO : FLT_EVAL_METHOD == %d\n", FLT_EVAL_METHOD);
#endif

#ifdef DECIMAL_DIG
    printf("INFO : DECIMAL_DIG == %d\n", DECIMAL_DIG);
#endif

#ifdef FLT_DECIMAL_DIG
    printf("INFO : FLT_DECIMAL_DIG == %d\n", FLT_DECIMAL_DIG);
#endif

#ifdef DBL_DECIMAL_DIG
    printf("INFO : DBL_DECIMAL_DIG == %d\n", DBL_DECIMAL_DIG);
#endif

#ifdef LDBL_DECIMAL_DIG
    printf("INFO : LDBL_DECIMAL_DIG == %d\n", LDBL_DECIMAL_DIG);
#endif

#ifdef LDBL_DIG
    printf("INFO : LDBL_DIG == %d\n", LDBL_DIG);
#endif

    printf("\n------------------------------------------\n");

    u[0] = 2.0Q;

    printf("     : the sizeof(u[0]) is %i\n", sizeof(u[0]));

    num_chars = quadmath_snprintf(buffer,
                                  buffer_size, "%40.36Qg", u[0]);

    if (num_chars>0) printf("u[0] = %s\n", buffer);


    u[1] = -4.0Q;

    /* Use bc to manually compute the first few iterations
     *
     * $ bc -lq
     * u0 = 2
     * u1 = -4
     * u2 = 111.0 - 1130.0 / u1 + 3000.0 / ( u0 * u1 )
     * u2
     * 18.50000000000000000000
     * u3 = 111.0 - 1130.0 / u2 + 3000.0 / ( u1 * u2 )
     * u3
     * 9.37837837837837837838
     * u4 = 111.0 - 1130.0 / u3 + 3000.0 / ( u2 * u3 )
     * u4
     * 7.80115273775216138330
     */

    u[2] = 111.0Q - 1130.0Q / u[1] + 3000.0Q / ( u[0] * u[1] );
    printf ("we have u[ 2] = %-36.22Le\n", u[2] );
    u[3] = 111.0Q - 1130.0Q / u[2] + 3000.0Q / ( u[1] * u[2] );
    printf ("we have u[ 3] = %-36.22Le\n", u[3] );
    u[4] = 111.0Q - 1130.0Q / u[3] + 3000.0Q / ( u[2] * u[3] );
    printf ("we have u[ 4] = %-36.22Le\n", u[4] );

    printf ("\n\n");
    for ( j=5; j<48; j++ ) {
        u[j] = 111.0Q - 1130.0Q / u[j-1] + 3000.0Q / ( u[j-2] * u[j-1] );
        printf ("        u[%2i] = %-36.22Le\n", j, u[j] );
    }

    printf ("\n\nFinal result should be 6 precisely.\n\n");
    return EXIT_SUCCESS;

}

