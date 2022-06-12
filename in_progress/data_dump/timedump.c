
/*
 * timedump.c  Create a binary outfile with floating point and integer
 *             data. The filename is the current GMT0 time expressed
 *             to the nearest second in format YYYYMMDDhhmms.
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
#include <iso646.h>
#include <limits.h>
#include <inttypes.h>
#include <time.h>
#include <locale.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define NUM_ELEMENTS 16777216
#define BAIL_OUT 32768
#define MAGNIFY 268435456
#define REAL_COORD 0.399750960350502282381
#define IMAG_COORD 0.205251797480741515756

#define VERBOSE 1

/* swap bytes around to change endian */
#define htonll(x) (((uint64_t)htonl((x) & 0xFFFFFFFF) << 32) | htonl((x) >> 32))


uint64_t rot8(uint64_t x)
{

    uint64_t result, b[8] = {0,0,0,0,0,0,0,0};

    b[0] = ( ( x & 0xffULL ) << 56 );
    b[1] = ( ( x & 0xff00ULL ) << 40 );
    b[2] = ( ( x & 0xff0000ULL ) << 24 );
    b[3] = ( ( x & 0xff000000ULL ) << 8 );
    b[4] = ( ( x & 0xff00000000ULL ) >> 8 );
    b[5] = ( ( x & 0xff0000000000ULL ) >> 24 );
    b[6] = ( ( x & 0xff000000000000ULL ) >> 40 );
    b[7] = ( x >> 56 );

    result = b[0] | b[1] | b[2] | b[3] | b[4] | b[5] | b[6] | b[7];

    return result;

}


uint32_t rot4(uint32_t x)
{
    uint32_t result, b[4] = {0,0,0,0};

    b[0] = ( ( x & 0xff ) << 24 );
    b[1] = ( ( x & 0xff00 ) << 8 );
    b[2] = ( ( x & 0xff0000 ) >> 8 );
    b[3] = ( ( x & 0xff000000 ) >> 24 );

    result = b[0] | b[1] | b[2] | b[3];

    return result;

}



int sysinfo(int verbose);

int main ( int argc, char **argv) {

    FILE *fp;
    struct stat status_buffer;
    size_t num_written, filename_len;
    struct tm *ptm;

    time_t time_now;
    char *timestamp_filename;
    char timestamp[32];
    char *err_status;

    double c_r = REAL_COORD;
    double c_j = IMAG_COORD;
    int bail_out = BAIL_OUT;
    double magnify = MAGNIFY;
    int num_elements = NUM_ELEMENTS;
    int status;
    char *tmpdir;

    uint64_t rotated64;
    uint32_t rotated32;

    setlocale (LC_ALL, "POSIX");

    status = setenv("TZ", "GMT0", 1);
    if ( status < 0 ) {
        fprintf (stderr,"FAIL : can not set timezone TZ = GMT0\n");
        return EXIT_FAILURE;
    }

    tmpdir = getenv("TMPDIR");
    if ( tmpdir == NULL ) {
        printf("No TMPDIR");
        return EXIT_FAILURE;
    }

    sysinfo(VERBOSE);

    time(&time_now);
    ptm = gmtime(&time_now);
    filename_len = strftime(timestamp, 32, "%Y%m%d%H%M%S", ptm);
    time(&time_now);

    timestamp_filename = calloc(_POSIX_PATH_MAX,sizeof(unsigned char));
    if ( timestamp_filename == NULL ) {
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

    err_status = strcat(timestamp_filename, tmpdir);

	if (tmpdir[strlen(tmpdir)-1] != '/' ) {
        err_status = strcat(timestamp_filename, "/");
	}

    err_status = strcat(timestamp_filename, timestamp);

    status = stat(timestamp_filename, &status_buffer);
    if ( status == 0 ) {
        fprintf (stderr,"FAIL : file already exists?\n");
        return EXIT_FAILURE;
    }

    errno = 0;
    fp = fopen(timestamp_filename, "wb");

    if ( fp == NULL ) {
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    /* WARNING : these are blind writes and no effort has
     *           been made to check that the data was in
     *           fact actually written nor has there been
     *           any error checking. Trivial permission
     *           issues are caught by the fopen() call
     *           but not much else.
     */

    /* guess the architecture endianess */
    int end_check = 1;
    /* strictly speaking this is not a wise way to do this */
    uint8_t endian_flag = (*(uint8_t*)&end_check == 1) ? 0 : 16;

    fprintf (stderr,"INFO : file %s/%s dump begins.\n",tmpdir,timestamp);
    /* if the machine is big endian we get endian_flag = 0x10 */
    num_written = fwrite(&endian_flag, sizeof(uint8_t), 1, fp);
    printf("DBUG : %2lu byte uint8_t endian_flag   num_written = %lu\n",
            sizeof(uint8_t), num_written);


    /* if this machine is big endian then we swap around the bytes
     * to give us little endian output in the file */
    if ( endian_flag ) {
        /* a test integer which is bytes 0x12345678 */
        /* int test_int = 305419896; */
        /* rotated32 = rot4(test_int); */
        rotated32 = rot4(num_elements);
        num_written = fwrite(&rotated32, sizeof(uint32_t), 1, fp);
    } else {
        num_written = fwrite(&num_elements, sizeof(uint32_t), 1, fp);
    }
    printf("     : %2lu byte uint32_t num_elements num_written = %lu\n",
                sizeof(uint32_t), num_written);
    printf("     : num_elements = %8i\n",num_elements);

    if ( endian_flag ) {
        rotated32 = rot4(bail_out);
        num_written = fwrite(&rotated32, sizeof(uint32_t), 1, fp);
    } else {
        num_written = fwrite(&bail_out, sizeof(uint32_t), 1, fp);
    }
    printf("     : %2lu byte uint32_t bail_out     num_written = %lu\n",
            sizeof(uint32_t), num_written);
    printf("     : bail_out = %8i\n",bail_out);

    /* need to swap around bytes of the 8-byte floating point double */
    if ( endian_flag ) {
        rotated64 = rot8(*((uint64_t *)&magnify));
        num_written = fwrite(&rotated64, sizeof(uint64_t), 1, fp);
    } else {
        num_written = fwrite(&magnify, sizeof(double), 1, fp);
    }
    printf("     : %2lu byte double magnify        num_written = %lu\n",
            sizeof(double), num_written);
    printf("     :        magnify = %-+26.20e\n", magnify);

    if ( endian_flag ) {
        rotated64 = rot8(*((uint64_t *)&c_r));
        num_written = fwrite(&rotated64, sizeof(uint64_t), 1, fp);
    } else {
        num_written = fwrite(&c_r, sizeof(double), 1, fp);
    }
    printf("DBUG : %2lu byte double c_r num_written = %lu\n",
            sizeof(double), num_written);
    printf("     : c_r = %-+26.20e\n",c_r);

    if ( endian_flag ) {
        rotated64 = rot8(*((uint64_t *)&c_j));
        num_written = fwrite(&rotated64, sizeof(uint64_t), 1, fp);
    } else {
        num_written = fwrite(&c_j, sizeof(double), 1, fp);
    }
    printf("     : %2lu byte double c_j num_written = %lu\n",
            sizeof(double), num_written);
    printf("     : c_j = %-+26.20e\n",c_j);

    fclose(fp);
    fprintf (stderr,"INFO : file %s closed.\n",timestamp_filename);

    free(timestamp_filename);
    timestamp_filename = NULL;

    return EXIT_SUCCESS;

}

