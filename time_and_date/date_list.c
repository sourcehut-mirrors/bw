
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
 * 
 ********************************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 *
 * This code should be C90 clean and therefore we may use :
 *
 *                 #define _XOPEN_SOURCE 500
 *
 *******************************************************************/
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 500
#endif

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
    int day, month, year, start_year, end_year;
    char *buf;
    
    errno = 0;

    start_year = 2023;
    end_year = 2024;

    /* assume a trivial POSIX locale */
    buf = setlocale ( LC_ALL, "POSIX" );
    if ( buf == NULL ) {
        fprintf (stderr,"FAIL : setlocale fail\n");
        return EXIT_FAILURE;
    }

    if ( argc > 1 ) {
        printf ("\nINFO : You suggest a locale of %s\n", argv[1]);
        buf = setlocale ( LC_ALL, argv[1] );
        /* The return value is NULL if the request can not be done */
        if ( buf == NULL ) {
            fprintf(stderr,"FAIL : * * * locale request failed * * *\n");
            fprintf(stderr,"     : ---------------------------------\n");
            fprintf(stderr,"     : please check your available list\n");
            fprintf(stderr,"     : of supported locales.\n");
            return EXIT_FAILURE;
        }
    }

    if ( argc == 4 ) {
        /* TODO : verify the data is valid */
        start_year = atoi(argv[2]);
        end_year = atoi(argv[3]);
        printf ("\nINFO : You provide start year = %i\n", start_year);
        printf ("     :       with an end year = %i\n", end_year);
        if ( ( start_year < 1752 ) || ( end_year > 2038 ) ) {
            printf ("     : good luck.\n");
        }
    } else {
        printf ("\nINFO : start year = %i and end year = %i\n",
                start_year, end_year);
    }

    for ( year = start_year; year < ( end_year + 1 ); year++ ) {
        for ( month = 1; month < 13; month++ ) {
            for ( day = 1; day < 32; day++ ) {

                if ( valid_date( day, month, year ) ) {
                        print_date( day, month, year );
                }

            } /* day */
        } /* month */
    } /* year */

    return EXIT_SUCCESS;

}

