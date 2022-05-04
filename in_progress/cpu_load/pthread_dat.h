
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

#include <stdint.h>
#include <time.h>

#define NUM_THREADS 8
#define FIB_MAX 50
#define FIB_MIN 20
#define FIB_DEFAULT 36
#define THREAD_DEFAULT 4
#define THREAD_MAX 256

/* struct to pass to the main dispatch routine */
typedef struct {
    uint64_t **fib_response; /* time results of fib(n) */
    uint64_t **fib_result;   /* values of fib(n) */
    int **fib_request;       /* requested fibonacci num */
    int num_siblings;        /* total number of threads */
    int fib_max;             /* maximum fib(n) to compute */
} dispatch_parm;

/* struct to pass params to a POSIX thread */
typedef struct {
    struct timespec sleeper;
    pthread_t thread_id;
    uint64_t fib_result;
    uint64_t fib_nsec;
    uint64_t sleep_delta;
    int num_siblings; /* total number of threads */
    int thread_num;   /* this thread number      */
    int fib_do;       /* some work for fibonacci */
} thread_parm;

int dispatch(dispatch_parm *test_set);
void *fibonacci_sleeping(void *);

