
/*
 * enqueue.c  put something onto the tail of the job queue as
 *            described in readme
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

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include "q.h"

int enqueue ( q_type *q, void *p ) {

    int mutex_type;
    int mutex_err_flag = 0;
    char buf[128] = "";
    int trylock_count;
    struct timespec ns_request, ns_remainder;
    int nanosleep_err_flag = 0;
    struct q_item *new_item;

    /*
     * Determine what sort of a mutex we are using in q->mutex
     * where it may be PTHREAD_MUTEX_NORMAL or perhaps even a
     * more useful PTHREAD_MUTEX_ERRORCHECK. Hope that we never
     * ever see PTHREAD_MUTEX_RECURSIVE. The only other possible
     * mutex type is the default PTHREAD_MUTEX_DEFAULT which may
     * be mapped to any or the three others. So don't do that.
     *
     * Possible ERRORS for pthread_mutexattr_gettype() :
     *
     *     EINVAL  The value type is invalid.
     *     EINVAL  The value specified by attr is invalid.
     *
     * Same error value returned if either parameter is borked.
     *
     * The mutex attr parameter must be of type :
     *
     *      const pthread_mutexattr_t *restrict attr
     *
     */
    mutex_err_flag = pthread_mutexattr_gettype(q->mutex_attr,&mutex_type);
    if ( mutex_err_flag == EINVAL ) {

        /* We have no safe way to enqueue the data and may as well
         * utter an error message and return an error status.
         */
        sprintf(buf, "FAIL : enqueue() fail on pthread_mutexattr_gettype");
        puts(buf);
        return ENQUEUE_ERROR;

    }

    /*
     * Set the mutex as locked and check for errors if we are using
     * an ERRORCHECK type mutex.
     *
     *     The pthread_mutex_trylock() function is identical to
     *     pthread_mutex_lock() except that if the mutex object
     *     referenced by mutex is currently locked (by any thread,
     *     including the current thread), the call fails immediately
     *     with EBUSY.
     */
    if ( mutex_type == PTHREAD_MUTEX_ERRORCHECK ) {

        ns_request.tv_sec = 0;
        ns_request.tv_nsec = NANOSLEEP_MS * 1000000;
        ns_remainder.tv_sec = 0;
        ns_remainder.tv_nsec = 0;
        trylock_count = 0;

        while ( ( pthread_mutex_trylock( q->mutex ) == EBUSY )
             && ( trylock_count < MUTEX_TRY_LOCK_LIMIT ) ) {

            trylock_count += 1;

            sprintf(buf,"INFO : enqueue() mutex returns EBUSY");
            puts(buf);

            if ( nanosleep(&ns_request, &ns_remainder) < 0 ) {

                /* The nanosleep() function will fail if:
                 *
                 *     EINTR   nanosleep was interrupted by a signal.
                 *     EINVAL  ns_request is invalid
                 *     ENOSYS  nanosleep is not supported
                 *
                 * Be sure to check errno.
                 */
                if ( errno == ENOSYS ) {
                    /* TODO : check this situation elsewhere and not
                     *          on every call to pthread_mutex_trylock
                     */
                    sprintf(buf, "FAIL : nanosleep is not supported");
                    puts(buf);
                    exit (ENQUEUE_ERROR);
                }

                if ( errno == EINTR ) {
                    /* cool, we were interrupted ? how much ? */
                    sprintf(buf, "INFO : nanosleep returns %10ld ns",
                                               ns_remainder.tv_nsec);
                    puts(buf);
                }

            }

        }

        if ( trylock_count == MUTEX_TRY_LOCK_LIMIT ) {
            sprintf(buf, "FAIL : enqueue() fail on MUTEX_TRY_LOCK_LIMIT");
            puts(buf);
            return ENQUEUE_ERROR;
        }

        /* if the mutex trylock is non-zero then we care to know */
        if ( trylock_count != 0 ) {
            sprintf(buf, "INFO : enqueue() trylock_count = %i", trylock_count);
            puts(buf);
        }

    } else {
        /* This is merely a decision wherein we agree that the
         * mutex lock must support error checking. Otherwise
         * this is all nose demons or worse. Good luck.
         */
        sprintf(buf, "FAIL : enqueue() fail due to no error support mutex");
        puts(buf);
        return ENQUEUE_ERROR;
    }

    /* we need to create a new queue item and put
     * the payload into it */
    new_item = calloc((size_t) 1, (size_t)sizeof(struct q_item));

    if ( new_item == NULL ) {
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
        /* this is HORRIBLE and here we bail out */
        exit ( EXIT_FAILURE );
    }

    /* place the payload data into new_item and then
     * ensure the "next" pointer is NULL.
     */
    new_item->payload = p;
    new_item->next = NULL;

    /* Is the queue list empty? Check if head and tail
     * point nowhere and check if length is zero.
     *
     * To be clear the queue itself is NOT a linked
     * list but rather the items inside it are linked.
     *
     * If the queue is empty then the head points to
     * nowhere as well as the tail. The length will
     * also be zero.  If there is only a single item
     * in the queue then the head and tail both point
     * to that single item.
     */

    if ( ( (q->length) == 0 )
        && ( (q->head) == NULL )
        && ( (q->tail) == NULL ) ) {

        /* The queue is empty.
         *
         * Just place the new_item on the head and
         * the tail and set length to one.
         */
        q->head = new_item;
        q->tail = new_item;
        q->length = 1;

    } else {

        /* The queue is not empty.
         *
         * Take this new_item and stick it on the queue
         * tail.  However we already have something on
         * the tail and we need to preserve that pointer.
         * Therefore whatever is on the tail now must
         * point to the new_item. Also the queue tail
         * will point to this new_item as it really is
         * now on the end of the list.
         *
         *   +--------- queue -----------+
         *   |                           |
         *   |   head -->  some_item_N   |
         *   |                           |
         *   |   tail -->  some_item_X   |
         *   |                           |
         *   |   length =   3            |
         *   |                           |
         *   +---------------------------+
         *
         *   However the some_item_N looks like :
         *
         *   +----- some_item_N ---------+
         *   |                           |
         *   |    payload = a_pointer_x  |
         *   |                           |
         *   |    next ---> some_item_P  |
         *   |                           |
         *   +---------------------------+
         *
         *   +----- some_item_P ---------+
         *   |                           |
         *   |    payload = a_pointer_y  |
         *   |                           |
         *   |    next ---> some_item_X  |
         *   |                           |
         *   +---------------------------+
         *
         *   +----- some_item_X ---------+
         *   |                           |
         *   |    payload = a_pointer_z  |
         *   |                           |
         *   |    next ---> NULL         |
         *   |      This "next" is also  |
         *   |      queue->tail->next    |
         *   |                           |
         *   +---------------------------+
         *
         */
        q->tail->next = new_item;
        q->tail = new_item;
        q->length += 1;

    }

    /* 
     * The pthread_mutex_unlock() function shall fail if:
     *
     *     EPERM  The mutex type is PTHREAD_MUTEX_ERRORCHECK
     *            or PTHREAD_MUTEX_RECURSIVE, or the mutex is
     *            a robust mutex, and the current thread does
     *            not own the mutex. 
     */
    if ( pthread_mutex_unlock ( q->mutex ) == EPERM ) {
        /* This should be impossible. */
        sprintf(buf, "FAIL : pthread_mutex_unlock EPERM !");
        puts(buf);
        exit (ENQUEUE_ERROR);
    }

    /* send out a signal to at least one thread consumer
     * which may be waiting. No promise anything is actually
     * waiting but if there is then we signal that a new
     * task has arrived.
     *
     * From the manpage :
     *
     *    The pthread_cond_signal() call unblocks at least one
     *    of the threads that are blocked on the specified
     *    condition variable.
     *
     */
    pthread_cond_signal( &( q->alive ) );

    return ENQUEUE_SUCCESS;

}

