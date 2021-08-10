
/*
 * bin_printf.c given some trivial binary data at some pointer we
 *              print it out in binary. This is endian aware.
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
 
size_t bin_printf ( uint8_t* f, size_t n )
{
    /* Assume that f is a pointer to a set of bytes in
     * memory and that we have n bytes that we can access.
     * There is no protection here for over runs into
     * memory that is uninitialized or otherwise dangerous.
     * Return the number of bytes printed.
     */

    uint8_t byte, mask;
    int j, retval = 0;
    int foo = 1;  /* dummy test integer */
    if ( *(char *)&foo == 1) {
        /* little endian */
        for ( j=(n-1); j>(-1); j-- ) {
            if ((j+1)%8) {
                printf(" ");
            } else {
                /* new line on every eight bytes */
                printf("\n ");
            }
            byte = f[j];
            if ( byte ) {
                mask = 0x80;
                while (mask){
                    printf ( "%d", (byte&mask ? 1 : 0) );
                    mask >>= 1;
                }
            } else {
                printf("00000000");
            }
            retval+=1;
        }
    } else {
        /* big endian */
        for ( j=0; j<n; j++ ) {
            if (j%8) {
                printf(" ");
            } else {
                /* new line on every eight bytes */
                printf("\n ");
            }
            byte = f[j];
            if ( byte ) {
                mask = 0x80;
                while (mask){
                    printf ( "%d", (byte&mask ? 1 : 0) );
                    mask >>= 1;
                }
            } else {
                printf("00000000");
            }
            retval+=1;
        }
    }
    printf("\n" );
    return retval;
}

