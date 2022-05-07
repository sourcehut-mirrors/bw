
/*
 * file_times.c  print out UNIX ctime mtime atime for a given filename
 * Copyright (C) Dennis Clarke 1999
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

#include <errno.h>
#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <time.h>
#include <fcntl.h>

int main(int argc, char *argv[])
{
    struct stat status_buffer;
    int fid_status;
    struct timespec time_tv;
    char *c_time_string;

    /* check if the user did provide a pathname */
    fid_status = 0;
    errno = 0;
    if (argc>1) {
        fid_status = stat(argv[1], &status_buffer);

        /* check that we actually have a file or directory */
        if ( fid_status != 0 ) {
            fprintf(stderr,"ERR  : pathname provided is not valid.\n");
    
            switch(errno) {
            case EFAULT :
                fprintf (stderr,"ERR  : EFAULT\n");
                break;
            case ENOENT :
                fprintf (stderr,"ERR  : ENOENT\n");
                break;
            case EBADF :
                fprintf (stderr,"ERR  : EBADF\n");
                break;
            default :
                fprintf (stderr,"ERR  : an error happened.\n");
            }
            perror("ERR  ");
            return EXIT_FAILURE;
        }

    } else {
        fprintf ( stderr, "FAIL : provide a filename\n");
        return EXIT_FAILURE;
    }

    /* note that "POSIX" is the same as "C" for a locale */
    setlocale ( LC_ALL, "POSIX" );
    if ( clock_gettime( CLOCK_REALTIME, &time_tv ) == -1 ) {
      perror( "clock gettime" );
      return( EXIT_FAILURE );
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
     * expect to see them in a strict C99 Linux world.
     *
     * Also on the PDP-11 were C was first implemented ( early 1970s )
     * the datatype we call integer was as large as a processor 
     * register. That would be 16 bits and thus a signed integer has
     * 15 bits for data and 1 bit for the sign. It may be possible to
     * trigger an error condition from gmtime() where the resultant
     * year would not fit into an integer. Very difficult to do with
     * a 32bit signed integer.
     */
    c_time_string = ctime( &time_tv.tv_sec );
    fprintf ( stderr, "INFO : current time is %s", c_time_string );

    struct tm *time_tm = calloc(1,sizeof(struct tm));
    time_t unix_secs_now = time_tv.tv_sec;

    struct tm *barf_tm = gmtime_r(&unix_secs_now, time_tm);

    time_t unix_secs_wow = 67769366129057857;
    barf_tm = gmtime_r(&unix_secs_wow, time_tm);

    free(time_tm);


    /* 
     * If the stat call worked then we get a buffer with a 
     * pile of good info in it : 
     *
     *      status_buffer = {
     *          st_dev     = 1640677507086U
     *          st_ino     = 231469791U
     *          st_mode    = 33261U
     *          st_nlink   = 1U
     *          st_uid     = 16411
     *          st_gid     = 20002
     *          st_rdev    = 18446744073709551615U
     *          st_size    = 531
     *
     *          st_atime   = {
     *              __tv_sec  = 1541445959
     *              __tv_nsec = 1584200
     *          }
     *
     *          st_mtime   = {
     *              __tv_sec  = 1541445751
     *              __tv_nsec = 757015900
     *          }
     *
     *          st_ctime   = {
     *              __tv_sec  = 1541448277
     *              __tv_nsec = 534276400
     *          }
     *          st_blksize = 8192
     *          st_blocks  = 16
     *          st_fstype  = "tmpfs"
     *      }
     *
     */

    /* access time */
    printf ("ctime(&status_buffer.st_atime) = \"%s\"\n",
                                      ctime(&status_buffer.st_atime));

    /* modification time */
    printf ("                    .st_mtime) = \"%s\"\n",
                                      ctime(&status_buffer.st_mtime));

    /* creation time */
    printf ("                    .st_ctime) = \"%s\"\n",
                                      ctime(&status_buffer.st_ctime));

    return EXIT_SUCCESS;

}

