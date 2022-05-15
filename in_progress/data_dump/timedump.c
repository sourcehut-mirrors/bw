
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
    int magnify = MAGNIFY;
    int num_elements = NUM_ELEMENTS;
    int status;
    char *tmpdir;

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
    /* TODO check the calloc return value */

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

    num_written = fwrite(&num_elements, sizeof(uint32_t), 1, fp);
    printf("     : %2lu byte uint32_t num_elements num_written = %lu\n",
            sizeof(uint32_t), num_written);
    printf("     : num_elements = %8i\n",num_elements);

    num_written = fwrite(&bail_out, sizeof(uint32_t), 1, fp);
    printf("     : %2lu byte uint32_t bail_out     num_written = %lu\n",
            sizeof(uint32_t), num_written);
    printf("     : bail_out = %8i\n",bail_out);

    num_written = fwrite(&magnify, sizeof(double), 1, fp);
    printf("     : %2lu byte double magnify        num_written = %lu\n",
            sizeof(double), num_written);
    printf("     :        magnify = %-+26.20e\n", magnify);

    num_written = fwrite(&c_r, sizeof(double), 1, fp);
    printf("DBUG : %2lu byte double c_r num_written = %lu\n",
            sizeof(double), num_written);
    printf("     : c_r = %-+26.20e\n",c_r);

    num_written = fwrite(&c_j, sizeof(double), 1, fp);
    printf("     : %2lu byte double c_j num_written = %lu\n",
            sizeof(double), num_written);
    printf("     : c_j = %-+26.20e\n",c_j);

    fclose(fp);
    fprintf (stderr,"INFO : file %s closed.\n",timestamp_filename);

    return EXIT_SUCCESS;

}

