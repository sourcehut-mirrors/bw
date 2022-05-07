/*
 * file_times.c  print out UNIX ctime mtime atime for a given filename
 * Copyright (C) Dennis Clarke 1999
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

long double timespec_to_ld( struct timespec t ) {

    char buffer[64] = "";
    int bytes_formatted;
    long double ld_t = 0.0;

    /* we need 10 digits for seconds and 9 digits for nsec */
    bytes_formatted = sprintf( buffer, "%10lu.%-9lu",
                               t.tv_sec, t.tv_nsec );

    if ( bytes_formatted > 0 ) {
        ld_t = strtold( buffer, NULL );
        if ( ld_t > ( ( long double ) 0.0 ) ) {
            return  ld_t;
        } else {
            return ( long double ) -1.0;
        }
    } else {
        return ( long double ) -1.0;
    }

}

