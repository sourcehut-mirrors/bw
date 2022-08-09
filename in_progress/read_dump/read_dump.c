
/*
 * read_dump.c  Try to read in all the data from an xmand file as
 *              described in xmand/readme.data
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

#include "file_mbrot.h"

int read_mbrot_data(f_item *mandelbrot)
{

    int end_check;
    int endian_flag;
    size_t num_read;

    uint32_t temp32bit;
    uint64_t temp64bit;
    uint32_t rotated32;
    uint64_t rotated64;
    double *fp64, temp_double;

    /* easy index vars for later */
    int Vr, Vj, Sr, Sj;

    /* we will need to know if we read the correct amount of data */
    uint32_t sample_counter;

    /* did we receive something valid? */
    if ( mandelbrot == NULL ) {
        return EXIT_FAILURE;
    }

    /* We shall assume that the caller did all the necessary
     * checks to ensure the file pointer is valid. */

    /* a big endian machine will have end_check as either
     * 0x00000001 or perhaps a very very old 0x0001 in the
     * case of 16bit integers. Unlikely. The point is that
     * little endian machines will be in reverse order and
     * thus the first 8-bits will be 0x01 for those.  */
    end_check = 1;
    endian_flag = (*(uint8_t*)&end_check == 1) ? 0 : 1;

    clearerr(mandelbrot->fp);

    /**************************************************************
     *              number of items in each array                 *
     **************************************************************/
    num_read = fread((void *)&temp32bit, sizeof(uint32_t), 1, mandelbrot->fp);
    mandelbrot->file_error_status = ferror(mandelbrot->fp);
    if ( mandelbrot->file_error_status != 0 ) {
        return EXIT_FAILURE;
    }

    if ( num_read < 1 ) {
        /* we have a short read
         * check if end of file */
        if ( feof(mandelbrot->fp) != 0 ) {
            return ERROR_END_OF_FILE;
        } else {
            return ERROR_INSUFFICIENT;
        }
    }

    if ( endian_flag ) {
        /* we are on a big endian machine so we need
         * to swap around the byte order of the data
         * read from the little endian data file. */
        rotated32 = rot4(temp32bit);
        temp32bit = rotated32;
    }
    mandelbrot->num_elements = temp32bit;

    /* check for early end of file */
    clearerr(mandelbrot->fp);
    if ( feof(mandelbrot->fp) != 0 ) {
        return ERROR_END_OF_FILE;
    }

    /**************************************************************
     *                   mandelbrot bail_out                      *
     **************************************************************/
    num_read = fread((void *)&temp32bit, sizeof(uint32_t), 1, mandelbrot->fp);
    mandelbrot->file_error_status = ferror(mandelbrot->fp);
    if ( mandelbrot->file_error_status != 0 ) {
        return EXIT_FAILURE;
    }

    if ( num_read < 1 ) {
        /* short read and check eof */
        if ( feof(mandelbrot->fp) != 0 ) {
            return ERROR_END_OF_FILE;
        } else {
            return ERROR_INSUFFICIENT;
        }
    }

    if ( endian_flag ) {
        /* swap byte order */
        rotated32 = rot4(temp32bit);
        temp32bit = rotated32;
    }
    mandelbrot->mand_bail = temp32bit;

    /* check for early end of file */
    clearerr(mandelbrot->fp);
    if ( feof(mandelbrot->fp) != 0 ) {
        return ERROR_END_OF_FILE;
    }


    /**************************************************************
     *        magnify is a floating point 64-bit double           *
     **************************************************************
     * Read in 64bits of unit64_t data and deal with it
     * as IEEE-754 floating point double later.  Why ?
     * Because a big endian machine would interpret
     * the little endian data as a NaN or a sub-normal
     * or perhaps just messy double value. 
     **************************************************************/
    num_read = fread((void *)&temp64bit, sizeof(uint64_t), 1, mandelbrot->fp);
    mandelbrot->file_error_status = ferror(mandelbrot->fp);
    if ( mandelbrot->file_error_status != 0 ) {
        return EXIT_FAILURE;
    }

    if ( num_read < 1 ) {
        /* short read and check eof */
        if ( feof(mandelbrot->fp) != 0 ) {
            return ERROR_END_OF_FILE;
        } else {
            return ERROR_INSUFFICIENT;
        }
    }

    if ( endian_flag ) {
        /* swap byte order */
        rotated64 = rot8(temp64bit);
        fp64 = memcpy(&temp_double,(void *)&rotated64, sizeof(double));
    } else {
        fp64 = memcpy(&temp_double,(void *)&temp64bit, sizeof(double));
    }
    mandelbrot->magnify = *fp64;

    /* check for early end of file */
    clearerr(mandelbrot->fp);
    if ( feof(mandelbrot->fp) != 0 ) {
        return ERROR_END_OF_FILE;
    }


    /**************************************************************
     *      real_translate is a floating point 64-bit double      *
     **************************************************************/
    num_read = fread((void *)&temp64bit, sizeof(uint64_t), 1, mandelbrot->fp);
    mandelbrot->file_error_status = ferror(mandelbrot->fp);
    if ( mandelbrot->file_error_status != 0 ) {
        return EXIT_FAILURE;
    }

    if ( num_read < 1 ) {
        /* short read and check eof */
        if ( feof(mandelbrot->fp) != 0 ) {
            return ERROR_END_OF_FILE;
        } else {
            return ERROR_INSUFFICIENT;
        }
    }

    if ( endian_flag ) {
        /* swap byte order */
        rotated64 = rot8(temp64bit);
        fp64 = memcpy(&temp_double,(void *)&rotated64, sizeof(double));
    } else {
        fp64 = memcpy(&temp_double,(void *)&temp64bit, sizeof(double));
    }
    mandelbrot->real_translate = *fp64;

    /* check for early end of file */
    clearerr(mandelbrot->fp);
    if ( feof(mandelbrot->fp) != 0 ) {
        return ERROR_END_OF_FILE;
    }


    /**************************************************************
     *     imag_translate is a floating point 64-bit double       *
     **************************************************************/
    num_read = fread((void *)&temp64bit, sizeof(uint64_t), 1, mandelbrot->fp);
    mandelbrot->file_error_status = ferror(mandelbrot->fp);
    if ( mandelbrot->file_error_status != 0 ) {
        return EXIT_FAILURE;
    }

    if ( num_read < 1 ) {
        /* short read and check eof */
        if ( feof(mandelbrot->fp) != 0 ) {
            return ERROR_END_OF_FILE;
        } else {
            return ERROR_INSUFFICIENT;
        }
    }

    if ( endian_flag ) {
        /* swap byte order */
        rotated64 = rot8(temp64bit);
        fp64 = memcpy(&temp_double,(void *)&rotated64, sizeof(double));
    } else {
        fp64 = memcpy(&temp_double,(void *)&temp64bit, sizeof(double));
    }
    mandelbrot->imag_translate = *fp64;

    /* check for early end of file */
    clearerr(mandelbrot->fp);
    if ( feof(mandelbrot->fp) != 0 ) {
        return ERROR_END_OF_FILE;
    }


    /************************************************************
     *  Now we process the internal memory structure layout as  *
     *  described in the xmand/readme.data                      *
     ************************************************************/

    /**************************************************************
     *                   VBOX_REAL_COUNT                          *
     **************************************************************/
    num_read = fread((void *)&temp32bit, sizeof(uint32_t), 1, mandelbrot->fp);
    mandelbrot->file_error_status = ferror(mandelbrot->fp);
    if ( mandelbrot->file_error_status != 0 ) {
        return EXIT_FAILURE;
    }

    if ( num_read < 1 ) {
        /* short read and check eof */
        if ( feof(mandelbrot->fp) != 0 ) {
            return ERROR_END_OF_FILE;
        } else {
            return ERROR_INSUFFICIENT;
        }
    }

    if ( endian_flag ) {
        /* swap byte order */
        rotated32 = rot4(temp32bit);
        temp32bit = rotated32;
    }
    mandelbrot->vbox_real_count = temp32bit;

    /* check for early end of file */
    clearerr(mandelbrot->fp);
    if ( feof(mandelbrot->fp) != 0 ) {
        return ERROR_END_OF_FILE;
    }


    /**************************************************************
     *                   VBOX_IMAG_COUNT                          *
     **************************************************************/
    num_read = fread((void *)&temp32bit, sizeof(uint32_t), 1, mandelbrot->fp);
    mandelbrot->file_error_status = ferror(mandelbrot->fp);
    if ( mandelbrot->file_error_status != 0 ) {
        return EXIT_FAILURE;
    }

    if ( num_read < 1 ) {
        /* short read and check eof */
        if ( feof(mandelbrot->fp) != 0 ) {
            return ERROR_END_OF_FILE;
        } else {
            return ERROR_INSUFFICIENT;
        }
    }

    if ( endian_flag ) {
        /* swap byte order */
        rotated32 = rot4(temp32bit);
        temp32bit = rotated32;
    }
    mandelbrot->vbox_imag_count = temp32bit;

    /* check for early end of file */
    clearerr(mandelbrot->fp);
    if ( feof(mandelbrot->fp) != 0 ) {
        return ERROR_END_OF_FILE;
    }



    /**************************************************************
     *                   VBOX_SAMPLE_REAL                         *
     **************************************************************/
    num_read = fread((void *)&temp32bit, sizeof(uint32_t), 1, mandelbrot->fp);
    mandelbrot->file_error_status = ferror(mandelbrot->fp);
    if ( mandelbrot->file_error_status != 0 ) {
        return EXIT_FAILURE;
    }

    if ( num_read < 1 ) {
        /* short read and check eof */
        if ( feof(mandelbrot->fp) != 0 ) {
            return ERROR_END_OF_FILE;
        } else {
            return ERROR_INSUFFICIENT;
        }
    }

    if ( endian_flag ) {
        /* swap byte order */
        rotated32 = rot4(temp32bit);
        temp32bit = rotated32;
    }
    mandelbrot->vbox_sample_real = temp32bit;

    /* check for early end of file */
    clearerr(mandelbrot->fp);
    if ( feof(mandelbrot->fp) != 0 ) {
        return ERROR_END_OF_FILE;
    }


    /**************************************************************
     *                   VBOX_SAMPLE_IMAG                         *
     **************************************************************/
    num_read = fread((void *)&temp32bit, sizeof(uint32_t), 1, mandelbrot->fp);
    mandelbrot->file_error_status = ferror(mandelbrot->fp);
    if ( mandelbrot->file_error_status != 0 ) {
        return EXIT_FAILURE;
    }

    if ( num_read < 1 ) {
        /* short read and check eof */
        if ( feof(mandelbrot->fp) != 0 ) {
            return ERROR_END_OF_FILE;
        } else {
            return ERROR_INSUFFICIENT;
        }
    }

    if ( endian_flag ) {
        /* swap byte order */
        rotated32 = rot4(temp32bit);
        temp32bit = rotated32;
    }
    mandelbrot->vbox_sample_imag = temp32bit;

    /* check for end of file */
    clearerr(mandelbrot->fp);
    if ( feof(mandelbrot->fp) != 0 ) {
        return ERROR_END_OF_FILE;
    }

    mandelbrot->file_position = ftell(mandelbrot->fp);

    /* TODO verify that the data structure described in the header
     * contains the correct number of elements */

    /* allocate memory for the data section */
    mandelbrot->mandelbrot_data->mandel_val = calloc((size_t)mandelbrot->num_elements, sizeof(uint32_t));

    if ( mandelbrot->mandelbrot_data->mandel_val == NULL ) {
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n", __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n", __FILE__, __LINE__ );
        }
        perror("FAIL ");
        return ERROR_MEMORY;
    }


    return ERROR_ALL_DATA_NOT_READ;



}

