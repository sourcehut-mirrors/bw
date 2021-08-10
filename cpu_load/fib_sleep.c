
/*
 * s.c  POSIX threads with MT-safe calls to fputs and nanosleep.
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
#include <pthread.h>
#include <locale.h>
#include <unistd.h>

#include "pthread_dat.h"

uint64_t timediff( struct timespec start_time,
                   struct timespec end_time );

uint64_t fib(volatile uint8_t n);

void* fibonacci_sleeping(void *recv_parm)
{
    int nanosleep_flag;
    uint64_t sleep = 0;
    char tbuf[128];
    struct timespec start_sleep, end_sleep, start_fib, end_fib;
    thread_parm *p = (thread_parm *)recv_parm;

    /* usually we can use pthread_equal() to determine 
     * this thread id but we have that data provided to
     * us in p->thread_num */
    sprintf(tbuf, "INFO thr (%03i) sleeping %lu nsec\n",
                      p->thread_num, p->sleeper.tv_nsec);

    fputs(tbuf, stdout);

    clock_gettime(CLOCK_MONOTONIC, &start_sleep);

    errno = 0;
    nanosleep_flag = nanosleep(&(p->sleeper), NULL);
    if ( nanosleep_flag != 0 ) {
        if ( errno == EINTR ) {
            sprintf(tbuf,"INFO thr %2i had nanosleep interrupted\n",
                      p->thread_num);

            fputs(tbuf, stdout);
        }
        perror("INFO : ");
        sprintf(tbuf, "INFO : thr (%03i) woke up early\n", p->thread_num);
    } 
    clock_gettime(CLOCK_MONOTONIC, &end_sleep);
    sleep = timediff(start_sleep,end_sleep);
    sprintf(tbuf, "INFO thr (%03i) woke up after %" PRIu64 " nsec\n",
                        p->thread_num, sleep);

    fputs(tbuf, stdout);

    p->sleep_delta = (uint64_t)llabs(  (long long)p->sleeper.tv_nsec
                                     - (long long)sleep);

    clock_gettime(CLOCK_MONOTONIC, &start_fib);

    p->fib_result = fib((uint8_t)p->fib_do);

    sprintf(tbuf, "INFO thr (%03i) : fib(%-2i) = %10" PRIu64 "\n",
                     p->thread_num, p->fib_do, p->fib_result);

    clock_gettime(CLOCK_MONOTONIC, &end_fib);

    fputs(tbuf, stdout);

    p->fib_nsec = timediff(start_fib,end_fib);

    sprintf(tbuf, "INFO thr (%03i) : time %" PRIu64 " nsec for fib(%-2i)\n",
                 p->thread_num, p->fib_nsec, p->fib_do);

    fputs(tbuf,stdout);

    return NULL;

}

