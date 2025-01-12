
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
        sprintf(tbuf, "INFO : this thread_id = %3i\n", thread_id );
    } else {
        sprintf(tbuf, "INFO : this thread_id unknown\n");
    }
    puts( tbuf );

    /* given that the queue is a blocking type of list
     * where no thread can work until something exists
     * in the list .. we can just try to get something
     * out of the queue. Note that this will block and
     * wait for actual work to be in the queue due to
     * a pthread condition variable that we put into the
     * queue.
     *
     * At some point in the future we may check the
     * work_flag. Not at this time. 
     *
     * Before we get into a blocking situation we
     * check the work_flag for this thread and see if if
     * is set to 0 in which case we bail out cleanly. */

    /* a mutex lock is not needed to read a single value
     *
     * we are not using this anyways ... yet 
     *
     *    if ( work_flag[thread_id] == 0 ) goto bail_out;
     */

    /* check if the queue is empty */
    pthread_mutex_lock ( the_q->mutex );
    if (  ( the_q->length == 0 )
         && ( the_q->head == NULL )
         && ( the_q->tail == NULL ) ) {

        /* the queue is empty and thus we bail out */
        pthread_mutex_unlock ( the_q->mutex );
        return NULL;
    }

    foo = (thread_parm_t *)dequeue( (q_type *)work_q );

    pthread_mutex_unlock ( the_q->mutex );

    while ( foo ) {

        foo->work_num = foo->work_num + 1; /* do +=1 on your own time */

        k = sprintf( tbuf, "thr %3i : work %3i  f( %3i )\n",
                              foo->id, foo->work_num,
                              foo->fibber );

        puts(tbuf);

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

        k = sprintf(fbuf,"thr %3i : fib(%-3" PRIu8 ") = %12" PRIu64 "\n",
                          thread_id, foo->fibber, fib(foo->fibber));

        puts(fbuf);

        /* throw away that big array */
        free(foo->big_array);
        foo->big_array = NULL;
        free(foo);
        foo = NULL;

        /* check again if the queue is empty */
        pthread_mutex_lock ( the_q->mutex );
        if (  ( the_q->length == 0 )
             && ( the_q->head == NULL )
             && ( the_q->tail == NULL ) ) {

            /* the queue is empty and thus we bail out */
            pthread_mutex_unlock ( the_q->mutex );
            return ( NULL );

        }
        foo = (thread_parm_t *)dequeue( (q_type *)work_q );
        pthread_mutex_unlock ( the_q->mutex );

        k = sprintf( tbuf, "maybe thr %3i : work %3i  f( %3i )\\n",
        foo->id, foo->work_num,foo->fibber );
        puts(tbuf);
    }

    return (NULL);

}

