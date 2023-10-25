
/*
 * check_path.c  See if a filepath for TMPDIR exists and we can use it
 *
 * Copyright (C) Dennis Clarke 2023
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
#include <stdlib.h>
#include <stdio.h>
#include <sys/stat.h>
#include <string.h>
#include "mbrot_work.h"
#include "file_mbrot.h"
#include "read_f.h"

int check_tmpdir(void) {

    /* we can assume the Microsoft BOOLEAN type here where
     * our return value is :
     *     true  = 1     everything works
     *     false = 0     sadly no tmpdir to work with
     *     fail  = -1    everything went wrong somewhere
     *
     * NOTE : the Microsoft BOOLEAN data type is a sick joke.
     */

    errno = 0;
    int status = 0;
    struct stat status_buffer;
    size_t dir_len = 0;
    char *tmpdir = getenv("TMPDIR");
    char *dir_buffer = calloc(LOCAL_PATH_MAX+1,sizeof(unsigned char));
    if ( dir_buffer == NULL ) {

        if ( errno == ENOMEM ) {

            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                    __FILE__, __LINE__ );

        } else {

            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                    __FILE__, __LINE__ );

        }
        perror("FAIL ");
        /* just return the Microsoft BOOLEAN value
         * for bork bork bork */
        return -1;
    }

    if ( tmpdir == NULL ) {
        fprintf(stderr,"WARN : env var TMPDIR not set\n");
        /* TODO : give consideration to strlcpy and the cat */
        strncpy(dir_buffer,"/tmp",4);
    } else {
        dir_len = strlen(tmpdir);
        if (dir_len > LOCAL_PATH_MAX) {
            /* well that won't work well .. so may as well
             * go looking for HOME */
            tmpdir = getenv("HOME");
            if ( tmpdir == NULL ) {
                /* this user is HOMEless ? */
bail_out:
                free(dir_buffer);
                return -1;
            } else {
                dir_len = strlen(tmpdir);
                if (dir_len > LOCAL_PATH_MAX) {
                    goto bail_out;
                }
            }
        }
        strncpy(dir_buffer,tmpdir,dir_len);
    }

    errno = 0;
    status = stat(dir_buffer, &status_buffer);

    if ( status < 0 ) {
        status = file_stat_err(errno);
        goto bail_out;
    }

    return 1;

}

