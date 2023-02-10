
/*
 * thread_pool.c   Demonstrate a progress spinner for activity
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

#include "thread_pool.h"
#include "task.h"
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <stdbool.h>

/*forward declare for simplicity*/
static void *thread_func(void *t_p);

void thread_pool_init(struct thread_pool *thread_pool, int num_running)
{
    int j;

    //start with an empty queue
    thread_pool->head=thread_pool->tail=NULL;

    //create the running tasks
    thread_pool->running=malloc(num_running * sizeof(struct running_task));
    thread_pool->num_running=num_running;

    pthread_mutex_init(&thread_pool->lock,NULL);
    pthread_cond_init(&thread_pool->signal,NULL);

    thread_pool->state=T_P_RUNNING;
    //create the running threads
    for(j=0;j<num_running;j++)
    {
	struct running_task *r_t=&thread_pool->running[j];
	r_t->thread_pool=thread_pool;
	/*set the thread to running and the task to NULL*/
	pthread_create(&r_t->thread_id,NULL,
		       thread_func,r_t);
	r_t->task=NULL;
	pthread_detach(r_t->thread_id);
    }

    //busy wait for threads to initialize
    
}

void thread_pool_destroy(struct thread_pool *thread_pool)
{
    size_t j;
    /*set pool status to stopped*/
    pthread_mutex_lock(&thread_pool->lock);
    thread_pool->state=T_P_STOPPED;
    pthread_mutex_unlock(&thread_pool->lock);
    pthread_cond_broadcast(&thread_pool->signal);

    bool all_done=false;

    //spin until all thread tasks are aborted
    while(!all_done)
    {
	pthread_mutex_lock(&thread_pool->lock);
	
	all_done=true;
	for(j=0;j<thread_pool->num_running;j++)
	{
	    if(thread_pool->running[j].state!=R_T_ABORTED)
		all_done=false;
	}
	pthread_mutex_unlock(&thread_pool->lock);
	pthread_cond_broadcast(&thread_pool->signal);
    }
    
    //free the threads array and the queue array
    free(thread_pool->running);
    pthread_cond_destroy(&thread_pool->signal);
    pthread_mutex_destroy(&thread_pool->lock);
    
}

void thread_pool_add_task(struct thread_pool *thread_pool, struct task *task)
{

    //lock the queue add a task unlock the queue
    pthread_mutex_lock(&thread_pool->lock);
    //create the task entry
    struct task_entry *new_entry=malloc(sizeof(struct task_entry));
    new_entry->task=task;
    new_entry->next=NULL;

    //add the new entry to the end of the queue
    if(!thread_pool->head)
    {
	thread_pool->head=thread_pool->tail=new_entry;
	thread_pool->head->next=thread_pool->tail->next=NULL;
    }
    else
    {
	thread_pool->tail->next=new_entry;
	thread_pool->tail=new_entry;
    }
    //we have work so let's get someone to do it.
    pthread_cond_signal(&thread_pool->signal);
    pthread_mutex_unlock(&thread_pool->lock);
}

static void *thread_func(void *r_t)
{
    struct running_task *running=r_t;
    struct thread_pool *thread_pool = running->thread_pool;
    struct task_entry *old_head=NULL;
    while(1)
    {
	//fetch the next task in the queue if one exists
	
	//lock the queue
	pthread_mutex_lock(&thread_pool->lock);


	
	//wait on the condition variable
	while(!thread_pool->head && thread_pool->state!=T_P_STOPPED)
	{    
	    pthread_cond_wait(&thread_pool->signal,&thread_pool->lock);
	}
	if(thread_pool->state==T_P_STOPPED)
	{
	    //We're done here
	    break;
	}
	
	//There's definitely something at the head of the queue 	    
	running->task=thread_pool->head->task;
	old_head=thread_pool->head;
	thread_pool->head=thread_pool->head->next;

	pthread_cond_signal(&thread_pool->signal);
	pthread_mutex_unlock(&thread_pool->lock);

	
	
	if(running->task)
	{
	    //clean up the previous node
	    free(old_head);
	    running->task->run(running->task);
	    
	    running->task->destroy(running->task);

	    //job done
	    pthread_mutex_lock(&thread_pool->lock);
	    running->task->status=TASK_COMPLETE;
	    pthread_mutex_unlock(&thread_pool->lock);
	}

	
    }
    //we dropped out cause the pool was stopped but still hold the lock
    running->state=R_T_ABORTED;
    pthread_cond_signal(&thread_pool->signal);
    pthread_mutex_unlock(&thread_pool->lock);

    pthread_exit(NULL);
    
    
}

