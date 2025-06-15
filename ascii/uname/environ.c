/*
 * environ.c    Walk the char **environ contents and perhaps try to
 *              wreck some havok and loose the dogs of war
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2019 Dennis Clarke
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

