
/*
 * permute.c  enumerate all permutations of a small set of tokens
 *            where this is all well described by Donald Knuth in
 *            "The Art of Computer Programming", vol. 4, Fascicle 3. 
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
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <iso646.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(void)
{

    /* Use the trivial method where we have seven tokens that we may
     * name A, B, C, ..., G, H and those tokens may be used to represent
     * other strings as required. Give each token a three bit binary
     * value and we clearly have 7 x 3 = 21 bits to represent a string
     * of all seven values.
     */

    int j, k, p[8];
    const char *tok[8];
    char buffer[8];

    tok[0] = "A";
    tok[1] = "B";
    tok[2] = "C";
    tok[3] = "D";
    tok[4] = "E";
    tok[5] = "F";
    tok[6] = "G";
    tok[7] = "H";

    /* ensure we start with a clear buffer */
    memset(&buffer, 0x00, 8);

    for ( j = 0; j < ( 1<<21 ); j++ ) {
        buffer[0] = '\0';
        /* 0000 0000 0000 0111 */
        k = j bitand 0x07;
        p[0] = k;
        strncat(buffer,tok[k],1);
   
        /* 0000 0000 0011 1000 */
        k = ( j bitand 0x38 ) >> 3;
        if ( k != p[0] ) {
            p[1] = k;
            strncat(buffer,tok[k],1);

            /* 0000 0001 1100 0000 */
            k = ( j bitand 0x01c0 ) >> 6;
            if (     ( k not_eq p[0] )
                 and ( k not_eq p[1] ) )  {

                p[2] = k;
                strncat(buffer,tok[k],1);

                /* 0000 1110 0000 0000 */
                k = ( j bitand 0x0e00 ) >> 9;
                if (     ( k not_eq p[0] )
                     and ( k not_eq p[1] ) 
                     and ( k not_eq p[2] ) ) {

                    p[3] = k;
                    strncat(buffer,tok[k],1);

                    /* 0111 0000 0000 0000 */
                    k = ( j bitand 0x7000 ) >> 12;
                    if (     ( k not_eq p[0] )
                         and ( k not_eq p[1] )
                         and ( k not_eq p[2] )
                         and ( k not_eq p[3] ) ) {

                        p[4] = k;
                        strncat(buffer,tok[k],1);

                        /* 0000 0011 1000 0000 0000 0000 */
                        k = ( j bitand 0x038000 ) >> 15;
                        if (     ( k not_eq p[0] )
                             and ( k not_eq p[1] )
                             and ( k not_eq p[2] )
                             and ( k not_eq p[3] ) 
                             and ( k not_eq p[4] ) ) {

                            p[5] = k;
                            strncat(buffer,tok[k],1);

                            /* 0001 1100 0000 0000 0000 0000 */
                            k = ( j bitand 0x1c0000 ) >> 18;
                            if (     ( k not_eq p[0] )
                                 and ( k not_eq p[1] )
                                 and ( k not_eq p[2] )
                                 and ( k not_eq p[3] )
                                 and ( k not_eq p[4] ) 
                                 and ( k not_eq p[5] ) ) {

                                p[6] = k;
                                strncat(buffer,tok[k],1);

                                /* 1110 0000 0000 0000 0000 0000 */
                                k = ( j bitand 0xe00000 ) >> 21;
                                if (     ( k not_eq p[0] )
                                     and ( k not_eq p[1] )
                                     and ( k not_eq p[2] )
                                     and ( k not_eq p[3] )
                                     and ( k not_eq p[4] )
                                     and ( k not_eq p[5] )
                                     and ( k not_eq p[6] ) ) {


                                    p[7] = k;
                                    strncat(buffer,tok[k],1);
                                    printf("%s\n",buffer);

                                    memset(&buffer, 0x00, 8);

                                }

                            }

                        }

                    }

                }

            }

        }

    }

    return EXIT_SUCCESS;

}

