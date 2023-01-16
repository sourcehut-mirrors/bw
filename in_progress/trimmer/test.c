
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

#define _XOPEN_SOURCE 600

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>

#include "strtrim.h"

#define NUMBER_OF_TESTS 19

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
        "\t\n\t\nthus quoth the raven\n\t and a rose in tatters on the gardens path\n",
        "issued         a compile and gave\n\t utterance to wrath \t \n \t \n",
        "a",
        "/var/tmp/some/valid/pathname",
        "//var///tmp/some/strange/////messy//pathname///  ",
        "/a/pathname/that/may/be/a/directory/",
        "   /a/pathname/ with / internal spaces // in // the//name/////    ",
        "",
        "     ",
        NULL
    };
    char buffer[255] = "\0";
    char *result = NULL;
    int j;

    if ( setlocale(LC_ALL,"C") == NULL ) {
        fprintf(stderr,"FAIL : the setlocale() returns NULL\n");
        return EXIT_FAILURE;
    }

    printf("----------------------------------------------------\n");
    printf("TEST: strtrim()\n");
    printf("----------------------------------------------------\n");
    for (j = 0;  j<(NUMBER_OF_TESTS-1); ++j) {
        /* NOTE we never pass in a pointer to a string literal
         * and we use the buffer safely */
        strcpy(buffer, some_string[j]);
        printf("input : \"%s\"\n", buffer);

        result = strtrim(buffer);
        if ( result != NULL ) {
            printf("output: \"%s\"\n\n", result);
        } else {
            printf("output: NULL pointer\n\n");
        }
    }

    /* the final NULL is a bugger */
    result = strtrim(some_string[NUMBER_OF_TESTS]);
    if ( result == NULL ) {
        printf("input : NULL\noutput: NULL pointer\n\n");
    } else {
        /* magic ? n0se demons ? */
        printf("input : NULL\noutput: \"%s\"\n\n", result);
        /* should be impossible */
        free(result);
        result = NULL;
    }

    printf( "\n\n----------------------------------------------------\n" );
    printf( "TEST: pathname_trim()\n" );
    printf( "----------------------------------------------------\n" );
    for (j = 0;  j<(NUMBER_OF_TESTS-1); ++j) {
        strcpy(buffer, some_string[j]);
        printf("input : \"%s\"\n", buffer);

        result = pathname_trim(buffer);
        if ( result != NULL ) {
            printf("output: \"%s\"\n\n", result);
        } else {
            printf("output: NULL pointer\n\n");
        }
    }

    result = pathname_trim(some_string[NUMBER_OF_TESTS]);
    if ( result == NULL ) {
        printf("input : NULL\noutput: NULL pointer\n\n");
    } else {
        /* n0se demons ? */
        printf( "input : NULL\noutput: \"%s\"\n\n", result );
        /* should be impossible */
        free(result);
        result = NULL;
    }

    return EXIT_SUCCESS;

}

