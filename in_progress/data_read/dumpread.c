
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

uint64_t rot8(uint64_t x);
uint32_t rot4(uint32_t x);

int main (int argc, char **argv)
{

    FILE *fp;
    struct stat status_buffer;
    int status;
    char *tmpdir, *tmp;
    size_t num_read, len;
    struct tm *ptm;

    time_t time_now;
    char *filename;
    char timestamp[32];
    char *err_status;

    double c_r, c_j, magnify;
    int bail_out, num_elements;

    uint64_t rotated64;
    uint32_t rotated32;

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

#ifndef PATH_MAX
#define PATH_MAX 255
    printf("PATH_MAX defined to be");
#else
    printf("PATH_MAX seems to be");
#endif
    printf(" %i\n", PATH_MAX);

    /* better check if argv[1] even exists */
    if (argc>1) {
        len = strlen(argv[1]);
        if ( len > PATH_MAX ) {
            fprintf ( stderr, "FAIL : filename too long.\n");
            return EXIT_FAILURE;
        }
        tmp = strncpy(filename, argv[1], len);

        /* A trailing slashe on a pathname forces resolution of
         * the name to a directory. So strip off leading and 
         * trailing spaces and extra leading slashes or any
         * trailing slashes */



        status = stat(filename, &status_buffer);
    } else {
        fprintf ( stderr, "FAIL : give a filename to read\n");
        return EXIT_FAILURE;
    }

    /* check that we have a valid status and if we do not
     * then check for a pile of possible errors : 
     *
     */

    if ( status < 0 ) {
        /* check for a pile of things that could have gone
         * wrong */
        switch(errno) {
            case EFAULT :
                fprintf ( stderr, "ERROR : EFAULT\n" );
                break;
            case ENOENT :
                fprintf ( stderr, "ERROR : ENOENT\n" );
                break;
            case EBADF :
                fprintf ( stderr, "ERROR : EBADF\n" );
                break;
            default :
                fprintf ( stderr, "ERROR : something bad happened.\n" );
        }
        perror("ERROR ");


        /* all manner of bad stuff can happen
         *
       EACCES Search  permission  is  denied for one of the directories in the
              path prefix of pathname.  (See also path_resolution(7).)

       EBADF  fd is not a valid open file descriptor.

       EFAULT Bad address.

       ELOOP  Too many symbolic links encountered while traversing the path.

       ENAMETOOLONG
              pathname is too long.

       ENOENT A component of pathname does not exist, or pathname is an  empty
              string and AT_EMPTY_PATH was not specified in flags.

       ENOMEM Out of memory (i.e., kernel memory).

       ENOTDIR
              A component of the path prefix of pathname is not a directory.

       EOVERFLOW
              pathname  or  fd  refers  to a file whose size, inode number, or
              number of blocks cannot be  represented  in,  respectively,  the
              types off_t, ino_t, or blkcnt_t.  This error can occur when, for
              example, an application compiled on a  32-bit  platform  without
              -D_FILE_OFFSET_BITS=64 calls stat() on a file whose size exceeds
              (1<<31)-1 bytes.

       The following additional errors can occur for fstatat():

       EBADF  dirfd is not a valid file descriptor.

       EINVAL Invalid flag specified in flags.

       ENOTDIR
              pathname is relative and dirfd is a file descriptor referring to
              a file other than a directory.


     */

    } else {

        /* print the file creation time */
        printf ("creation time of that file is st_ctime) = \"%s\"\n",
                                       ctime(&status_buffer.st_ctime));

    }


    status = stat(argv[1], &status_buffer);
    if ( status == 0 ) {
        fprintf (stderr,"FAIL : file already exists?\n");
        return EXIT_FAILURE;
    }

    errno = 0;
    fp = fopen(filename, "rb");

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



    /****************************************************************
     *
     *     we do not care about the endian state of the machine
     *
     *                  in the output file
     *
     ****************************************************************
    num_written = fwrite(&endian_flag, sizeof(uint8_t), 1, fp);
    printf("DBUG : %2lu byte uint8_t endian_flag   num_written = %lu\n",
            sizeof(uint8_t), num_written);
     */

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

