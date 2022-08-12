
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

    setlocale (LC_ALL, "C");

    status = setenv("TZ", "GMT0", 1);
    if ( status < 0 ) {
        fprintf (stderr,"FAIL : can not set timezone TZ = GMT0\n");
        return EXIT_FAILURE;
    }

    /* This is just one of those things that I want. */
    tmpdir = getenv("TMPDIR");
    if ( tmpdir == NULL ) {
        fprintf(stderr,"FAIL : env var TMPDIR not set\n");
        return EXIT_FAILURE;
    }

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
    if (argc == 0) {
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
                break;
            case ERROR_MEMORY :
                fprintf(stderr,"ERR  : ERROR_MEMORY\n");
                fprintf(stderr,"     : Please download more memory.\n");
                break;
            default :
                fprintf(stderr,"ERR  : Something wrong?\n");
                fprintf(stderr,"     : You figure it out. I do not know.\n");
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
                fprintf(stderr,"     : You figure it out. I do not know.\n");
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

