/*
 * big_int.c  Just demonstrate that inttypes.h will include stdint.h
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

#include <errno.h>
#include <float.h>
#include <inttypes.h>
#include <locale.h>
#include <math.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int
main(int argc, char **argv)
{

    const uint64_t num1 = 9223372036854775807;
    const uint64_t num2 = 9223372036854775807;
    const uint64_t ulli = 18446744073709551614U;

    /* call to setlocale does return char * and therefore we need */
    char *buf;

    uint64_t sum  = num1 + num2;

    if ( argc > 1 ) {
        printf ("\nINFO : You suggest a locale of %s\n", argv[1]);
        buf = setlocale ( LC_ALL, argv[1] );
    } else {
        buf = setlocale ( LC_ALL, "POSIX" );
    }

    if ( buf == NULL ) {
        fprintf (stderr,"FAIL : setlocale fail\n");
        return EXIT_FAILURE;
    }

    printf("num1   : %" PRIu64 "\n", num1);
    printf("num2   : %" PRIu64 "\n", num2);

    printf("sum    : %" PRIu64 "\n", sum);
    printf("sum hex: %" PRIx64 "\n", sum);

    printf("ulli   : %" PRIu64 "\n\n", ulli);

    printf("sum and ulli are ");
    
    if ( sum == ulli ) {
        printf("equal.\n\n");
    } else {
        printf("not equal.\n\n");     
        return EXIT_FAILURE;
    }
    
    return EXIT_SUCCESS;

}

