
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

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <errno.h>
#include <locale.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>

#define NUM_ELEMENTS 16777216
#define BAIL_OUT 32768
#define MAGNIFY 268435456
#define REAL_COORD 0.39975096035050228
#define IMAG_COORD 0.20525179748074152

#define VERBOSE 1
int sysinfo(int verbose);

int main ( int argc, char **argv) {

    FILE *fp;
    struct stat status_buffer;
    size_t num_written;

    time_t time_now;
    char timestamp_filename[32];

    double c_r = REAL_COORD;
    double c_j = IMAG_COORD;
    int bail_out = BAIL_OUT;
    int magnify = MAGNIFY;
    int num_elements = NUM_ELEMENTS;

    setlocale (LC_ALL, "POSIX");

    int status = setenv("TZ", "GMT0", 1);
    if ( status < 0 ) {
        fprintf (stderr,"FAIL : can not set timezone TZ = GMT0\n");
        return EXIT_FAILURE;
    }

    sysinfo(VERBOSE);

    time(&time_now);
    struct tm *ptm = localtime(&time_now);

    setlocale (LC_ALL, "POSIX");

    size_t filename_len = strftime(timestamp_filename, 32, "%Y%m%d%H%M%S", ptm);

    printf("DBUG : filename len = %lu\n", filename_len);
    printf("     : filename     = \"%s\"\n", timestamp_filename);

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

    num_written = fwrite( &c_r, sizeof(double), 1, fp);
    printf("DBUG : %2lu byte double  c_r           num_written = %lu\n",
            sizeof(double), num_written);

    num_written = fwrite( &c_j, sizeof(double), 1, fp);
    printf("     : %2lu byte double  c_j           num_written = %lu\n",
            sizeof(double), num_written);

    num_written = fwrite( &bail_out, sizeof(int), 1, fp);
    printf("     : %2lu byte integer bail_out      num_written = %lu\n",
            sizeof(int), num_written);

    num_written = fwrite( &magnify, sizeof(int), 1, fp);
    printf("     : %2lu byte integer magnify       num_written = %lu\n",
            sizeof(int), num_written);

    num_written = fwrite( &num_elements, sizeof(int), 1, fp);
    printf("     : %2lu byte integer num_elements  num_written = %lu\n",
            sizeof(int), num_written);


    fclose(fp);

    return EXIT_SUCCESS;

}

