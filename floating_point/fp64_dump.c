
/*
 * ------------------------------------------------------------------
 * Copyright (c) 2024 Dennis Clarke
 *
 *    Permission is hereby granted, free of charge, to any person
 *    obtaining a copy of this software and associated documentation
 *    files (the "Software"), to deal in the Software without
 *    restriction, including without limitation the rights to use,
 *    copy, modify, merge, publish, distribute, sublicense, and/or
 *    sell copies of the Software, and to permit persons to whom the
 *    Software is furnished to do so, subject to the following
 *    conditions:
 *
 *    The above copyright notice and this permission notice shall be
 *    included in all copies or substantial portions of the Software.
 *
 *        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
 *        KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 *        WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 *        PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
 *        OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 *        OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 *        OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 *        SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * ------------------------------------------------------------------
 */

/*********************************************************************
 *    The intention here is that the code be strictly compliant
 *    with IEEE  Std  1003.1-200x and earlier for ISO/IEC 9899:1990
 *    spec C.
 *
 *********************************************************************/
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 500
#endif

#include <errno.h>
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

/*
#include <fenv.h>
#pragma STDC FENV_ACCESS ON

#define __STDC_FORMAT_MACROS
#include <inttypes.h>
*/

int
what_is (char *some_string)
{
    /* on systems that strictly conform to the C90 spec
     * we will get an integer return type. If we use C99
     * then we get a floating point value. */
    char *end_ptr;
    double fp64;
    long long_int;

    fp64 = strtod(some_string, &end_ptr);

    if ( (some_string != end_ptr) && (*end_ptr == '\0')) {
        printf("It's a double with value %g\n", fp64);
    } else {
        long_int = strtol(some_string, &end_ptr, 0);
        if (some_string != end_ptr && *end_ptr == '\0') {
            printf("It's an integer with value %ld\n", long_int);
        } else {
            return 1;
        }
    }
    return 0;
}

/* Accept a pointer to a pointer of some data element which
 * is expected to be an IEEE 754-2008 floating point FP64
 * type object. Then print out the hex and the binary data
 * in some meaningful way.
 *
 * The FP64 data element in IEEE 754-2008 looks like :
 *
 *     s eee eeee eeee    dddd dddd dddd .... dddd
 *     ^ ^              ^ ^
 *     | |              | |
 *     | |              | +- begining of 52 bits of data
 *     | |              |
 *     | |              +- implied data bit set to 1
 *     | |
 *     | +- begining of 11 bits of exponent data
 *     |
 *     +- sign bit s = 0 is positive and 1 means negative
 *
 *
 * May barely fit into 80chars as "s eeeeeeeeeee dddd ..."
 *
 */

int fp64_dump ( double *some_fp64 )
{

    unsigned char eight_byte[8];
    size_t len_double = sizeof(double);
    size_t len_int = sizeof(int);
    int j = 1;
    int little_endian;
    void *some_ptr;
    void *int_ptr = (void *)&j;
    void *src_ptr = (void *)some_fp64;
    void *dst_ptr = (void *)&eight_byte;


    /* this is bad ju ju
     * Type punning is a bad idea.
     *    int little_endian = (*(uint8_t*)&j == 1) ? 1 : 0;
     */

    some_ptr = memcpy(dst_ptr, int_ptr, len_int);
    for ( j=0; j<len_int; j++ ) {
        printf("eight_byte[%i] = %i\n", j, eight_byte[j]);
    }
    little_endian = eight_byte[0];
    printf("\nlittle_endian = eight_byte[0] = %i\n",little_endian);


    printf("\naddr %p  :", src_ptr);
    some_ptr = memcpy(dst_ptr, src_ptr, len_double);
    for ( j=0; j<len_double; j++ ) {
        printf(" %02x", eight_byte[j]);
    }
    printf("\n");


    return EXIT_SUCCESS;

}

int
main ( int argc, char **argv )
{

    double pi = M_PI;
    int foo = fp64_dump( &pi );

    return EXIT_SUCCESS;

}

