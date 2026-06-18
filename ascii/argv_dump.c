
/*
 * argv_dump.c  Demonstrate that we may dump out the CLI string elements
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
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <sys/utsname.h>

#define VERBOSE 1
int sysinfo(int verbose);

int main(int argc, char *argv[]) 
{

    int foo = 0;
    int char_count_total = 0;
    setlocale(LC_ALL, "C");
    sysinfo(VERBOSE);

    /* The C standard really doesn't clearly say how a
     * pointer will be printed. C11 ISO/IEC 9899:2011
     * the idea is described in section 7.21.6.1 para8.
     * Maybe you get a leading 0x and maybe you don't and
     * really we are printing a void* type pointer.
     * Just use C99 <inttypes.h> and uintptr_t instead. */

    printf("argc = %i\n", argc);
    printf("&argc = %p\n", &argc);
    printf("argv = %p\n", argv);

    for (foo = 0; foo < argc; foo++ ) {
        printf ("%2i chars for argv[%2i] = \"%s\"\n",
                           strlen(argv[foo]), foo, argv[foo] );

        char_count_total += strlen(argv[foo]);

    }

    printf ("\nhex dump of argv\n----------------\n");
    for (foo = 0; foo < ( char_count_total + argc ); foo++ ) {
        printf("%02x ", ((uint8_t*)argv[0])[foo] );
    }

    printf("\n");

    return 42;

}

