
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
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <errno.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

/*
#include <fenv.h>
#pragma STDC FENV_ACCESS ON

#define __STDC_FORMAT_MACROS
#include <inttypes.h>
*/

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

int what_is (char *some_string)
{
    char *end_ptr;
    double fp64;
    long long_int;

    fp64 = strtod(some_string, &end_ptr);

    if ( (some_string != end_ptr) && (*end_ptr == '\0')) {
        printf("It's a float with value %g\n", fp64);
    } else {
        long_int = strtol(some_string, &end_ptr, 0);
        if (some_string != end_ptr && *end_ptr == '\0') {
            printf("It's an integer with value %ld\n", 1);
        } else {
            return 1;
        }
    }
    return 0;
}

int fp64_dump ( double ** some_fp64 )
{

    return 0;

}

int main ( int argc, char **argv )
{

    int k;

    if ( argc < 2 ) {
        fprintf(stderr,"Gimme a string dummy.\n");
        return EXIT_FAILURE;
    }

    k = what_is(argv[1]);

    return EXIT_SUCCESS;

}

