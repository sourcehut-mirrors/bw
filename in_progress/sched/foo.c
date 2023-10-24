
#define _XOPEN_SOURCE 600

#define VERBOSE 1

#include <sched.h>
#include <stdio.h>

int sysinfo(int verbose);

int main(void)
{

    int pri_max, pri_min;

    sysinfo(VERBOSE);

    pri_max = sched_get_priority_max(SCHED_FIFO);
    pri_min = sched_get_priority_min(SCHED_FIFO);

    printf("SCHED_FIFO   : max = %i\n", pri_max);
    printf("SCHED_FIFO   : min = %i\n", pri_min);

    pri_max = sched_get_priority_max(SCHED_OTHER);
    pri_min = sched_get_priority_min(SCHED_OTHER);

    printf("SCHED_OTHER  : max = %i\n", pri_max);
    printf("SCHED_OTHER  : min = %i\n", pri_min);

    pri_max = sched_get_priority_max(SCHED_RR);
    pri_min = sched_get_priority_min(SCHED_RR);

    printf("SCHED_RR     : max = %i\n", pri_max);
    printf("SCHED_RR     : min = %i\n", pri_min);

#ifdef __GLIBC__
    /* Linux claims to support :
     *     SCHED_BATCH, SCHED_IDLE, and SCHED_DEADLINE
     * with no clue what those do ... if anything.
     */

    pri_max = sched_get_priority_max(SCHED_BATCH);
    pri_min = sched_get_priority_min(SCHED_BATCH);

    printf("SCHED_BATCH   : max = %i\n", pri_max);
    printf("SCHED_BATCH   : min = %i\n", pri_min);

    pri_max = sched_get_priority_max(SCHED_IDLE);
    pri_min = sched_get_priority_min(SCHED_IDLE);

    printf("SCHED_IDLE   : max = %i\n", pri_max);
    printf("SCHED_IDLE   : min = %i\n", pri_min);

    pri_max = sched_get_priority_max(SCHED_DEADLINE);
    pri_min = sched_get_priority_min(SCHED_DEADLINE);

    printf("SCHED_DEADLINE   : max = %i\n", pri_max);
    printf("SCHED_DEADLINE   : min = %i\n", pri_min);

#endif

    return 42;

}

