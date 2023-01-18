
/*
 * read_factors.c  Read in list of integers and their prime factors.
 *                 Find a few interesting things to report.
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

#include "read_f.h"

int main (int argc, char **argv)
{
    struct f_item *factors_file;
    struct line_item *factor_line;
    int status, len, max_line_length, line_count;
    char *tmpdir;
    char *filename;
    char *clean_filename;
    char *max_line;

    setlocale (LC_ALL, "C");

    status = setenv("TZ", "GMT0", 1);
    if ( status < 0 ) {
        fprintf (stderr,"FAIL : can not set timezone TZ = GMT0\n");
        return EXIT_FAILURE;
    }

    /* TODO : do not enforce the need for TMPDIR */
    tmpdir = getenv("TMPDIR");
    if ( tmpdir == NULL ) {
        fprintf(stderr,"FAIL : env var TMPDIR not set\n");
        return EXIT_FAILURE;
    }
    /* TODO : just because we now have a TMPDIR of some
     * sort does not mean we can use it. */

    
    factors_file = calloc(1,sizeof(struct f_item));
    if ( factors_file == NULL ) {
        /* possible ENOMEM */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                        __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                        __FILE__, __LINE__ );
        }
        perror("FAIL ");
        return EXIT_FAILURE;
    }


    /**********************************************************
     *           Now deal with the filename provided          *
     **********************************************************/
    if (argc == 1) {
        fprintf(stderr, "FAIL : provide a filename\n");
        return EXIT_FAILURE;
    }

    len = (int)strlen(argv[1]);
    if ( ( len > LINE_LENGTH_MAX ) || ( len < 4 ) ) {
        fprintf(stderr, "FAIL : provide a resonable filename\n");
        return EXIT_FAILURE;
    }

    filename = calloc(LINE_LENGTH_MAX,sizeof(char));
    if ( filename == NULL ) {
        /* possible ENOMEM */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                        __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                        __FILE__, __LINE__ );
        }
        perror("FAIL ");
        free(factors_file);
        return EXIT_FAILURE;
    }

    strncpy(filename,argv[1],(size_t)len);

    clean_filename = pathname_trim(filename);

    errno = 0;
    status = filepath_ptr(&factors_file->fp, clean_filename);
    if ( status != 0 ) {
        /* Possible error status values :
         *
         *     ERROR_FILENAME;
         *     ERROR_FILENAME_EMPTY;
         *     ERROR_FILENAME_FOPEN;
         *     ERROR_FILENAME_LENGTH;
         *     ERROR_FILENAME_STAT;
         *     ERROR_MEMORY;
         */

        switch(status) {
            case ERROR_FILENAME :
                fprintf(stderr,"ERR  : ERROR_FILENAME\n");
                fprintf(stderr,"     : Please check your filename.\n");
                break;
            case ERROR_FILENAME_EMPTY :
                fprintf(stderr,"ERR  : ERROR_FILENAME_EMPTY\n");
                fprintf(stderr,"     : What were you thinking?\n");
                break;
            case ERROR_FILENAME_FOPEN :
                fprintf(stderr,"ERR  : ERROR_FILENAME_FOPEN\n");
                fprintf(stderr,"     : Unable to open that filename.\n");
                break;
            case ERROR_FILENAME_LENGTH :
                fprintf(stderr,"ERR  : ERROR_FILENAME_LENGTH\n");
                fprintf(stderr,"     : Filename length is wrong?\n");
                break;
            case ERROR_FILENAME_STAT :
                fprintf(stderr,"ERR  : ERROR_FILENAME_STAT\n");
                fprintf(stderr,"     : Please check your filename.\n");
                break;
            case ERROR_MEMORY :
                fprintf(stderr,"ERR  : ERROR_MEMORY\n");
                fprintf(stderr,"     : Please download more memory.\n");
                break;
            default :
                fprintf(stderr,"ERR  : Something wrong?\n");
                fprintf(stderr,"     : You figure it out. I do not know.\n");
                fprintf(stderr,"     : error code is %i\n",status);
        }

        free(factors_file);
        factors_file = NULL;

        return EXIT_FAILURE;

    }

    /* we may not need to set errno at all but .. whatever */
    errno = 0;


    if ( ftrylockfile(factors_file->fp) != 0 ) {
        fprintf(stderr,"FAIL : ftrylockfile()\n");
        perror("ERR ");
        return EXIT_FAILURE;
    }

    factor_line = calloc(1,sizeof(line_item));
    if ( factor_line == NULL ) {
        /* possible ENOMEM */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                        __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                        __FILE__, __LINE__ );
        }
        perror("FAIL ");
        free(factors_file);
        free(filename);
        return EXIT_FAILURE;
    }

    factor_line->buffer = calloc(LINE_LENGTH_MAX,sizeof(char));
    if ( factor_line->buffer == NULL ) {
        /* possible ENOMEM */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                        __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                        __FILE__, __LINE__ );
        }
        perror("FAIL ");
        free(factor_line);
        free(factors_file);
        free(filename);
        return EXIT_FAILURE;
    }

    max_line = calloc(LINE_LENGTH_MAX,sizeof(char));
    if ( max_line == NULL ) {
        /* possible ENOMEM */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                        __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                        __FILE__, __LINE__ );
        }
        perror("FAIL ");
        free(factor_line->buffer);
        free(factor_line);
        free(factors_file);
        free(filename);
        return EXIT_FAILURE;
    }

    line_count = 0;
    max_line_length = 0;
    /* read the first line which should exist */
    status = get_factor_line(factors_file->fp,factor_line);
    /* clearly this is the maximum line thus far given
     * we have nothing else */
    if ((status!=ERROR_END_OF_FILE) && (status!=LINE_OVERRUN) ) {
        max_line_length = (int)factor_line->buffer_length;
        strncpy(max_line,factor_line->buffer,(size_t)max_line_length);
        line_count = line_count + 1;
        printf ("%-8i : %-3i    \"%s\"\n",line_count,max_line_length,max_line);
    } else {
        fprintf(stderr,"FAIL : the file seems to be bad\n");
        fprintf(stderr,"     : better inspect the contents\n");
        free(max_line);
        free(factor_line->buffer);
        free(factor_line);
        free(factors_file);
        free(filename);
        return EXIT_FAILURE;
    }

    while ( (status!=ERROR_END_OF_FILE) && (status!=LINE_OVERRUN) ) {
        status = get_factor_line(factors_file->fp,factor_line);
        line_count = line_count + 1;
        if ( (int)factor_line->buffer_length > max_line_length ) {
            max_line_length = (int)factor_line->buffer_length;
            strncpy(max_line,factor_line->buffer,(size_t)max_line_length);
            printf ("%-8i : %-3i    \"%s\"\n",line_count,max_line_length,max_line);
        }

        /* check end of file */
        clearerr(factors_file->fp);
        if ( feof(factors_file->fp) != 0 ) {
            goto done;
        }

    }

done:
    free(max_line);
    free(factor_line->buffer);
    free(factor_line);
    free(factors_file);
    free(filename);
    return EXIT_SUCCESS;

}

