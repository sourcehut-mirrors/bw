
/*
 * hex_dump.c  Using some awareness of the system architecture
 *             we dump out data in hex
 *
 *    It may be of value to note that the elf.h header files
 *    generally define these two values :
 *
 *         #define ELFDATA2LSB     1
 *         #define ELFDATA2MSB     2
 *
 *    Where ELFDATA2MSB is for a big endian machine and the
 *    ELFDATA2LSB would be a little endian machine.
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2025 Dennis Clarke
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

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int hex_dump( void *foo, size_t n)
{
    size_t j;

    /* just a hack for the moment */
    for (j=0; j < n; j++) {
        
        printf("0x%02x ", *( ((uint8_t *)foo)+j ) );
    }

    return EXIT_SUCCESS;

}

