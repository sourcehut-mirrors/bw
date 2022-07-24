
/*
 * data_cmp.c Given two file pathnames we read in the header
 *            data from both. See data format description in
 *            the xmand directory. The data values are then
 *            compared and all differences reported.
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

int fid_read(FILE *fp, void *ptr)
{

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

    /* now walk through the data handed to us in the 
     * pointer ptr and determine how much to read from
     * the file fp */

    /* if the machine is big endian we get
     * endian_flag = 0x10 */
    endian_flag = (*(uint8_t*)&end_check == 1) ? 0 : 16;











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

