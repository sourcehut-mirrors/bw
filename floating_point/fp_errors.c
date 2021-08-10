
/* fp_errors.c  Demonstrate that floating point numbers are rarely
 *              stored with correct perfect representation.
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

#include <stdio.h>
#include <stdlib.h>

int main ( int argc, char **argv )
{

    /* none of these can be represented with perfect precision */
    float fp32 = 36.584f;
    double fp64 = 36.584;
    long double fp128 = 36.584L;

    printf("\n float fp32 = %g\n", fp32 );
    printf("That looks correct but don\'t believe what you see.\n\n");

    printf(" double fp64 = %-+22.16e\n", fp64 );
    printf(" long double fp128 = %-+40.34Le\n", fp128 );
    printf("Those show that there are errors.\n\n");

    /* none of these will work perfectly either */
    fp32 = 0.1f;
    fp64 = 0.1;
    fp128 = 0.1L;

    printf("How about one tenth? Good luck.\n");
    printf(" float fp32 = %g\n", fp32 );
    printf(" double fp64 = %-+22.16e\n", fp64 );
    printf(" long double fp128 = %-+40.34Le\n", fp128 );

    /* these require that we trap for floating point exceptions */
    fp32 = (float) 1.0000001192092895507812500L;
    printf(" 1.000000119209289550781250   = %-+32.26e\n", fp32 );

    fp32 = (float) 1.0000000596046447753906250L;
    printf(" 1.0000000596046447753906250  = %-+32.26e\n", fp32 );

    fp32 = (float) 1.000000029802322387695312500L;
    printf(" 1.00000002980232238769531250 = %-+32.26e\n", fp32 );

    /* nice easy perfect stuff */
    printf("\n perfect binary values :\n");
    fp32 = (float) 1.25L;
    printf(" float fp32 = %g\n", fp32 );

    fp32 = fp32 / 2;
    printf(" float fp32/2 = %g\n", fp32 );

    return EXIT_SUCCESS;

}

