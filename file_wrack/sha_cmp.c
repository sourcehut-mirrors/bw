
/*
 * sha_cmp.c read in a list of sha512 hash lines from two files and
 *           report any matches between the two files.
 *
 * Copyright (C) Dennis Clarke 2021
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

/* the input files must be of the format 
 *
 * 0123456789abc....badcaffe some_file_name or string follows
 *
 * where the leading hex digits MUST be 128 chars of hex in order
 * to represent a SHA512 64-byte hash value.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <limits.h>

int main(int argc, char **argv)
{
    char *path0, *path1;
    struct stat status_buffer;
    char *linep = NULL;
    size_t line_length = 129;
    unsigned int line_count = 0;
    ssize_t chars_read = 0;
    int status;
    
    if (argc < 2) {
usage:
        fprintf (stderr,"USAGE : %s filename0 filename1\n", argv[0]);
        return EXIT_FAILURE;
    }

    status = stat(argv[1], &status_buffer);
    if ( status == 0 ) {
        path0 = argv[1];
        FILE *file0 = fopen(path0, "r");
        if (!file0) {
            perror(path0);
            return EXIT_FAILURE;
        }
    } else {
        fprintf (stderr,"FAIL  : some problem with %s\n", argv[1]);
        goto usage;
    }

    
    do {
        /* use fgets for C99 */
        chars_read = getdelim( &linep, &line_length, 0x20, file0);
        line_count += 1;

        printf("%s\n", linep);

    } while (chars_read > 0);
    
    if (fclose(file0)) {
        perror(path0);
        return EXIT_FAILURE;
    }

    free(linep);

    return EXIT_SUCCESS;

}

