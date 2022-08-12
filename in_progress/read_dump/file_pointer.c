
/*
 * file_pointer.c process a filename and return a file pointer
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
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <inttypes.h>
#include <time.h>
#include <locale.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include "file_mbrot.h"

/* we expect that fidname is some file identifier
 * string such as /var/tmp/foo/boo/123456 or whatever
 * makes sense for a filename. */
int file_pointer(FILE **fp, char *fidname)
{

    size_t len;
    char *filename, *fid;
    char *tmp;
    int status;
    struct stat status_buffer;

    len = strlen(fidname);
    if (len > LOCAL_PATH_MAX) {
        return ERROR_FILENAME_LENGTH;
    }

    /* ensure that the filename string has a terminating nul */
    filename = calloc(LOCAL_PATH_MAX+1, sizeof(unsigned char));
    if ( filename == NULL ) {
        /* really? possible ENOMEM? */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                    __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                    __FILE__, __LINE__ );
        }
        perror("FAIL ");
        return ERROR_MEMORY;
    }

    tmp = strncpy(filename, fidname, len);

    /* A trailing slash on a pathname forces resolution of
     * the name to a directory. So strip off leading and
     * trailing spaces first. */
    fid = strtrim(filename);

    /* do we still have a filename ? */
    len = strlen(fid);
    if (len>0) {
        /* remove trailing slashes */
        while ((fid[len-1] == '/') && (len>0)) {
            fid[len-1] = '\0';
            len = strlen(fid);
        }

        /* do we still have a filename ? */
        if (len==0) {
            free(filename);
            filename = NULL;
            return ERROR_FILENAME;
        } else {
            errno = 0;
            status = stat(filename, &status_buffer);
        }

    } else {
        fprintf(stderr, "FAIL : filename is invalid\n");
        free(filename);
        filename = NULL;
        return ERROR_FILENAME_EMPTY;
    }

    /* check that we have a valid status and if we do not
     * then check for a pile of possible errors and bail out. */
    if (status != 0) {
        /* what went wrong? */
        file_stat_err(errno);
        free(filename);
        filename = NULL;

        return ERROR_FILENAME_STAT;

    }

    /* Check if pathname is a directory. */
    if ( status_buffer.st_mode & S_IFDIR ) {
        errno = EINVAL;
        perror("FAIL ");
        fprintf(stderr,"FAIL : is pathname a directory?\n");
        return ERROR_FILENAME_STAT;
    }

    errno = 0;
    *fp = fopen(filename, "rb");

    free(filename);
    filename = NULL;

    if (*fp == NULL) {
        return ERROR_FILENAME_FOPEN;
    }

    return EXIT_SUCCESS;

}

