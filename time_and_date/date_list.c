
/*
 * date_list.c generate a list of valid dates from 2019 upwards
 *               or whatever range you want.
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
    
    errno = 0;  /* start with no error condition */

    /* we will need a buffer for the setlocale call etc *
     *    buf = malloc( bufsize );
     *    if ( buf == NULL ) {
     *        perror ( "doh! ");
     *        fprintf (stderr,"FAIL : malloc failed for buf\n");
     *        return EXIT_FAILURE;
     *    }
     */

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


/*
        candidate_int = (int)strtol(argv[5], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : pthread_limit not understood\n");
            perror("     ");
            return ( EXIT_FAILURE );
        }
        if ( ( candidate_int < 1 ) || ( candidate_int > 64 ) ){
            fprintf(stderr,"WARN : pthread_limit is unreasonable\n");
            fprintf(stderr,"     : we shall assume 1 and proceed.\n");
            pthread_limit = 1;
        } else {

            if ( candidate_int > 1 ) {

                * snazzy little bit shifting and counting follows
                 * where this is not at all efficient but is sort of
                 * fun *

                k = 0; * number of '1' bits in candidate_int *
                j = candidate_int;
                p = 0; * bit position being tested *
                while (j) {
                    if ( j & 1 ) {  * test the LSB position * 
                        k += 1;     * count the '1' bit * 
                    }
                    j = j >> 1;     * shift left * 
                    p += 1;         * keep track of the bit position * 
                }
                if ( k > 1 ) {
                    fprintf(stderr,"WARN : pthread_limit is not a perfect\n");
                    fprintf(stderr,"     : power of two. We shall assume\n");
                    pthread_limit = 1 << ( p - 1 );
                    fprintf(stderr,"     : %i POSIX thread(s).\n", pthread_limit);
                } else {
                    pthread_limit = candidate_int;
                }

            } else {
                pthread_limit = 1;
            }
        }
*/

    for ( year = 2020; year < 2021; year++ ) {
        for ( month = 1; month < 13; month++ ) {
            for ( day = 1; day < 32; day++ ) {

                /* vanarius_10 in chat suggests this magic :
                 *
                 * ( month%1 ?
                 *    ( month < 7 ? 31 , 30 ) ,
                 *       ( month >= 7 ? 30 , 31 ) )
                 *
                 * However this is not at all obvious. We can
                 * think about it and yes it seems to make sense
                 * for months beginning at 1 for January but lets
                 * just be more clear shall we?
                 */

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

