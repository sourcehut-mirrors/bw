
/*
 * q.h  See the readme related to this POSIX thread work queue.
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

#define ELEMENT_COUNT_LIMIT 1073741824
#define THREAD_LIMIT 256
#define FIB_LIMIT 30

/* If we are going to use pthread_mutex_trylock */
#define MUTEX_TRY_LOCK_LIMIT 16
#define NANOSLEEP_MS 10

/* The enqueue function may return an error */
#define ENQUEUE_ERROR 41
#define ENQUEUE_SUCCESS 0

#include <pthread.h>

extern pthread_t worker_thread[THREAD_LIMIT];

/**********************************************************
 * There was an idea that we could track the activity level
 * of any given thread with a trivial flag.
 *
 * A mutex to allow access to the work_flag array
 *     extern pthread_mutex_t working_now;
 *     extern int work_flag[THREAD_LIMIT];
 **********************************************************/

typedef struct q_type {

    struct q_item *head;
    struct q_item *tail;

   /* how many items are in the queue */
    int length;

   /* We need a way to control access to
    * this list from many places and protect
    * us from multiple accesses happening at
    * the same time. */
    pthread_mutexattr_t *mutex_attr;
    pthread_mutex_t *mutex;

    /* Is this queue live or dead?
     *
     * Here I am thinking that someday and someway
     * we need to have consumers or workers out there
     * that check if there is stuff in the queue as
     * well as a way to signal that we are shutting
     * down the whole queue.
     */
    pthread_cond_t alive;

} q_type;

typedef struct q_item {

    /* we need a way to stuff a data payload or
     * parameter information load in this thing */
    void *payload;

    /* is there a next item in the list ? */
    struct q_item *next;

} q_item;

q_type *q_create(void);
int q_destroy(q_type *q);
int enqueue(q_type *q, void *p);
void *dequeue(q_type *q);

