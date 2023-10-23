
/* ripped from the man page on Solaris 10 
 * for pthread_create(3C)
 */

#define _REENTRANT
#include <pthread.h>

#define NUM_THREADS 5
#define SLEEP_TIME 10

void *sleeping(void *);   /* thread routine */

int i;
thread_t tid[NUM_THREADS];      /* array of thread IDs */

int
main(int argc, char *argv[])
{
    if (argc == 1)  {
        printf("use 0 as arg1 to use pthread_create()\n");
        printf("or use 1 as arg1 to use thr_create()\n");
        return (1);
    }

    for ( i = 0; i < NUM_THREADS; i++)
        pthread_create(&tid[i], NULL, sleeping,
            (void *)SLEEP_TIME);

    for ( i = 0; i < NUM_THREADS; i++)
        pthread_join(tid[i], NULL);

    printf("main() reporting that all %d threads have
    terminated\n", i);
    return (0);
}  /* main */

void *
sleeping(void *arg)
{
    int sleep_time = (int)arg;
    printf("thread %d sleeping %d seconds ...\n", thr_self(),
    sleep_time);
    sleep(sleep_time);
    printf("\nthread %d awakening\n", thr_self());
    return (NULL);
}

