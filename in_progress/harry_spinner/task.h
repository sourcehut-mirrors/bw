/*
 * task.h  Demonstrate a progress spinner for activity
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
/* #include <stdint.h> */

#ifndef TASK_H
#define TASK_H

/* 
 This is a tiny task implementation that wraps detatched pthreads.
*/


enum TASK_STATUS
{
    TASK_CREATED,
    TASK_RUNNING,
    TASK_COMPLETE,
    TASK_ABORTED
};


/*forward declare to make it a bit easier to read*/
struct task;

typedef void (*task_init)(struct task *task);
typedef void (*task_run)(struct task *task);
typedef void  (*task_destroy)(struct task *task);

struct task
{
    unsigned int task_id;
    enum TASK_STATUS status;

    //context and return
    void *task_ctx;
    void *ret;

    //function pointers
    task_init init;
    task_run run;
    task_destroy destroy;
};

void create_task(struct task *task,
		 unsigned int task_id,
		 task_init init,
		 task_run run,
		 task_destroy destroy,
		 void *task_ctx);
void destroy_task(struct task *task);

#endif

