
/*
 * sched.h  Demonstrate trivial POSIX threads dispatch and join with
 *          MT-safe calls to fputs. Attempt thread schedule priority.
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

#define NUM_THREADS 64
#define BASELINE_FIB 26
#define PRIORITY_REQUEST 20
#define VERBOSE 1

pthread_t thread_id[NUM_THREADS];

int sysinfo(int verbose);

uint64_t timediff( struct timespec start_time,
                   struct timespec end_time );

/* a trivial thread routine */
void *mocking(void *);

/* a silly fibonacci */
uint64_t fib(volatile uint8_t n);

/* initialize a POSIX pthread attribute */
int create_pthread_attr(pthread_attr_t **pthread_attr);

/* some way to get and set a process priority */
int set_this_priority(int new_pri);

