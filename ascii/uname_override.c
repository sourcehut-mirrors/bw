/*
 * uname_override.c  Demonstrate that FreeBSD seems to allow env var
 *                   values to override the uname(2) struct return
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
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <sys/utsname.h>

static int endian( void );

int main(int argc, char *argv[])
{

    int j;

    struct utsname uname_data;

    /* tricky stuff about uname() :
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
    char env_var_to_check[16] = "\0";

    setlocale( LC_MESSAGES, "C" );

    /* scan for and nuke those annoying env vars */
    errno = 0;
    for ( j=0; j<4 ; j++ ) {
        strncpy(env_var_to_check,env_var[j],7);
        env_var_to_check[7]='\0';
        if (getenv(env_var_to_check) != NULL) {
            fprintf(stderr, "WARN : env var \"%s\" caught.\n",
                                         env_var_to_check);

            /* The setenv(), putenv(), and unsetenv() functions return
             * the value 0 if successful; otherwise the value -1 is
             * returned and the global variable errno is set to indicate
             * the error. */

            env_var_to_check[7]='=';
            env_var_to_check[8]='\0';
            if (putenv(env_var_to_check) < 0) {
                fprintf(stderr, "FAIL : could not clear env \"%s\"\n",
                                          env_var_to_check);
                perror("FAIL : ");
                return EXIT_FAILURE;
            } else {
                fprintf(stderr, "     : cleared env var \"%s\"\n",
                                          env_var_to_check);
            }
            env_var_to_check[0] = '\0';
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
        printf("            machine = %s  is a ", uname_data.machine );

        if ( endian() ){
            printf ("big");
        } else {
            printf ("little");
        }
        printf(" endian architecture.\n");

        printf ( "-------------------------------" );
        printf ( "------------------------------" );
    }
    printf ("\n");

    return EXIT_SUCCESS;

}

static int endian( void )
{
    /* consistent width upper case hex address from
     * an n-bit value in v such that we return a
     * string like 0xFEEDBEEFBADCAFFE
     *                    ffffffff7ffff2d0         */
    int eflag = 1; /* in mem 0x00000001 big endian */
    eflag = (*(uint8_t*)&eflag == 1) ? 0 : 1;
    /* fprintf ( stderr, "DBG : eflag = %i\n", eflag ); */
    return ( eflag );
}

