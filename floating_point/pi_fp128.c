
/*
 * pi_fp128.c  Demonstrate that some architectures can not process
 *             the standard IEEE754-2008 data types.
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2019 Dennis Clarke
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

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{

    int j = 0;
    long double pi = 3.14159265358979323846264338327950288419716939937510L;

    printf("the sizeof(pi) is %i bytes\n", sizeof(long double) );

    printf("\npi is this  3.14159265358979323846264338");
    printf("327950288419716939937510.....\n\n");

    printf("pi could be %42.38Le\n\n", pi);

    printf("Actual hex data for 128bit pi is\n\n");
    printf("  0x40 00 92 1f b5 44 42 d1 84 69 89 8c c5 17 01 b8\n\n");

    printf("Our pi data is at address %p\n\n  0x", &pi);
    for ( j=0; j<sizeof(long double); j++ ) {
        printf("%02x ", ((unsigned char *)&pi)[j] );
    }

    printf("\n" );

    return EXIT_SUCCESS;

}

