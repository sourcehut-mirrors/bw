/*
 * thread_pool.h   Demonstrate a progress spinner for activity
 * Copyright (C) The Wild Greek : Χαρίλαος Σκανδύλας
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
 * SUSv2  superset of SUS extended to  support POSIX.1b-1993,   
 * POSIX.1c-1996, and ISO/IEC 9899  (C  Standard) Amendment 1
 *********************************************************************/
#define _XOPEN_SOURCE 500

#include <pthread.h>

#ifndef THREAD_POOL_H
#define THREAD_POOL_H

enum THREAD_POOL_STATE { T_P_RUNNING, T_P_PAUSED, T_P_STOPPED};
enum RUNNING_TASK_STATE {R_T_RUNNING, R_T_PAUSED, R_T_ABORTED};


struct task_entry
{
    struct task *task;
    struct task_entry*next;
};

struct running_task
{
    struct task *task;
    struct thread_pool *thread_pool;
    pthread_t thread_id;
    enum RUNNING_TASK_STATE state;
};


struct thread_pool
{
    //task queue
    struct task_entry *head;
    struct task_entry *tail;
    //running tasks
    struct running_task *running;
    size_t num_running;
    //synchronization mechanisms
    pthread_mutex_t lock;
    pthread_cond_t signal;
    //pool state
    enum THREAD_POOL_STATE state;
};
/*TODO: Do we need control over the running thread tasks ?
 *SOL: Partially solved by also holding a pointer to the task alongside */


void thread_pool_init(struct thread_pool *thread_pool, int num_running);
void thread_pool_destroy(struct thread_pool *thread_pool);
void thread_pool_add_task(struct thread_pool *thread_pool, struct task *task);

#endif

