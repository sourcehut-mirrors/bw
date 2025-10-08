
/*
 * filetimes.c report the various essential UNIX timestamps for a file
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

#include <ctype.h>
#include <errno.h>
#include <fcntl.h>
#include <inttypes.h>
#include <iso646.h>
#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>

/* Maximum length of a single line of test in a file
 * before we give up. */
#define MAX_LINE 512

#define VERBOSE 1
int sysinfo(int verbose);
int file_stat_err( int file_errno );

int main(int argc, char **argv)
{
    struct stat status_buffer;
    int status;

    FILE *fp;
    char *line = NULL;
    char *c_time_string;
    size_t line_count, char_count;
    int endian_type, some_char, char_flag, fpos_status;
    int end_of_file = 0;
    fpos_t fpos;
    long ftell_pos;
    struct timespec time_tv;
    struct timespec modification_t;
    struct timespec creation_t;
    struct timespec access_t;

    uint64_t candidate;
    struct tm *time_tm;
    time_t unix_secs_now;
    struct tm *sample_tm;
    time_t unix_secs;

    if ( setlocale ( LC_ALL, "C" ) == NULL ) {
        fprintf(stderr,"FAIL : setlocale() returns NULL on \"C\"\n");
        return EXIT_FAILURE;
    }

    if ( argc < 2 ) {
        fprintf(stderr,"FAIL : provide a filename or pathname\n");
        errno = EINVAL;
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    if ( clock_gettime( CLOCK_REALTIME, &time_tv ) == -1 ) {
        perror( "clock gettime" );
        return EXIT_FAILURE;
    }
    c_time_string = ctime( &time_tv.tv_sec );

    /* note that we no longer will get an ENOMEM from the
     * sysctlbyname call.  See sysinfo.c for details. */
    endian_type = sysinfo(VERBOSE);
    if ( endian_type > 2 ) {
        fprintf(stderr,"FAIL : sysinfo() returns an error\n");
        return EXIT_FAILURE;
    }

    errno = 0;
    status = stat(argv[1], &status_buffer);
    if ( status == 0 ) {
        fprintf (stderr,"\nINFO : current time is %s", c_time_string );
        fprintf (stderr,"     : three UNIX times of the pathname are :\n");

        /* what I see on recent Linux
         *
         * (gdb) print &status_buffer
         * $1 = (struct stat *) 0x7fffffffe6d0
         * (gdb) print status_buffer
         * $2 = {st_dev = 2052, st_ino = 9473459, st_nlink = 1,
         *       st_mode = 33188, st_uid = 16411, st_gid = 20002,
         *       __pad0 = 0, st_rdev = 0,
         *       st_size = 350, st_blksize = 4096, st_blocks = 8,
         *       st_atime = 1759890002, st_atimensec = 930193717,
         *       st_mtime = 1759889998, st_mtimensec = 686183065,
         *       st_ctime = 1759889998, st_ctimensec = 686183065,
         *       __glibc_reserved = {0, 0, 0}}
         * 
         */

        /* access time */
        fprintf(stderr,"\n     : atime.sec = %10lu  nsec = %10lu\n",
                               status_buffer.st_atime,
                               status_buffer.st_atimensec);

        fprintf(stderr,"     :             %s",
                               ctime(&status_buffer.st_atime));


        /* modification time */
        fprintf(stderr,"\n     : mtime.sec = %10lu  nsec = %10lu\n",
                               status_buffer.st_mtime,
                               status_buffer.st_mtimensec);
        fprintf(stderr,"     :             %s",
                               ctime(&status_buffer.st_mtime));

        /* creation time */
        fprintf(stderr,"\n     : ctime.sec = %10lu  nsec = %10lu\n",
                               status_buffer.st_ctime,
                               status_buffer.st_ctimensec);
        fprintf(stderr,"     :             %s",
                               ctime(&status_buffer.st_ctime));
        fprintf(stderr,"\n");


        /* Check if pathname is a directory.
         * Note the ISO646 bitand. */
        if ( status_buffer.st_mode bitand S_IFDIR ) {
            errno = EINVAL;
            perror("FAIL ");
            fprintf(stderr,"FAIL : is pathname a directory?\n");
            return EXIT_FAILURE;
        }

    } else {
        /* check a pile of things that could have gone wrong */
        file_stat_err(errno);
        return EXIT_FAILURE;
    }

    /* 
     * Note that ctime() has nothing to do with file creation time.
     * Also it does not allow the user to format the output string.
     * Therefore we need to call gmtime or gmtime_r and then deal
     * with strftime and other time and date functions.
     *
     * The members of struct timespec time_tv are :
     *      {    tv_sec  = 1651937483,
     *           tv_nsec =  345979577
     *      }
     *
     * We may then call gmtime_r() with the above tv_sec data to get
     * a struct tm :
     *
     *      {    tm_sec    = 23,
     *           tm_min    = 31,
     *           tm_hour   = 15,
     *           tm_mday   = 7,
     *           tm_mon    = 4,
     *           tm_year   = 122,
     *           tm_wday   = 6,
     *           tm_yday   = 126,
     *           tm_isdst  = 0,
     *           __tm_gmtoff = 0,
     *           __tm_zone   = 0x7ffff7ecffe0 "GMT"
     *      }
     *
     * Note that __tm_zone is a *char pointer to the current locale
     * string for the UTC timezone. We need to also note that tm_gmtoff
     * field is derived from BSD and is a GNU library extension; it is
     * not visible in a strict ISO C environment. 
     *
     * Looking at the ISO/IEC 9945-1:1996 (“POSIX.1”) specifications
     * we should have at least the following : 
     *
     *     int tm_sec;     seconds (0 - 60)
     *     int tm_min;     minutes (0 - 59)
     *     int tm_hour;    hours (0 - 23)
     *     int tm_mday;    day of month (1 - 31)
     *     int tm_mon;     month of year (0 - 11)
     *     int tm_year;    year - 1900
     *     int tm_wday;    day of week (Sunday = 0)
     *     int tm_yday;    day of year (0 - 365)
     *     int tm_isdst;   is summer time in effect?
     *     char *tm_zone;  abbreviation of timezone name
     *     long tm_gmtoff; offset from UTC in seconds
     *
     * Those last two members are really just in BSD world. Do not
     * expect to see them in a strict C99 world.
     *
     * Also on the PDP-11 were C was first implemented ( early 1970s )
     * the datatype we call integer was as large as a processor 
     * register. That would be 16 bits and thus a signed integer has
     * 15 bits for data and 1 bit for the sign. It may be possible to
     * trigger an error condition from gmtime() where the resultant
     * year would not fit into an integer. Very difficult to do with
     * a 32bit signed integer. Even more strange with 64-bit integers
     * and a number like 67769050553057857 would be interesting.
     */

    if ( argc > 2 ) {
        printf("INFO : sizeof(long long) = %i\n", sizeof(long long));

        errno = 0;
        candidate = (uint64_t)strtoll(argv[2], (char **)NULL, 10);
        if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
            fprintf(stderr,"FAIL : bail out integer not understood\n");
            perror("     ");
            return EXIT_FAILURE;
        }

        errno = 0;
        time_tm = calloc(1,sizeof(struct tm));
        if ( time_tm == NULL ) {
            if ( errno == ENOMEM ) {
                fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                        __FILE__, __LINE__ );
            } else {
                fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                        __FILE__, __LINE__ );
            }
            perror("FAIL ");
            return EXIT_FAILURE;
        }

        unix_secs_now = time_tv.tv_sec;
        sample_tm = gmtime_r(&unix_secs_now, time_tm);

        /* The user may have provided some bizarre UNIX time
         * in seconds. See if it causes bad things. */
        unix_secs = candidate;
        sample_tm = gmtime_r(&unix_secs, time_tm);
        if ( sample_tm == NULL ) {
            fprintf(stderr,"FAIL : %" PRIu64 " fail\n", (uint64_t)unix_secs);
        } else {
            printf("INFO : time_tm->tm_year = %i\n", time_tm->tm_year);
        }
    
        free(time_tm);
        time_tm = NULL;
    }

    fp = fopen( argv[1], "r");
    if ( fp == NULL ) {
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    /* Note that the data in fpos will be unspecified
     * information usable by fsetpos(3C) */
    fpos_status = fgetpos(fp, &fpos);
    if ( fpos_status != 0 ) {
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    /* we expect to be at position byte zero */
    ftell_pos = ftell(fp);
    if ( ftell_pos < 0 ) {
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    errno = 0;
    line = calloc(MAX_LINE,sizeof(unsigned char));
    if ( line == NULL ) {
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                    __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                    __FILE__, __LINE__ );
        }
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    /* NOTE : for fgetc()
     *
     *       If the stream is at end-of-file or a read error occurs, the
     *       return is EOF. The routines feof(3) and ferror(3) must be
     *       used to distinguish between end-of-file and error.
     *
     *       If an error occurs, the global variable errno is set to
     *       indicate the error.
     */

    printf("\n------------------------- file output ---------------------\n");
    printf("line_no   bytes   line_buffer where \"~\" is a special char\n");
    printf("-----------------------------------------------------------\n");
    char_count = 0;
    line_count = 0;
    errno = 0;
    do {
        some_char = fgetc(fp);
        /* Due to the sad fact that a binary file will cause all
         * manner of problems we may need to check if we can print
         * the some_char. */

        if ( some_char == EOF ) {

            if ( feof(fp) ) {
                if ( char_count > 0 ) {
                    /* we hit end of file and the line has
                     * valid chars in it. remove the trailing
                     * new_line char and deal with end of file.
                     * Also note we do not increment char_count
                     * because we did not get a valid char. */
                    line[char_count] = '\0';
                    line_count += 1;
                    printf("%-6zu    %-4zu    \"%s\"\n",line_count,
                                                      char_count,
                                                      line);

                } else {
                    /* we have a dead empty line somehow */
                    line[0] = '\0';  /* THIS should never happen */
                }
                end_of_file = 1;
            } else {
                /* this is a read error */
                perror("FAIL ");
                fprintf(stderr,"     : read error at %s:%d\n", __FILE__, __LINE__ );
                free(line);
                return EXIT_FAILURE;
            }

        } else {

            char_flag = isprint(some_char) || isspace(some_char)
                       || (some_char==0010) || (some_char==0177);

            /* Try to ensure we have a safe char to print and if all
             * else fails then just use a tilde "~" octal 0176 */
            line[char_count] = char_flag ? (uint8_t)some_char : 0176;

            char_count += 1;

            /* Check for some insane line length and bail out with
             * a horrific nasty message and tell the user to smarten
             * up.
             */
            if (char_count>=MAX_LINE) {
                free(line);
                line = NULL;
                fprintf(stderr,"\n\n*****************************\n");
                fprintf(stderr,"*    WHAT? Binary file?     *\n");
                fprintf(stderr,"*****************************\n");
                return EXIT_FAILURE;
            }

            /* end of line has a new_line char and we remove it */
            if ( line[char_count - 1] == '\n' ) {
                line[char_count - 1] = '\0';
                line_count += 1;
                printf("%-6zu    %-4zu    \"%s\"\n",line_count,char_count,line);
                char_count = 0;
                line[0] = '\0';
            }
        }
    } while (end_of_file == 0);
    printf("\n-------------------------------------------------------\n");
    /* free that line buffer */
    free(line);

    ftell_pos = ftell(fp);
    if ( ftell_pos < 0 ) {
        perror("FAIL ");
        return EXIT_FAILURE;
    }
    fprintf(stderr,"\n\nINFO : ftell_pos = %-6li\n", ftell_pos);

    if ( ferror(fp) != 0 ) {
        fprintf(stderr,"\nWARN : some sort of an error occured??\n");
    }

    if ( feof(fp) != 0 ) {
        fprintf(stderr,"INFO : we did hit EOF\n");
    }

    if ( fclose(fp) != 0 ) {
        fprintf(stderr,"\nWARN : fclose returned an error.\n");
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    fprintf(stderr,"INFO : file %s is now closed\n\n", argv[1]);

    status = stat(argv[1], &status_buffer);
    if ( status == 0 ) {
        fprintf (stderr,"\nINFO : three UNIX times are now :\n");

        /* access time */
        fprintf(stderr,"     : ctime(&buffer.st_atime) = %s",
                               ctime(&status_buffer.st_atime));

        /* modification time */
        fprintf(stderr,"     :              .st_mtime) = %s",
                               ctime(&status_buffer.st_mtime));

        /* creation time */
        fprintf(stderr,"     :              .st_ctime) = %s",
                               ctime(&status_buffer.st_ctime));
    } else {
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;

}

