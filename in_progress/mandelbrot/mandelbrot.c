
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
#include "m.h"

#define VERBOSE 1
int sysinfo(int verbose);
uint64_t system_memory(void);

int parse_double(const char *str, double **dbl );

int main(int argc, char **argv)
{

    /* there is a need for some time data in that we use
     * the nanosec 32-bit number as a seed for srand48() */
    struct timespec now_time;

    int j, k, p, candidate_int;
    double *test_dbl;

    m_type *mandel_data;

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

    errno = 0;
    mandel_data = calloc((size_t)1, sizeof(m_type));
    if ( mandel_data == NULL ) {
        /* possible ENOMEM? */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc ENOMEM\n");
        } else {
            fprintf(stderr,"FAIL : calloc\n");
        }
        perror("FAIL ");
        /* this is horrible and here we bail out */
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
    if ( ( argc < 6 ) && ( argc > 1 ) ) {
        fprintf(stderr,"FAIL : insufficient arguments provided\n");
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
    } else if ( argc == 6 ) {
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
            mandel_data->mand_bail = (uint32_t)4096;
        } else {
            mandel_data->mand_bail = (uint32_t)candidate_int;
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
            mandel_data->magnify = 1.0;
        } else {
            mandel_data->magnify = (double)candidate_int;
        }

        /* attempt to parse the double floating point coordinates */
        if ( parse_double(argv[3], &test_dbl ) == EXIT_FAILURE ) {
            fprintf(stderr,"FAIL : double floating point conversion\n");
            return EXIT_FAILURE;
        } else if ( fabs(*test_dbl) > 2.0 ) {
            fprintf(stderr,"WARN : double coordinate is out of range\n");
            fprintf(stderr,"     : value seen = %-+18.12e\n", *test_dbl );
            fprintf(stderr,"     : we shall assume zero.\n");
            mandel_data->real_translate = 0.0;
        } else {
            mandel_data->real_translate = *test_dbl;
        }

        if ( parse_double(argv[4], &test_dbl ) == EXIT_FAILURE ) {
            fprintf(stderr,"FAIL : double floating point conversion\n");
            return EXIT_FAILURE;
        } else if ( fabs(*test_dbl) > 2.0 ) {
            fprintf(stderr,"WARN : double coordinate is out of range\n");
            fprintf(stderr,"     : value seen = %-+18.12e\n", *test_dbl );
            fprintf(stderr,"     : we shall assume zero.\n");
            mandel_data->imag_translate = 0.0;
        } else {
            mandel_data->imag_translate = *test_dbl;
        }

        /* TODO : how do we know the number of processors available? */
        /* At this time we just accept any reasonable power of two as
         * the pthread count */
        candidate_int = (int)strtol(argv[5], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : pthread_limit not understood\n");
            perror("     ");
            return ( EXIT_FAILURE );
        }
        if ( ( candidate_int < 1 ) || ( candidate_int > 64 ) ){
            fprintf(stderr,"WARN : pthread_limit is unreasonable\n");
            fprintf(stderr,"     : we shall assume 1 and proceed.\n");
            mandel_data->pthread_limit = 1;
        } else {
            if ( candidate_int > 1 ) {
                /* TODO why? snazzy little bit shifting and counting */
                k = 0; /* number of '1' bits in candidate_int */
                j = candidate_int;
                p = 0; /* bit position being tested */
                while (j) {
                    if ( j & 1 ) { /* test the LSB position */
                        k += 1;    /* count the '1' bit */
                    }
                    j = j >> 1;    /* shift left */
                    p += 1;        /* keep track of the bit position */
                }
                if ( k > 1 ) {
                    fprintf(stderr,"WARN : pthread_limit is not a perfect\n");
                    fprintf(stderr,"     : power of two. We shall assume\n");
                    mandel_data->pthread_limit = 1 << ( p - 1 );
                    fprintf(stderr,"     : %i POSIX thread(s).\n", mandel_data->pthread_limit);
                } else {
                    mandel_data->pthread_limit = (uint32_t)candidate_int;
                }

            } else {
                mandel_data->pthread_limit = 1;
            }
        }

    } else {
        fprintf(stderr,"WARN : No arguments received thus we have\n");
        fprintf(stderr,"     : some hard coded default values.\n");
        mandel_data->mand_bail = 8192;
        mandel_data->magnify = 1.0;
        mandel_data->real_translate = 0.0;
        mandel_data->imag_translate = 0.0;
        mandel_data->pthread_limit = 1;
    }

    printf("INFO : mandelbrot bail out = %i\n", mandel_data->mand_bail);
    printf("     : magnify = %-+18.12e\n", mandel_data->magnify);
    printf("     : coordinates = ");
    printf("( %-+18.14e", mandel_data->real_translate);
    printf(", %-+18.14e )\n", mandel_data->imag_translate);
    printf("     : pthread_limit = %i\n", mandel_data->pthread_limit);


    /* TODO perhaps now we create a work queue and the required
     * mutex locks etc etc etc .... */

    free (mandel_data);
    free (test_dbl);

    return EXIT_SUCCESS;

}

