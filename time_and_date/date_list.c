
/*
 * date_list.c generate a list of valid dates
 *
 * ------------------------------------------------------------------
 * Copyright (c) 1999 Dennis Clarke
 *
 *    Permission is hereby granted, free of charge, to any person
 *    obtaining a copy of this software and associated documentation
 *    files (the "Software"), to deal in the Software without
 *    restriction, including without limitation the rights to use,
 *    copy, modify, merge, publish, distribute, sublicense, and/or
 *    sell copies of the Software, and to permit persons to whom the
 *    Software is furnished to do so, subject to the following
 *    conditions:
 *
 *    The above copyright notice and this permission notice shall be
 *    included in all copies or substantial portions of the Software.
 *
 *        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
 *        KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 *        WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 *        PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
 *        OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 *        OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 *        OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 *        SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * ------------------------------------------------------------------
 */

#define _XOPEN_SOURCE 500

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

    for ( year = 1752; year < 1753; year++ ) {
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

