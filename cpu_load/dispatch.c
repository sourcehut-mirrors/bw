
/*
 * dispatch.c   trivial POSIX threads dispatch and join with
 *              MT-safe calls to fputs and nanosleep.
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
#include <stdint.h>
#include <inttypes.h>
#include <time.h>
#include <locale.h>
#include <unistd.h>
#include <pthread.h>

#include "pthread_dat.h"

int dispatch(dispatch_parm *test_set) {

    /* make life easy later and avoid multiple pointer
     * dereference messy code. Who wants three star code? 
     * Just say no. */
    uint64_t *this_response = *(test_set->fib_response);
    uint64_t *this_fib_value = *(test_set->fib_result);
    int *this_fib_request = *(test_set->fib_request);
    int pt, pthread_limit = test_set->num_siblings;
    int fib_max = test_set->fib_max;
    /* char sbuf[128] = ""; */

    double some_rando;

    pthread_t *tid = NULL;       /* pthread IDs */
    thread_parm **parm = NULL;   /* thread data */

    /* printf("INFO : fib_max = %i\n", fib_max); */

    errno = 0;
    tid = calloc((size_t)pthread_limit,sizeof(pthread_t));
    if ( tid == NULL ) {
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc says ENOMEM\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ );
        perror("FAIL ");
        return EXIT_FAILURE;
    }
    /* printf("INFO : tid       = %p\n", tid); */

    errno = 0;
    parm = calloc((size_t)pthread_limit,sizeof(thread_parm*));
    if ( parm == NULL ) {
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc says ENOMEM\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ );
        perror("FAIL ");
        return EXIT_FAILURE;
    }
    /* printf("INFO : parm      = %p\n", parm); */

    errno = 0;
    for ( pt = 0; pt < pthread_limit; pt++ ){
        parm[pt] = (thread_parm*)calloc(1,sizeof(thread_parm));
        if ( parm[pt] == NULL ) {
            if ( errno == ENOMEM ) {
                fprintf(stderr,"FAIL : calloc says ENOMEM\n");
                fprintf(stderr,"     : so best buy some more.\n");
                perror("     ");
                return EXIT_FAILURE;
            }
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ );
            perror("FAIL ");
            return EXIT_FAILURE;
        }
        parm[pt]->thread_num = pt;
        parm[pt]->thread_id = tid[pt];

        /* ensure we get some random sleep time of at least 50msec and
         * then add on a random amount up to 250msec */
        some_rando = drand48();
        some_rando = some_rando * 250000000.0 + 50000000.0;
        parm[pt]->sleeper.tv_nsec = (long)some_rando;

        parm[pt]->sleeper.tv_sec = 0;  /* sub-second nanosleep only */

        /* the thread will call upon fibonacci and compute
         * the f(n) for some random n between (fib_max - 9) and fib_max
         *
         * note that drand48() returns from 0.0 to less than 1.0 */
        parm[pt]->fib_do = fib_max - (int)( drand48() * 10.0 );

        printf("INFO : parm[%02i]", pt);
        printf("   ->sleeper.tv_nsec = %lu\n", parm[pt]->sleeper.tv_nsec);
        printf("     :            ->fib_do          = %i\n", parm[pt]->fib_do);
    }

    printf("\n");

    errno = 0;
    for ( pt = 0; pt < pthread_limit; pt++) {
        /* in this case we only provide data to the thread
         * for one thread only and not access to the entire
         * array of thread data */
        pthread_create( &parm[pt]->thread_id, NULL, fibonacci_sleeping, (void *)parm[pt]);
    }

    for ( pt = 0; pt < pthread_limit; pt++) {
        /* note see
         *
         *     int pthread_join(pthread_t thread, void **value_ptr);
         *
         *       where value_ptr does have a purpose */
        pthread_join( parm[pt]->thread_id, NULL);


        /* this is no longer needed as the data is gathered in main
         *
        sprintf(sbuf, "DATA : thr (%03i) fib(%02i) %14" PRIu64 " nsec delta %14" PRIu64 " nsec\n",
                        pt,
                        parm[pt]->fib_do,
                        parm[pt]->fib_nsec,
                        parm[pt]->sleep_delta);

        fputs(sbuf, stdout);
        */

        *(this_fib_request+pt) = parm[pt]->fib_do;
        *(this_response+pt) = parm[pt]->fib_nsec;
        *(this_fib_value+pt) = parm[pt]->fib_result;

    }

    printf("main() reports that %d threads terminated\n", pthread_limit);

    for ( pt = 0; pt < pthread_limit; pt++ ){
        free(parm[pt]);
        parm[pt] = NULL;
    }
    free(parm);
    parm = NULL;
    free(tid);
    tid = NULL;

    return EXIT_SUCCESS;

}

