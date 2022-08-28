
/*
 * parse_pthread_limit.c  parse a string to a power of two integer
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

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

/* if the data can not be processed just return -1 */
int parse_pthread_limit(const char *str, int *pthread_limit)
{

    int j, k, p, candidate_int;
        /* TODO : how do we know the number of processors available? */
        /* At this time we just accept any reasonable power of two as
         * the pthread count */
    errno = 0;
    candidate_int = (int)strtol(str, (char **)NULL, 10);
    if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
        fprintf(stderr,"FAIL : pthread_limit not understood\n");
        perror("     ");
        return -1;;
    }

    if ( ( candidate_int < 1 ) || ( candidate_int > 512 ) ) {
        fprintf(stderr,"WARN : pthread_limit is unreasonable\n");
        fprintf(stderr,"     : we shall assume 1 and proceed.\n");
        *pthread_limit = 1;
        return -1;
    }

    if ( candidate_int > 1 ) {
        /* TODO why? snazzy little bit shifting and counting */
        k = 0; /* number of '1' bits in candidate_int */
        j = candidate_int;
        p = 0; /* bit position being tested */
        while (j) {
            if ( j & 1 ) { /* test the LSB position */
                k += 1;    /* count the '1' bit */
            }
            j = j >> 1;    /* shift left */
            p += 1;        /* keep track of the bit position */
        }
        if ( k > 1 ) {
            fprintf(stderr,"WARN : pthread_limit is not a perfect\n");
            fprintf(stderr,"     : power of two. We shall assume\n");
            *pthread_limit = 1 << ( p - 1 );
            fprintf(stderr,"     : %i POSIX thread(s).\n", *pthread_limit);
        } else {
            *pthread_limit = candidate_int;
        }

    } else {
        /* as a rock bottom minimum we run single threaded */
        *pthread_limit = 1;
        return -1;
    }

    return *pthread_limit;

}


