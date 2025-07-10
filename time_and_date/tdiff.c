
/*
 * tdiff.c  return a struct which holds the time delta between
 *          two timespec parameters.
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

#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <time.h>
#include <stdlib.h>
#include "tdiff.h"

int tdiff( tdiff_type *dt,
           struct timespec start_time,
           struct timespec end_time )
{

    /* If this is called with a negative time delta
     * between start_time and end_time then we must
     * respect the data and report a negative delta.
     *
     * The problem here is that we can not use floating
     * point data elements to perform the computation.
     *
     * The data arrives in the form of long integers :
     *
     *         secs    long int
     *         nsecs   long int
     *
     * Therefore the start time maybe something that looks like
     * this :
     *
     *     start_time :   1718601944       547123401
     *
     *     t0 = start_time = 1718601944.547123401
     *
     * Consider end_time data that looks like this :
     *
     *      end_time :   1718602045        843710014
     *
     *      t1 =   end_time = 1718602045.843710014
     *
     * Here we see the end_time data suggests 1718602045.843710014
     * and it is trivial to determine the delta : 
     *
     *   t1 - t0 = 1718602045.843710014 - 1718601944.547123401
     *           =        101.296586613
     *
     * This seems trivial if the data was actually floating point.
     *
     *               It is not floating point.
     *
     * A logic table needs to exist wherein we look at the seconds
     * and the nanosec time components separately as well as the
     * correct actions to take when those components are equal, or
     * perhaps less than or greater than one another.
     *
     * There exists three distinct cases for seconds :
     *
     *     (1)   start.tv_sec  >   end.tv_sec
     *     (2)   start.tv_sec  =   end.tv_sec
     *     (3)   start.tv_sec  <   end.tv_sec
     *
     * There are no other possible situations and in practice we will
     * see condition (2) most of the time. Very short time delta data
     * is common in modern computing systems where a full second has
     * not transpired between two events.
     * 
     * Within each of the above three situations we have the same sort
     * of problem looking at the nanosecs : 
     *
     *     (1)   start.tv_sec    >   end.tv_sec
     *
     *         (1.1)   start.tv_nsec   >    end.tv_nsec
     *
     *              example :  108.925       102.655
     *
     *              The delta here should be -6.270 which is a
     *              negative time report.
     *
     *               sec = 102 - 108 = -6
     *
     *              nsec = -1 * ( 655000000  -  925000000 )
     *                   = -1 * ( -270000000 )
     *                   = 270000000
     *
     *              result -->    sec = -6    nsec = 270000000
     *
     *              The operation here should be :
     *
     *                  result.sec  = end.tv_sec    - start.tv_sec
     *                  result.nsec = -1 * ( start.tv_nsec - end.tv_nsec )
     *
     *
     *         (1.2)   start.tv_nsec   =    end.tv_nsec
     *
     *              example :  277.186       192.186
     *
     *              trivial report end.tv_sec - start.tv_sec
     *
     *                             192 - 277 = -85.0
     *                        
     *              The operation here should be :
     *
     *                  result.sec  = end.tv_sec    - start.tv_sec
     *                  result.nsec = 0
     *
     *         (1.3)   start.tv_nsec   <    end.tv_nsec
     *
     *              example :  126.587       104.816
     *
     *              time delta should be -21.771
     *
     *              end.tv_sec  104  -   start.tv_sec   126   =   -22
     *
     *                     then add one full second  +1  to get   -21
     *
     *              The nanosecs will require an offset of 1 billion
     *              as well as a sign change :
     *
     *               -1 * ( end.tv_nsec - start_nsec - 1000000000 )
     *
     *               -1 * ( 816000000 - 587000000 - 1000000000 )
     *
     *               -1 * ( 229000000 - 1000000000 )
     *
     *               -1 * ( -771000000 )
     *
     *
     *              Therefore : 
     *
     *                  result.sec  = end.tv_sec  - start.tv_sec + 1
     *                              =      104    -      126     + 1
     *                              =     -21
     *
     *
     *                  result.nsec = -1 * ( end.tv_nsec 
     *                                     - start_nsec
     *                                     - 1000000000 )
     *
     *
     *
     *     (2)   start tv_sec    =   end   tv_sec
     *
     *           NOTE : this is the most common case wherein a full
     *                  second has not elapsed. Also the only situation
     *                  where the resultant nanosecs may be negative.
     *
     *         (2.1)   start.tv_nsec   >    end.tv_nsec
     *
     *              example :  1718602045.843710014   1718602045.714047011
     *
     *              Here we will have a negative time delta between the
     *              end_time t1 and start_time t0 :
     *
     *              1718602045.714047011 - 1718602045.843710014
     *                  = -0.129663003
     *
     *              Therefore :
     *
     *                  result.sec  = 0
     *
     *                  result.nsec = end.tv_nsec - start.tv_nsec
     *                              =   714047011 - 843710014
     *                              =  -129663003
     *
     *                  This represents a time delta of -0.129663003 secs.
     *
     *
     *         (2.2)   start.tv_nsec   =    end.tv_nsec
     *
     *              trivial : return  0 and 0 in the struct
     *
     *         (2.3)   start.tv_nsec   <    end.tv_nsec
     *
     *              example :  1718604178.149045751  1718604178.457419106
     *
     *                 trivial return secs = 0
     *                        and nanosecs = 457419106 - 149045751
     *                                     = 308373355
     *
     *
     *     (3)   start tv_sec  <   end   tv_sec
     *
     *         (3.1)   start.tv_nsec   >    end.tv_nsec
     *
     *              example :  54387.390145701   68712.127084199
     *
     *              time delta is 14324.736938498
     *
     *              We need to adjust the seconds :
     *
     *                sec = 68712  -  54387 - 1
     *                    = 14324
     *
     *              We also need to adjust the nanosecs :
     *
     *               nsec = 127084199  -   390145701 + 1000000000
     *                    =      -263061502  +  1000000000
     *                    = 736938498
     *
     *              Results in 14324.736938498 delta.
     *
     *
     *         (3.2)   start.tv_nsec   =    end.tv_nsec
     *
     *              example :  1718604178.123456789  1718604192.123456789
     *
     *              trivial return  sec = 1718604192 - 1718604178
     *                                  = 14
     *
     *                             nsec = 0
     * 
     *         (3.3)   start.tv_nsec   <    end.tv_nsec
     *
     *              example :  1718604178.047684173   1718607011.094571341
     *
     *              The delta time is 2833.046887168
     *
     *              return  sec = 1718607011 - 1718604178
     *                          = 2833
     *
     *                     nsec = 94571341  -  47684173
     *                          = 46887168
     *
     * There are no other possible situations and in some cases we will
     * need to adjust the seconds. To be more clear, the data arrives in
     * four parts and the nanosecs data may require that we adjust the
     * seconds by a full second, either forwards or backwards in time.
     *
     */

    struct timespec temp;
    double fp64 = 0.0;

    if ( start_time.tv_sec > end_time.tv_sec ) {

        if ( start_time.tv_nsec > end_time.tv_nsec ) {
            temp.tv_sec = end_time.tv_sec - start_time.tv_sec;
            temp.tv_nsec = -1 * ( end_time.tv_nsec - start_time.tv_nsec );
            fp64 = (double)temp.tv_sec 
                        - ( (double)temp.tv_nsec / 1000000000.0 );
        }

        if ( start_time.tv_nsec == end_time.tv_nsec ) {
            temp.tv_sec = end_time.tv_sec - start_time.tv_sec;
            temp.tv_nsec = 0;
            fp64 = (double)temp.tv_sec;
        }

        if ( start_time.tv_nsec < end_time.tv_nsec ) {
            temp.tv_sec = end_time.tv_sec - start_time.tv_sec + 1;
            temp.tv_nsec = -1 * ( end_time.tv_nsec
                                - start_time.tv_nsec
                                - 1000000000 );
            fp64 = (double)temp.tv_sec
                        - ( (double)temp.tv_nsec / 1000000000.0 );
        }

    }

    if ( start_time.tv_sec == end_time.tv_sec ) {
        temp.tv_sec = 0;
        temp.tv_nsec = end_time.tv_nsec - start_time.tv_nsec;
        fp64 = ( (double)temp.tv_nsec / 1000000000.0 );
    } 

    if ( start_time.tv_sec < end_time.tv_sec ) {
        if ( start_time.tv_nsec > end_time.tv_nsec ) {
            temp.tv_sec = end_time.tv_sec - start_time.tv_sec - 1;
            temp.tv_nsec = end_time.tv_nsec - start_time.tv_nsec
                              + 1000000000;
            fp64 = (double)temp.tv_sec
                        + ( (double)temp.tv_nsec / 1000000000.0 );
        }
        if ( start_time.tv_nsec == end_time.tv_nsec ) {
            temp.tv_sec = end_time.tv_sec - start_time.tv_sec;
            temp.tv_nsec = 0;
            fp64 = (double)temp.tv_sec;
        }
        if ( start_time.tv_nsec < end_time.tv_nsec ) {
            temp.tv_sec = end_time.tv_sec - start_time.tv_sec;
            temp.tv_nsec = end_time.tv_nsec - start_time.tv_nsec;
            fp64 = (double)temp.tv_sec
                        + ( (double)temp.tv_nsec / 1000000000.0 );
        }

    }

    dt->sec = temp.tv_sec;
    dt->nsec = temp.tv_nsec;
    dt->delta = fp64;
    
    return EXIT_SUCCESS;

}

