
/*
 * xmand_read.c  Read in the little endian data dump.
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

int main (int argc, char **argv)
{

    struct f_item *mandelbrot_file;

    struct stat status_buffer;
    int status;
    char *tmpdir, *tmp;
    size_t num_read, len;
    long file_position;
    struct tm *ptm;

    int end_check = 1;
    uint8_t endian_flag;

    time_t time_now;
    char st_ctime_buffer[128];
    char *filename, *fid;
    char timestamp[32];

    uint32_t temp32bit;
    uint64_t temp64bit;
    uint64_t rotated64;
    double *fp64, temp_double;
    uint32_t rotated32;

    /* the actual data we are trying to read */
    uint32_t num_elements, mandel_bail_out;
    double magnify, c_r, c_j;
    uint32_t vbox_real_count, vbox_imag_count; 
    uint32_t vbox_sample_real, vbox_sample_imag;

    /* these are the actual data arrays */
    uint32_t *mandel_val;
    double *coord_r, *coord_j;

    /* easy index vars for later */
    int Vr, Vj, Sr, Sj;

    /* we will need to know if we read the correct amount of data */
    uint32_t sample_counter;


    mandelbrot_file = calloc((size_t) 1, (size_t)sizeof(struct f_item));
    if ( mandelbrot_file == NULL ) {
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

    mandelbrot_file->mandelbrot_data = calloc((size_t) 1, (size_t)sizeof(struct m_data));
    if ( mandelbrot_file->mandelbrot_data == NULL ) {
        /* possible ENOMEM */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                        __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                        __FILE__, __LINE__ );
        }
        perror("FAIL ");
        free(mandelbrot_file);
        return EXIT_FAILURE;
    }

    /**********************************************************
     *           Now deal with the filename provided          *
     **********************************************************/
    setlocale (LC_ALL, "C");

    status = setenv("TZ", "GMT0", 1);
    if ( status < 0 ) {
        fprintf (stderr,"FAIL : can not set timezone TZ = GMT0\n");
        free(mandelbrot_file->mandelbrot_data);
        free(mandelbrot_file);
        return EXIT_FAILURE;
    }

    tmpdir = getenv("TMPDIR");
    if ( tmpdir == NULL ) {
        printf("env var TMPDIR not set\n");
        free(mandelbrot_file->mandelbrot_data);
        free(mandelbrot_file);
        return EXIT_FAILURE;
    }

    sysinfo(VERBOSE);

    /* better check if argv[1] even exists */
    if (argc>1) {
        len = strlen(argv[1]);
        if (len > LOCAL_PATH_MAX) {
            fprintf(stderr, "FAIL : filename too long.\n");
            fprintf(stderr, "     : limit is %i chars.\n",
                                      LOCAL_PATH_MAX);

            free(mandelbrot_file->mandelbrot_data);
            free(mandelbrot_file);
            return EXIT_FAILURE;
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
            free(mandelbrot_file->mandelbrot_data);
            free(mandelbrot_file);
            return EXIT_FAILURE;
        }

        tmp = strncpy(filename, argv[1], len);

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
                fprintf(stderr, "FAIL : filename is invalid\n");
                free(filename);
                filename = NULL;
                free(mandelbrot_file->mandelbrot_data);
                free(mandelbrot_file);
                return EXIT_FAILURE;
            } else {
                errno = 0;
                status = stat(filename, &status_buffer);
            }
        } else {
            fprintf(stderr, "FAIL : filename is invalid\n");
            free(filename);
            filename = NULL;
            free(mandelbrot_file->mandelbrot_data);
            free(mandelbrot_file);
            return EXIT_FAILURE;
        }
    } else {
        fprintf(stderr, "FAIL : give a filename to read\n");
        free(mandelbrot_file->mandelbrot_data);
        free(mandelbrot_file);
        return EXIT_FAILURE;
    }

    /* check that we have a valid status and if we do not
     * then check for a pile of possible errors and bail out. */
    if (status != 0) {
        /* what went wrong? */
        file_stat_err(errno);
        free(mandelbrot_file->mandelbrot_data);
        free(mandelbrot_file);
        free(filename);
        filename = NULL;
        return EXIT_FAILURE;
    } else {
        sprintf(st_ctime_buffer, "INFO : creation time of file = %s",
                                       ctime(&status_buffer.st_ctime));
        printf(st_ctime_buffer);
    }

    errno = 0;
    mandelbrot_file->fp = fopen(filename, "rb");

    if (mandelbrot_file->fp == NULL) {
        perror("FAIL ");
        free(filename);
        filename = NULL;
        return EXIT_FAILURE;
    }
    errno = 0;

    status = read_mbrot_data(mandelbrot_file);

    printf("DBUG : status = %i\n", status);

    return EXIT_SUCCESS;

}

