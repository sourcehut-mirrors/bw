/*
 * ct.c    report the date for a give UNIX time expressed in secs since
 *         1 Jan 1970 00:00:00 and also support other LANG locales if
 *         requested.  This was likely written somewhere in the 1990s
 *         but the memory of such things has been lost in backup tapes
 *         in cardboard boxes.
 *
 * ------------------------------------------------------------------
 * Copyright (c) 1996 Dennis Clarke
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
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <time.h>

int
main(int argc, char **argv)
{
    char *c_time_string;
    char time_buffer[16];
    struct timespec tn, time_tv;
    int err_clock;
    long candidate_input;

    errno = 0;
    if ( argc == 2 ) {
        candidate_input = strtol(argv[1], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ) {
            fprintf(stderr,"WARN : UNIX time not understood\n");
            perror("     ");
            err_clock = clock_gettime(CLOCK_REALTIME, &tn);
            if ( err_clock == 0 ) {
                sprintf(time_buffer, "%10lu", tn.tv_sec);
                printf("     : we shall assume timenow");
                printf(" %s", time_buffer);
                candidate_input = tn.tv_sec;
            } else {
                fprintf(stderr,"FAIL : ");
                if (err_clock == EINVAL) {
                    fprintf(stderr,"CLOCK_REALTIME not known\n");
                } else if (err_clock == ENOSYS) {
                    fprintf(stderr,"clocks are not supported?\n");
                } else {
                    fprintf(stderr,"could not get the time now\n");
                }
                return EXIT_FAILURE;
            }
        }
        if ( candidate_input < 0 ) {
            fprintf(stderr,"WARN : negative time is not well understood\n");
            fprintf(stderr,"     : we shall assume 0 for the very beginning\n");
            candidate_input = 0;
        }
        if ( candidate_input > 2147483647 ) {
            fprintf(stderr,"WARN : end of time detected\n");
            fprintf(stderr,"     : we shall assume 0\n");
            fprintf(stderr,"     : return back to the future\n");
            candidate_input = 0;
        }
    } else {
         if ( argc > 2 ) {
               fprintf(stderr,"FAIL : provide only");
         } else {
               fprintf(stderr,"FAIL : provide");
         }
         fprintf(stderr," a UNIX time in secs\n");
         errno = EINVAL;
         perror("FAIL ");
         return EXIT_FAILURE;
    }

    setlocale ( LC_TIME, "C" );

    time_tv.tv_sec = candidate_input;
    /* someday maybe ... deal with fractional seconds ?
     *   time_tv.tv_nsec = (argc == 3 ) ? strtol(argv[2], (char **)NULL, 10) : 0; 
     */
    time_tv.tv_nsec = 0;
    c_time_string = ctime(&time_tv.tv_sec);
    printf("%s", c_time_string);

    return EXIT_SUCCESS;

}

