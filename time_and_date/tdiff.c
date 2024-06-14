
/*
 * tdiff.c  entirely strict compliant ISO9899:1990 code to return
 *          a struct which holds the time delta between two timespec
 *          parameters.
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2024 Dennis Clarke
 *
 *    Permission is hereby granted, free of charge, to any person
 *    obtaining a copy of this software and associated documentation
 *    files (the "Software"), to deal in the Software without
 *    restriction, including without limitation the rights to use,
 *    copy, modify, merge, publish, distribute, sublicense, and/or
 *    sell copies of the Software, and to permit persons to whom the
 *    Software is furnished to do so, subject to the following
 *    conditions:
 *
 *    The above copyright notice and this permission notice shall be
 *    included in all copies or substantial portions of the Software.
 *
 *        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
 *        KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 *        WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 *        PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
 *        OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 *        OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 *        OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 *        SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * ------------------------------------------------------------------
 */

#define _XOPEN_SOURCE 500

#include <time.h>
#include <stdlib.h>
#include "tdiff.h"

int tdiff( tdiff_type *delta,
           struct timespec start_time,
           struct timespec end_time )
{

    /* If this is called with a possible negative time delta
     * between start_time and end_time then we have to respect
     * the data and report a negative time delta.
     *
     * Also the nanosec components may be a negative time delta
     * while the seconds are equal. This is also valid.
     */

    struct timespec temp;
    long seconds, nanosecs;



    /* check for the trivial situation where the seconds are
     * equal in start_time and end_time */
    if ( start_time.tv_sec == end_time.tv_sec ) {
        temp.tv_sec = 0;
        temp.tv_nsec = end_time.tv_nsec - start_time.tv_nsec;
    } else {
        /* check if we are dealing with a negative time
         * between the secs */
        if ( end_time.sec < start_time.sec ) {
            /* check if the end.tv_nsec is less than start.tv_nsec */
            if ( end_time.tv_nsec <= start_time.tv_nsec ) {
                /* this is trivial, with no adjustment required */
                temp.tv_sec = start_time.tv_sec - end_time.tv_sec;
                temp.tv_sec = start_time.tv_nsec - end_time.tv_nsec;
            }

        }



    }





    if ( ( end_time.tv_nsec - start_time.tv_nsec ) < 0 ) {
        /* make a full second adjustment to tv_sec */
        temp.tv_sec = end_time.tv_sec - start_time.tv_sec - 1;
        /* we have to add a full second to temp.tv_nsec */
        temp.tv_nsec = 1000000000 
                     + end_time.tv_nsec - start_time.tv_nsec;

    } else {

        temp.tv_sec = end_time.tv_sec - start_time.tv_sec;
        temp.tv_nsec = end_time.tv_nsec - start_time.tv_nsec;

    }

    seconds = temp.tv_sec;
    nanosecs = temp.tv_nsec;

    delta->sec = seconds;
    delta->nsec = nanosecs;
    
    return EXIT_SUCCESS;

}

