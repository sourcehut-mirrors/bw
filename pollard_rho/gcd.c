
/*
 * gcd.c  Greatest Common Divisor algorithm as a recursive
 *        procedure and a trivial procedure.
 *
 *
 * A decent 64-bit machine has no problem with this : 
 *     $ ./gcd 4281477293 4288021993
 *     gcd( 4281477293, 4288021993 ) = 65447
 *     INFO :   trivial gdb tdelta =          66873 nsec
 *     gcd( 4281477293, 4288021993 ) = 65447
 *     INFO : recursive gdb tdelta =           3724 nsec
 *     $
 *
 * Copyright (C) Dennis Clarke 2023
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
#include <limits.h>

/* #define __STDC_FORMAT_MACROS */

/* n.b. : inttypes.h includes stdint.h */
#include <inttypes.h>
#include <time.h>

int64_t gcd_trivial(int64_t *a_in, int64_t *b_in);
int64_t gcd_recursive(int64_t a, int64_t b);
uint64_t timediff( struct timespec start_time,
                   struct timespec end_time );

int main(int argc, char *argv[])
{
    int64_t g, j, k, p, q;
    int64_t recursive_result;
    struct timespec now_time, then_time;
    uint64_t t_delta;

    if ( argc < 3 ){
        fprintf ( stderr, "\nFAIL : provide two integers\n");
        return ( EXIT_FAILURE );
    }

    /* We must use strtoull() on 32-bit machines because
     * the sizeof(long) is most likely 32-bits.  */
    errno = 0;
    j = (int64_t)strtoull(argv[1], (char **)NULL, 10);
    if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
        fprintf(stderr,"FAIL : integer not understood\n");
        perror("     ");
        return EXIT_FAILURE;
    }

    errno = 0;
    k = (int64_t)strtoull(argv[2], (char **)NULL, 10);
    if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
        fprintf(stderr,"FAIL : integer not understood\n");
        perror("     ");
        return EXIT_FAILURE;
    }

    /* we will need those numbers again later */
    p = j;
    q = k;

    /* Get the REALTIME_CLOCK time in a timespec struct */
    if ( clock_gettime(CLOCK_REALTIME, &now_time ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }

    printf ("gcd( %" PRIu64 ", %" PRIu64 " ) = ", j, k);
    g = gcd_trivial(&j, &k);
    printf ("%" PRIu64 "\n", g);

    if ( clock_gettime(CLOCK_REALTIME, &then_time ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }

    t_delta = timediff(now_time, then_time);
    /* This t_delta is a baseline offset value that we seem to ignore
     * anyways. */
    printf("INFO :   trivial gdb tdelta = %14" PRIu64 " nsec\n", t_delta);


    if ( clock_gettime(CLOCK_REALTIME, &now_time ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }

    printf ("gcd( %" PRIu64 ", %" PRIu64 " ) = ", p, q);
    recursive_result = gcd_recursive(p, q);
    printf ("%" PRIu64 "\n", recursive_result);

    if ( clock_gettime(CLOCK_REALTIME, &then_time ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }

    t_delta = timediff(now_time, then_time);
    /* This t_delta is a baseline offset value that we seem to ignore
     * anyways. */
    printf("INFO : recursive gdb tdelta = %14" PRIu64 " nsec\n", t_delta);


    return EXIT_SUCCESS;
}

/* dirt simple Greatest Common Divisor */
int64_t gcd_trivial(int64_t *a_in, int64_t *b_in) {

    int64_t rem_m, a, b;

    a = *a_in;
    b = *b_in;

    while ( b != 0 ) {
        rem_m = a % b;
        a = b;
        b = rem_m;
    }

    return a;
}

/* A recursive variation of Greatest Common Divisor */
int64_t gcd_recursive(int64_t a, int64_t b) {
   if (b == 0)
   return a;
   return gcd_recursive(b, a%b);
}

