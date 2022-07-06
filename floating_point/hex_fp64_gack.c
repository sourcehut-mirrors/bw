
/*
 * hex_fp64_gack.c  Given some FP64 data in memory we print out the
 *                  floating point value. This is endian aware.
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

#include <ctype.h>
#include <errno.h>
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <sys/utsname.h>

static int endian( void )
{
    int eflag = 1; /* 0x00000001 big endian */
    eflag = (*(uint8_t*)&eflag == 1) ? 0 : 1;
    return eflag;
}

int main ( int argc, char *argv[] ) {

    /* Two floating point FP64 values :
     *     00 00 b6 05 85 95 d9 3f
     *     00 00 d4 ce b0 45 ca 3f
     *
     * Those only make sense to little endian machines.
     */
    int k;
    struct utsname uname_data;

    setlocale( LC_MESSAGES, "C" );
    if ( uname( &uname_data ) < 0 ) {
        fprintf ( stderr,
                 "WARNING : Could not attain system uname data.\n" );
        perror ( "uname" );
    } else {
        printf ( "-------------------------------" );
        printf ( "------------------------------\n" );
        printf ( "        system name = %s\n", uname_data.sysname );
        printf ( "          node name = %s\n", uname_data.nodename );
        printf ( "            release = %s\n", uname_data.release );
        printf ( "            version = %s\n", uname_data.version );
        printf ( "            machine = %s\n", uname_data.machine );
        printf ( "             endian = ");
        if ( endian() ){
            printf ("big");
        } else {
            printf ("little");
        }
        printf (" endian\n");
        printf ( "-------------------------------" );
        printf ( "------------------------------" );
    }
    printf ("\n");

    /* little endian values for some FP64 data */
    uint8_t r[8] = { 0x00, 0x00, 0xb6, 0x05, 0x85, 0x95, 0xd9, 0x3f };
    uint8_t j[8] = { 0x00, 0x00, 0xd4, 0xce, 0xb0, 0x45, 0xca, 0x3f };

    /* we may need big endian */
    uint8_t rbe[8], jbe[8];

    if ( endian() ) {
        /* Swap the bytes around. The easy way. Move the bytes to
         * another destination. In reverse. Very easy and fast.
         * Note that people love to talk about fancy ways to
         * swap around bytes inside an array. Some people even
         * want little tricks like swapping the left half of
         * the array to the right half with some temporary
         * variable in the middle. Just keep it simple. Also, for
         * fun just see what happens if the index k is an unsigned
         * datatype like size_t. Bad stuff happens. */
        for (k=7; k>=0; --k) {
            rbe[k] = r[7-k];
            jbe[k] = j[7-k];
        }
        printf("   r = %-+36.22e\n", *(double*)&rbe);
        printf("   j = %-+36.22e\n", *(double*)&jbe);
    } else {
        printf("   r = %-+36.22e\n", *(double*)&r);
        printf("   j = %-+36.22e\n", *(double*)&j);
    }

    return EXIT_SUCCESS;

}

