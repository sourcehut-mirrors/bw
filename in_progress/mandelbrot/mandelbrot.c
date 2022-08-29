
/*
 * mandelbrot.c  An attempt to compute the mandelbrot fractal data
 *               with a fully threaded work queue approach.
 * Copyright (C) Dennis Clarke 2019
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

#define __STDC_FORMAT_MACROS
#include <fenv.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <locale.h>
#include <sys/utsname.h>
#include <unistd.h>
#include <math.h>
#include <errno.h>
#include <pthread.h>

/* the work queue */
#include "q.h"

/* essential mandelbrot data */
#include "file_mbrot.h"
#include "mbrot_work.h"

#define VERBOSE 1
int sysinfo(int verbose);

int parse_double(const char *str, double **dbl );
int parse_pthread_limit(const char *str, int *pthread_limit);

int main(int argc, char **argv)
{

    /* there is a need for some time data in that we use
     * the nanosec 32-bit number as a seed for srand48() */
    struct timespec now_time;

    int candidate_int, pthread_limit, status, file_data_flag;
    double *test_dbl;

    struct f_item *mandelbrot_file;
    char *tmpdir;

    setlocale( LC_ALL, "C" );

    /* Get the uptime in a timespec struct */
    if ( clock_gettime( CLOCK_MONOTONIC, &now_time ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
        return EXIT_FAILURE;
    } else {
        /* call srand48() with the sub-second time data */
        srand48( (long) now_time.tv_nsec );
    }
    sysinfo(VERBOSE);

    /* TODO : do not enforce the need for TMPDIR */
    tmpdir = getenv("TMPDIR");
    if ( tmpdir == NULL ) {
        fprintf(stderr,"FAIL : env var TMPDIR not set\n");
        return EXIT_FAILURE;
    }
    /* TODO : just because we now have a TMPDIR of some
     * sort does not mean we can use it. */

    if ((argc != 3) && (argc != 6)) {
        fprintf(stderr,"FAIL : insufficient arguments provided\n");
        fprintf(stderr,"     : provide a filename\n");
        fprintf(stderr,"     :    * * *  or  * * *\n");
        fprintf(stderr,"     : provide mandelbrot data\n");
        fprintf(stderr,"     : usage %s mand_bail integer\n",argv[0]);
        fprintf(stderr,"     :        magnify integer\n");
        fprintf(stderr,"     :        real imaginary double values\n");
        fprintf(stderr,"     :        pthread integer\n");
        fprintf(stderr,"     :\n");
            /* 8192 125 -1.75 -0.0234 16 is reasonable data */
        fprintf(stderr,"     : example %s",argv[0]);
        fprintf(stderr," 8192 125 -1.75 -0.0234 16\n");
        fprintf(stderr,"     : quitting.\n");
        return EXIT_FAILURE;
    }

    errno = 0;
    test_dbl = calloc((size_t)1, sizeof(double));
    if ( test_dbl == NULL ) {
        /* possible ENOMEM? */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc ENOMEM\n");
        } else {
            fprintf(stderr,"FAIL : calloc\n");
        }
        perror("FAIL ");
        /* bail out */
        return EXIT_FAILURE;
    }

    errno = 0;
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

        free(test_dbl);
        test_dbl = NULL;

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

        free(test_dbl);
        test_dbl = NULL;

        free(mandelbrot_file);
        mandelbrot_file = NULL;

        return EXIT_FAILURE;
    }
   
   
    /* at the moment we do not have any data read from a file */
    file_data_flag = 0;

    if ( argc == 3 ) {
        /* process the arguments as a filename and pthread_limit. */
        status = parse_pthread_limit(argv[2], &pthread_limit);
        if ( status < 0 ) {
                /* as a rock bottom minimum we run single threaded */
                mandelbrot_file->pthread_limit = 1;
            }
        mandelbrot_file->pthread_limit = pthread_limit;

        /* extract mandelbrot data from the header */
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
    
            free(test_dbl);
            test_dbl = NULL;

            free(mandelbrot_file);
            mandelbrot_file = NULL;

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

        printf("INFO : data read from file %s\n", argv[1]);
        /* well now we definately have all data loaded from a file */
        file_data_flag = 1;

    } else {
        /* the only other possibility here is that we have CLI data */

        /* parse mand_bail */
        candidate_int = (int)strtol(argv[1], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : bail_out_integer not understood\n");
            perror("     ");
            return ( EXIT_FAILURE );
        }

        if ( ( candidate_int < 256 ) || ( candidate_int > 1048576 ) ){
            fprintf(stderr,"WARN : mandlebrot bail out is unreasonable\n");
            fprintf(stderr,"     : we shall assume 4096 and proceed.\n");
            mandelbrot_file->mand_bail = (uint32_t)4096;
        } else {
            mandelbrot_file->mand_bail = (uint32_t)candidate_int;
        }

        /* parse magnify which internally is a double value */
        candidate_int = (int)strtol(argv[2], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : magnify_integer not understood\n");
            perror("     ");
            return EXIT_FAILURE;
        }

        if ( ( candidate_int < 1 ) || ( candidate_int > ( 1<<30 ) ) ){
            fprintf(stderr,"WARN : magnify_integer is unreasonable\n");
            fprintf(stderr,"     : we shall assume 1 and proceed.\n");
            mandelbrot_file->magnify = 1.0;
        } else {
            mandelbrot_file->magnify = (double)candidate_int;
        }

        /* attempt to parse the double floating point coordinates */
        if ( parse_double(argv[3], &test_dbl ) == EXIT_FAILURE ) {
            fprintf(stderr,"FAIL : double floating point conversion\n");
            return EXIT_FAILURE;
        } else if ( fabs(*test_dbl) > 2.0 ) {
            fprintf(stderr,"WARN : double coordinate is out of range\n");
            fprintf(stderr,"     : value seen = %-+18.12e\n", *test_dbl );
            fprintf(stderr,"     : we shall assume zero.\n");
            mandelbrot_file->real_translate = 0.0;
        } else {
            mandelbrot_file->real_translate = *test_dbl;
        }

        if ( parse_double(argv[4], &test_dbl ) == EXIT_FAILURE ) {
            fprintf(stderr,"FAIL : double floating point conversion\n");
            return EXIT_FAILURE;
        } else if ( fabs(*test_dbl) > 2.0 ) {
            fprintf(stderr,"WARN : double coordinate is out of range\n");
            fprintf(stderr,"     : value seen = %-+18.12e\n", *test_dbl );
            fprintf(stderr,"     : we shall assume zero.\n");
            mandelbrot_file->imag_translate = 0.0;
        } else {
            mandelbrot_file->imag_translate = *test_dbl;
        }

        status = parse_pthread_limit(argv[5], &pthread_limit);
        if ( status < 0 ) {
                /* as a rock bottom minimum we run single threaded */
                mandelbrot_file->pthread_limit = 1;
            }
        mandelbrot_file->pthread_limit = pthread_limit;


    } 

    status = 0;

    printf("INFO : mandelbrot bail out = %i\n", mandelbrot_file->mand_bail);
    printf("     : magnify = %-+20.12e\n", mandelbrot_file->magnify);
    printf("     : coordinates = ");
    printf("( %-+28.20e", mandelbrot_file->real_translate);
    printf(", %-+28.20e )\n", mandelbrot_file->imag_translate);
    printf("     : pthread_limit = %i\n", mandelbrot_file->pthread_limit);

    if ( file_data_flag ) {
        printf("     : vbox structure is %i X %i grid with %i X %i samples each\n",
            mandelbrot_file->vbox_real_count, mandelbrot_file->vbox_imag_count,
            mandelbrot_file->vbox_sample_real, mandelbrot_file->vbox_sample_imag);
    }


    /* TODO perhaps now we create a work queue and the required
     * mutex locks etc etc etc .... */


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
    free (test_dbl);

    if ( status == 0 ) {
        return EXIT_SUCCESS;
    } else {
        return EXIT_FAILURE;
    }


}

