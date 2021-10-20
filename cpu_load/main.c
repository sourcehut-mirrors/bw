
/*
 * main.c try to guess the cpu capacity with some throw away work
 *        and in the threads use MT-safe calls
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
#include <stdint.h>
#include <inttypes.h>
#include <time.h>
#include <locale.h>
#include <unistd.h>
#include <pthread.h>

#include "pthread_dat.h"

uint64_t timediff( struct timespec start_time,
                   struct timespec end_time );

#define VERBOSE 1
int sysinfo(int verbose);

int main(int argc, char **argv) {

    dispatch_parm *main_data = NULL;

    int j, k, p, status, candidate_int = 0;
    int pthread_limit = THREAD_DEFAULT;
    int fib_max = FIB_DEFAULT;
    int *fib_request = NULL;
    uint64_t *fib_response = NULL;
    uint64_t *fib_result = NULL;
    double ratio = 0.0;
    struct timespec total_start, total_end, time_now;
    uint64_t total_thread_time, total_time;
    char *c_time_string = NULL;

    setlocale(LC_ALL, "C");
    sysinfo(VERBOSE);

    errno = 0;
    if ( argc > 1 ) {
        candidate_int = (int)strtol(argv[1], (char **)NULL, 10);
        if ( (errno == ERANGE) || (errno == EINVAL) ){
            fprintf(stderr,"FAIL : pthread_limit not understood\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        if ( ( candidate_int < 1 ) || ( candidate_int > THREAD_MAX ) ){
            fprintf(stderr,"WARN : pthread_limit is unreasonable\n");
            pthread_limit = THREAD_DEFAULT;
            fprintf(stderr,"     : we shall assume %i and proceed.\n",
                    pthread_limit);
        } else {
            /* snazzy little bit shifting and counting follows
             * where this is not at all efficient but is sort of
             * fun : see https://en.wikipedia.org/wiki/Find_first_set
             *
             * Here we set pthread_limit to a perfect power of two */
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
                pthread_limit = 1 << ( p - 1 );
                fprintf(stderr,"     : %i POSIX thread(s).\n", pthread_limit);
            } else {
                pthread_limit = candidate_int;
            }
        }
    }

    if ( argc > 2 ) {
        candidate_int = (int)strtol(argv[2], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : fibonacci max limit not understood\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        if ( ( candidate_int < FIB_MIN ) || ( candidate_int > FIB_MAX ) ) {
                fprintf(stderr,"WARN : fibonacci max limit is unreasonable\n");
                fib_max = FIB_DEFAULT;
                fprintf(stderr,"     : we shall assume %i and proceed.\n", fib_max);
            } else {
                fib_max = candidate_int;
                printf("INFO : fibonacci max limit is %i\n", fib_max);
            }
    } else {
        printf("INFO : default fibonacci max is %i\n", FIB_DEFAULT);
    }

    /* this is just silly */
    if ( argc > 3 ) {
        fprintf(stderr,"We only need two integer parameters.\n");
    }

    /* get the time of day */
    if ( clock_gettime(CLOCK_REALTIME, &time_now) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    } else {
        c_time_string = ctime(&time_now.tv_sec);
        printf("INFO : current time is %s", c_time_string);
        /* call srand48() with the sub-second time data */
        srand48((long)time_now.tv_nsec);
        /* printf("\nINFO : srand48() seed done.\n"); */
    }

    printf("INFO : we may create %i threads\n", pthread_limit);

    errno = 0;
    main_data = calloc(1,sizeof(dispatch_parm));
    if ( main_data == NULL ) {
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc says ENOMEM\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ );
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    errno = 0;
    fib_request = calloc((size_t)pthread_limit,sizeof(int));
    if ( fib_request == NULL ) {
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc says ENOMEM\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ );
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    errno = 0;
    fib_response = calloc((size_t)pthread_limit,sizeof(uint64_t));
    if ( fib_response == NULL ) {
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc says ENOMEM\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ );
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    errno = 0;
    fib_result = calloc((size_t)pthread_limit,sizeof(uint64_t));
    if ( fib_result == NULL ) {
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc says ENOMEM\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ );
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    main_data->fib_request = &fib_request;
    main_data->fib_response = &fib_response;
    main_data->fib_result = &fib_result;
    main_data->num_siblings = pthread_limit;
    main_data->fib_max = fib_max;

    clock_gettime(CLOCK_MONOTONIC, &total_start);
    status = dispatch(main_data);
    clock_gettime(CLOCK_MONOTONIC, &total_end);
    total_time = timediff(total_start,total_end);


    total_thread_time = 0;
    for ( j = 0; j < pthread_limit; j++ ) {
        printf("DATA : thr (%03i) ", j);
        printf(" : fib(%-2i)", fib_request[j]);
        printf(" = %10" PRIu64 " ", fib_result[j]);
        printf(" time %14" PRIu64 " nsec\n", fib_response[j] );
        total_thread_time += fib_response[j];
    }

    printf("DATA : total time measured from main   = %14" PRIu64 "\n",
            total_time);

    printf("DATA : total cpu time in POSIX threads = %14" PRIu64 "\n",
             total_thread_time);

    /* start clean up */
    free(fib_request);
    fib_request = NULL;

    free(fib_result);
    fib_result = NULL;
    main_data->fib_response = NULL;

    free(fib_response);
    fib_response = NULL;
    main_data->fib_response = NULL;

    free(main_data);
    main_data = NULL;

    return status;

}

