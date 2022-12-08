/*
 * proof_fp64.c  Demonstrate that a perfect power of two will have zero
 *               value bytes in the mantissa section of the standard
 *               IEEE754-2008 data types.
 *
 * Copyright (C) Dennis Clarke 2022
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

int main(int argc, char *argv[])
{
    int j;

    /* At best we have mantissa of 52 bits plus an implied one bit
     * thus epsilon will be 2^(-50) may work
     */
    double epsilon = 0.000000000000000888178419700125232338905334472656250;

    /* note hex representation of any valid integer power of two
     * will always have zero for the data section or mantissa
     *
     *   0xMM M0 00 00 00 00 00 00
     *
     *   Where the "M" values represent the sign bit and then
     *   eleven bits for the exponent.
     */

    printf("To demonstrate we shall use 2^(-50).\n");
    printf("epsilon is at address %p\n\n", &epsilon);
    for ( j=0; j<sizeof(double); j++ ) {
        printf("%02x ", ((unsigned char *)&epsilon)[j] );
    }
    printf("\n" );
    printf("Correct precise decimal is = %+-42.38e\n", epsilon);

    /* Because Charilaos says what about 2^(-1) ? */
    epsilon = 0.5;
    printf("\n\nΧαρίλαος says \"What about 2^(-1) ?\"\n");
    printf("epsilon is at address %p\n\n", &epsilon);
    for ( j=0; j<sizeof(double); j++ ) {
        printf("%02x ", ((unsigned char *)&epsilon)[j] );
    }
    printf("\n" );
    printf("Decimal value is = %+-12.8e\n", epsilon);

    return EXIT_SUCCESS;

}

