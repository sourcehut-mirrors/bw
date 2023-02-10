/*
 * task.c  Demonstrate a progress spinner for activity
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

#include "task.h"

void create_task(struct task *task,
		 unsigned int task_id,
		 task_init init,
		 task_run run,
		 task_destroy destroy,
		 void *task_ctx)
{
    task->task_id=task_id;
    task->status=TASK_CREATED;
    task->init=init;
    task->run=run;
    task->destroy=destroy;
    task->task_ctx=task_ctx;
    task->ret=NULL;
    task->init(task);
}

void destroy_task(struct task *task)
{
    task->destroy(task);
}

