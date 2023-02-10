
/*
 * test_thread_pool.c Demonstrate a progress on a thread pool
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

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "task.h"
#include "thread_pool.h"

long fib(volatile int n);

void task_init_empty(struct task *task)
{
    /*printf("Doing nothing on initialization\n");*/
}

void task_destroy_empty(struct task *task)
{
    /*printf("Doing nothing on destruction\n");*/
}

void task_run_print(struct task *task)
{

    int secs=rand()%10;
    printf("Task %u, sleeping for %d\n",task->task_id,secs);
    usleep(1000000*secs);
}


void task_run_echo(struct task *task)
{
    printf("Nice! You said:Hi:%u\n",task->task_id);
    
}

void task_run_do_work(struct task *task)
{
    int i, j, k, p, fib_in;
    unsigned int seed=0;
	long long sum;
    long fibonacci;
    srand(0);
    struct timespec begin, end; 
    clock_gettime(CLOCK_REALTIME, &begin);
    
    for(i=0;i<100;i++)
    {
	//printf("%d\n",i);
	sum=0;
	
	for(j=0;j<rand_r(&seed);j++)
	{
	    sum+=rand_r(&seed);
	}

	for(k=0;k<rand_r(&seed);k++)
	{
	    sum+=rand_r(&seed);
	}

	for(p=0;p<rand_r(&seed);p++)
	{
	    sum+=rand_r(&seed);
	}
	
    }
    
    /* do a silly fibbonnaaaccciii */
    srand48( (long) begin.tv_nsec );
    fib_in =  (int)(drand48()*26.0 + 20.0) ;
    fibonacci = fib( fib_in );
    printf("fibonacci(%i) = %i\n", fib_in, fibonacci);


    clock_gettime(CLOCK_REALTIME, &end);
    long seconds = end.tv_sec - begin.tv_sec;
    long nanoseconds = end.tv_nsec - begin.tv_nsec;
    double elapsed = seconds + nanoseconds*1e-9;
    
    //printf("Time measured: %.3f seconds.\n", elapsed);

    
}

int main(int argc, char *argv[])
{
    int i, j;
    int pool_size=1;
    int num_done=0;

    if(argc>1)
    {
	pool_size=atoi(argv[1]);
    }

    printf("Task struct size in memory: %zu\n",sizeof(struct task));
    printf("Thread Pool struct size in memory: %zu\n",sizeof(struct thread_pool));
    printf("Pool Size: %d\n",pool_size);
    struct thread_pool t_p;
    thread_pool_init(&t_p,pool_size);

	
    unsigned long up=0;

    /* this is not well understood at this time .. by me : 
     *    Dennis Clarke  10 Feb 2023 
     *
     * was 150 and Harry says .. go for 512 and watch the smoke.
     */
    int num_tasks=512;
    struct task *count_tasks=malloc(num_tasks*sizeof(struct task));
    for(i=0;i<num_tasks;i++)
    {
	int die= rand()%3;
	if(die==0)
	{
	    create_task(&count_tasks[i],up,task_init_empty,task_run_print,
		    task_destroy_empty,NULL);
	}
	else if(die==1)
	{
	    create_task(&count_tasks[i],up,task_init_empty,task_run_echo,
		    task_destroy_empty,NULL);
	}
	else
	{
	    create_task(&count_tasks[i],up,task_init_empty,task_run_do_work,
		    task_destroy_empty,NULL);
	}
	
	up++;
	thread_pool_add_task(&t_p,&count_tasks[i]);
    }

    
    while(1)
    {
	usleep(1000000);
	
	num_done=0;
	for(j=0;j<num_tasks;j++)
	{
	   pthread_mutex_lock(&t_p.lock);
	    if(count_tasks[j].status==TASK_COMPLETE)
		num_done++;
	    pthread_mutex_unlock(&t_p.lock);
	}
	printf("Tick: %d/%d tasks done!\n",num_done,num_tasks);
	
	
	if( num_done==num_tasks)
	{
	    break;
	}
	
    }
    printf("Terminating\n");
    //for(int i=0;i<num_tasks;i++)
    thread_pool_destroy(&t_p);
    free(count_tasks);
    
    return 0;
}
