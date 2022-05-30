
/*
 * crucible.c  Single threaded create a pile of files and then append
 *             poetry to the random data with both a 2048 byte chunk
 *             and then a 768 byte chunk to cause on disk fragmentation.
 *
 * This was written a long long time ago and used on Sparc 5 machines
 * with Sun "photon" storage arrays and such.
 *
 * Copyright (C) Dennis Clarke 1994
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

/**************************************************************************
 *  Author : Dennis M. Clarke  dclarke@blastwave.org
 *  Intent : File system IO load test.
 *  Detail : A tool was needed that would test a simple filesystem and
 *           its component devices.  This tool could then be used to
 *           quickly determine the measurable impact of filesystem and/or
 *           component changes.  This tool was quite useful in creating
 *           half Terabyte and full Terabyte filesystems on disk stripes.
 *           First revision was around 1994 and tested on photon model
 *           fibre arrays in 2004 on FCAL Enterprise Network Arrays.
 *
 *    Note : May not mean very much in the era of Samsung SSDs and such.
 *           Last update Dec 2020. Still likely full of errors and all
 *           the high resolution timer bits are janky as hell.
 **************************************************************************/
#include <errno.h>
#include <limits.h>
#include <locale.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stdint.h>
#include <time.h>
#include <unistd.h>
#include <inttypes.h>
#include <iso646.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "offset.h"

#define VERBOSE 1
#define MAX_GROUPS 16
#define SIXTYFOURK 65536
#define ONE_MEG 1048576
#define NANOSEC 1000000000

void append_2k(FILE *);
void append_TSE(FILE *);
static double genrand(void);

uint64_t timediff( struct timespec start_time,
                   struct timespec end_time );

int sysinfo(int verbose);

int main (int argc, char **argv) {

    uint64_t r64_time, r64_dump_time_hrt, total_dump_time_hrt;
    uint64_t file_create_total_time, file_create_time;
    uint64_t totaltime, baseline_delta;

    uint32_t iteration_count;
    uint32_t i, j, k, l, m, n, p, z;
    size_t q, random_bytes_read, filename_len, fid_len, dir_len;
    int fflush_err, twister_flag = 0;
    int rchar_line, rchar_num;
    char *c_time_string;

    /* a pile of these can be tossed away */
    struct timespec clock_resolution;
    struct timespec start_hrt, end_hrt;
    struct timespec end_test1_hrt, end_test2_hrt, end_test3_hrt;
    struct timespec start_proc_hrt, end_proc_hrt;
    struct timespec bubble_start_hrt, bubble_end_hrt;
    struct timespec qsort_start_hrt, qsort_end_hrt;
    struct timespec random_buffer_start_hrt, random_buffer_end_hrt;


    int file_ctime_offset;
    struct timespec *file_ctime = calloc(DFR*DSR*FFR*FSR,sizeof(struct timespec));

    if ( file_ctime == NULL ) {
        /* really? possible ENOMEM? */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                    __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                    __FILE__, __LINE__ );
        }
        perror("FAIL ");
        /* NOTE : it is very nasty to bail out this way
         *        but why bother to continue ?
         */
        return EXIT_FAILURE;
    }


    /* For snits and giggles we are curious about bubble sort min
     * and max time */
    uint64_t bubble_time;
    uint64_t qsort_time;
    uint64_t bubble_min = 3600000000000;  /* some large time of 1Hr */
    uint64_t bubble_max = 0;
    uint64_t qsort_min = 3600000000000;
    uint64_t qsort_max = 0;
    int bork = 0; /* just in case qsort and bubble sort disagree */

    double avgtime;
    double this_file_io, avg_file_io;

    char fid0[2] = { 'a', 'a' };
    char dir0[2] = { 'a', 'a' };
    char fid1[2] = { 'a', 'a' };
    char dir1[2] = { 'a', 'a' };
    char fid[10] = { 'a', 'a', '/', 'a', 'a', '.', 'd', 'a', 't', '\0' };

    /* see https://tools.ietf.org/html/rfc4648 RFC 4648
     * 5.  Base 64 Encoding with URL and Filename Safe Alphabet
     *
     *   0 A            17 R            34 i            51 z
     *   1 B            18 S            35 j            52 0
     *   2 C            19 T            36 k            53 1
     *   3 D            20 U            37 l            54 2
     *   4 E            21 V            38 m            55 3
     *   5 F            22 W            39 n            56 4
     *   6 G            23 X            40 o            57 5
     *   7 H            24 Y            41 p            58 6
     *   8 I            25 Z            42 q            59 7
     *   9 J            26 a            43 r            60 8
     *  10 K            27 b            44 s            61 9
     *  11 L            28 c            45 t            62 - (minus)
     *  12 M            29 d            46 u            63 _
     *  13 N            30 e            47 v           (underline)
     *  14 O            31 f            48 w
     *  15 P            32 g            49 x
     *  16 Q            33 h            50 y         (pad) =
     */
    char alph[64] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                    "abcdefghijklmnopqrstuvwxyz"
                    "0123456789-_";

    /* these are used to sort the results of the random
     * data lines and to examine the distribution.
     * It is a silly idea but hey, why not? */
    int alph_dist[64];
    int alph_dist_copy[64];

    /* part of the silly idea where we use a bubble sort */
    int swap_count, swap_me, swapped;
    int swap_count_min = 99999999;
    int swap_count_max = 0;

    /* it would be far faster to read 64k from /dev/random
     * in one call as opposed to reading byte by byte */
    uint8_t rand64k[65536];

    /* A place for the 64k of char data where we only use
     * the Base 64 RFC-4648 filename and URL safe chars
     * listed above. We need an extra byte for the final
     * nul char. */
    char buffer_64k_rand_text[65537];
    int char_count, k_index;

    /* curious what we get with _XOPEN_SOURCE 600
    printf("\n\n--------- _XOPEN_SOURCE 600 -------\n");
    printf("_POSIX_CHILD_MAX   = %i\n", _POSIX_CHILD_MAX);
    printf("_POSIX_NGROUPS_MAX = %i\n", _POSIX_NGROUPS_MAX);
    printf("_POSIX_OPEN_MAX    = %i\n", _POSIX_OPEN_MAX);
    printf("_POSIX_PATH_MAX    = %i\n", _POSIX_PATH_MAX);
    printf("_POSIX_TZNAME_MAX  = %i\n", _POSIX_TZNAME_MAX);
    printf("---------------------------------------\n");
    */

    char filename[FILENAME_MAX];
    char directory[FILENAME_MAX];
    char mkdir_path[FILENAME_MAX];

    FILE *fp, *frandom;

    if ( argc != 2 ) {
        printf ("\n*****************************************************\n");
        printf (" crucible : cru-ci-ble (kroo'se-bel) noun.\n");
        printf ("            1. A vessel for melting materials at\n");
        printf ("               high temperatures.\n");
        printf ("            2. A severe test, as of patience or belief;\n");
        printf ("               a trial.\n\n");
        printf ("[ Dennis Clarke dclarke@blastwave.org ]\n");
        printf ("Written in 1994 or so to hammer Sun SPARC servers and\n");
        printf ("the old \"photon\" series fibre arrays.\n");
        printf ("*****************************************************\n\n");
        /*
        printf ("This test will create 26^4 = 456976 files of\n");
        printf ("exactly 65536 bytes each. This amounts to\n");
        printf ("29,948,379,136 bytes = 27.8 GB of data where we\n");
        printf ("are not counting directory structure overhead.\n\n");
        */
        printf ("%s: Usage - you must specify the directory.\n", argv[0]);
        printf ("Example : %s ./test/area/foo \n", argv[0]);
        return EXIT_FAILURE;
    }

    /* dump out some information about the system we are using */
    sysinfo(VERBOSE);

    if (setlocale(LC_ALL,"POSIX") == NULL) {
        printf("INFO : for some reason setlocale fails.\n");
        return EXIT_FAILURE;
    }

    errno = 0;
    if (setenv("TZ","GMT0",1) == -1) {
        fprintf(stderr, "%s: can not set TZ=GMT0\n", argv[0]);
        perror("WARN : ");
        fprintf(stderr,"    : The TimeZone appears to be TZ=\"");
        fprintf(stderr,getenv("TZ"));
        fprintf(stderr,"\"\n");
    }

    /* can we get the current time from a clock? */
    if (clock_gettime( CLOCK_REALTIME, &start_hrt) == EINVAL) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERR  : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    } else {

        /* We use CLOCK_REALTIME which is assured to work reasonably
         * well by IEEE Std 1003.1b-1993 (“POSIX.1b”). It may be useful
         * to ask for the resolution of the system clock calls. This
         * may be done with clock_getres().
         */

        if (clock_getres(CLOCK_REALTIME, &clock_resolution) == EINVAL) {
            /* This makes no sense and *should* never happen. */
            fprintf(stderr,"ERR  : clock_getres fail\n");
            return EXIT_FAILURE;
        }

        /* This clock resolution data is not very useful. It may say
         * that the clock reports all the way down to a 1 nsec number
         * but I assure you that doesn't mean very much. */
        printf("INFO : clock_resolution = %" PRIu64 " nsec\n",
                                               clock_resolution.tv_nsec);

        /* baseline clock_gettime delta */
        clock_gettime(CLOCK_REALTIME, &start_hrt);
        clock_gettime(CLOCK_REALTIME, &end_hrt);
        baseline_delta = timediff(start_hrt, end_hrt);

        printf("INFO : baseline delta time is %" PRIu64 " nsec\n",
                                                         baseline_delta);

        /* With all these time and clock calls we may as well report the
         * current time. */
        c_time_string = ctime(&end_hrt.tv_sec);
        fprintf (stderr,"\nINFO : current time is %s", c_time_string);

        /* Note that strftime() may help :
         *
         * phobos$ date -u
         * TZ=GMT0 LC_TIME=C /bin/date "+%a %b %d %H:%M:%S %Z %Y"
         * Fri Mar 18 23:44:10 UTC 2022
         * Fri Mar 18 23:44:10 GMT 2022
         *
         * Both represent the same time.
         */

        /* Initialize the random number drand48() with the nanosec data
         * from the current time. Not a perfect method but srand48()
         * needs some sort of a initial number as input.
         *
         * In the past we could use the Mersennne Twister as a random
         * number source. It makes sense to use a more modern method
         * given that /dev/random can generally be accepted as near
         * cryptographically random. Mostly. At least on most modern
         * systems running UNIX and Linux. To get a really flawless
         * random number generator we need something like radiation
         * decay data from strontium-90 or caesium-137. Not really
         * available at a corner store.
         */
        srand48((long)end_hrt.tv_nsec);
    }

    /**************************************************************
     * from somewhere back in 1994 or so ...                      *
     *                                                            *
     * Be advised that the size_t type is in limits.h as          *
     * :typedef       unsigned long size_t;                       *
     *                                                            *
     * strlen returns a size_t number which is really ulong int   *
     * since we are using short strings then we can cast it to a  *
     * simple int.                                                *
     **************************************************************/

    /**************************************************************
     * copy the provided directory argument to the variable
     * directory with the exception of the last character.
     **************************************************************/
    q = strlen(argv[1]);

    /* we need q < ( FILENAME_MAX - 12 )
     *
     * 3 Apr 2021 : near as I can recall we need to append at
     *              least ten bytes onto the given filepath.
     *
     *              filename pattern will be like "XX/XX.dat"
     *
     *              there is also a trailing nul byte "\0"
     *
     *
     * So we get something similar to :
     *
     *      user_gave_us_a_pathname/XX/XX.dat
     *
     * Where the total length of the string must be less than
     * the system FILENAME_MAX.
     *
     * 18 Mar 2022 : someday I may want to try three letter
     *               combinations for the filenames and the
     *               directory that they land inside. In which
     *               case we need a trailing "/XXX/XXX.dat\0"
     *               which will be 13 bytes. Check for a path
     *               total length of FILENAME_MAX - 14 to be
     *               super safe.
     *
     * If the pathname is that long then the user may be just
     * be a bit of a fool to even try.
     */
    if ( q > ( FILENAME_MAX - 12 ) ) {
        fprintf(stderr,"ERROR : path name too long\n");
        return EXIT_FAILURE;
    }

    /* just copy argv[1] into directory */
    for ( i = 0; (argv[1][i]!='\0'); ++i)
        directory[i] = argv[1][i];

    /* is the last character a forward slash "/" ? */
    if ( (argv[1][q-1]) != '/' ) {  /* was the last char a "/" ? */
        directory[i] = '/';         /* no, so add the slash      */
        directory[i+1] = '\0';      /* null terminate the string */
    } else {
        directory[i] = '\0';        /* argv[1] had the slash, ok */
    }

    /* It would be of some value to stat() the directory
     * pathname just to ensure it actually exists and is
     * a directory. */
    struct stat fid_status_buffer;
    int fid_status;
    errno = 0;
    fid_status = stat(directory, &fid_status_buffer);

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

    /* is that a valid directory?
     * The sys/stat.h header says we need S_IFDIR value 0040000 */

    if (S_ISDIR(fid_status_buffer.st_mode) == 0) {
        fprintf (stderr,"ERR  : pathname provided not a directory.\n");
        return EXIT_FAILURE;
    }

    /* check that the current user can write effective_uid using
     *     st_uid
     *     st_gid
     */
    uid_t effective_uid = geteuid();
    gid_t effective_gid = getegid();
    printf("INFO : fid_status_buffer.st_uid = %i\n", fid_status_buffer.st_uid);
    printf("     : fid_status_buffer.st_gid = %i\n", fid_status_buffer.st_gid);
    printf("     : this user  effective_uid = %i\n", effective_uid);
    printf("     : this user  effective_gid = %i\n", effective_gid);


    /* the user should have rwx permissions on the directory
     * otherwise we need to check the group permissions */
    if ( (fid_status_buffer.st_mode bitand 00000700) == 0000700 ) {
        printf("     : valid write permission for owner.\n");

        if (fid_status_buffer.st_uid == effective_uid) {
            printf("     :  correct ownership also.\n");
        } else {
            fprintf (stderr,"ERR  : wrong user ownership.\n");
            return EXIT_FAILURE;
        }
    } else {

        if ( fid_status_buffer.st_gid != effective_gid ) {

            /* we can plan for a user that may be in 16 groups
             * and that should be more than enough */
            errno = 0;
            gid_t *group_list = calloc(MAX_GROUPS, sizeof(gid_t));
            if ( group_list == NULL ) {
                /* really? possible ENOMEM? */
                if ( errno == ENOMEM ) {
                    fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                            __FILE__, __LINE__ );
                } else {
                    fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                            __FILE__, __LINE__ );
                }
                perror("FAIL ");
                /* NOTE : it is very nasty to bail out this way
                 */
                return EXIT_FAILURE;
            }

            errno = 0;
            int num_of_groups = getgroups(MAX_GROUPS, group_list);
    
            if ( num_of_groups < 0 ) {
                perror("ERR  ");
                return EXIT_FAILURE;
            }
    
            /* walk the group list to see if the user matches the
             * directory st_gid */
            int group_match = 0;
            for ( int s=0; s<num_of_groups; s++ ) {
                if ( fid_status_buffer.st_gid == group_list[s] ) {
                    /* we have a group id match */
                    printf("     : this user is in   grp_id = %i\n",
                                                             group_list[s]);
    
                    group_match = 1;
                    s = num_of_groups;
                }
            }
    
            if ( group_match == 1 ) {
                /* wonderful but can we read, write and execure/search
                 * in the directory ? */
                if (( fid_status_buffer.st_mode bitand 00000070 ) != 00000070 ) {
                    fprintf (stderr,"ERR  : pathname provided not group usable.\n");
                    free(group_list);
                    return EXIT_FAILURE;
                }
            }
            free(group_list);

        }
    }

    totaltime = 0;
    r64_time = 0;
    r64_dump_time_hrt = 0;
    total_dump_time_hrt = 0;
    file_create_total_time = 0;
    file_create_time = 0;
    iteration_count = 0;


    if ((frandom = fopen("/dev/urandom", "r")) == NULL) {
        fprintf(stderr, "%s: can't read /dev/urandom \n", argv[0]);
        perror("WARN : ");
        fprintf(stderr, "    : we must use the Mersenne Twister\n");
        twister_flag = 1;
    }

    /* reset the start time clock data */
    if ( clock_gettime( CLOCK_REALTIME, &start_hrt ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }

    /* directory name loops for [A-z] etc */
    for (j=DIR_FIRST_LETTER_MIN; j<=DIR_FIRST_LETTER_MAX; j++) {
        fid[0]=alph[j];
        for (k=DIR_SECOND_LETTER_MIN; k<=DIR_SECOND_LETTER_MAX; k++) {
            /* The structure of the character string fid is very simple.
             * It looks like so : aa/aa.dat
             * To iterate through a pile of unique filenames we just
             * keep changing those letter chars as needed.  */
            fid[1]=alph[k];

            /* inner loops to change the filename.  */
            for (l=FILE_FIRST_LETTER_MIN; l<=FILE_FIRST_LETTER_MAX; l++) {
                fid[3]=alph[l];
                for (m=FILE_SECOND_LETTER_MIN; m<=FILE_SECOND_LETTER_MAX; m++) {
                    fid[4]=alph[m];

                    /*
                     * If we stick to just lowercase letters then we
                     * have 26^2 = 676 files per directory. Before long
                     * we would no longer be testing file IO rates and
                     * have to deal with overhead to locate a given file
                     * in a directory.
                     */

                    filename_len = sizeof(filename);
                    strncpy(filename,directory,filename_len);

                    fid_len = sizeof(fid);
                    strncat(filename,fid,fid_len);

                    /* Generate the random text before we need it and
                     * also outside of the area that measures time
                     * for a given file. */
                    if ( clock_gettime( CLOCK_REALTIME, &random_buffer_start_hrt ) == -1 ) {
                        /* We could not get the clock. Bail out. */
                        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
                        return EXIT_FAILURE;
                    }

                    /* memset to clear 64k_random */
                    memset(rand64k, 0x00, ((size_t)65536)*sizeof(uint8_t));

                    if ( twister_flag ) {
                        /* we can not use the /dev/random device it seems */
                        for (char_count = 0; char_count < 65535; ++char_count ) {
                            k_index = (int)(genrand() * 64.0);
                            buffer_64k_rand_text[char_count]=alph[k_index];
                        }
                    } else {
                        errno = 0;
                        clearerr(frandom);
                        /* read 64kB of random bytes */
                        random_bytes_read = fread(rand64k, sizeof(uint8_t), 65536, frandom);
                        if (ferror(frandom) != 0) {
                            /* this is a real mess and we may as well bail out */
                            fprintf(stderr,"ERR  : reading /dev/urandom failed\n");
                            perror("FAIL : ");
                            fclose(frandom);
                            return EXIT_FAILURE;
                        }
                        /* now use that random pile of bytes to generate
                         * random text */
                        for (char_count = 0; char_count < 65535; ++char_count ) {
                            /* ensure we only use 7 low bits of those
                             * random numbers. Thus we mask with the
                             * binary value 01111111 */
                            k_index = rand64k[char_count] & (uint8_t)0x3f;
                            buffer_64k_rand_text[char_count]=alph[k_index];
                        }
                    }

                    /* insert newline chars at 64 bytes each */
                    for (char_count = 63; char_count < 65535; char_count+=64){
                        buffer_64k_rand_text[char_count]='\n';
                    }

                    buffer_64k_rand_text[65535]='\n';
                    buffer_64k_rand_text[65536]='\0';

                    if ( clock_gettime(CLOCK_REALTIME, &end_hrt) == -1 ) {
                        /* We could not get the clock. Bail out. */
                        fprintf(stderr,"ERR  : could not attain CLOCK_REALTIME\n");
                        return EXIT_FAILURE;
                    }

                    /* this is nothing but the time to create the
                     * random 64k bytes */
                    r64_dump_time_hrt += timediff(random_buffer_start_hrt, end_hrt);

                    /* create the new file and dump our random data */
                    if ( clock_gettime( CLOCK_REALTIME, &start_proc_hrt ) == -1 ) {
                        /* We could not get the clock. Bail out. */
                        fprintf(stderr,"ERR  : could not attain CLOCK_REALTIME\n");
                        return EXIT_FAILURE;
                    }

                    /* TODO try a more intelligent approach to this using
                     * fstat/stat etc */
                    if ( (fp = fopen(filename, "w")) == NULL ) {
                        /* probably the directory does not exist yet.
                         * So lets remove the XX.dat part from the end.
                         * Make sure we have the terminating nul. */
                        dir_len = strlen(filename) - 6;
                        mkdir_path[0]='\0';
                        strncpy(mkdir_path,filename,dir_len);
                        mkdir_path[dir_len]='\0';

                        errno = 0;
                        if ( mkdir(mkdir_path, (mode_t)0755) != 0 ) {
                            fprintf (stderr,"%s: can't mkdir %s\n",
                                              argv[0], mkdir_path);
                            fprintf (stderr,"%s: ABORTING\n", argv[0]);
                            perror("FAIL ");
                            return EXIT_FAILURE;
                        }

                        /* create the new file and dump our random data */
                        if ( clock_gettime( CLOCK_REALTIME, &start_proc_hrt ) == -1 ) {
                            /* We could not get the clock. Bail out. */
                            fprintf(stderr,"ERR  : could not attain CLOCK_REALTIME\n");
                            return EXIT_FAILURE;
                        }

                        /* we know for certain that the directory exists */
                        errno = 0;
                        if ( (fp = fopen(filename, "w")) == NULL ) {
                            fprintf (stderr,"%s: can't open %s\n",
                                               argv[0], filename);
                            fprintf (stderr,"%s: ABORTING\n", argv[0]);
                            perror ("FAIL ");
                            return EXIT_FAILURE;
                        }
                    }

                    fprintf(fp, buffer_64k_rand_text);
                    errno = 0;
                    fflush_err = fflush(fp);
                    if (fflush_err != 0) {
                        fprintf(stderr, "fflush error %i", fflush_err);
                        perror("FAIL : ");
                        return EXIT_FAILURE;
                    }
                    fclose ( fp ); /* close the file and flush buffers */

                    if ( clock_gettime( CLOCK_REALTIME, &end_proc_hrt ) == -1 ) {
                        /* We could not get the clock. Bail out. */
                        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
                        return EXIT_FAILURE;
                    }

                    iteration_count = iteration_count + 1;

                    /* Compute an offset into the linear array file_ctime */
                    file_ctime_offset=offset(j - DIR_FIRST_LETTER_MIN,
                                             k - DIR_SECOND_LETTER_MIN,
                                             l - FILE_FIRST_LETTER_MIN,
                                             m - FILE_SECOND_LETTER_MIN);

                    (file_ctime+file_ctime_offset)->tv_sec = start_proc_hrt.tv_sec;
                    (file_ctime+file_ctime_offset)->tv_nsec = start_proc_hrt.tv_nsec;
                    /*
                    file_create_time = timediff(start_proc_hrt, end_proc_hrt);
                    file_create_total_time = file_create_total_time + file_create_time;
                    */

                } /* m for */
            } /* l for */
        } /* k for */
    } /* j for */

    /* NOTE this marks the end of the initial file create and 64k dump */

    if ( clock_gettime( CLOCK_REALTIME, &end_test1_hrt ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }

    if ( twister_flag == 0 ) fclose ( frandom );

    totaltime = timediff(start_hrt, end_test1_hrt);

    avgtime = (double)totaltime/((double)iteration_count * NANOSEC);

    avg_file_io = ((double)iteration_count * SIXTYFOURK )
                / ((double)totaltime * ONE_MEG * NANOSEC );

    printf("\nTEST (1) wall clock time was %.6f sec\n\n",
               (double)totaltime/NANOSEC );

    printf("%6li files \n", iteration_count);

    /*
    printf("          avg =%.6f sec\n", avgtime);

    printf("          IO avg rate =%.6f MB/s\n", avg_file_io);
    */

    printf("           random text generation time %.6f sec\n",
               (double)r64_dump_time_hrt/NANOSEC );

    printf("           actual file write time %.6f sec\n",
                ((double)totaltime/NANOSEC)
                -((double)r64_dump_time_hrt/NANOSEC));

    /*******************************************************************/

    printf ( "\nTEST 2 ) file append 2048 bytes.\n" );
    printf ( "Appending to file structure at %s\n", directory );

    /* we want a new time */
    if ( clock_gettime( CLOCK_REALTIME, &end_test1_hrt ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }

    totaltime = 0.0;
    iteration_count = 0;
    for (j=DIR_FIRST_LETTER_MIN; j<=DIR_FIRST_LETTER_MAX; j++) {
        for (k=DIR_SECOND_LETTER_MIN; k<=DIR_SECOND_LETTER_MAX; k++) {
            fid[0]=alph[j];
            fid[1]=alph[k];

            /******************************************************
             * Now we need an inner loop to change the filename.  *
             ******************************************************/

            for (l=FILE_FIRST_LETTER_MIN; l<=FILE_FIRST_LETTER_MAX; l++) {
                fid[3]=alph[l];
                for (m=FILE_SECOND_LETTER_MIN; m<=FILE_SECOND_LETTER_MAX; m++) {
                    fid[4]=alph[m];

                    filename_len = sizeof(filename);
                    strncpy(filename,directory,filename_len);

                    fid_len = sizeof(fid);
                    strncat(filename,fid,fid_len);

                    if ( clock_gettime( CLOCK_REALTIME, &start_proc_hrt ) == -1 ) {
                        /* We could not get the clock. Bail out. */
                        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
                        return EXIT_FAILURE ;
                    }

                    if ( ( fp = fopen ( filename, "a") ) == NULL ) {
                        /** There was an error **/
                        fprintf ( stderr, "%s: can't append to file %s\n", argv[0], filename );
                        fprintf ( stderr, "%s: ABORTING\n", argv[0]);
                        perror ("FAIL ");
                        return EXIT_FAILURE ;
                    } else {
                        /** append the data **/
                        append_2k ( fp );
                        fflush_err = fflush ( fp );
                        if ( fflush_err != 0 ) {
                            fprintf ( stderr, "fflush error %i", fflush_err );
                            return EXIT_FAILURE ;
                        }
                        fclose ( fp ); /* close the file and flush buffers */
                    }

                    if ( clock_gettime( CLOCK_REALTIME, &end_proc_hrt ) == -1 ) {
                        /* We could not get the clock. Bail out. */
                        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
                        return EXIT_FAILURE;
                    }

                    iteration_count = iteration_count + 1;

                } /* m for */
            } /* l for */
        } /* k for */
    } /* j for */

    if ( clock_gettime( CLOCK_REALTIME, &end_test2_hrt ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }

    totaltime = timediff(end_test1_hrt, end_test2_hrt);
    printf(" TEST (2) Wall Clock Total Time = %" PRIu64 " nsec = %.6f sec\n",
             totaltime, (double)totaltime/NANOSEC );

    printf ( "\nTEST 3 ) file append 749 bytes.\n" );

    totaltime = 0.0;
    iteration_count = 0;
    for (j=DIR_FIRST_LETTER_MIN; j<=DIR_FIRST_LETTER_MAX; j++) {
        for (k=DIR_SECOND_LETTER_MIN; k<=DIR_SECOND_LETTER_MAX; k++) {
            fid[0]=alph[j];
            fid[1]=alph[k];

            for (l=FILE_FIRST_LETTER_MIN; l<=FILE_FIRST_LETTER_MAX; l++) {
                fid[3]=alph[l];
                for (m=FILE_SECOND_LETTER_MIN; m<=FILE_SECOND_LETTER_MAX; m++) {
                    fid[4]=alph[m];

                    filename_len = sizeof(filename);
                    strncpy(filename,directory,filename_len);

                    fid_len = sizeof(fid);
                    strncat(filename,fid,fid_len);

                    if ( clock_gettime( CLOCK_REALTIME, &start_proc_hrt ) == -1 ) {
                        /* We could not get the clock. Bail out. */
                        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
                        return EXIT_FAILURE ;
                    }

                    if ( ( fp = fopen ( filename, "a") ) == NULL ) {
                        /** There was an error **/
                        fprintf ( stderr, "%s: can't append to file %s\n", argv[0], filename );
                        fprintf ( stderr, "%s: ABORTING\n", argv[0]);
                        perror ("FAIL ");
                        return EXIT_FAILURE ;
                    } else {
                        /** append the data **/
                        append_TSE ( fp );
                        fflush_err = fflush ( fp );
                        if ( fflush_err != 0 ) {
                            fprintf ( stderr, "fflush error %i", fflush_err );
                            return EXIT_FAILURE ;
                        }
                        fclose ( fp ); /* close the file and flush buffers */
                    }

                    if ( clock_gettime( CLOCK_REALTIME, &end_proc_hrt ) == -1 ) {
                        /* We could not get the clock. Bail out. */
                        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
                        return EXIT_FAILURE;
                    }

                    iteration_count = iteration_count + 1;

                } /* m for */
            } /* l for */
        } /* k for */
    } /* j for */

    if ( clock_gettime( CLOCK_REALTIME, &end_test3_hrt ) == -1 ) {
        /* We could not get the clock. Bail out. */
        fprintf(stderr,"ERROR : could not attain CLOCK_REALTIME\n");
        return EXIT_FAILURE;
    }

    totaltime = timediff(end_test2_hrt, end_test3_hrt);
    printf(" TEST (3) Wall Clock Total Time = %" PRIu64 " nsec = %.6f sec\n",
             totaltime, (double)totaltime/NANOSEC );

    printf("%6li files\n", iteration_count);

    free(file_ctime);
    file_ctime = NULL;

    return EXIT_SUCCESS;

} /* End of main */

/***********************************************************************/
/* A C-program for TT800 : July 8th 1996 Version */
/* by M. Matsumoto, email: matumoto@math.keio.ac.jp */
/* genrand() generate one pseudorandom number with double precision */
/* which is uniformly distributed on [0,1]-interval */
/* for each call.  One may choose any initial 25 seeds */
/* except all zeros. */

/* See: ACM Transactions on Modelling and Computer Simulation, */
/* Vol. 4, No. 3, 1994, pages 254-266. */

/* http://random.mat.sbg.ac.at/ftp/pub/data/tt800.c */

#define N 25
#define M 7

static double genrand(void) {
    unsigned long y;
    static int k = 0;
    static unsigned long x[N]={ /* initial 25 seeds, change as you wish */
        0x95f24dab, 0x0b685215, 0xe76ccae7, 0xaf3ec239, 0x715fad23,
        0x24a590ad, 0x69e4b5ef, 0xbf456141, 0x96bc1b7b, 0xa7bdf825,
        0xc1de75b7, 0x8858a9c9, 0x2da87693, 0xb657f9dd, 0xffdc8a9f,
        0x8121da71, 0x8b823ecb, 0x885d05f5, 0x4e20cd47, 0x5a9ad5d9,
        0x512c0c03, 0xea857ccd, 0x4cc1d30f, 0x8891a8a1, 0xa6b7aadb
    };
    static unsigned long mag01[2]={
        0x0, 0x8ebfd028 /* this is magic vector `a', don't change */
    };
    if (k==N) { /* generate N words at one time */
      int kk;
      for (kk=0;kk<N-M;kk++) {
        x[kk] = x[kk+M] ^ (x[kk] >> 1) ^ mag01[x[kk] % 2];
      }
      for (; kk<N;kk++) {
        x[kk] = x[kk+(M-N)] ^ (x[kk] >> 1) ^ mag01[x[kk] % 2];
      }
      k=0;
    }
    y = x[k];
    y ^= (y << 7) & 0x2b5b2500; /* s and b, magic vectors */
    y ^= (y << 15) & 0xdb8b0000; /* t and c, magic vectors */
    y &= 0xffffffff; /* you may delete this line if word size = 32 */
/*
   the following line was added by Makoto Matsumoto in the 1996 version
   to improve lower bit's corellation.
   Delete this line to use the code published in 1994.
*/
    y ^= (y >> 16); /* added to the 1994 version */
    k++;
    return( (double) y / (unsigned long) 0xffffffff);
}
/**************************************************************************/

/*********************************************
 *  Append 2048 bytes of data to file        *
 *********************************************/
void append_2k ( FILE *fp ) {
    /* dylan */
    int i;
    for ( i = 0; i<936 ; ++i )
        fprintf ( fp, "\n" );

    fprintf( fp, "Suddenly I felt as if I had more to say.\n\n");
    fprintf( fp, "\n\n------------- Rage against the dying of the disk -----------\n\n");
    fprintf( fp, "Do not go slowly into that good server,\n");
    fprintf( fp, "Old disks should spin and seek at close of file;\n");
    fprintf( fp, "Rage, rage against the dying of the disk.\n");
    fprintf( fp, "\n");
    fprintf( fp, "Though write cache is fast wise men will not waver,\n");
    fprintf( fp, "Because forking data without trust is like cold bile.\n");
    fprintf( fp, "Rage, rage against the dying of the disk.\n");
    fprintf( fp, "\n");
    fprintf( fp, "Good men, disable write cache, crying how right\n");
    fprintf( fp, "Their frail Sparc 5 might have danced with fibre array,\n");
    fprintf( fp, "Rage, rage against the dying of the disk.\n");
    fprintf( fp, "\n");
    fprintf( fp, "Wild men who caught and sang the Solaris in flight,\n");
    fprintf( fp, "And learn, too late, they grieved Linux on its way,\n");
    fprintf( fp, "Do not go gentle into that good night.\n");
    fprintf( fp, "\n");
    fprintf( fp, "Grave Sparc, near death, will seek with blinding photon\n");
    fprintf( fp, "Blind panic will blaze while Opterons sing a new day,\n");
    fprintf( fp, "Oh William, Oh William where is your Joy?\n");
    fprintf( fp, "Rage, rage against the dying of the disk.\n");
    fprintf( fp, "\n");
    fprintf( fp, "And you, my Sparc, there with sad Alpha chip,\n");
    fprintf( fp, "Curse, watch as x86 Solaris holds back the dawn,\n");
    fprintf( fp, "Do not go gentle into that good night.\n");
    fprintf( fp, "Rage, rage against the dying of the disk.\n");
    fprintf( fp, "\n\n\t\tWith apologies to Dylan from Dennis dclarke@blastwave.org\n\n");
}

/************************************************
 * Append a little more                         *
 ************************************************/
void append_TSE ( FILE *fp ) {
    /* From Thomas Sterns Elliot ... */
    fprintf( fp, "\n\n------------------------------------------------------\n");
    fprintf( fp, "My mind it seems is oft at play.\n\n");
    fprintf( fp, "\n\n------------------------------------------------------\n");

    fprintf( fp, "WEBSTER was much possessed by death\n");
    fprintf( fp, "And saw the skull beneath the skin;\n");
    fprintf( fp, "And breastless creatures under ground\n");
    fprintf( fp, "Leaned backward with a lipless grin.\n");
    fprintf( fp, "\n");

    fprintf( fp, "Daffodil bulbs instead of balls               5\n");
    fprintf( fp, "Stared from the sockets of the eyes!\n");
    fprintf( fp, "He knew that thought clings round dead limbs\n");
    fprintf( fp, "Tightening its lusts and luxuries.\n");
    fprintf( fp, "\n");

    fprintf( fp, "Donne, I suppose, was such another\n");
    fprintf( fp, "Who found no substitute for sense,            10\n");
    fprintf( fp, "To seize and clutch and penetrate;\n");
    fprintf( fp, "Expert beyond experience,\n");
    fprintf( fp, "\n");

    fprintf( fp, "He knew the anguish of the marrow\n");
    fprintf( fp, "The ague of the skeleton;\n");
    fprintf( fp, "No contact possible to flesh                  15\n");
    fprintf( fp, "Allayed the fever of the bone.\n");
    fprintf( fp, "\n");

}

