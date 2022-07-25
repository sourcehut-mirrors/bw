
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

/* this is a somewhat janky little function to compute
 * and index into the large data arrays */
static int array_index(int Vr, int Vj,
                       int Sr, int Sj,
                       int vbox_real_count,  
                       int vbox_sample_real, 
                       int vbox_sample_imag );

int main (int argc, char **argv)
{

    FILE *fp;
    struct stat status_buffer;
    int status, file_error_status;
    char *tmpdir, *tmp;
    size_t num_read, len;
    long file_position;
    struct tm *ptm;

    int end_check = 1;
    uint8_t endian_flag;

    time_t time_now;
    char st_ctime_buffer[128];
    char *filename, *fid;
    char timestamp[32];

    uint32_t temp32bit;
    uint64_t temp64bit;
    uint64_t rotated64;
    double *fp64, temp_double;
    uint32_t rotated32;

    /* the actual data we are trying to read */
    uint32_t num_elements, mandel_bail_out;
    double magnify, c_r, c_j;
    uint32_t vbox_real_count, vbox_imag_count; 
    uint32_t vbox_sample_real, vbox_sample_imag;

    /* these are the actual data arrays */
    uint32_t *mandel_val;
    double *coord_r, *coord_j;

    /* easy index vars for later */
    int Vr, Vj, Sr, Sj;

    /* we will need to know if we read the correct amount of data */
    uint32_t sample_counter;


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
        sprintf(st_ctime_buffer,
                "INFO : creation time of file = %s",
                                       ctime(&status_buffer.st_ctime));
        /* ctime tosses in a \n at the end
        len = strlen(st_ctime_buffer);
        st_ctime_buffer[len-1] = '\0';
        */
        printf(st_ctime_buffer);
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
        fprintf(stderr,"ERR  : read error occured.\n");
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
        fprintf(stderr,"ERR  : read error occured.\n");
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
        fprintf(stderr,"ERR  : read error occured.\n");
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
        fprintf(stderr,"ERR  : read error occured.\n");
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



    /* TODO make a function we can call to do this 32bit read */
    num_read = fread((void *)&temp32bit, sizeof(uint32_t), 1, fp);
    file_error_status = ferror(fp);
    if ( file_error_status != 0 ) {
        fprintf(stderr,"ERR  : read error occured.\n");
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
    vbox_real_count = temp32bit;
    printf("     : uint32_t vbox_real_count = %i\n", vbox_real_count);

    /* check for early end of file */
    clearerr(fp);
    if ( feof(fp) != 0 ) {
        fprintf(stderr,"ERR  : End of file\n");
        goto bail_out;
    }


    num_read = fread((void *)&temp32bit, sizeof(uint32_t), 1, fp);
    file_error_status = ferror(fp);
    if ( file_error_status != 0 ) {
        fprintf(stderr,"ERR  : read error occured.\n");
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
    vbox_imag_count = temp32bit;
    printf("     : uint32_t vbox_imag_count = %i\n", vbox_imag_count);





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
    vbox_sample_real = temp32bit;
    printf("     : uint32_t vbox_sample_real = %i\n", vbox_sample_real);




    /* check for early end of file */
    clearerr(fp);
    if ( feof(fp) != 0 ) {
        fprintf(stderr,"ERR  : End of file\n");
        goto bail_out;
    }

    num_read = fread((void *)&temp32bit, sizeof(uint32_t), 1, fp);
    file_error_status = ferror(fp);
    if ( file_error_status != 0 ) {
        fprintf(stderr,"ERR  : read error occured.\n");
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
    vbox_sample_imag = temp32bit;  
    printf("     : uint32_t vbox_sample_imag = %i\n", vbox_sample_imag);

    /* check for early end of file */
    clearerr(fp);
    if ( feof(fp) != 0 ) {
        fprintf(stderr,"ERR  : End of file\n");
        goto bail_out;
    }

    /* TODO verify that the data structure described in the header
     * contains the correct number of elements */



    /* allocate memory for the data section */
    mandel_val = calloc((size_t)num_elements, sizeof(uint32_t));
    if ( mandel_val == NULL ) {
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n", __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ );
        }
        perror("FAIL ");
        goto bail_out;
    }

    coord_r = calloc((size_t)num_elements, sizeof(double));
    if ( coord_r == NULL ) {
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n", __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ );
        }
        perror("FAIL ");
        free(mandel_val);
        mandel_val = NULL;
        goto bail_out;
    }

    coord_j = calloc((size_t)num_elements, sizeof(double));
    if ( coord_j == NULL ) {
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n", __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ );
        }
        perror("FAIL ");
        free(mandel_val);
        mandel_val = NULL;
        free(coord_r);
        coord_r = NULL;
        goto bail_out;
    }

    /* Now read the data section one vbox section at a time
     * working from the lower left ( 0, 0 ) upwards to 
     * the mysterious ( 15, 15 ). How could we know that
     * from the header data ? 
     *
     * TODO : modify the header data 
     */

    sample_counter = 0;
    for ( Vj = 0; Vj < vbox_imag_count; Vj++ ) {
        for ( Vr = 0; Vr < vbox_real_count; Vr++ ) {
            for ( Sj = 0; Sj < vbox_sample_imag; Sj++ ) {
                for ( Sr = 0; Sr < vbox_sample_real; Sr++ ) {
                    /* Each sample consists of
                     *
                     *  8 byte double    real_coord
                     *  8 byte double    imag_coord
                     *  4 byte uint32_t  mandel_val
                     */

                    /* read in the real component of the coordinate */
                    clearerr(fp);
                    if ( feof(fp) != 0 ) {
                        fprintf(stderr,"ERR  : End of file\n");
                        goto clean_up;
                    }

                    /* note that we read a uint64_t type  */
                    num_read = fread((void *)&temp64bit, sizeof(uint64_t), 1, fp);
                    file_error_status = ferror(fp);
                    if ( file_error_status != 0 ) {
                        fprintf(stderr,"ERR  : read error occured.\n");
                        goto clean_up;
                    }

                    if ( num_read < 1 ) {
                        /* check if end of file */
                        if ( feof(fp) != 0 ) {
                            fprintf(stderr,"ERR  : End of file\n");
                        } else {
                            fprintf(stderr,"ERR  : insufficient data read\n");
                        }
                        goto clean_up;
                    }

                    if ( endian_flag ) {
                        rotated64 = rot8(temp64bit);
                        fp64 = memcpy(&temp_double,(void *)&rotated64, sizeof(double));
                    } else {
                        fp64 = memcpy(&temp_double,(void *)&temp64bit, sizeof(double));
                    }

                    coord_r[array_index(Vr,Vj,Sr,Sj,vbox_real_count,vbox_sample_real,vbox_sample_imag)] = temp_double;


                    /* read in the imaginary component of the coordinate */
                    clearerr(fp);
                    if ( feof(fp) != 0 ) {
                        fprintf(stderr,"ERR  : End of file\n");
                        goto clean_up;
                    }

                    /* note that we read a uint64_t type  */
                    num_read = fread((void *)&temp64bit, sizeof(uint64_t), 1, fp);
                    file_error_status = ferror(fp);
                    if ( file_error_status != 0 ) {
                        fprintf(stderr,"ERR  : read error occured.\n");
                        goto clean_up;
                    }

                    if ( num_read < 1 ) {
                        /* check if end of file */
                        if ( feof(fp) != 0 ) {
                            fprintf(stderr,"ERR  : End of file\n");
                        } else {
                            fprintf(stderr,"ERR  : insufficient data read\n");
                        }
                        goto clean_up;
                    }

                    if ( endian_flag ) {
                        rotated64 = rot8(temp64bit);
                        fp64 = memcpy(&temp_double,(void *)&rotated64, sizeof(double));
                    } else {
                        fp64 = memcpy(&temp_double,(void *)&temp64bit, sizeof(double));
                    }

                    coord_j[array_index(Vr,Vj,Sr,Sj,vbox_real_count,vbox_sample_real,vbox_sample_imag)] = temp_double;



                    /* check for early end of file */
                    clearerr(fp);
                    if ( feof(fp) != 0 ) {
                        fprintf(stderr,"ERR  : End of file\n");
                        goto clean_up;
                    }

                    num_read = fread((void *)&temp32bit, sizeof(uint32_t), 1, fp);
                    file_error_status = ferror(fp);
                    if ( file_error_status != 0 ) {
                        fprintf(stderr,"ERR  : read error occured.\n");
                        goto clean_up;
                    }

                    if ( num_read < 1 ) {
                        /* we have a short read 
                         * check if end of file */
                        if ( feof(fp) != 0 ) {
                            fprintf(stderr,"ERR  : End of file\n");
                        } else {
                            fprintf(stderr,"ERR  : insufficient data read\n");
                        }
                        goto clean_up;
                    }

                    if ( endian_flag ) {
                        rotated32 = rot4(temp32bit);
                        temp32bit = rotated32;
                    }
                    mandel_val[array_index(Vr,Vj,Sr,Sj,vbox_real_count,vbox_sample_real,vbox_sample_imag)] = temp32bit;

                    sample_counter += 1;

                }
            }
        }
    }


    printf("\n--- data values -------------------------------------------------------\n");

    printf("     : r[ 0][ 0][ 0][ 0] = %-+32.26e\n",
     *(coord_r + array_index(0,0,0,0,vbox_real_count,vbox_sample_real,vbox_sample_imag)));

    printf("     : j[ 0][ 0][ 0][ 0] = %-+32.26e\n",
     *(coord_j + array_index(0,0,0,0,vbox_real_count,vbox_sample_real,vbox_sample_imag)));

    printf("     :       mand_height = %9i\n",   
     *(mandel_val + array_index(0,0,0,0,vbox_real_count,vbox_sample_real,vbox_sample_imag)));


    printf("     : r[ 7][ 7][63][63] = %-+32.26e\n",
     *(coord_r + array_index(7,7,63,63,vbox_real_count,vbox_sample_real,vbox_sample_imag)));

    printf("     : j[ 7][ 7][63][63] = %-+32.26e\n",
     *(coord_j + array_index(7,7,63,63,vbox_real_count,vbox_sample_real,vbox_sample_imag)));

    printf("     :       mand_height = %9i\n",   
     *(mandel_val + array_index(7,7,63,63,vbox_real_count,vbox_sample_real,vbox_sample_imag)));


    printf("     : r[ 8][ 8][ 0][ 0] = %-+32.26e\n",
     *(coord_r + array_index(8,8,0,0,vbox_real_count,vbox_sample_real,vbox_sample_imag)));

    printf("     : j[ 8][ 8][ 0][ 0] = %-+32.26e\n",
     *(coord_j + array_index(8,8,0,0,vbox_real_count,vbox_sample_real,vbox_sample_imag)));

    printf("     :       mand_height = %9i\n",   
     *(mandel_val + array_index(8,8,0,0,vbox_real_count,vbox_sample_real,vbox_sample_imag)));


    printf("     : r[ 8][ 8][ 1][ 0] = %-+32.26e\n",
     *(coord_r + array_index(8,8,1,0,vbox_real_count,vbox_sample_real,vbox_sample_imag)));

    printf("     : j[ 8][ 8][ 1][ 0] = %-+32.26e\n",
     *(coord_j + array_index(8,8,1,0,vbox_real_count,vbox_sample_real,vbox_sample_imag)));

    printf("     :       mand_height = %9i\n",   
     *(mandel_val + array_index(8,8,1,0,vbox_real_count,vbox_sample_real,vbox_sample_imag)));


    printf("     : r[ 8][ 8][32][32] = %-+32.26e\n",
     *(coord_r + array_index(8,8,32,32,vbox_real_count,vbox_sample_real,vbox_sample_imag)));

    printf("     : j[ 8][ 8][32][32] = %-+32.26e\n",
     *(coord_j + array_index(8,8,32,32,vbox_real_count,vbox_sample_real,vbox_sample_imag)));

    printf("     :       mand_height = %9i\n",   
     *(mandel_val + array_index(8,8,32,32,vbox_real_count,vbox_sample_real,vbox_sample_imag)));


    printf("     : r[ 3][12][44][21] = %-+32.26e\n",
     *(coord_r + array_index(3,12,44,21,vbox_real_count,vbox_sample_real,vbox_sample_imag)));

    printf("     : j[ 3][12][44][21] = %-+32.26e\n",
     *(coord_j + array_index(3,12,44,21,vbox_real_count,vbox_sample_real,vbox_sample_imag)));

    printf("     :       mand_height = %9i\n",   
     *(mandel_val + array_index(3,12,44,21,vbox_real_count,vbox_sample_real,vbox_sample_imag)));


    printf("     : r[15][15][63][63] = %-+32.26e\n",
     *(coord_r + array_index(15,15,63,63,vbox_real_count,vbox_sample_real,vbox_sample_imag)));

    printf("     : j[15][15][63][63] = %-+32.26e\n",
     *(coord_j + array_index(15,15,63,63,vbox_real_count,vbox_sample_real,vbox_sample_imag)));

    printf("     :       mand_height = %9i\n",   
     *(mandel_val + array_index(15,15,63,63,vbox_real_count,vbox_sample_real,vbox_sample_imag)));


    printf("------------------------------------------------------------------------\n");


clean_up:
    if ( sample_counter != num_elements ) {
        fprintf(stderr,"ERR  : wrong number of elements read\n");
        fprintf(stderr,"     : expected sample number = %i\n", num_elements);
        fprintf(stderr,"     : samples read from file = %i\n", sample_counter);
        if ( feof(fp) != 0 ) {
            fprintf(stderr,"     : End of file\n");
        } else {
            fprintf(stderr,"     : File contains more data.\n");
            file_position = ftell(fp);
            fprintf(stderr,"     : At byte position %lu\n", file_position);
        }
    }

    clearerr(fp);

    /* clean up memory and exit cleanly */
    free(mandel_val);
    mandel_val = NULL;

    free(coord_r);
    coord_r = NULL;

    free(coord_j);
    coord_r = NULL;

bail_out:
    fclose(fp);
    fprintf (stderr,"INFO : file %s closed.\n",fid);

    free(filename);
    filename = NULL;

    return EXIT_SUCCESS;

}

static int array_index(int Vr, int Vj,
                       int Sr, int Sj,
                       int vbox_real_count, 
                       int vbox_sample_real,
                       int vbox_sample_imag )
{

    int result =  Vr * vbox_sample_real + Sr

                + Vj * vbox_real_count
                     * vbox_sample_real
                     * vbox_sample_imag

                + Sj * vbox_real_count * vbox_sample_real;

    return result;

}

