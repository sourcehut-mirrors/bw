
/*
 * sorter.c   bubble sort and qsort some numbers
 * Copyright (C) Dennis Clarke 2020
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

#define LIMIT 10000

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include <time.h>

uint64_t timediff( struct timespec st, struct timespec en );
static int int_compare(const void *p1, const void *p2);

int main(int argc, char **argv)
{

    /* some data elements which are all just trivial 
     * integers and some are negative and some are
     * duplicates. */

    uint64_t tdelta_nsec = 0;
    struct timespec t0, t1;
    size_t k, num_elements = LIMIT;
    int tmp, swap;
    int *blarg, *bleah;
    if ( argc > 1 ) {
        num_elements = (size_t)atoi(argv[1]);
        if ( num_elements < 10 ) {
            fprintf(stderr,"FAIL : don't be a jerk.\n");
            return EXIT_FAILURE;
        }
    }
    blarg = calloc(num_elements,sizeof(int));
    bleah = calloc(num_elements,sizeof(int));

    /* Get the CLOCK_REALTIME time in a timespec struct */
    if ( clock_gettime( CLOCK_REALTIME, &t0 ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    } else {
        /* to get a random seed value we should use the clock
         * nanosec value. There may be better ways and we 
         * could even read /dev/random to get some bytes and
         * then seed with that .. however this is cheap and 
         * easy.
         *   
         *   srand48((long int)t0.tv_nsec);
         *
         * if we want the exact same data over and over then
         *  use a constant parameter here : 
         *
         *  srand48(((long int)123456789));
         *
         */
         srand48((long int)t0.tv_nsec);
    }

    for ( k = 0; k < num_elements; k++ ) {
        blarg[k] = (int) (drand48() * (double)(1<<20)) - (1<<19);
        bleah[k] = blarg[k];
    }

    printf("\n-------- input data ------\n");
    printf("%3i    %-4i\n", 0, blarg[0]);
    /* print out the whole input list is a dumb idea
    for ( k=0; k<num_elements; k++ ) {
        printf("%3i    %-4i\n", k, blarg[k]);
    }
    */
    printf("%3i    %-4i\n", num_elements-1, blarg[num_elements-1]);

    clock_gettime( CLOCK_REALTIME, &t0 );
    /* yes we can use a goto just fine */
loop:
    swap = 0;
    for ( k=0; k<(num_elements-1); k++ ) {
        if ( blarg[k] > blarg[k+1] ) {
            tmp = blarg[k];
            blarg[k] = blarg[k+1];
            blarg[k+1] = tmp;
            swap = 1;
        }
    }
    if ( swap ) goto loop;

    clock_gettime( CLOCK_REALTIME, &t1 );

    printf("\n-------- output data -----\n");
    printf("%3i    %-4i\n", 0, blarg[0]);
    /*
    for ( k=0; k<num_elements; k++ ) {
        printf("%3i    %-4i\n", k, blarg[k]);
    }
    */
    printf("%3i    %-4i\n", num_elements-1, blarg[num_elements-1]);
    printf("\n--------------------------\n");

    tdelta_nsec = timediff( t0, t1);
    printf("     : bubble sort %" PRIu64 " nsecs\n", tdelta_nsec);

    clock_gettime( CLOCK_REALTIME, &t0 );
    qsort((void *)bleah, num_elements, sizeof(int), int_compare);
    clock_gettime( CLOCK_REALTIME, &t1 );
    tdelta_nsec = timediff( t0, t1);
    printf("     :  quick sort %" PRIu64 " nsecs\n", tdelta_nsec);

    for ( k=0; k<num_elements; k++ ) {
        if (blarg[k]-bleah[k]) {
            printf("WARN : element %i differs %i and %i\n",
                    k, blarg[k], bleah[k]);
            k = num_elements;
        }
    }

    free(blarg);
    free(bleah);

    return EXIT_SUCCESS;

}

/* A trivial function to compare data which happens
 * to just be integers at the moment.  However we
 * could write this to handle nearly anything and
 * that includes the colour of cats.  */
static int
int_compare(const void *p1, const void *p2)
{
    int i = *((int *)p1);
    int j = *((int *)p2);

    if (i > j) return (1);
    if (i < j) return (-1);

    return (0);
}

