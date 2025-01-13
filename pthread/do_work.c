
/*
 * do_work.c  The actual POSIX thread execution code that will fetch
 *            work data from a queue and then perform some baloney
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2019 Dennis Clarke
 *
 *    Permission is hereby granted, free of charge, to any person
 *    obtaining a copy of this software and associated documentation
 *    files (the "Software"), to deal in the Software without
 *    restriction, including without limitation the rights to use,
 *    copy, modify, merge, publish, distribute, sublicense, and/or
 *    sell copies of the Software, and to permit persons to whom the
 *    Software is furnished to do so, subject to the following
 *    conditions:
 *
 *    The above copyright notice and this permission notice shall be
 *    included in all copies or substantial portions of the Software.
 *
 *        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
 *        KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 *        WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 *        PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
 *        OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 *        OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 *        OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 *        SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * ------------------------------------------------------------------
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

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <errno.h>
#define __STDC_FORMAT_MACROS
#include <inttypes.h>

#include "q.h"
#include "do_work.h"

/* this is in q.h as extern */
pthread_t worker_thread[THREAD_LIMIT];

/********** not needed at this time **************
int work_flag[THREAD_LIMIT];
 *************************************************/

uint64_t fib(uint8_t n);

void *do_some_array_thing ( void *work_q ) {

    int j, k;
    int thread_id = 0;
    int found_thread_id_flag = 0;

    /* track how many times this thread
     * fetches work instruction data
     */
    int work_counter = 0;

    char tbuf[128] = "";
    char fbuf[128] = "";

    q_type *the_q = (q_type *)work_q;

    pthread_t this_thread_id;

    thread_parm_t *foo = NULL;

    /* Walk the worker_thread[k] array to find this thread id.
     *
     * This number should be the same as foo->id
     *
     * We do this because there is no way to really know
     * this thread id number unless we actually search
     * for it. We use pthread_self(void) to get a hint.
     *
     *     pthread_t pthread_self(void);
     *
     *     DESCRIPTION
     *         The pthread_self() function returns the thread
     *         ID of the calling thread.
     *
     * Then check if that makes sense in the worker_thread[k] array.
     */
    this_thread_id = pthread_self();
    found_thread_id_flag = 0;
    for ( k = 0; k < THREAD_LIMIT; k++ ) {
        if ( pthread_equal(worker_thread[k], this_thread_id) ) {
            found_thread_id_flag = 1;
            thread_id = k;
        }
    }
    /* did that search actually work ? */
    if ( found_thread_id_flag == 1 ) {
        sprintf(tbuf, "INFO : this thread_id = %3i", thread_id );
    } else {
        sprintf(tbuf, "INFO : this thread_id unknown");
    }
    puts(tbuf);

    /* given that the queue is a blocking type of list
     * where no thread can work until something exists
     * in the list .. we can just try to get something
     * out of the queue. Note that this will block and
     * wait for actual work to be in the queue due to
     * a pthread condition variable that we put into the
     * queue.
     */







    /* check if the queue is empty ******************/
    /* pthread_mutex_lock ( the_q->mutex ); */
    if (  ( the_q->length == 0 )
         && ( the_q->head == NULL )
         && ( the_q->tail == NULL ) ) {

        /* pthread_mutex_unlock ( the_q->mutex ); */
        return NULL;
    }

    /* get some work instruction data from the queue */
    foo = (thread_parm_t *)dequeue( (q_type *)work_q );
    work_counter = work_counter + 1;

    if ( foo ) {

        foo->work_num = work_counter;

        k = sprintf(tbuf, "thr %3i : work  %-3i  f( %3i )",
                           foo->id, work_counter, foo->fibber );

        puts(tbuf);

    } else {

        /* this should never happen given that we used a mutex
         * lock to check if the queue was empty */
        k = sprintf( tbuf, "WARN : no foo to process, queue empty!?\n");
        puts(tbuf);
        return NULL;

    }

    while ( foo ) {

        /* thrash heap with calloc foo->array_cnt uint64_t elements */
        foo->big_array = calloc( foo->array_cnt,
                                 (size_t)sizeof(uint64_t));

        if ( foo->big_array == NULL ) {
            /* really? possible ENOMEM? */
            if ( errno == ENOMEM ) {
                /* TODO : this is not a thread safe way to output */
                fprintf(stderr,"FAIL : calloc ENOMEM at %s:%d\n",
                        __FILE__, __LINE__ );
            } else {
                fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                        __FILE__, __LINE__ );
            }
            perror("FAIL ");
            /* this is horrible and here we bail out */
            exit ( EXIT_FAILURE );
        }

        for ( j=0; j<(int)foo->array_cnt; j++ ) {
            *((foo->big_array)+j) = (uint64_t)j
                                  + (uint64_t)123456789
                                  + (uint64_t)foo->fibber;
        }

        /* actually do the call into the recursive and abusive fib() */
        k = sprintf(fbuf,"thr %3i : work  %-3i  fib(%-3" PRIu8 ") = %12" PRIu64,
                          thread_id, foo->work_num,
                          foo->fibber, fib(foo->fibber));

        puts(fbuf);

        /* throw away that big array */
        free(foo->big_array);
        foo->big_array = NULL;

        /* We have consumed the work element and may now set it
         * to a NULL pointer. Be aware that this pointer resides
         * inside the queue. It remains there as a NULL. */
        free(foo);
        foo = NULL;

        /* check if the queue is empty **************/
        if (  ( the_q->length == 0 )
             && ( the_q->head == NULL )
             && ( the_q->tail == NULL ) ) {

            return NULL;
        }

        /* fetch a new work element pointer from the queue */
        foo = (thread_parm_t *)dequeue( (q_type *)work_q );

        if ( foo ) {

            /* How many times has this thread gone back to the
             * queue to get work element data? 
             */
            work_counter = work_counter + 1;

            foo->work_num = work_counter;

            k = sprintf(tbuf,"thr %3i : work  %-3i  fib(%-3" PRIu8 ")",
                          thread_id, work_counter, foo->fibber);

            puts(tbuf);

        } else {

            /* This should never happen given that we used a mutex
             * lock to check if the queue was empty.
             */
            k = sprintf( tbuf, "\nWARN : no foo to process, queue empty!?\n");
            puts(tbuf);
            return NULL;

        }

    }

    return NULL;

}

