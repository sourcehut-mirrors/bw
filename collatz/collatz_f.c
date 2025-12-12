
/*
 * collatz_f.c  The actual Collatz Conjecture calculation
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

/* there should be no reason to need this anymore 
 *   #define __STDC_FORMAT_MACROS
 */
#include <inttypes.h>

#include "collatz.h"

int collatz(collatz_type *cdat) 
{

    uint64_t number;

    if ( ( cdat->c0 ) > COLLATZ_LIM ) {
        fprintf(stderr,"FAIL : computation outside uint64_t domain.\n");
        return EXIT_FAILURE;
    }

    cdat->height_location = 0;
    cdat->path_height = 0;
    cdat->path_len = 0;
    cdat->upwards_count = 0;
    number = cdat->c0;

    while (number > 1) {

        if (number % 2 == 0) {
            number = number / 2;
        } else {
            if ( number > COLLATZ_LIM ) {

                fprintf(stderr,"FAIL : computation outside uint64_t");
                fprintf(stderr," domain.\n     : %12" PRIu64, number);
                fprintf(stderr," path pos %8i\n", cdat->path_len );

                return EXIT_FAILURE;
            }
            number = 3 * number + 1;
            /* We are curious about hailstone numbers 
             * https://mathworld.wolfram.com/HailstoneNumber.html
             * integers in the Collatz conjecture may rise and fall
             * over and over before dropping to one. Called hailstone
             * numbers which rise and fall. */
            cdat->upwards_count +=1;
        }
        cdat->path_len = cdat->path_len + 1;

        if ( number > ( cdat->path_height ) ) {
            cdat->path_height = number;
            cdat->height_location = (uint64_t)cdat->path_len;
        }

        /* if we ever want to look at all the intermediate value
         * then we drop in this 
         *

        printf ("debug : number = %16" PRIu64 " max_height = ", number);
        printf ("%16" PRIu64 " path_len = %16" PRIu64"\n",
                            cdat->path_height, cdat->path_len );

        */


    }

    return EXIT_SUCCESS;

}

