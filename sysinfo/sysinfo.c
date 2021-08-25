
/*
 * sysinfo.c use uname(2) and sysconf(3C) to determine basic system data
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

#include <inttypes.h>
#include <iso646.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <locale.h>
#include <sys/resource.h>
#include <sys/utsname.h>
#include <math.h>
#include <fenv.h>
#include <unistd.h>
#include <time.h>
#include <errno.h>

#if defined(__FreeBSD__)
#include <sys/types.h>
#include <sys/sysctl.h>
#endif

#define ONEGB 1073741824

int sysinfo(int verbose) {

    long err_flag = 0;
    struct utsname uname_data;
    struct timespec uptime;
    long uptime_day, uptime_hour, uptime_min, uptime_sec;
 
    uint64_t pages = 0;
#ifndef __MVS__
    errno = 0;
    err_flag = sysconf(_SC_PHYS_PAGES);
    if ( err_flag < 0 ){
        perror("sysconf(_SC_PHYS_PAGES) : ");
        return EXIT_FAILURE;
    }
    /* none of these are working on 32-bit arm */
    pages = err_flag;
#endif

    errno = 0;
    err_flag = sysconf(_SC_PAGE_SIZE);
    if ( err_flag < 0 ){
        perror("sysconf(_SC_PAGE_SIZE) : ");
        return EXIT_FAILURE;
    }
    uint64_t pagesize = (uint64_t)err_flag;
    uint64_t sysmem = pages * pagesize;
    uint64_t avail_memory = 0;

    uint64_t pages_avail = 0;
    uint64_t version = 0;
    uint64_t threads = 0;
    uint64_t clock_ticks_sec = 0;

    errno = 0;
    if ( verbose ) {
#if defined(__FreeBSD__)
        size_t len = sizeof(pages_avail);

        err_flag = sysctlbyname("hw.availpages", &pages_avail, &len, NULL, 0);

        /* We may get ENOMEM due to a few concerns.
         *
         *  int sysctlbyname( const char *name,
         *                          void *oldp,
         *                     size_t *oldlenp,
         *                    const void *newp,
         *                       size_t newlen);
         *
         * The information is copied into the buffer specified by oldp.
         * The size of the buffer is given by the location specified by
         * oldlenp before the call, and that location gives the amount
         * of data copied after a successful call and after a call that
         * returns with the error code ENOMEM.  If the amount of data
         * available is greater than the size of the buffer supplied,
         * the call supplies as much data as fits in the buffer provided
         * and returns with the error code ENOMEM.  If the old value is
         * not desired, oldp and oldlenp should be set to NULL.
         *
         *    The following errors may be reported:
         *
         *        [EFAULT] The buffer name, oldp, newp, or length
         *                 pointer oldlenp contains an invalid address.
         *
         *        [EINVAL] The name array is less than two or greater than
         *                 CTL_MAXNAME.
         *
         *        [EINVAL] A non-null newp is given and its specified
         *                 length in newlen is too large or too small.
         *
         *        [ENOMEM] The length pointed to by oldlenp is too short
         *                 to hold the requested value.
         *
         *        [ENOMEM] The smaller of either the length pointed to
         *                 by oldlenp or the estimated size of the
         *                 returned data exceeds the system limit on
         *                 locked memory.
         *
         *        [ENOMEM] Locking the buffer oldp, or a portion of the
         *                 buffer if the estimated size of the data to
         *                 be returned is smaller, would cause the
         *                 process to exceed its per-process locked
         *                 memory limit.
         *
         *        [ENOTDIR] The name array specifies an intermediate
         *                  rather than terminal name.
         *
         *        [EISDIR] The name array specifies a terminal name, but
         *                 the actual name is not terminal.
         *
         *        [ENOENT] The name array specifies a value that is
         *                 unknown.
         *
         *        [EPERM]  An attempt is made to set a read-only value.
         *
         *        [EPERM]  A process without appropriate privilege
         *                 attempts to set a value.
         */

        if (err_flag < 0) {
            perror("sysctlbyname(\"hw.availpages\", ...) : ");
            return EXIT_FAILURE;
        }
#else
#ifndef __MVS__
        err_flag = sysconf(_SC_AVPHYS_PAGES);
        if ( err_flag < 0 ){
            perror("sysconf(_SC_AVPHYS_PAGES) : ");
            return EXIT_FAILURE;
        }
        pages_avail = (uint64_t)err_flag;
#endif
#endif

#ifdef __MVS__
        avail_memory = pages_avail * pagesize;
#endif
        clock_ticks_sec = (uint64_t)sysconf(_SC_CLK_TCK);
        errno = 0;
        err_flag = sysconf(_SC_VERSION);
        if ( err_flag < 0 ){
            perror("sysconf(_SC_VERSION) : ");
            return EXIT_FAILURE;
        }
        version = (uint64_t)err_flag;

        errno = 0;
        err_flag = sysconf(_SC_THREADS);
        if ( err_flag < 0 ){
            perror("sysconf(_SC_THREADS) : ");
            return EXIT_FAILURE;
        }
        threads = (uint64_t)err_flag;
    }

    /*
     * some values of interest : 
     *
     * NAME                                unistd.h symbolic constant
     * ----------------------------------------------------------------
     * _SC_MAPPED_FILES                    _POSIX_MAPPED_FILES 
     *                                     Supports Memory Mapped Files
     *
     * _SC_MAXPID                          no unistd.h value
     *                                     Max pid value
     *
     * _SC_MEMLOCK                         _POSIX_MEMLOCK
     *                                     Supports Process Memory Locking
     *
     * _SC_MEMLOCK_RANGE                   _POSIX_MEMLOCK_RANGE
     *                                     Supports Range Memory Locking
     *
     * _SC_MEMORY_PROTECTION               _POSIX_MEMORY_PROTECTION
     *                                     Supports Memory Protection
     *
     * _SC_MESSAGE_PASSING                 _POSIX_MESSAGE_PASSING
     *                                     Supports Message Passing
     *
     * _SC_MONOTONIC_CLOCK                 _POSIX_MONOTONIC_CLOCK
     *                                     Supports Monotonic Clock option
     *
     * _SC_NPROCESSORS_CONF                no unistd.h value
     *                                     Number of processors configured
     *
     * _SC_NPROCESSORS_MAX                 no unistd.h value
     *                                     Max number of processors supported
     *
     * _SC_NPROCESSORS_ONLN                no unistd.h value
     *                                     Number of processors online
     *
     * _SC_PHYS_PAGES                      no unistd.h value
     *                                     Total number of pages of
     *                                     physical memory
     *
     * _SC_REALTIME_SIGNALS                _POSIX_REALTIME_SIGNALS
     *                                     Supports Realtime Signals
     *
     * _SC_SHELL                           _POSIX_SHELL
     *                                     Supports POSIX shell
     *
     * _SC_SPIN_LOCKS                      _POSIX_SPIN_LOCKS
     *                                     Supports Spin Locks
     *
     * _SC_STACK_PROT                      no unistd.h value
     *                                     Default stack protection
     *
     * _SC_THREAD_ATTR_STACKADDR           _POSIX_THREAD_ATTR_STACKADDR
     *                                     Supports Thread Stack Address
     *
     * _SC_THREAD_ATTR_STACKSIZE           _POSIX_THREAD_ATTR_STACKSIZE
     *                                     Supports Thread Stack Size
     *
     * _SC_THREAD_DESTRUCTOR_ITERATIONS    PTHREAD_DESTRUCTOR_ITERATIONS
     *                                     Number attempts made to
     *                                     destroy thread data on thread
     *                                     exit
     *
     * _SC_THREAD_PRIO_INHERIT             _POSIX_THREAD_PRIO_INHERIT
     *                                     Supports Priority Inheritance
     *
     * _SC_THREAD_PRIO_                    _POSIX_THREAD_PRIO_
     *                                     Supports Priority
     *
     * _SC_THREAD_PRIORITY_SCHEDULING      _POSIX_THREAD_PRIORITY_SCHEDULING
     *                                     Supports Thread Execution
     *                                     Scheduling
     *
     * _SC_THREAD_SAFE_FUNCTIONS           _POSIX_THREAD_SAFE_FUNCTIONS
     *                                     Supports Thread-Safe Functions
     *
     * _SC_THREAD_STACK_MIN                PTHREAD_STACK_MIN
     *                                     Min byte size of thread stack
     *                                     storage
     *
     * _SC_THREAD_THREADS_MAX              PTHREAD_THREADS_MAX
     *                                     Max number of threads per
     *                                     process
     *
     * _SC_THREADS                         _POSIX_THREADS
     *                                     Supports Threads
     * 
     * _SC_VERSION                         _POSIX_VERSION
     *                                     POSIX.1 version supported
     * 
     * _SC_XOPEN_REALTIME                  _XOPEN_REALTIME
     *                                     Supports X/Open POSIX
     *                                     Realtime Feature Group
     * 
     * _SC_XOPEN_UNIX                      _XOPEN_UNIX
     *                                     Supports X/Open CAE
     *                                     Specification,
     *                                     August 1994, System
     *                                     Interfaces and Headers,
     *                                     Issue 4, Version 2
     * 
     * _SC_XOPEN_VERSION                   _XOPEN_VERSION
     *                                     Integer value indicates
     *                                     version of X/Open Portability
     *                                     Guide to which implementation
     *                                     conforms
     *
     * _SC_XOPEN_XCU_VERSION               _XOPEN_XCU_VERSION
     *                                     Integer value indicates
     *                                     version of XCU specification
     *                                     to which implementation
     *                                     conforms
     * 
     * If name is an invalid value, sysconf() returns -1 and sets errno
     * to indicate the error. If the variable corresponding to name is
     * associated with functionality that is not supported by the
     * system, sysconf() returns -1 without changing the value of errno.
     *
     * Calling sysconf() with the following returns -1 without set-
     * ting errno, because no maximum limit can be determined. The
     * system supports at least the minimum values and can support
     * higher values depending upon system resources.
     *
     *   Variable                            Minimum supported value
     *   _SC_AIO_MAX                        _POSIX_AIO_MAX
     *   _SC_ATEXIT_MAX                     32
     *   _SC_MQ_OPEN_MAX                    32
     *   _SC_THREAD_THREADS_MAX             _POSIX_THREAD_THREADS_MAX
     *   _SC_THREAD_KEYS_MAX                _POSIX_THREAD_KEYS_MAX
     *   _SC_THREAD_DESTRUCTOR_ITERATIONS   _POSIX_THREAD_DESTRUCTOR_ITERATIONS
     *
     * A call to setrlimit() can cause the value of OPEN_MAX to change.
     *
     * Multiplying sysconf(_SC_PHYS_PAGES) or sysconf(_SC_AVPHYS_PAGES)
     * by sysconf(_SC_PAGESIZE) to determine memory amount in bytes can
     * exceed the maximum values representable in a 32-bit signed or
     * unsigned integer.
     *
     * The value of CLK_TCK can be variable and it should not be
     * assumed that CLK_TCK is a compile-time constant.
     */
    int fp_round_mode;

    /* can we guess the architecture endianess? */
    int end_check = 1;
    /* strictly speaking this is not a wise way to do this */
    int little_endian = (*(uint8_t*)&end_check == 1) ? 1 : 0;

    setlocale( LC_MESSAGES, "C" );
    if ( uname( &uname_data ) < 0 ) {
        fprintf ( stderr,
                 "WARNING : Could not attain system uname data.\n" );
        perror ( "uname" );
    } else {
        printf ( "----------------------------------" );
        printf ( "---------------------------------\n" );
        printf ( "                 system name = %s\n", uname_data.sysname );
        printf ( "                   node name = %s\n", uname_data.nodename );
        printf ( "                     release = %s\n", uname_data.release );
        printf ( "                     version = %s\n", uname_data.version );
        printf ( "                     machine = %s\n", uname_data.machine );
#ifndef __MVS__
        printf ( "                   page size = %" PRIu64 "\n", pagesize );
        printf ( "               system memory = %" PRIu64 "\n", sysmem );
        printf ( "                             = %" PRIu64 " kB\n",
                                                         sysmem/1024 );

        printf ( "                             = %" PRIu64 " MB\n",
                                                      sysmem/1048576 );
#endif

        /* If the available system memory is a perfect number aligned on
         * a gigabyte boundary then we report it. Otherwise, this makes
         * very little sense to bother with.
         *
         *  alpha$ echo '8k  34359738368  1073741824 / pq' | dc
         *  32.00000000
         *  alpha$
         */
        if ( (sysmem % ONEGB) == 0 ) {

            printf ( "                             = %" PRIu64 " GB\n",
                                                        sysmem >> 30 );

        }

        if ( verbose ) {
#ifndef __MVS__
            printf("                 avail pages = %" PRIu64 "\n", pages_avail);
            printf("                avail memory = %" PRIu64 "\n", avail_memory);
            printf("         clock ticks per sec = %" PRIu64 "\n", clock_ticks_sec);
#endif

            printf("             threads support = %" PRIu64 "\n", threads);
            printf("               POSIX Version = %" PRIu64 "\n", version);

        }

        printf ( "                      endian = ");
        if ( little_endian ) {
            printf ( "little");
        } else {
            printf ( "big");
        }
        printf ( " endian\n" );

        /* note that sizeof reports back an unsigned long integer and
         * thus the format string for printf should be %lu */
        printf ( "       sizeof(unsigned long) = %lu\n", sizeof(unsigned long) );
        printf ( "  sizeof(unsigned long long) = %lu\n", sizeof(unsigned long long) );
        printf ( "                 sizeof(int) = %lu\n", sizeof(int) );
        printf ( "               sizeof(void*) = %lu\n", sizeof(void*) );

        /* get the current floating point rounding mode */
        fp_round_mode = fegetround();
        printf("           fp rounding mode is ");
        switch(fp_round_mode){
            case FE_TONEAREST:
                printf("FE_TONEAREST\n");
                break;
            case FE_TOWARDZERO:
                printf("FE_TOWARDZERO\n");
                break;
            case FE_UPWARD:
                printf("FE_UPWARD\n");
                break;
            case FE_DOWNWARD:
                printf("FE_DOWNWARD\n");
                break;
            default:
                printf("bloody unknown!\n");
                break;
        }

#ifndef __MVS__
        errno = 0;
        err_flag = sysconf(_SC_MONOTONIC_CLOCK);
        if ( err_flag > 0 ) {
            printf("           system uptime ");
            if ( clock_gettime( CLOCK_MONOTONIC, &uptime ) == -1 ) {
                /* We could not get the uptime. No problem. 
                 * Life goes on. */
                printf("unknown\n");
            } else {
                /* uptime.tv_sec should be the total seconds of uptime */

                uptime_day = uptime.tv_sec / 86400;

                printf("%4lu day", uptime_day);
                if ( uptime_day > 1 ) printf("s");

                uptime_hour = ( uptime.tv_sec - ( uptime_day * 86400 ) ) / 3600;

                printf("  %3lu hour", uptime_hour);
                if ( uptime_hour > 1 ) printf("s");

                uptime_min = ( uptime.tv_sec - ( uptime_day * 86400 ) - ( uptime_hour * 3600 ) ) / 60;
                printf("  %3lu min", uptime_min);
                if ( uptime_min > 1 ) printf("s");

                uptime_sec = uptime.tv_sec - ( uptime_day * 86400 ) - ( uptime_hour * 3600 ) - ( uptime_min * 60 );
                printf("  %3lu sec", uptime_sec);
                if ( uptime_sec > 1 ) printf("s");
          
                printf("\n");

            }
        } else {
            /* the Apple M1 seems to fail here for some obscure reason */
            printf("WAT : sysconf(_SC_MONOTONIC_CLOCK) returns %i\n", err_flag);
            perror("WAT : ");
        }
#endif

        printf ( "----------------------------------" );
        printf ( "---------------------------------" );
    }
    printf ("\n");

    return ( EXIT_SUCCESS );

}

