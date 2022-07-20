
/*
 * test.c toss some test strings at the strtrim() function
 *
 * Copyright (C) Dennis Clarke 2012
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
 * Compile with c99 or with gcc and CFLAGS to include options 
 * -std=iso9899:199409 -pedantic-errors in order to ensure compliance
 * with ISO IEC 9899:1999 C spec. 
 *
 * Code cleanup and transition to comb as a pointer to type ( int * ) 
 * array by Dennis Clarke dclarke@blastwave.org  28 Dec 2012 
 *
 *********************************************************************/
#define _XOPEN_SOURCE 600

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *strtrim( char *str );

int main(int argc, char *argv[]) {
    char *some_string[] =
    {
        "one string",
        "    two strings",
        "three strings  ",
        " four ",
        " fifth string  ",
        "sixth   string ",
        "  this   -     thing ",
        "and more",
        "a long  string   that    says nothing  much",
        "another empty thing of such and such",
        "thus quoth the raven and a rose in tatters on the gardens path",
        "issued         a compile and gave utterance to wrath",
        "a",
        "",
        NULL
    };
    char buffer[255] = "\0";
    int j;

    printf( "----------------------------------------------------\n" );
    printf( "TEST: strtrim()\n\n" );
    for( j = 0; ( j<14 ) ; ++j ) {
        strcpy( buffer, some_string[j] );
        printf( "input : \"%s\"\noutput: \"%s\"\n\n",
                          some_string[j], strtrim( buffer ) );
    }

    /* the final NULL is a bugger */
    printf( "input : NULL\noutput: \"%s\"\n\n", strtrim( some_string[14] ) );

    /* we need to free that some_string[14] mess */
    if ( some_string[14] != NULL ) {
        free( some_string[14] );
        some_string[14] = NULL;
    }

    return EXIT_SUCCESS;

}

