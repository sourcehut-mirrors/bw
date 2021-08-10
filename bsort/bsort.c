
/*
 * bsort.c  Trivial bubble sort demo
 * Copyright (C) Dennis Clarke 2020
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

#define LIMIT 10

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int main(int argc, char **argv)
{

    /* some data elements which are all just trivial 
     * integers and some are negative and some are
     * duplicates. */
    int blarg[LIMIT] = { 45, 12, 1, 4, -5,
                        -62,  8, 0, 1, -4 };

    int k, tmp, swap =0;

    printf("\n-------- input data ------\n");
    for ( k=0; k<10; k++ ) {
        printf("%3i    %-4i\n", k, blarg[k]);
    }

    /* yes we can use a goto just fine */
loop:
    swap = 0;
    for ( k=0; k<(LIMIT-1); k++ ) {
        if ( blarg[k] > blarg[k+1] ) {
            tmp = blarg[k];
            blarg[k] = blarg[k+1];
            blarg[k+1] = tmp;
            swap = 1;
        }
    }
    if ( swap ) goto loop;

    printf("\n-------- output data -----\n");
    for ( k=0; k<10; k++ ) {
        printf("%3i    %-4i\n", k, blarg[k]);
    }
    printf("\n--------------------------\n");

    return EXIT_SUCCESS;

}

