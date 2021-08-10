
/*
 * argv_dump.c  Demonstrate that we may dump out the CLI string elements
 * Copyright (C) Dennis Clarke 2019
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
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>
#include <sys/utsname.h>

int sysinfo(int verbose);

int main(int argc, char *argv[]) 
{

    int foo = 0;
    int char_count_total = 0;
    setlocale(LC_ALL, "C");
    sysinfo(1);

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

