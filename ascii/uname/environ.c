/*
 * environ.c    Walk the char **environ contents and perhaps try to
 *              wreck some havok and loose the dogs of war
 *
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

#include <errno.h>
#include <locale.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/utsname.h>

extern char **environ;

int main(int argc, char *argv[])
{

    int j = 0;
    size_t k;
    struct utsname uname_data;
    char *env_var_value = NULL;

    char *uname_override[] = {"UNAME_s","UNAME_r","UNAME_v","UNAME_m"};

    setlocale( LC_MESSAGES, "C" );

    if ( environ != NULL ) {
        printf ("INFO : environ is at %p\n", &environ);
    } else {
        printf ("FAIL : environ is NULL\n");
        return EXIT_FAILURE;
    }

    env_var_value = *environ;

    while ( env_var_value != NULL ) {
        j = j + 1;
        printf ("[%-3i]: %p    len %-3i = \"%s\"",
                j, env_var_value, strlen(env_var_value),
                env_var_value);

        /* we may even get the terminating NUL byte with
         * the used of less than or equal to strlen */
        for ( k = 0; k <= strlen(env_var_value); k++ ) {
            if ( k%16 == 0 ) {
                printf ("\n     : ");
            }
            printf("%02x ", ((uint8_t*)env_var_value)[k] );
        }
        printf("\n\n");

        env_var_value = *(environ + j);

    }

    return EXIT_SUCCESS;

}

