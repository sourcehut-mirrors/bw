
/*
 * date_list.c generate a list of valid dates from 2019 upwards
 *               or whatever range you want.
 *
 *             Stay away from September of the year 1752.
 *
 * Copyright 2020 Dennis Clarke
 *
 * To the extent possible under law, the authors have waived
 * all copyright and related or neighboring rights to this file.
 * This work is published from: United States, Canada.
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

#include <errno.h>
#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define BUFFERSIZE 32

/* function to determine if a date is valid */
int valid_date( int d, int m, int y );

/* function to print out the date in whatever locale we want */
size_t print_date( int day, int month, int year );

int main(int argc, char *argv[])
{
    size_t bufsize = BUFFERSIZE;
    int day, month, year;
    char *buf;
    
    errno = 0;

    if ( argc > 1 ) {
        printf ("\nINFO : You suggest a locale of %s\n", argv[1]);
        buf = setlocale ( LC_ALL, argv[1] );
    } else {
        buf = setlocale ( LC_ALL, "POSIX" );
    }

    if ( buf == NULL ) {
        fprintf (stderr,"FAIL : setlocale fail\n");
        return(EXIT_FAILURE);
    }

    for ( year = 2020; year < 2024; year++ ) {
        for ( month = 1; month < 13; month++ ) {
            for ( day = 1; day < 32; day++ ) {

                /* does this date exist ? */
                if ( day < 29 ) {

                    print_date( day, month, year );

                } else {

                    if ( valid_date( day, month, year ) == 1 ) {

                        print_date( day, month, year );

                    } else {

                        fprintf (stderr, "WARN : invalid date ");
                        fprintf (stderr, "y = %4i  m = %2i  d = %2i\n",
                                                      year, month, day);

                    }

                }
            } /* day */
        } /* month */
    } /* year */

    return EXIT_SUCCESS;

}

