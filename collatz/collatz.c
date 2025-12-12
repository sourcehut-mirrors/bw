
/*
 * collatz.c  A brief look at the Collatz Conjecture sequence
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
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <sys/utsname.h>

#include "collatz.h"

int collatz(collatz_type *cdat);
int c_out(collatz_type *cdat);

int main(int argc, char *argv[]) 
{
    uint64_t k, number;
    collatz_type clatz;

    setlocale( LC_ALL, "C" );

    if ( argc > 1 ){
        number = (uint64_t)strtoll(argv[1], (char **)NULL, 10);
        if ( number > COLLATZ_LIM ) {
            fprintf(stderr,"FAIL : stay in the uint64_t domain\n");
            return EXIT_FAILURE;
        }
        if ( number < 3 ) {
            fprintf(stderr,"FAIL : be reasonable\n");
            return EXIT_FAILURE;
        }
        clatz.c0 = number;
    } else {
        fprintf(stderr,"FAIL : please enter a starting number.\n");
        return EXIT_FAILURE;
    }

    /* After a whack of OCD fiddling around we have this at 60 chars */
    printf ("--------------------------------");
    printf ("--------------------------------\n");
    printf ("       start   path_len    max_at                 max");
    printf ("  hailstone\n");
    printf ("--------------------------------");
    printf ("--------------------------------\n");

    for ( k = number; k > 0; k-- ) {
        clatz.c0 = k;
        if ( collatz( &clatz ) == EXIT_FAILURE ) {
            fprintf(stderr,"FAIL : oops ... something bad happened\n");
            return EXIT_FAILURE;
        }
        c_out(&clatz);
    }

    if ( collatz( &clatz ) == EXIT_FAILURE ) {
        fprintf(stderr,"FAIL : something bad happened\n");
        return EXIT_FAILURE;
    }
    c_out(&clatz);

    return EXIT_SUCCESS;

}

