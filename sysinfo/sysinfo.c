
/*
 * sysinfo.c use uname(2) and sysconf(3C) to determine basic system data
 *
 *           RETURN : this code will return the value 1 ( one ) if
 *                    the machine is little endian. Otherwise we
 *                    shall return the value 0 ( zero ) for a big
 *                    endian machine. If there is an error then we
 *                    return SYSINFO_FAIL which has a value 127.
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2019 Dennis Clarke
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

#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)
#include <fenv.h>
#endif

#include <inttypes.h>
#include <iso646.h>
#include <limits.h>
#include <locale.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>
#include <sys/utsname.h>
#include <time.h>
#include <unistd.h>

#if defined(__FreeBSD__)
#include <sys/sysctl.h>
#include <sys/types.h>
#endif

/* 23 Aug 2022 : Both PAGESIZE and PAGE_SIZE are specified in POSIX
 *
 * Some platform don't have _SC_PHYS_PAGES and _SC_AVPHYS_PAGES in sysconf().
 * Let's assume we do, then disable it for certain compilers/platforms.
 */
#define HAVE_PAGE_INFO
#ifdef __MVS__
#   undef HAVE_PAGE_INFO
#endif
#ifdef __IBMC__
#   undef HAVE_PAGE_INFO
#endif

#define SYSINFO_FAIL 127
#define ONEGB 1073741824

int sysinfo(int verbose) {

    long err_flag = 0;
    struct utsname uname_data;
    struct timespec uptime;
    long uptime_day, uptime_hour, uptime_min, uptime_sec;
 
    uint64_t pages = 0;
    uint64_t pagesize, sysmem;
    uint64_t avail_memory = 0;
    uint64_t pages_avail = 0;
    uint64_t version = 0;
    uint64_t threads = 0;
    uint64_t clock_ticks_sec = 0;

#if defined(__FreeBSD__)
    size_t len;
#endif

    int fp_round_mode;
    int end_check = 1;
    int little_endian;

#ifdef HAVE_PAGE_INFO
    errno = 0;
    err_flag = sysconf(_SC_PHYS_PAGES);
    if ( err_flag < 0 ){
        perror("sysconf(_SC_PHYS_PAGES) : ");
        return SYSINFO_FAIL;
    }
    /* what about 32-bit armv7l ? */
    pages = (uint64_t)err_flag;
#endif

    errno = 0;
    err_flag = sysconf(_SC_PAGE_SIZE);
    if ( err_flag < 0 ){
        perror("sysconf(_SC_PAGE_SIZE) : ");
        return SYSINFO_FAIL;
    }
    pagesize = (uint64_t)err_flag;
    sysmem = pages * pagesize;

    errno = 0;
    if ( verbose ) {

#if defined(__FreeBSD__)

        len = sizeof(pages_avail);

        err_flag = sysctlbyname("hw.availpages", &pages_avail, &len, NULL, 0);

        if (err_flag < 0) {
            perror("sysctlbyname(\"hw.availpages\", ...) : ");
            return SYSINFO_FAIL;
        }

#endif

#ifndef HAVE_PAGE_INFO
        avail_memory = pages_avail * pagesize;
#endif
        clock_ticks_sec = (uint64_t)sysconf(_SC_CLK_TCK);
        errno = 0;
        err_flag = sysconf(_SC_VERSION);
        if ( err_flag < 0 ){
            perror("sysconf(_SC_VERSION) : ");
            return SYSINFO_FAIL;
        }
        version = (uint64_t)err_flag;

        errno = 0;
        err_flag = sysconf(_SC_THREADS);
        if ( err_flag < 0 ){
            perror("sysconf(_SC_THREADS) : ");
            return SYSINFO_FAIL;
        }
        threads = (uint64_t)err_flag;
    }

    /* guess the architecture endianess */
    little_endian = (*(uint8_t*)&end_check == 1) ? 1 : 0;

    setlocale( LC_MESSAGES, "C" );
    if ( uname( &uname_data ) < 0 ) {
        /* just give up if we can not use uname */
        return SYSINFO_FAIL;
        /*
         * fprintf ( stderr,
         *       "WARNING : Could not attain system uname data.\n" );
         * perror ( "uname" );
         */ 
    } else {
        /***************************************************************
         *    S P E C I A L    N O T E   F O R    F R E E B S D
         *
         *    FreeBSD can entirely override the uname data with
         *    some funky environment variables. The ordinary user
         *    can have "uname -a" report they are on a MIPS machine
         *    running Windows NT 3.51 if they choose. So be careful.
         ***************************************************************/
        printf ( "----------------------------------" );
        printf ( "---------------------------------\n" );
        printf ( "                 system name = %s\n", uname_data.sysname );
        printf ( "                   node name = %s\n", uname_data.nodename );
        printf ( "                     release = %s\n", uname_data.release );
        printf ( "                     version = %s\n", uname_data.version );
        printf ( "                     machine = %s\n", uname_data.machine );

        /* If the available system memory is a perfect number aligned on
         * a gigabyte boundary then we report it. Otherwise, this makes
         * very little sense to bother with.
         *
         *  alpha$ echo '8k  34359738368  1073741824 / pq' | dc
         *  32.00000000
         *  alpha$
         */

#ifdef HAVE_PAGE_INFO

#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)

        printf ( "                   page size = %" PRIu64 "\n", pagesize );
        printf ( "               system memory = %" PRIu64 "\n", sysmem );
        printf ( "                             = %" PRIu64 " kB\n",
                                                         sysmem/1024 );

        printf ( "                             = %" PRIu64 " MB\n",
                                                      sysmem/1048576 );

        if ( (sysmem % ONEGB) == 0 ) {

            printf ( "                             = %" PRIu64 " GB\n",
                                                        sysmem >> 30 );

        }
#else

        printf ( "                   page size = %llu\n", pagesize );
        printf ( "               system memory = %llu\n", sysmem );
        printf ( "                             = %llu kB\n",
                                                         sysmem/1024 );

        printf ( "                             = %llu MB\n",
                                                      sysmem/1048576 );

        if ( (sysmem % ONEGB) == 0 ) {

            printf ( "                             = %llu GB\n",
                                                        sysmem >> 30 );

        }

#endif
#endif

        if ( verbose ) {
#ifdef HAVE_PAGE_INFO
            if ( avail_memory > 0 ) {
#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)
                printf("                 avail pages = %" PRIu64 "\n", pages_avail);
                printf("                avail memory = %" PRIu64 "\n", avail_memory);
#else
                printf("                 avail pages = %llu\n", pages_avail);
                printf("                avail memory = %llu\n", avail_memory);
#endif
            } else {
                printf("                 avail pages = unknown\n");
                printf("                avail memory = unknown\n");
            }
#endif

#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)
            printf("         clock ticks per sec = %" PRIu64 "\n", clock_ticks_sec);
            printf("             threads support = %" PRIu64 "\n", threads);
            printf("               POSIX Version = %" PRIu64 "\n", version);
#else
            printf("         clock ticks per sec = %llu\n", clock_ticks_sec);
            printf("             threads support = %llu\n", threads);
            printf("               POSIX Version = %llu\n", version);
#endif
            printf("          _POSIX_CHILD_MAX   = %i\n", _POSIX_CHILD_MAX);
            printf("          _POSIX_NGROUPS_MAX = %i\n", _POSIX_NGROUPS_MAX);
            printf("          _POSIX_OPEN_MAX    = %i\n", _POSIX_OPEN_MAX);
            printf("          _POSIX_PATH_MAX    = %i\n", _POSIX_PATH_MAX);
            printf("          _POSIX_TZNAME_MAX  = %i\n", _POSIX_TZNAME_MAX);

        }

        printf ( "                      endian = ");
        if ( little_endian ) {
            printf ( "little");
        } else {
            printf ( "big");
        }
        printf ( " endian\n" );

        /* If sizeof reports back an unsigned long integer as 64bit
         * the format string for printf should be %lu. However compilers
         * on 32bit machines will get upset and warn we should use %u. */
        printf ( "       sizeof(unsigned long) = %lu\n",
                                               sizeof(unsigned long) );

        printf ( "                sizeof(long) = %lu\n",
                                          sizeof(unsigned long long) );

        printf ( "                 sizeof(int) = %lu\n", sizeof(int) );

        printf ( "               sizeof(void*) = %lu\n", sizeof(void*) );

#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)
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
#endif

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
            printf("WAT : sysconf(_SC_MONOTONIC_CLOCK) returns %li\n", err_flag);
            perror("WAT : ");
        }
#endif

#ifdef FLT_EVAL_METHOD
        printf("          FLT_EVAL_METHOD    = %i\n", FLT_EVAL_METHOD);
#endif

        printf ( "----------------------------------" );
        printf ( "---------------------------------" );
    }
    printf ("\n");

    return little_endian;

}

