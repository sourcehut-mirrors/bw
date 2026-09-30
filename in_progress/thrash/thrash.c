

/*
 * thrash.c : create a pile of directories and then a pile of files
 *            within each directory. The files contain highly random
 *            data which will defeat any attempt to compress.
 *
 * This will be interesting on a ZFS filesystem with zstd compression
 * and SHA512 checksums. The cpu may get very busy trying to compress
 * the data blocks.
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2026 Dennis Clarke
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

/* hack this away on the OpenBSD world for now 
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <errno.h>
#include <locale.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "tdiff.h"

/* This is a reasonable method to avoid kernel interferance when
 * trying to read data from either /dev/random or /dev/urandom.
 * FreeBSD just has a symlink for those and then employs some
 * snazzy PRNG algorithm. However using Mersenne Twister bypasses
 * all of that.
 *
 * Also the file output is repetitive on every run. Same stuff is
 * in the output files.
 *
 * --- Standard MT19937 Mersenne Twister Implementation Constants
 *     Makoto Matsumoto and Takuji Nishimura,
 *     1998 ACM Transactions on Modeling and Computer Simulation
 *     Vol. 8, No. 1, pages 3–30
 */
#define N 624
#define M 397
#define MATRIX_A 0x9908b0dfUL   /* constant vector a */
#define UPPER_MASK 0x80000000UL /* most significant w-r bits */
#define LOWER_MASK 0x7fffffffUL /* least significant r bits */

static unsigned long mt[N];     /* the array for the state vector  */
static int mti = N + 1;         /* mti==N+1 means mt[N] not initialized */

static void init_genrand(unsigned long s) {
    mt[0] = s & 0xffffffffUL;   /* Strict explicit array assignment */
    for (mti = 1; mti < N; mti++) {
        mt[mti] = (1812433253UL * (mt[mti-1] ^ (mt[mti-1] >> 30)) + 
                   (unsigned long)mti);
        mt[mti] &= 0xffffffffUL;
    }
}

static unsigned long genrand_int32(void) {
    unsigned long y;
    static unsigned long mag01[2] = {0x0UL, MATRIX_A};

    if (mti >= N) { 
        int kk;
        if (mti == N + 1) init_genrand(5489UL); 

        for (kk = 0; kk < N - M; kk++) {
            y = (mt[kk] & UPPER_MASK) | (mt[kk+1] & LOWER_MASK);
            mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 1UL];
        }
        for (; kk < N - 1; kk++) {
            y = (mt[kk] & UPPER_MASK) | (mt[kk+1] & LOWER_MASK);
            mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 1UL];
        }
        y = (mt[N-1] & UPPER_MASK) | (mt[0] & LOWER_MASK);
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 1UL];
        mti = 0;
    }
  
    y = mt[mti++];

    y ^= (y >> 11);
    y ^= (y << 7) & 0x9d2c5680UL;
    y ^= (y << 15) & 0xefc60000UL;
    y ^= (y >> 18);

    return y;
}

/*
 * --- Standard MT19937 Mersenne Twister Implementation Code above.
 */

int
main(int argc, char **argv)
{
    /* we need to create piles of files and also a log */
    FILE *out_file;
    FILE *log_file;
    unsigned char *buffer;
    char *locale_buf;

    char dir_name[16];
    char file_name[32];
    char letter;

    int dir_a, dir_b, file_x, file_y;
    int max_dir_b, max_file_y;

    /* my own way of dealing with time delta as seen
     * in the time_and_date directory. */
    struct timespec tn_0, tn_1, tn_begin, tn_end;
    struct timespec tn_dir_begin, tn_dir_end;
    tdiff_type delta_file, delta_dir, delta_total;

    /* do the basic clock tests */
    clockid_t clock_flag;
    int err_clock;

    size_t i;
    unsigned long rand_val;

    /* The LLVM/Clang compiler can be a real whiner about
     * things declared and not defined. Thus this is a way
     * to tell the LLVM/Clang compiler to shut up. */
    tn_0.tv_sec         = 0; tn_0.tv_nsec         = 0;
    tn_1.tv_sec         = 0; tn_1.tv_nsec         = 0;
    tn_begin.tv_sec     = 0; tn_begin.tv_nsec     = 0;
    tn_end.tv_sec       = 0; tn_end.tv_nsec       = 0;
    tn_dir_begin.tv_sec = 0; tn_dir_begin.tv_nsec = 0;
    tn_dir_end.tv_sec   = 0; tn_dir_end.tv_nsec   = 0;
 
    /* determine what sort of clock we can use. if any */
    errno = 0;
    clock_flag = CLOCK_MONOTONIC;
    err_clock = clock_gettime(clock_flag, &tn_begin);
    if ( err_clock != 0 ) {
        fprintf(stderr,"FAIL : ");
        if ( errno == ENOSYS ) {
            fprintf(stderr,"clock_gettime() not supported\n");
            return EXIT_FAILURE;
        }
 
        if ( errno == EINVAL ) {
            fprintf(stderr,"CLOCK_MONOTONIC not known\n");
            errno = 0;
            clock_flag = CLOCK_REALTIME;
            err_clock = clock_gettime(clock_flag, &tn_begin);
 
            if ( err_clock != 0 ) {
                if ( errno == EINVAL ) {
                    /* Not very likely to ever happen as CLOCK_REALTIME
                     * shall always be implemented if the clock_gettime()
                     * function exists. */
                    fprintf(stderr,"FAIL : CLOCK_REALTIME not supported\n");
                    fprintf(stderr,"     : system is borked for clocks\n");
                    return EXIT_FAILURE;
                }
                fprintf(stderr,"FAIL : bizarre error. good luck.\n");
                return EXIT_FAILURE;
            }
        }
    }

    /* TODO : we do not have a log file yet and this is borked
     *        because we need CLOCK_REALTIME to get the date 
     *
     *          bork bork bork
     *
    fprintf(stdout, "INFO : start time %ld.%09ld\n", 
                                tn_begin.tv_sec, 
                                tn_begin.tv_nsec);
    fflush(stdout);
    */

    /* Mersenne Twister init with the time nanosec as seed */
    init_genrand((unsigned long)tn_begin.tv_nsec);

    /* if anything is on the command line then we assume
     * we are doing a short run of 10G total data
     */
    if (argc > 1) {
        max_dir_b = 0;  
        max_file_y = 0; 
    } else {
        max_dir_b = 9;  
        max_file_y = 9;
    }

    /* keep this simple for now */
    locale_buf = setlocale( LC_ALL, "POSIX" );
    if ( locale_buf == NULL ) {
        fprintf (stderr,"FAIL : setlocale POSIX fail\n");
        return EXIT_FAILURE;
    }

    /* why do I want putenv again ? */
    if (putenv("LC_TIME=POSIX") != 0) {
        fprintf (stderr,"FAIL : putenv fail\n");
        return EXIT_FAILURE;
    }

    /* I am going to hard code the path for now */
    log_file = fopen("../log/thrash.log", "w");
    if (!log_file) {
        fprintf(stderr, "FAIL: log file: %s\n", strerror(errno));
        return EXIT_FAILURE;
    }
    
    /* hard coded 4 MB for each random file */
    errno = 0;
    buffer = calloc(1, 4194304);
    if ( buffer == NULL ) {
        /* really? possible ENOMEM? */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                                __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                                __FILE__, __LINE__ );
        }
        perror("FAIL ");
        /* bail out and close the log file */
        fclose(log_file);
        return EXIT_FAILURE;
    }

    printf("INFO : log is ../log/thrash.log\n");
    fflush(stdout);

    /* loop on the lowercase letters for a directory name */
    for (letter = 'a'; letter <= 'z'; letter++) {
        for (dir_a = 0; dir_a <= 9; dir_a++) {

            /* the digits in the directory name where we
             * can set the max at 0 or 9 or 4 or whatever */
            for (dir_b = 0; dir_b <= max_dir_b; dir_b++) {
                
                if (max_dir_b == 0) {
                    snprintf(dir_name, sizeof(dir_name), 
                             "%c%d", letter, dir_a);
                } else {
                    snprintf(dir_name, sizeof(dir_name), 
                             "%c%d%d", letter, dir_a, dir_b);
                }
                
                if ( ( mkdir(dir_name, 0777) != 0 )
                        && ( errno != EEXIST ) ) {
                    /* are we out of disk space? */
                    fprintf(stderr,"FAIL : mkdir fails\n");
                    perror("FAIL ");
                    free(buffer);
                    fclose(log_file);
                    return EXIT_FAILURE;
                }

                /* this was tested above */
                clock_gettime(clock_flag, &tn_dir_begin);

                for (file_x = 0; file_x <= 9; file_x++) {

                    /* we can do a short run and set some max
                     * number on max_file_y. See above. */
                    for (file_y = 0; file_y <= max_file_y; file_y++) {

                        /* we do want to time the file operation */
                        clock_gettime(clock_flag, &tn_0);

                        /* hacky hard coded number */
                        for (i = 0; i < 4194304; i += 4) {
                            /* Mersenne Twister to the rescue */
                            rand_val = genrand_int32();

                            /* just push the bits right for 32 bits */
                            buffer[i]     = rand_val & 0xFF;
                            buffer[i + 1] = (rand_val >> 8) & 0xFF;
                            buffer[i + 2] = (unsigned char)
                                            ((rand_val >> 16) & 0xFF);
                            buffer[i + 3] = (unsigned char)
                                            ((rand_val >> 24) & 0xFF);
                            /* TODO : maybe use the MT stuff better */
                        }

                        /* is there another digit in the filename? */
                        if (max_file_y == 0) {

                            snprintf(file_name, sizeof(file_name), 
                                     "%s/rand_%d", dir_name, file_x);

                        } else {

                            snprintf(file_name, sizeof(file_name), 
                                     "%s/rand_%d%d", dir_name, 
                                     file_x, file_y);

                        }
                        
                        out_file = fopen(file_name, "wb");

                        /* did we bork ? */
                        if (!out_file) {
                            free(buffer);
                            fclose(log_file);
                            return EXIT_FAILURE;
                        }

                        if (fwrite(buffer, 1, 4194304, out_file) != 4194304) {
                            fclose(out_file);
                            free(buffer);
                            fclose(log_file);
                            return EXIT_FAILURE;
                        }
                        fclose(out_file);

                        clock_gettime(clock_flag, &tn_1);
                        tdiff(&delta_file, tn_0, tn_1);

                        fprintf(log_file, "%s %ld.%09ld\n", 
                                file_name, delta_file.sec, 
                                delta_file.nsec);

                        fflush(log_file);
                    }
                }

                clock_gettime(clock_flag, &tn_dir_end);
                tdiff(&delta_dir, tn_dir_begin, tn_dir_end);

                printf("     : dir %s done %ld.%09ld seconds\n", 
                       dir_name, delta_dir.sec, delta_dir.nsec);

                fflush(stdout);
            }
        }
    }

    clock_gettime(clock_flag, &tn_end);
    tdiff(&delta_total, tn_begin, tn_end);

    fprintf(log_file, "TOTAL TIME: %ld.%09ld seconds\n", 
            delta_total.sec, delta_total.nsec);

    fflush(log_file);

    /* just do that again for the stdout stuff */
    printf("TOTAL TIME: %ld.%09ld seconds\n", 
           delta_total.sec, delta_total.nsec);

    fflush(stdout);

    free(buffer);
    fclose(log_file);

    return EXIT_SUCCESS;

}

