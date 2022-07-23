
/*
 * dumpread.c  Read in the little endian data dump.
 *
 * Copyright (C) Dennis Clarke 2022
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
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <inttypes.h>
#include <time.h>
#include <locale.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include "dumpread.h"

int main (int argc, char **argv)
{

    FILE *fp;
    struct stat status_buffer;
    int status, file_error_status;
    char *tmpdir, *tmp;
    size_t num_read, len;
    struct tm *ptm;

    int end_check = 1;
    uint8_t endian_flag;

    time_t time_now;
    char *filename, *fid;
    char timestamp[32];

    uint32_t temp32bit;
    uint64_t temp64bit;
    uint64_t rotated64;
    double *fp64;
    uint32_t rotated32;

    /* the actual data we are trying to read */
    uint32_t num_elements, mandel_bail_out;
    double magnify, c_r, c_j;


    setlocale (LC_ALL, "C");

    status = setenv("TZ", "GMT0", 1);
    if ( status < 0 ) {
        fprintf (stderr,"FAIL : can not set timezone TZ = GMT0\n");
        return EXIT_FAILURE;
    }

    tmpdir = getenv("TMPDIR");
    if ( tmpdir == NULL ) {
        printf("env var TMPDIR not set\n");
        return EXIT_FAILURE;
    }

    sysinfo(VERBOSE);

    time(&time_now);
    ptm = gmtime(&time_now);
    len = strftime(timestamp, 32, "%Y%m%d%H%M%S", ptm);
    time(&time_now);

    /* better check if argv[1] even exists */
    if (argc>1) {
        len = strlen(argv[1]);
        if (len > LOCAL_PATH_MAX) {
            fprintf(stderr, "FAIL : filename too long.\n");
            fprintf(stderr, "     : limit is %i chars.\n",
                                      LOCAL_PATH_MAX);
            return EXIT_FAILURE;
        }
        /* ensure that the filename string has a terminating nul */
        filename = calloc(LOCAL_PATH_MAX+1, sizeof(unsigned char));
        if ( filename == NULL ) {
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

        tmp = strncpy(filename, argv[1], len);

        /* A trailing slash on a pathname forces resolution of
         * the name to a directory. So strip off leading and 
         * trailing spaces first. */
        fid = strtrim(filename);
        /* do we still have a filename ? */
        len = strlen(fid);
        if (len>0) {
            /* remove trailing slashes */
            while ((fid[len-1] == '/') && (len>0)) {
                fid[len-1] = '\0';
                len = strlen(fid);
            }

            /* do we still have a filename ? */
            if (len==0) {
                fprintf(stderr, "FAIL : filename is invalid\n");
                free(filename);
                filename = NULL;
                return EXIT_FAILURE;
            } else {
                errno = 0;
                status = stat(filename, &status_buffer);
            }
        } else {
            fprintf(stderr, "FAIL : filename is invalid\n");
            free(filename);
            filename = NULL;
            return EXIT_FAILURE;
        }
    } else {
        fprintf(stderr, "FAIL : give a filename to read\n");
        return EXIT_FAILURE;
    }

    /* check that we have a valid status and if we do not
     * then check for a pile of possible errors and bail out. */
    if (status != 0) {
        /* what went wrong? */
        file_stat_err(errno);
        free(filename);
        filename = NULL;
        return EXIT_FAILURE;
    } else {
        printf("INFO : creation time of file is st_ctime) = \"%s\"\n",
                                       ctime(&status_buffer.st_ctime));
    }

    errno = 0;
    fp = fopen(filename, "rb");

    if (fp == NULL) {
        perror("FAIL ");
        free(filename);
        filename = NULL;
        return EXIT_FAILURE;
    }
    errno = 0;

    /* if the machine is big endian we get
     * endian_flag = 0x10 */
    endian_flag = (*(uint8_t*)&end_check == 1) ? 0 : 16;

    printf("INFO : machine is ");
    printf("%s", endian_flag == 0 ? "little" : "big");
    printf(" endian\n");

    /* if this machine is big endian then we swap around the bytes
     * to give us little endian output in the file */
    clearerr(fp);
    num_read = fread((void *)&temp32bit, sizeof(uint32_t), 1, fp);
    file_error_status = ferror(fp);
    if ( file_error_status != 0 ) {
        fprintf(stderr,"ERR  : some read error occured.\n");
        fprintf(stderr,"     : check the filename.\n");
        goto bail_out;
    }
    printf("INFO : read %i items of type uint32_t from file %s\n",
                                                       num_read, fid);

    if ( num_read < 1 ) {
        /* we have a short read 
         * check if end of file */
        if ( feof(fp) != 0 ) {
            fprintf(stderr,"ERR  : End of file\n");
        } else {
            fprintf(stderr,"ERR  : insufficient data read\n");
        }
        goto bail_out;
    }

    if ( endian_flag ) {
        /* we are on a big endian machine so we need
         * to swap around the bye order of the data
         * read from the little endian file. */
        rotated32 = rot4(temp32bit);
        temp32bit = rotated32;
    }
    num_elements = temp32bit;
    printf("     : uint32_t    num_elements = %i\n", num_elements);

    /* check for early end of file */
    clearerr(fp);
    if ( feof(fp) != 0 ) {
        fprintf(stderr,"ERR  : End of file\n");
        goto bail_out;
    }

    num_read = fread((void *)&temp32bit, sizeof(uint32_t), 1, fp);
    file_error_status = ferror(fp);
    if ( file_error_status != 0 ) {
        fprintf(stderr,"ERR  : some read error occured.\n");
        fprintf(stderr,"     : check the filename.\n");
        goto bail_out;
    }
    printf("INFO : read %i items of type uint32_t\n", num_read);
    if ( num_read < 1 ) {
        /* we have a short read 
         * check if end of file */
        if ( feof(fp) != 0 ) {
            fprintf(stderr,"ERR  : End of file\n");
        } else {
            fprintf(stderr,"ERR  : insufficient data read\n");
        }
        goto bail_out;
    }

    if ( endian_flag ) {
        rotated32 = rot4(temp32bit);
        temp32bit = rotated32;
    }
    mandel_bail_out = temp32bit;
    printf("     : uint32_t mandel_bail_out = %i\n", mandel_bail_out);

    /* check for early end of file */
    clearerr(fp);
    if ( feof(fp) != 0 ) {
        fprintf(stderr,"ERR  : End of file\n");
        goto bail_out;
    }

    /* Now we read in 64bits of data and deal with it
     * as IEEE-754 floating point double later.
     * Why ?
     * Because a big endian machine would interpret
     * the little endian data as a NaN or a sub-normal
     * or perhaps just nasty messy double value. */
    num_read = fread((void *)&temp64bit, sizeof(uint64_t), 1, fp);
    file_error_status = ferror(fp);
    if ( file_error_status != 0 ) {
        fprintf(stderr,"ERR  : some read error occured.\n");
        fprintf(stderr,"     : check the filename.\n");
        goto bail_out;
    }
    printf("INFO : read %i items of type uint64_t\n", num_read);
    if ( num_read < 1 ) {
        /* check if end of file */
        if ( feof(fp) != 0 ) {
            fprintf(stderr,"ERR  : End of file\n");
        } else {
            fprintf(stderr,"ERR  : insufficient data read\n");
        }
        goto bail_out;
    }

    if ( endian_flag ) {
        rotated64 = rot8(temp64bit);
        fp64 = memcpy(&magnify,(void *)&rotated64, sizeof(double));
    } else {
        fp64 = memcpy(&magnify,(void *)&temp64bit, sizeof(double));
    }
    printf("     : double           magnify = %-+32.26e\n", magnify);


    /* check for early end of file */
    clearerr(fp);
    if ( feof(fp) != 0 ) {
        fprintf(stderr,"ERR  : End of file\n");
        goto bail_out;
    }

    num_read = fread((void *)&temp64bit, sizeof(uint64_t), 1, fp);
    file_error_status = ferror(fp);
    if ( file_error_status != 0 ) {
        fprintf(stderr,"ERR  : some read error occured.\n");
        fprintf(stderr,"     : check the filename.\n");
        goto bail_out;
    }
    printf("INFO : read %i items of type uint64_t\n", num_read);
    if ( num_read < 1 ) {
        /* check if end of file */
        if ( feof(fp) != 0 ) {
            fprintf(stderr,"ERR  : End of file\n");
        } else {
            fprintf(stderr,"ERR  : insufficient data read\n");
        }
        goto bail_out;
    }

    if ( endian_flag ) {
        rotated64 = rot8(temp64bit);
        fp64 = memcpy(&c_r,(void *)&rotated64, sizeof(double));
    } else {
        fp64 = memcpy(&c_r,(void *)&temp64bit, sizeof(double));
    }
    printf("     : double               c_r = %-+32.26e\n", c_r);



    /* check for early end of file */
    clearerr(fp);
    if ( feof(fp) != 0 ) {
        fprintf(stderr,"ERR  : End of file\n");
        goto bail_out;
    }

    num_read = fread((void *)&temp64bit, sizeof(uint64_t), 1, fp);
    file_error_status = ferror(fp);
    if ( file_error_status != 0 ) {
        fprintf(stderr,"ERR  : some read error occured.\n");
        fprintf(stderr,"     : check the filename.\n");
        goto bail_out;
    }
    printf("INFO : read %i items of type uint64_t\n", num_read);
    if ( num_read < 1 ) {
        /* check if end of file */
        if ( feof(fp) != 0 ) {
            fprintf(stderr,"ERR  : End of file\n");
        } else {
            fprintf(stderr,"ERR  : insufficient data read\n");
        }
        goto bail_out;
    }

    if ( endian_flag ) {
        rotated64 = rot8(temp64bit);
        fp64 = memcpy(&c_j,(void *)&rotated64, sizeof(double));
    } else {
        fp64 = memcpy(&c_j,(void *)&temp64bit, sizeof(double));
    }
    printf("     : double               c_j = %-+32.26e\n", c_j);


bail_out:
    fclose(fp);
    fprintf (stderr,"INFO : file %s closed.\n",fid);

    free(filename);
    filename = NULL;

    return EXIT_SUCCESS;

}

