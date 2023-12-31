
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

int
check_tmpdir(char **dir_buffer)
{

    /* can we use TMPDIR or HOME dir or /tmp ?
     *     true  = 1
     *     false = 0
     */

    int status = 0;
    struct stat status_buffer;
    size_t dir_len = 0;

    char *tmpdir = getenv("TMPDIR");
    char *homedir = getenv("HOME");

    if ( *dir_buffer == NULL ) {
        fprintf(stderr,"FAIL : no valid dir_buffer\n");
        return 0;
    }

    if ( tmpdir == NULL ) {
        fprintf(stderr,"WARN : env var TMPDIR not set\n");
        /* TODO : give consideration to strlcpy */
        strncpy(*dir_buffer,"/tmp",4);
    } else {
        dir_len = strlen(tmpdir);
        if (dir_len > LOCAL_PATH_MAX) {
            /* some crazy long pathname will not work well
             * go looking for HOME */
            if ( homedir == NULL ) {
                /* this user is HOMEless ? */
                fprintf(stderr,"WARN : user has no HOME dir?\n");
bail_out:
                return 0;
            } else {
                dir_len = strlen(homedir);
                if (dir_len > LOCAL_PATH_MAX) {
                    fprintf(stderr,"WARN : HOME dir is unreasonable.\n");
                    goto bail_out;
                }
                strncpy(*dir_buffer,homedir,dir_len);
            }
        } else {
            strncpy(*dir_buffer,tmpdir,dir_len);
        }
    }

    errno = 0;
    status = stat(*dir_buffer, &status_buffer);

    if ( status < 0 ) {
        status = file_stat_err(errno);
        goto bail_out;
    }

    return 1;

}

