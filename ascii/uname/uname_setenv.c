/*
 * uname_setenv.c Demonstrate that FreeBSD seems to allow env var
 *                values to override the uname(3) struct members.
 *                We may remove the env var contents with setenv.
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
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/utsname.h>

int main(int argc, char *argv[])
{

    int j;
    struct utsname uname_data;
    char *env_var_value = NULL;

    /* tricky stuff about UNAME(3) :
     *
     *    These ENVIRONMENT variables override some uname struct members
     *
     *         env name     overrides
     *         --------------------------
     *         UNAME_s      sysname
     *         UNAME_r      release
     *         UNAME_v      version
     *         UNAME_m      machine
     *
     */
    char *env_var[] = {"UNAME_s","UNAME_r","UNAME_v","UNAME_m"};

    char empty[4];
    empty[0] = '\0';

    setlocale( LC_MESSAGES, "C" );

    /* check for and then unset those env vars */
    errno = 0;
    for ( j=0; j<4 ; j++ ) {
        env_var_value = getenv(env_var[j]);
        if ( env_var_value != NULL) {

            fprintf(stderr, "INFO : env var %s set to \"%s\"\n",
                    env_var[j], env_var_value);

            if (setenv(env_var[j], empty, 1) < 0) {
                fprintf(stderr, "FAIL : could not clear env %s\n",
                        env_var[j]);

                perror("FAIL : ");
                return EXIT_FAILURE;
            } else {
                fprintf(stderr, "     : cleared env var \"%s\"\n", env_var[j]);
                /* verify that we do indeed have a modified env var */
                env_var_value = getenv(env_var[j]);
                if ( env_var_value != NULL) {
                    fprintf(stderr, "     : %s now set to string \"%s\"\n",
                                      env_var[j], env_var_value);
                } else {
                    fprintf(stderr, "     : %s does not exist\n",
                                      env_var[j]);
                }
            }
        }
    }

    if ( uname( &uname_data ) < 0 ) {
        fprintf(stderr,
                 "WARNING : Could not attain system uname data.\n" );
        perror ("uname" );
    } else {
        printf("-------------------------------" );
        printf("------------------------------\n" );
        printf("        system name = %s\n", uname_data.sysname );
        printf("          node name = %s\n", uname_data.nodename );
        printf("            release = %s\n", uname_data.release );
        printf("            version = %s\n", uname_data.version );
        printf("            machine = %s\n", uname_data.machine );
        printf ( "-------------------------------" );
        printf ( "------------------------------" );
    }
    printf ("\n");

    return EXIT_SUCCESS;

}

