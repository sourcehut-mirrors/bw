
/*
 * filetimes.c report the various essential UNIX timestamps for a file
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

#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <time.h>
#include <fcntl.h>

#define VERBOSE 1
int sysinfo(int verbose);

int main(int argc, char **argv)
{
    struct stat status_buffer;
    int status;

    FILE *fp;
    char *line = NULL;
    char *c_time_string, buff[64];
    size_t fwrite_ret, linecap = 0;
    ssize_t linelen;
    fpos_t fpos;
    int fpos_status;
    long ftell_pos;
    struct timespec start_tv;

    if ( argc < 2 ) {
        fprintf(stderr,"FAIL : provide a filename or pathname\n");
        errno = EINVAL;
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    setlocale ( LC_ALL, "POSIX" );
    if ( clock_gettime( CLOCK_REALTIME, &start_tv ) == -1 ) {
        perror( "clock gettime" );
        return EXIT_FAILURE;
    }

    /* note that we no longer will get an ENOMEM from the
     * sysctlbyname call.  See sysinfo.c for details. */
    sysinfo(VERBOSE);

    c_time_string = ctime( &start_tv.tv_sec );

    errno = 0;
    status = stat(argv[1], &status_buffer);
    if ( status == 0 ) {
        fprintf (stderr,"\nINFO : current time is %s", c_time_string );
        fprintf (stderr,"     : three UNIX times of the file are :\n");

        /* access time */
        sprintf(buff,"     : ctime(&buffer.st_atime) = %s",
                                        ctime(&status_buffer.st_atime));
        buff[57] = '\0';
        fprintf (stderr,"%s\n", buff);

        /* modification time */
        sprintf(buff,"     :              .st_mtime) = %s",
                                        ctime(&status_buffer.st_mtime));
        buff[57] = '\0';
        fprintf (stderr,"%s\n", buff);

        /* creation time */
        sprintf(buff,"     :              .st_ctime) = %s",
                                        ctime(&status_buffer.st_ctime));
        buff[57] = '\0';
        fprintf (stderr,"%s\n", buff);

    } else {
        perror("FAIL ");
        return EXIT_FAILURE;
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


    size_t line_length, line_count, char_count;

    errno = 0;
    line = calloc(8192,sizeof(unsigned char));
    if ( line == NULL ) {
        /* really? possible ENOMEM? */
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

    int some_char = 0;
    int end_of_file = 0;

    /* NOTE : for fgetc()
     *
     *       If the stream is at end-of-file or a read error occurs, the
     *       return is EOF. The routines feof(3) and ferror(3) must be
     *       used to distinguish between end-of-file and error.
     *
     *       If an error occurs, the global variable errno is set to
     *       indicate the error.
     */
    char_count = 0;
    line_count = 0;
    errno = 0;
    do {
        some_char = fgetc(fp);
        if ( some_char == EOF ) {
            if ( feof(fp) ) {
                if ( char_count > 0 ) {
                    /* we hit end of file and the line has
                     * valid chars in it. */
                    line[char_count] = '\0';
                    printf("%-6i    %-4i    \"%s\"\n",line_count,char_count,line);
                } else {
                    line[0] = '\0';
                }
                end_of_file = 1;
            } else {
                /* this is a read error */
                perror("FAIL ");
                free(line);
                return EXIT_FAILURE;
            }
        } else {
            line[char_count] = (uint8_t)some_char;
            char_count += 1;
            /* end of line has a new_line char and we remove it */
            if ( line[char_count - 1] == '\n' ) {
                line[char_count - 1] = '\0';
                line_count += 1;
                printf("%-6i    %-4i    \"%s\"\n",line_count,char_count,line);
                char_count = 0;
                line[0] = '\0';
            }
        }
    } while (end_of_file == 0);

    ftell_pos = ftell(fp);
    if ( ftell_pos < 0 ) {
        perror("FAIL ");
        free(line);
        return EXIT_FAILURE;
    }
    fprintf(stderr,"\nINFO : ftell_pos = %-6i\n", ftell_pos);

    if ( ferror(fp) != 0 ) {
        fprintf(stderr,"\nWARN : some sort of an error occured??\n");
    }

    if ( feof(fp) != 0 ) {
        fprintf(stderr,"INFO : we did hit EOF\n");
    }

    if ( fclose(fp) != 0 ) {
        fprintf(stderr,"\nWARN : fclose returned an error.\n");
        perror("FAIL ");
        free(line);
        return EXIT_FAILURE;
    }

    /* we seem to do this everywhere */
    free(line);

    fprintf(stderr,"INFO : file %s is now closed\n\n", argv[1]);

    status = stat(argv[1], &status_buffer);
    if ( status == 0 ) {
        fprintf (stderr,"\nINFO : three UNIX times are now :\n");

        /* access time */
        sprintf(buff,"     : ctime(&buffer.st_atime) = %s",
                                        ctime(&status_buffer.st_atime));
        buff[57] = '\0';
        fprintf (stderr,"%s\n", buff);

        /* modification time */
        sprintf(buff,"     :              .st_mtime) = %s",
                                        ctime(&status_buffer.st_mtime));
        buff[57] = '\0';
        fprintf (stderr,"%s\n", buff);

        /* creation time */
        sprintf(buff,"     :              .st_ctime) = %s",
                                        ctime(&status_buffer.st_ctime));
        buff[57] = '\0';
        fprintf (stderr,"%s\n", buff);

    } else {
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;

}

