
/*
 * sched.c  Demonstrate trivial POSIX threads dispatch and join with
 *          MT-safe calls to fputs. Attempt thread schedule priority.
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
#include <inttypes.h>
#include <time.h>
#include <locale.h>
#include <unistd.h>
#include <pthread.h>
#include <sched.h>
#include <sys/time.h>
#include <sys/resource.h>

#include "schedule.h"

int main(int argc, char *argv[]) {

    int j;
    int pthread_err;

    int fifo_pri_max, fifo_pri_min,
        other_pri_max, other_pri_min,
        rr_pri_max, rr_pri_min;

    struct timespec time_start, time_done;
    char *c_time_string;
    pthread_attr_t *attr;

    /* a silly struct with one integer member
     *   struct sched_param {int sched_priority = 1}
     */
    struct sched_param thread_schedule_param;

    setlocale(LC_ALL, "C");
    if ( clock_gettime( CLOCK_REALTIME, &time_start ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return -42;
    } else {
        c_time_string = ctime( &time_start.tv_sec );
        printf("\nINFO : current time is %s", c_time_string );
    }

    sysinfo(VERBOSE);

    if ( set_this_priority(PRIORITY_REQUEST) != EXIT_SUCCESS ) {
        /* well bork bork bork ... */
        return -42;
    }

    /* check if we can do POSIX thread schedule stuff at all */
    fprintf(stderr,"NOTE : _POSIX_THREAD_PRIORITY_SCHEDULING is ");
#if defined(_POSIX_THREAD_PRIORITY_SCHEDULING)
    fprintf(stderr,"defined\n");
#else
    fprintf(stderr," not defined\n");
    fprintf(stderr,"FAIL : there is no reason to continue.\n");
    return -42;
#endif

    fifo_pri_max = sched_get_priority_max(SCHED_FIFO);
    fifo_pri_min = sched_get_priority_min(SCHED_FIFO);

    printf("SCHED_FIFO   : max = %i\n", fifo_pri_max);
    printf("SCHED_FIFO   : min = %i\n", fifo_pri_min);

    other_pri_max = sched_get_priority_max(SCHED_OTHER);
    other_pri_min = sched_get_priority_min(SCHED_OTHER);

    printf("SCHED_OTHER  : max = %i\n", other_pri_max);
    printf("SCHED_OTHER  : min = %i\n", other_pri_min);

    rr_pri_max = sched_get_priority_max(SCHED_RR);
    rr_pri_min = sched_get_priority_min(SCHED_RR);

    printf("SCHED_RR     : max = %i\n", rr_pri_max);
    printf("SCHED_RR     : min = %i\n", rr_pri_min);


    /* use the Round Robin scheduler */
    printf("INFO : Round Robin scheduler SCHED_RR selected\n");
    printf("     | SCHED_RR priority_max = %i\n", rr_pri_max);
    printf("     | SCHED_RR priority_min = %i\n", rr_pri_min);

    printf("     : seed drand48() with %lu\n", (long)time_start.tv_nsec);
    srand48((long)time_start.tv_nsec);

    if ( create_pthread_attr(&attr) == EXIT_FAILURE ) {
        fprintf(stderr,"FAIL : pthread attr init failed\n");
        if ( attr != NULL ) free(attr);
        return -42;
    }

    /* PTHREAD_SCOPE_PROCESS or PTHREAD_SCOPE_SYSTEM ? */
    errno = 0;
    pthread_err = pthread_attr_setscope(attr, PTHREAD_SCOPE_PROCESS);
    if ( pthread_err == EINVAL ) {
        fprintf(stderr,"FAIL : pthread_attr_setscope %s:%d\n", __FILE__, __LINE__);
        perror("FAIL : Invalid value for attr");
        return EXIT_FAILURE;
    }

    if ( pthread_err == ENOTSUP ) {
        fprintf(stderr,"WARN : pthread_attr_setscope %s:%d\n", __FILE__, __LINE__);
        fprintf(stderr,"     : Invalid or unsupported value\n");
        perror("     : however errno returns");
        fprintf(stderr,"     : must be a Linux system.\n");
        fprintf(stderr,"     : will attempt PTHREAD_SCOPE_SYSTEM\n");
        errno = 0;
        pthread_err = pthread_attr_setscope(attr, PTHREAD_SCOPE_SYSTEM);
        if ((pthread_err == EINVAL)||(pthread_err == ENOTSUP)){
            /* bork bork bork and just give up */
            fprintf(stderr,"     : pthread_attr_setscope %s:%d\n", __FILE__, __LINE__);
            perror("FAIL : can not set pthread contention scope at all");
            return EXIT_FAILURE;
        }
        fprintf(stderr,"     : PTHREAD_SCOPE_SYSTEM works here\n");
    }

    /* PTHREAD_CREATE_DETACHED or PTHREAD_CREATE_JOINABLE */
    errno = 0;
    pthread_err = pthread_attr_setdetachstate(attr, PTHREAD_CREATE_JOINABLE);
    if ( pthread_err == EINVAL) {
        fprintf(stderr,"FAIL : pthread_attr_setdetachstate\n");
        perror("FAIL : EINVAL");
        return EXIT_FAILURE;
    }

    /* set the POSIX thread schedule policy to Round Robin */
    errno = 0;
    pthread_err = pthread_attr_setschedpolicy(attr, SCHED_RR);
    if ( (pthread_err == EINVAL ) || ( pthread_err == ENOTSUP ) ) {
        fprintf(stderr,"FAIL : pthread_attr_setschedpolicy\n");
        fprintf(stderr,"     : pthread_err = %i", pthread_err);
        perror("FAIL : ");
        return EXIT_FAILURE;
    }

    errno = 0;
    thread_schedule_param.sched_priority = -999;
    pthread_err = pthread_attr_getschedparam(attr, &thread_schedule_param);
    if ( (pthread_err == EINVAL ) || ( pthread_err == ENOTSUP ) ) {
        fprintf(stderr,"FAIL : pthread_attr_getschedparam\n");
        fprintf(stderr,"     : pthread_err = %i", pthread_err);
        perror("FAIL : ");
        return EXIT_FAILURE;
    }

    printf("INFO : pthread_attr_getschedparam reports sched_priority = %i\n",
                   thread_schedule_param.sched_priority );

    errno = 0;
    thread_schedule_param.sched_priority = rr_pri_min;
    pthread_err = pthread_attr_setschedparam(attr, &thread_schedule_param);
    if ( (pthread_err == EINVAL ) || ( pthread_err == ENOTSUP ) ) {
        fprintf(stderr,"FAIL : pthread_attr_setschedparam\n");
        fprintf(stderr,"     : pthread_err = %i", pthread_err);
        perror("FAIL : ");
        return EXIT_FAILURE;
    }


    printf("INFO : pthread_attr_setschedparam at SCHED_RR minimum = %i\n",
                   thread_schedule_param.sched_priority );

    if ( clock_gettime( CLOCK_MONOTONIC, &time_start ) == -1 ) {
        fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
        free(attr);
        attr = NULL;
        return -42;
    }

    /* create the pool of threads */
    for ( j = 0; j < NUM_THREADS; j++) {
        errno = 0;
        pthread_err = pthread_create(&thread_id[j], attr, mocking, (void *)NULL);
        if ( pthread_err == EAGAIN ) {
            fprintf(stderr,"FAIL : EAGAIN system lacked resources\n");
            perror("FAIL : EAGAIN");
            return EXIT_FAILURE;
        } else if ( pthread_err == EINVAL ) {
            fprintf(stderr,"FAIL : EINVAL attr is invalid\n");
            perror("FAIL : EINVAL");
            return EXIT_FAILURE;
        } else if ( pthread_err == EPERM ) {
           fprintf(stderr,"FAIL : EPERM permission denied\n");
           perror("FAIL : EPERM");
           return EXIT_FAILURE;
        }
    }

    /* use the blocking join to call them back in */
    for ( j = 0; j < NUM_THREADS; j++) {
        pthread_join(thread_id[j], NULL);
    }

    if ( clock_gettime( CLOCK_MONOTONIC, &time_done ) == -1 ) {
        fprintf(stderr,"ERROR : could not attain CLOCK_MONOTONIC\n");
        free(attr);
        attr = NULL;
        return -42;
    }

    printf("DONE : all %d threads have terminated\n", j);

    printf("     : total time %14.6e\n",
            ((double)timediff(time_start,time_done))/1000000000.0);

    free(attr);
    attr = NULL;

    return EXIT_SUCCESS;

}

void* mocking(void *arg)
{
    int k;
    uint8_t my_thread_id = 0;
    uint8_t do_this_fib;
    char tbuf[128];
    pthread_t this_thread_id;
    struct timespec start_work, end_work;
    uint64_t fibonacci;

    for ( k = 0; k < NUM_THREADS; k++ ) {
        this_thread_id = pthread_self();
        if ( pthread_equal(thread_id[k], this_thread_id ) ) {
            /* okay we found our thread id number */
            my_thread_id = (uint8_t)k;
            k = NUM_THREADS;  /* a break would also work */
        }
    }

    do_this_fib = ((uint8_t)(drand48()*BASELINE_FIB)) + 20;

    sprintf(tbuf, "     : thread %2i working fib(%2i)\n", my_thread_id, do_this_fib);
    fputs(tbuf, stdout);

    clock_gettime(CLOCK_MONOTONIC, &start_work);
    fibonacci = fib(do_this_fib);
    clock_gettime(CLOCK_MONOTONIC, &end_work);

    sprintf(tbuf,"     : thr %3i did fib(%2i)=%12" PRIu64 " in %14.6e sec\n",
                my_thread_id, do_this_fib, fibonacci,
                ((double)timediff(start_work,end_work))/1000000000.0);

    fputs(tbuf, stdout);

    return NULL;
}

uint64_t fib(volatile uint8_t n)
{
    if ( n == 0 ) {
        return 0;
    } else if ( n == 1 ) {
        return 1;
    } else {
        return ( fib( n - 1 ) + fib( n - 2 ) );
    }
}

int create_pthread_attr(pthread_attr_t **pthread_attr)
{

    /* we will need to specifiy the thread attributes */
    errno = 0;
    *pthread_attr = calloc(1,sizeof(pthread_attr_t));
    if (*pthread_attr == NULL) {
        /* really? possible ENOMEM? */
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

    errno = 0;
    if ( pthread_attr_init(*pthread_attr) == ENOMEM ) {
        fprintf(stderr,"FAIL : ENOMEM from pthread_attr_init\n");
        perror("FAIL : ");
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;

}

int set_this_priority(int new_pri)
{

    int this_proc_pri;

    errno = 0;
    this_proc_pri = getpriority(PRIO_PROCESS, 0);
    if ( errno != 0 ) {
        /* [ESRCH]   No process was located using the which and who
         *           values specified.
         * [EINVAL]  The which argument was not one of PRIO_PROCESS,
         *           PRIO_PGRP, or PRIO_USER.
         */
        fprintf(stderr,"FAIL : getpriority returns bad stuff\n");
        perror("FAIL ");
        return EXIT_FAILURE;
    }
    fprintf(stderr,"INFO : getpriority(PRIO_PROCESS, 0) returns %i\n",
                    this_proc_pri);

    /* attemp to set this process into whatever new_pri is */
    errno = 0;
    this_proc_pri = setpriority(PRIO_PROCESS, 0, new_pri);

    if ( errno != 0 ) {
        /* [ESRCH]   No process was located using the which and who
         *           values specified.
         * [EINVAL]  The which argument was not one of PRIO_PROCESS,
         *           PRIO_PGRP, or PRIO_USER.
         * [EPERM]   A process was located, but neither its eff nor
         *           real user ID matched the eff user ID of the
         *           caller.
         * [EACCES]  A non super-user attempted to lower a process
         *           priority.
         */
        fprintf(stderr,"FAIL : setpriority returns bad stuff\n");
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    errno = 0;
    this_proc_pri = getpriority(PRIO_PROCESS, 0);
    if ( errno != 0 ) {
        /* [ESRCH]   No process was located using the which and who
         *           values specified.
         * [EINVAL]  The which argument was not one of PRIO_PROCESS,
         *           PRIO_PGRP, or PRIO_USER.
         */
        fprintf(stderr,"FAIL : getpriority returns bad stuff\n");
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    /* did we get what we asked for ? */
    fprintf(stderr,"INFO : getpriority(PRIO_PROCESS, 0) ");
    if ( this_proc_pri != new_pri ) {
        /* nope. however something worked anyways */
        fprintf(stderr,"requested %i priority.\n", new_pri);
        fprintf(stderr,"     : however we attained ");
    } else {
        fprintf(stderr,"success for ");
    }
    fprintf(stderr,"%i priority\n",this_proc_pri);

    return EXIT_SUCCESS;

}

