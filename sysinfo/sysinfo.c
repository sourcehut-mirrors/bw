
/*
 * sysinfo.c use uname(2) and sysconf(3C) to determine basic system data
 *
 *           RETURN : this code will return the value 1 ( one ) if
 *                    the machine is little endian. Otherwise we
 *                    shall return the value 2 ( two ) for a big
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

/* the whole notion of a floating point environment will require
 * at least C99 and a reasonably modern system. Otherwise you need
 * to write a ton of inline assembly for fifty architectures. Not
 * really true. However the ELF headers surely list a lot of machine
 * types and we just can not rely on anything else but the stuff
 * in fenv.h.  Good luck.
 */
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
#include <sys/types.h>
#include <time.h>
#include <unistd.h>

#if defined (__FreeBSD__) || defined (__OpenBSD__)
#include <sys/sysctl.h> 
#endif

#if defined(__FreeBSD__)
/* we need __BSD_VISIBLE or u_char and u_short vanish
 * and then sys/rtprio.h fails in a big way */
typedef unsigned char   u_char;
typedef unsigned short  u_short;
#include <sys/rtprio.h>
#endif

/* W A R N I N G : this is broken on Solaris 11.4 
#if defined (__SunOS_5_10) || defined (__SunOS_5_11)
#include <sys/processor.h>
#endif
 */

#if defined (__SunOS_5_10)
#include <sys/processor.h>
#endif

/* 23 Aug 2021 : Both PAGESIZE and PAGE_SIZE are specified in POSIX
 *
 * Some platforms do not have _SC_PHYS_PAGES and _SC_AVPHYS_PAGES
 * in sysconf(). We can assume they do and then disable it for
 * certain compilers/platforms. Welcome to "ifdef" madness.
 */
#define HAVE_PAGE_INFO
#ifdef __MVS__
#   undef HAVE_PAGE_INFO
#endif
#ifdef __IBMC__
#   undef HAVE_PAGE_INFO
#endif

#include "sysinfo.h"

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
    int ncpu = 0;
    int cpu_model_flag = 0;
    char cpu_model[128];
    size_t cpu_model_len = 128;

    int return_endian = 0;

#if defined(__FreeBSD__)
    size_t len;
    int prio_err_flag = 0;
    int this_pid_prio = 0;
    int this_pid_prio_type = 0;
    struct rtprio this_pid_rtp;
#endif

#if defined(__OpenBSD__)
     int mib[2];
#endif

/* W A R N I N G : this is broken on Solaris 11.4 
#if defined (__SunOS_5_10) || defined (__SunOS_5_11)
    processorid_t solaris_cpu;
    ushort_t      solaris_locality;
    processor_info_t solaris_cpu_info;
    int get_cpu_info_status;
#endif
*/

#if defined (__SunOS_5_10)
    processorid_t solaris_cpu;
    ushort_t      solaris_locality;
    processor_info_t solaris_cpu_info;
    int get_cpu_info_status;
#endif

    int fp_round_mode;

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
        err_flag = sysctlbyname("hw.availpages", &pages_avail,
                                               &len, NULL, 0);

        if (err_flag < 0) {
            perror("sysctlbyname(\"hw.availpages\", ...) : ");
            return SYSINFO_FAIL;
        }

        prio_err_flag = rtprio( RTP_LOOKUP, 0, &this_pid_rtp);
        if ( prio_err_flag < 0 ) {
            /*
             * The rtprio() system call will fail if:
             *
             *  [EFAULT]  The rtp pointer passed to rtprio() invalid.
             *  [EINVAL]  The specified prio was out of range.
             *  [EPERM]   The calling thread is not allowed to set the
             *            priority.  See mac_priority(4)
             *  [ESRCH]   The specified process or thread was not found
             */
            if ( errno == EPERM ) {
                /* this is not an error condition, merely an access
                 * problem. Ignore it and know that priority data
                 * is not available here. */
            } else {
                /* something bad happens */
                perror("rtprio() : ");
                return SYSINFO_FAIL;
            }
        }
        this_pid_prio = this_pid_rtp.prio;
        this_pid_prio_type = this_pid_rtp.type;

        /* There is a pile of other information we can get from a
         * FreeBSD system. From the manpage for sysctlbyname()
         *
         * string    HW_MACHINE    The machine class.
         * string    HW_MODEL      The machine model
         * integer   HW_NCPU       The number of cpus.
         * integer   HW_BYTEORDER  The byteorder (4321 or 1234)
         * integer   HW_PHYSMEM    Amount of physical memory
         *                         in bytes, minus the amount used
         *                         by the kernel and some other stuff
         * integer   HW_USERMEM    Amount of memory in bytes which
         *                         is not wired.
         * integer   HW_PAGESIZE   The software page size.
         * integer   HW_FLOATINGPT Nonzero if the floating point
         *                         support is in hardware.
         * string    HW_MACHINE_ARCH  The machine architecture
         * integer   HW_REALMEM    Amount of memory in bytes reported
         *                         by the firmware. May not make sense.
         * integer   HW_AVAILPAGES The same value as HW_PHYSMEM measured
         *                         in pages. See code above.
         * 
         * A typical machine may report things like :
         *
         *         $ sysctl hw.byteorder
         *         hw.byteorder: 1234
         *         $ sysctl hw.realmem
         *         hw.realmem: 17179869184
         *         $ sysctl hw.physmem
         *         hw.physmem: 17003057152
         *         $ sysctl hw.usermem
         *         hw.usermem: 6006362112
         *         $ sysctl hw.machine_arch
         *         hw.machine_arch: amd64
         *
         */

        cpu_model[0] = '\0';
        err_flag = sysctlbyname("hw.model", &cpu_model, &cpu_model_len,
                                 NULL, 0);
        if (err_flag < 0) {
            /* check for hw.fdt.model */
            err_flag = sysctlbyname("hw.fdt.model", &cpu_model,
                                     &cpu_model_len, NULL, 0);
            if (err_flag < 0) {
                cpu_model_flag=0;
            } else {
                cpu_model_flag=1;
            }
        } else {
            cpu_model_flag=1;
        }

        len = sizeof(ncpu);
        err_flag = sysctlbyname("hw.ncpu", &ncpu, &len, NULL, 0);


#endif

#if defined(__OpenBSD__)
    cpu_model[0] = '\0';

    mib[0] = CTL_HW;
    mib[1] = HW_MODEL;

    err_flag = sysctl(mib, 2, &cpu_model, &cpu_model_len, NULL, 0);

    if (err_flag < 0) {
        cpu_model_flag=0;
    } else {
        cpu_model_flag=1;
    }
#endif


/* what follows is just pure hackary to see what works where on
 * Solaris ... like who runs that ?? 
#if defined (__SunOS_5_8) || defined (__SunOS_5_9)

    printf("\n\n    Solaris 8 ? or Solaris 9 ? good luck...\n\n");

#endif

#if defined (__SunOS_5_10) || defined (__SunOS_5_11)

    printf("\n\n    Solaris 10 or 11 detected.\n\n");

#endif
*/

/* may only work with the ORACLE Studio 12.6 stuff 
#if defined (__SunOS_RELEASE)
    printf("\n\n  __SunOS_RELEASE may be %i\n", __SunOS_RELEASE);
#endif
*/

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

#if __POSIX_VISIBLE >= 200112
        errno = 0;
        err_flag = sysconf(_SC_THREADS);
        if ( err_flag < 0 ){
            perror("sysconf(_SC_THREADS) : ");
            return SYSINFO_FAIL;
        }
        threads = (uint64_t)err_flag;
#endif

    }

    /* locale should be set by the calling routine
    setlocale( LC_MESSAGES, "C" );
    */

    if ( uname( &uname_data ) < 0 ) {
        /* just give up if we can not use uname */
        return SYSINFO_FAIL;
        /*
         * fprintf ( stderr,
         *       "WARNING : Could not attain system uname data.\n" );
         * perror ( "uname" );
         */ 
    } else {
        /**************************************************************
         *    S P E C I A L    N O T E   F O R    F R E E B S D
         *
         *    FreeBSD can entirely override the uname data with
         *    some funky environment variables. The ordinary user
         *    can have "uname -a" report they are on a MIPS machine
         *    running Windows NT 3.51 if they choose. So be careful.
         *************************************************************/
        printf("----------------------------------");
        printf("---------------------------------\n");
        printf("                 system name = %s\n",
                                                  uname_data.sysname);

        printf("                   node name = %s\n",
                                                 uname_data.nodename);

        printf("                     release = %s\n",
                                                  uname_data.release);

        printf("                     version = %s\n",
                                                  uname_data.version);

        printf("                     machine = %s\n",
                                                  uname_data.machine);

#if defined(__FreeBSD__)
        if ( cpu_model_flag ) {
            printf("                   cpu model = %s\n", cpu_model);
            printf("                   number of = %i\n", ncpu);
        }
#endif

/* W A R N I N G : this is broken on Solaris 11.4 */
#if defined (__SunOS_5_10)
    printf("                   cpu model = ");
    solaris_cpu = getcpuid();
    get_cpu_info_status = processor_info( solaris_cpu, &solaris_cpu_info);
    if ( get_cpu_info_status<0 ) {
        /* no idea what to do here really... */
        printf("unknown\n");
    } else {
        printf("%s\n",solaris_cpu_info.pi_processor_type);
        printf("                   cpu clock = %i MHz\n", solaris_cpu_info.pi_clock);
        printf("                   cpu state = ");
        if ( solaris_cpu_info.pi_state == P_NOINTR ) {
            printf("NOINTR\n");
        } else {
            printf("%i\n", solaris_cpu_info.pi_state);
        }
    }
#endif

        /* If the available system memory is a number aligned on
         * a gigabyte boundary then we report it.
         */

#ifdef HAVE_PAGE_INFO
#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)

        printf("                   page size = %" PRIu64 "\n",
                                                            pagesize );

        printf("               system memory = %" PRIu64 "\n",
                                                              sysmem );

        printf("                             = %" PRIu64 " kB\n",
                                                         sysmem/1024 );

        printf("                             = %" PRIu64 " MB",
                                                      sysmem/1048576 );
        if ( ( sysmem>>30 ) > 32 ) {
            printf(" about %" PRIu64 " GB",(sysmem>>30));
        }
        printf("\n");

#else

        printf("                   page size = %llu\n", pagesize );
        printf("               system memory = %llu\n", sysmem );

        printf("                             = %llu kB\n",
                                                         sysmem/1024 );

        printf("                             = %llu MB\n",
                                                      sysmem/1048576 );

        /* lines up on exactly 1GB ? */
        if ( (sysmem % 1073741824) == 0 ) {

            printf("                             = %llu GB\n",
                                                        sysmem >> 30 );

        }

#endif
#endif

        if ( verbose ) {
#ifdef HAVE_PAGE_INFO
            if ( avail_memory > 0 ) {
#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)
                printf("                 avail pages = %" PRIu64 "\n",
                                                          pages_avail);

                printf("                avail memory = %" PRIu64 "\n",
                                                         avail_memory);
#else
                printf("                 avail pages = %llu\n",
                                                          pages_avail);

                printf("                avail memory = %llu\n",
                                                         avail_memory);
#endif
            } else {
                printf("                 avail pages = unknown\n");
                printf("                avail memory = unknown\n");
            }
#endif

#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)
            printf("         clock ticks per sec = %" PRIu64 "\n",
                                                      clock_ticks_sec);

            printf("             threads support = %" PRIu64 "\n",
                                                              threads);
            
            printf("               POSIX Version = %" PRIu64 "\n",
                                                              version);
#else
            printf("         clock ticks per sec = %llu\n",
                                                      clock_ticks_sec);
             

            printf("             threads support = %llu\n",
                                                              threads);

            printf("               POSIX Version = %llu\n",
                                                              version);
#endif
            printf("          _POSIX_CHILD_MAX   = %i\n",
                                                     _POSIX_CHILD_MAX);

            printf("          _POSIX_NGROUPS_MAX = %i\n", 
                                                   _POSIX_NGROUPS_MAX);

            printf("          _POSIX_OPEN_MAX    = %i\n",
                                                      _POSIX_OPEN_MAX);

            printf("          _POSIX_PATH_MAX    = %i\n",
                                                      _POSIX_PATH_MAX);

            printf("          _POSIX_TZNAME_MAX  = %i\n",
                                                    _POSIX_TZNAME_MAX);

            /* I am somewhat unsure what this is for */
#ifdef __STAT_TIME_T_EXT
            printf("          __STAT_TIME_T_EXT  = %i\n",
                                                    __STAT_TIME_T_EXT);
#endif

        }

        return_endian = endian();
        printf("                      endian = ");
        if ( return_endian == 1 ) {
            printf("little\n");
        } else {
            printf("big\n");
        }

        /* If sizeof reports back an unsigned long integer as 64bit
         * the format string for printf should be %lu. However
         * compilers on 32bit machines will get upset and warn
         * we should use %u. */
        printf("       sizeof(unsigned long) = %lu\n",
                                               sizeof(unsigned long));

#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 600)
        printf("                sizeof(long) = %lu\n",
                                          sizeof(unsigned long long));
#endif

        printf("                 sizeof(int) = %lu\n",sizeof(int));

        printf("               sizeof(void*) = %lu\n",sizeof(void*));

/* some older systems may not have fenv.h at all */
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

/* The situation with IBM MVS systems is that you only get the things
 * that are in the POSIX specs if you really really do need them. So
 * you can forget all about the clock idea. There may be clock data
 * somewhere but you will not get there easily or in a portable way.
 *
 * WARNING : this does not work on a Solaris 8 machine either. I
 * have yet to check Solaris 2.5.1 or earlier.
 */
#if __POSIX_VISIBLE >= 200112
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

                uptime_hour = ( uptime.tv_sec
                                - ( uptime_day * 86400 ) ) / 3600;

                printf("  %3lu hour", uptime_hour);
                if ( uptime_hour > 1 ) printf("s");

                uptime_min = ( uptime.tv_sec 
                                - ( uptime_day * 86400 ) 
                                - ( uptime_hour * 3600 ) ) / 60;

                printf("  %3lu min", uptime_min);
                if ( uptime_min > 1 ) printf("s");

                uptime_sec = uptime.tv_sec 
                                - ( uptime_day * 86400 )
                                - ( uptime_hour * 3600 )
                                - ( uptime_min * 60 );

                printf("  %3lu sec", uptime_sec);
                if ( uptime_sec > 1 ) printf("s");
          
                printf("\n");

            }
        } else {
            /* Apple M1 seems to fail here for some obscure reason */
            printf("WAT : sysconf(_SC_MONOTONIC_CLOCK) returns %li\n",
                                                            err_flag);
            perror("WAT : ");
        }
#endif
#endif

        printf("----------------------------------" );
        printf("---------------------------------" );
    }
    printf("\n");

#if defined(__FreeBSD__)
    if ( prio_err_flag == 0 ) {
        printf("INFO : this_pid_prio = %i of type ", this_pid_prio);
        /* The value of the type field may be :
         *     RTP_PRIO_REALTIME
         *     RTP_PRIO_NORMAL
         *     RTP_PRIO_IDLE
         */
        if ( this_pid_prio_type == RTP_PRIO_REALTIME ) {
            printf("RTP_PRIO_REALTIME");
        } else if ( this_pid_prio_type == RTP_PRIO_NORMAL ) {
            printf("RTP_PRIO_NORMAL");
        } else if ( this_pid_prio_type == RTP_PRIO_IDLE ) {
            printf("RTP_PRIO_IDLE");
        } else {
            printf("UNKNOWN ?");
        }
        printf("\n");
    }
#endif

#if defined(__ISO_C_VISIBLE)
    printf("INFO : __ISO_C_VISIBLE id defined\n");
#endif

#ifdef FLT_EVAL_METHOD
    printf("INFO : FLT_EVAL_METHOD == %d\n", FLT_EVAL_METHOD);
#endif

#ifdef DECIMAL_DIG
    printf("INFO : DECIMAL_DIG == %d\n", DECIMAL_DIG);
#endif

#ifdef FLT_DECIMAL_DIG
    printf("INFO : FLT_DECIMAL_DIG == %d\n", FLT_DECIMAL_DIG);
#endif

#ifdef DBL_DECIMAL_DIG
    printf("INFO : DBL_DECIMAL_DIG == %d\n", DBL_DECIMAL_DIG);
#endif

#ifdef LDBL_DECIMAL_DIG
    printf("INFO : LDBL_DECIMAL_DIG == %d\n", LDBL_DECIMAL_DIG);
#endif

#ifdef LDBL_DIG
    printf("INFO : LDBL_DIG == %d\n", LDBL_DIG);
#endif

    return return_endian;

}

