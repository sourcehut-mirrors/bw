
/*
 * read_factors.c  Read in GCC test reports.
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
#include <ctype.h>
#include <limits.h>
#include <inttypes.h>
#include <time.h>
#include <locale.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include "read_f.h"
#include "gcc_tests.h"

int main (int argc, char **argv)
{
    struct f_item *tests_file;
    struct line_item *test_report_line;
    int status, len, max_line_length, line_count, ch;
    size_t s, j , k;
    char *filename, *clean_filename, *max_line, *ptr;
    char search[16] = " testsuite on ";
    char system[128];

    /* it may not be polite but let us assume we can just
     * use the very basic ASCII character set and POSIX
     * type locale. Thus no fancy UTF-8 or multi-lingual
     * processing. Sorry.
     */
    setlocale (LC_ALL, "C");

    status = setenv("TZ", "GMT0", 1);
    if ( status < 0 ) {
        fprintf (stderr,"FAIL : can not set timezone TZ = GMT0\n");
        return EXIT_FAILURE;
    }

    /**********************************************************
     *           Now deal with the filename provided          *
     **********************************************************/
    if (argc == 1) {
        fprintf(stderr, "FAIL : provide a filename\n");
        return EXIT_FAILURE;
    }

    /* we expect a file name similar to "1999_data" or
     * some four digit year and the suffix "_data"
     */
    len = (int)strlen(argv[1]);
    if ( ( len > LINE_LENGTH_MAX ) || ( len < 4 ) ) {
        fprintf(stderr, "FAIL : provide a resonable filename\n");
        return EXIT_FAILURE;
    }

    tests_file = calloc(1,sizeof(struct f_item));
    if ( tests_file == NULL ) {
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
        free(tests_file);
        return EXIT_FAILURE;
    }

    strncpy(filename,argv[1],(size_t)len);

    /* scrub out whitespace and duplicate slash chars */
    clean_filename = pathname_trim(filename);

    errno = 0;
    status = filepath_ptr(&tests_file->fp, clean_filename);
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

        free(tests_file);
        free(filename);
        tests_file = NULL;

        return EXIT_FAILURE;

    }

    /* we may not need to set errno at all but .. whatever */
    errno = 0;

    if ( ftrylockfile(tests_file->fp) != 0 ) {
        fprintf(stderr,"FAIL : ftrylockfile()\n");
        perror("ERR ");
        free(tests_file);
        free(filename);
        return EXIT_FAILURE;
    }

    test_report_line = calloc(1,sizeof(line_item));
    if ( test_report_line == NULL ) {
        /* possible ENOMEM */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                        __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                        __FILE__, __LINE__ );
        }
        perror("FAIL ");
        free(tests_file);
        free(filename);
        return EXIT_FAILURE;
    }

    test_report_line->buffer = calloc(LINE_LENGTH_MAX,sizeof(char));
    if ( test_report_line->buffer == NULL ) {
        /* possible ENOMEM */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                        __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                        __FILE__, __LINE__ );
        }
        perror("FAIL ");
        free(test_report_line);
        free(tests_file);
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
        free(test_report_line->buffer);
        free(test_report_line);
        free(tests_file);
        free(filename);
        return EXIT_FAILURE;
    }

    line_count = 0;
    max_line_length = 0;
    /* read the first line which should exist as HTML header stuff */
    status = get_a_line(tests_file->fp,test_report_line);
    /* clearly this is the maximum line thus far given
     * we have nothing else */
    if ((status!=ERROR_END_OF_FILE) && (status!=LINE_OVERRUN) ) {
        max_line_length = (int)test_report_line->buffer_length;
        strncpy(max_line,test_report_line->buffer,(size_t)max_line_length);
        line_count = line_count + 1;
        /* nope. 
        printf ("%-8i : %-3i    \"%s\"\n",line_count,max_line_length,max_line);
        */
    } else {
        fprintf(stderr,"FAIL : the file seems to be bad\n");
        fprintf(stderr,"     : better inspect the contents\n");
        free(max_line);
        free(test_report_line->buffer);
        free(test_report_line);
        free(tests_file);
        free(filename);
        return EXIT_FAILURE;
    }

    while ( (status!=ERROR_END_OF_FILE) && (status!=LINE_OVERRUN) ) {
        status = get_a_line(tests_file->fp,test_report_line);
        line_count = line_count + 1;
        if ( (int)test_report_line->buffer_length > max_line_length ) {
            max_line_length = (int)test_report_line->buffer_length;
            strncpy(max_line,test_report_line->buffer,(size_t)max_line_length);

            /* truth is, we do not care anymore .... 
            printf ("%-8i : %-3i    \"%s\"\n",
                    line_count,max_line_length,max_line);
            */

        }

        ptr = strstr(test_report_line->buffer,search);
        if ( ptr != NULL ) {
            s = strlen(ptr);
            /* search string is at least 14 bytes long */
            j = 14;
            while ((isspace(*(ptr+j)))&&(j<s)) j++;
            system[0] = '\0';
            k = 0;
            /* ch = (char)(*(ptr+j)); */
            while (j<s) {
                /* system[k++] = ch;
                ch = (char)(*(ptr+j++));
                */
                system[k++] = (char)(*(ptr+j++));
            }
            system[k] = '\0';
            printf ("%s\n",system);
        }

        /* check end of file */
        clearerr(tests_file->fp);
        if ( feof(tests_file->fp) != 0 ) {
            goto done;
        }

    }

done:
    free(max_line);
    free(test_report_line->buffer);
    free(test_report_line);
    free(tests_file);
    free(filename);
    return EXIT_SUCCESS;

}

