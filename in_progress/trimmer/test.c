
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

#define _XOPEN_SOURCE 500

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>

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
        "and more\t",
        "\ta long  string   that    says nothing  much",
        "\tanother empty thing of such and such\t",
        "thus quoth the raven and a rose in tatters on the gardens path",
        "issued         a compile and gave utterance to wrath",
        "a",
        "",
        "     ",
        NULL
    };
    char buffer[255] = "\0";
    char *result = NULL;
    int j;

    /* we are not checking the return from setlocale() */
    setlocale(LC_ALL,"C");

    printf( "----------------------------------------------------\n" );
    printf( "TEST: strtrim()\n\n" );
    for( j = 0; ( j<15 ) ; ++j ) {
        /* NOTE we never pass in a pointer to a string literal
         * and we use the buffer safely */
        strcpy( buffer, some_string[j] );
        printf("input : \"%s\"\n", buffer);

        result = strtrim( buffer );
        if ( result != NULL ) {
            printf("output: \"%s\"\n\n", result);
        } else {
            printf("output: NULL pointer\n\n");
        }
    }

    /* the final NULL is a bugger */
    result = strtrim( some_string[15] );
    if ( result == NULL ) {
        printf( "input : NULL\noutput: NULL pointer\n\n");
    } else {
        /* magic ? n0se demons ? */
        printf( "input : NULL\noutput: \"%s\"\n\n", result );
        /* should be impossible */
        free(result);
        result = NULL;
    }

    return EXIT_SUCCESS;

}

