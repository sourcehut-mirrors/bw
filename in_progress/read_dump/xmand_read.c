
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
 * For ISO/IEC 9899:1990 (“ISO C90”).  The setenv(), putenv() and
 * unsetenv() functions conforms to IEEE Std 1003.1-2001 (“POSIX.1”).
 *********************************************************************/
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

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
    int status;
    char *tmpdir;

    if ( setlocale (LC_ALL, "C") == NULL ) {
        fprintf (stderr,"FAIL : can not setlocale LC_ALL=C\n");
        return EXIT_FAILURE;    
    }

    errno = 0;
    if ( setenv("TZ", "GMT0", 1) < 0 ) {
        fprintf (stderr,"FAIL : can not set timezone TZ = GMT0\n");
        perror("FAIL setenv ");
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

    if (argc == 0) {
        fprintf(stderr, "FAIL : provide a filename\n");
        return EXIT_FAILURE;
    }

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

    sysinfo(VERBOSE);

    /**********************************************************
     *           Now deal with the filename provided          *
     **********************************************************/
    if (argc == 1) {
        fprintf(stderr, "FAIL : provide a filename\n");
        return EXIT_FAILURE;
    }

    errno = 0;
    status = file_pointer(&mandelbrot_file->fp, argv[1]);
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

        free(mandelbrot_file->mandelbrot_data);
        mandelbrot_file->mandelbrot_data = NULL;
        free(mandelbrot_file);
        mandelbrot_file = NULL;

        return EXIT_FAILURE;

    }

    /* we may not need to set errno at all but .. whatever */
    errno = 0;
    status = read_mbrot_data(mandelbrot_file);

    if ( status != 0 ) {
        /* possible error values 
         * return ERROR_END_OF_FILE;
         * return ERROR_INSUFFICIENT;
         * return ERROR_MEMORY;
         */
        switch(status) {
            case ERROR_END_OF_FILE :
                fprintf(stderr,"ERR  : ERROR_END_OF_FILE\n");
                goto bail_out;

            case ERROR_INSUFFICIENT :
                fprintf(stderr,"ERR  : ERROR_INSUFFICIENT\n");
                goto bail_out;

            case ERROR_MEMORY :
                fprintf(stderr,"ERR  : ERROR_MEMORY\n");
                /* this could be a nasty situation so for now
                 * just give up.
                 *
                 * TODO : make this a clean exit */
                return EXIT_FAILURE;

            default :
                fprintf(stderr,"ERR  : Something wrong?\n");
                fprintf(stderr,"     : read_mbrot_data() bork bork bork.\n");
                fprintf(stderr,"     : You figure it out. I do not know.\n");
                fprintf(stderr,"     : error code is %i\n",status);
                return EXIT_FAILURE;
        }

    }


    /**********************************************************/
    /* print out something */

    printf("\n    mand_bail = %i\n", mandelbrot_file->mand_bail);
    printf("    translate = ( %-+28.20e , %-+28.20e )\n",
                                      mandelbrot_file->real_translate,
                                      mandelbrot_file->imag_translate);

    printf("      magnify = %-+20.12e\n\n", mandelbrot_file->magnify );



    printf("     : r[ 0][ 0][ 0][ 0] = %-+32.26e\n",
            mandelbrot_file->mandelbrot_data->coord_r[array_index(0,0,0,0,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);

    printf("     : j[ 0][ 0][ 0][ 0] = %-+32.26e\n",
            mandelbrot_file->mandelbrot_data->coord_j[array_index(0,0,0,0,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);


    printf("     :       mand_height = %9i\n",
            mandelbrot_file->mandelbrot_data->mandel_val[array_index(0,0,0,0,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);



    printf("     : r[ 7][ 7][63][63] = %-+32.26e\n",
            mandelbrot_file->mandelbrot_data->coord_r[array_index(7,7,63,63,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);

    printf("     : j[ 7][ 7][63][63] = %-+32.26e\n",
            mandelbrot_file->mandelbrot_data->coord_j[array_index(7,7,63,63,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);


    printf("     :       mand_height = %9i\n",
            mandelbrot_file->mandelbrot_data->mandel_val[array_index(7,7,63,63,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);



    printf("     : r[ 8][ 8][ 0][ 0] = %-+32.26e\n",
            mandelbrot_file->mandelbrot_data->coord_r[array_index(8,8,0,0,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);

    printf("     : j[ 8][ 8][ 0][ 0] = %-+32.26e\n",
            mandelbrot_file->mandelbrot_data->coord_j[array_index(8,8,0,0,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);


    printf("     :       mand_height = %9i\n",
            mandelbrot_file->mandelbrot_data->mandel_val[array_index(8,8,0,0,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);


    printf("     : r[ 8][ 8][ 1][ 0] = %-+32.26e\n",
            mandelbrot_file->mandelbrot_data->coord_r[array_index(8,8,1,0,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);

    printf("     : j[ 8][ 8][ 1][ 0] = %-+32.26e\n",
            mandelbrot_file->mandelbrot_data->coord_j[array_index(8,8,1,0,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);


    printf("     :       mand_height = %9i\n",
            mandelbrot_file->mandelbrot_data->mandel_val[array_index(8,8,1,0,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);


    printf("     : r[ 8][ 8][32][32] = %-+32.26e\n",
            mandelbrot_file->mandelbrot_data->coord_r[array_index(8,8,32,32,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);

    printf("     : j[ 8][ 8][32][32] = %-+32.26e\n",
            mandelbrot_file->mandelbrot_data->coord_j[array_index(8,8,32,32,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);


    printf("     :       mand_height = %9i\n",
            mandelbrot_file->mandelbrot_data->mandel_val[array_index(8,8,32,32,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);



    printf("     : r[ 3][12][44][21] = %-+32.26e\n",
            mandelbrot_file->mandelbrot_data->coord_r[array_index(3,12,44,21,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);

    printf("     : j[ 3][12][44][21] = %-+32.26e\n",
            mandelbrot_file->mandelbrot_data->coord_j[array_index(3,12,44,21,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);


    printf("     :       mand_height = %9i\n",
            mandelbrot_file->mandelbrot_data->mandel_val[array_index(3,12,44,21,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);



    printf("     : r[15][15][63][63] = %-+32.26e\n",
            mandelbrot_file->mandelbrot_data->coord_r[array_index(15,15,63,63,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);

    printf("     : j[15][15][63][63] = %-+32.26e\n",
            mandelbrot_file->mandelbrot_data->coord_j[array_index(15,15,63,63,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);


    printf("     :       mand_height = %9i\n",
            mandelbrot_file->mandelbrot_data->mandel_val[array_index(15,15,63,63,mandelbrot_file->vbox_real_count,mandelbrot_file->vbox_sample_real,mandelbrot_file->vbox_sample_imag)]);



    /* free memory and bail out */

bail_out:
    free(mandelbrot_file->mandelbrot_data->mandel_val);
    mandelbrot_file->mandelbrot_data->mandel_val = NULL;
    free(mandelbrot_file->mandelbrot_data->coord_r);
    mandelbrot_file->mandelbrot_data->coord_r = NULL;
    free(mandelbrot_file->mandelbrot_data->coord_j);
    mandelbrot_file->mandelbrot_data->coord_j = NULL;
    free(mandelbrot_file->mandelbrot_data);
    mandelbrot_file->mandelbrot_data = NULL;
    free(mandelbrot_file);
    mandelbrot_file = NULL;

    if ( status == 0 ) {
        return EXIT_SUCCESS;
    } else {
        return EXIT_FAILURE;
    }

}

