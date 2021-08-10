
/*
 * t_pthr.c  Demonstrate trivial POSIX threads dispatch and join with
 *           MT-safe calls to fputs and nanosleep.
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

#define NUM_THREADS 16
#define SLEEP_TIME 4

uint64_t timediff( struct timespec start_time,
                   struct timespec end_time );

void    *sleeping(void *);  /* thread routine */

pthread_t tid[NUM_THREADS]; /* array of thread IDs */
struct timespec sleeper;    /* data for nanosleep */
int    i;

int main(int argc, char *argv[]) {

    struct timespec time_now;
    char *c_time_string;

    sleeper.tv_nsec = 0;
    sleeper.tv_sec = SLEEP_TIME;

    setlocale(LC_ALL, "C");
    if ( clock_gettime( CLOCK_REALTIME, &time_now ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return(EXIT_FAILURE);
    } else {
        c_time_string = ctime( &time_now.tv_sec );
        printf("\nINFO : current time is %s", c_time_string );
    }

    for ( i = 0; i < NUM_THREADS; i++) {
        pthread_create(&tid[i], NULL, sleeping, (void *)NULL);
    }

    for ( i = 0; i < NUM_THREADS; i++) {
        pthread_join(tid[i], NULL);
    }

    printf("main() reporting that all %d threads have terminated\n", i);

    return EXIT_SUCCESS;

}

void* sleeping(void *arg)
{
    int errno, actual_sleep, my_id;
    char tbuf[128];
    pthread_t this_thread_id;
    struct timespec start_sleep, end_sleep;
    uint64_t sleep_nanosecs = 0;

    for ( int k = 0; k < NUM_THREADS; k++ ) {
        this_thread_id = pthread_self();
        if ( pthread_equal( tid[k], this_thread_id ) ) {
            /* okay we found our thread id number */
            my_id = k;
            sprintf( tbuf, "INFO : this thread_id = %i\n", my_id );
            fputs(tbuf, stdout);
            k = NUM_THREADS;  /* ya know a break would also work eh? */
        }
    }

    sprintf(tbuf, "INFO : thread %2i sleeping %lu seconds\n",
                      my_id, sleeper.tv_sec);

    fputs(tbuf, stdout);

    clock_gettime( CLOCK_MONOTONIC, &start_sleep );

    errno = 0;
    actual_sleep = nanosleep(&sleeper, NULL);

    clock_gettime( CLOCK_MONOTONIC, &end_sleep );

    if ( actual_sleep < 0 ) {
        sprintf( tbuf, "INFO : thr %2i woke up early\n", my_id);
        perror("INFO : ");
    } else {
        sprintf( tbuf, "INFO : thr %2i woke up after %" PRIu64 " nsec\n",
                            my_id, timediff(start_sleep,end_sleep));
    }

    fputs(tbuf, stdout);

    return NULL;
}

