
/*
 * endian.c   determine if the current system architecture is a
 *            big endian or littler endian machine
 *
 *    The elf.h header files generally define these two values :
 *
 *         #define ELFDATA2LSB     1
 *         #define ELFDATA2MSB     2
 *
 *    Where ELFDATA2MSB is for a big endian machine and the
 *    ELFDATA2LSB would be a little endian machine.
 *
 *     RETURN :  1 for little endian and 2 for big endian
 *
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

int endian( void )
{

    /* an array of 8 bytes to copy data into */
    unsigned char eight_byte[8];
    size_t len_int = sizeof(int);
    int j = 1;
    int endian_flag;
    void *some_ptr;
    void *int_ptr = (void *)&j;
    void *dst_ptr = (void *)&eight_byte;

    some_ptr = memcpy(dst_ptr, int_ptr, len_int);

    /* If a byte value of 1 lands in eight_byte[0]
     * then we know the machine is little endian
     */
    endian_flag = eight_byte[0] ? 1 : 2;

    return endian_flag;

}
