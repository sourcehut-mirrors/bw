
/* solaris_cpuid.c use some calls in sys/processor.h to get info
 *                 about the processor hardware. Good luck.
 * ------------------------------------------------------------------
 * Copyright (c) 2025 Dennis Clarke
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

#include <errno.h>

/* slight difference between Solaris 10 and 11.4 if we trust
 * the manpages */
#if ! defined (_SOL10_HACK)
#if defined (__SunOS_5_10) || (__SunOS_5_11)
#include <sys/types.h>
#include <sys/processor.h>
#endif
#else
#include "sol10_processor.h"
#endif

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int
main ( int argc, char **argv )
{

#if defined (__SunOS_5_10) || defined (__SunOS_5_11)
    processorid_t solaris_cpu;
    ushort_t      solaris_locality;
    processor_info_t solaris_cpu_info;
    int get_cpu_info_status;
#else
    fprintf(stderr,"FAIL : this is for Solaris 10 or 11.4 only\n");
    return EXIT_FAILURE;
#endif

#if defined (__SunOS_5_10) || defined (__SunOS_5_11)
    printf("cpu model = ");
    solaris_cpu = getcpuid();
    get_cpu_info_status = processor_info( solaris_cpu, &solaris_cpu_info);
    if ( get_cpu_info_status<0 ) {
        /* no idea what to do here really... */
        printf("unknown because processor_info() borked\n");
    } else {
        printf("%s\n",solaris_cpu_info.pi_processor_type);
        printf("    cpu clock = %i MHz\n", solaris_cpu_info.pi_clock);
        printf("    cpu state = ");
        if ( solaris_cpu_info.pi_state == P_NOINTR ) {
            printf("NOINTR\n");
        } else {
            printf("%i\n", solaris_cpu_info.pi_state);
        }
    }
#endif

    return EXIT_SUCCESS;

}

