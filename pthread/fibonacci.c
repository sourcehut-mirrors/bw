/*
 * fibonacci.c    Really nasty fibonacci computation.
 *
 *        This results in not much other than magic smoke churning
 *        inside a computer. Good luck.
 *
 * Copyright (C) Dennis Clarke 2019
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
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

static uint64_t fib(volatile uint8_t n)
{
    /* This is pure ugly horrific and beautiful in its
     * terrible performance where even a very fast computer
     * will be in deep trouble with any n > 50.
     *
     * The 64bit limit is F93 and you can check that
     * for yourself.
     *
     * The nested calls to fib() result in a massive use
     * of stack frames to unwind.
     *
     * Good luck and you have been warned. */
    if ( n == 0 ) {
        return 0;
    } else if ( n == 1 ) {
        return 1;
    } else {
        return ( fib( n - 1 ) + fib( n - 2 ) );
    }
}

int main(int argc, char **argv)
{

    uint8_t f, fib_limit = 57;
    int num;
    char time_buffer[32];
    struct timespec tn;

    /* check if we can get the time */
    if ( clock_gettime(CLOCK_REALTIME, &tn)!= 0 ) {
        fprintf(stderr,"FAIL : clock_gettime()\n");
        return EXIT_FAILURE;
    }

    if (argc>1) {
        errno = 0;
        num = (int)strtol(argv[1], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : integer not understood\n");
            perror("     ");
            return EXIT_FAILURE;
        }
        if (( num < 1 )||( num > 93 )){
            fprintf(stderr,"WARN : input is unreasonable\n");
            fprintf(stderr,"     : we shall assume 56 and proceed.\n");
        } else {
            fib_limit = (uint8_t)num+1;
        }
    }

    time_buffer[0] = '\0';
    for (f=0; f<fib_limit; f++) {
        clock_gettime(CLOCK_REALTIME, &tn);

        snprintf(time_buffer, 21, "%10lu.%-9lu",
                                   tn.tv_sec, tn.tv_nsec);

        /*
        len = strlen(time_buffer);
        if (len<20) {
            strncat(time_buffer,"000000000",20 - len);
        }
        */

        printf("%3i : %12" PRIu64 "    t = %s\n",
                             f, fib(f), time_buffer);

        time_buffer[0] = '\0';
    }

    return EXIT_SUCCESS;

}

