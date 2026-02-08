
/*
 * overflow.c force an integer overflow which may be silent
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
 
#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>
#include <inttypes.h>

int main(int argc, char **argv)
{

    uint64_t one_64bit = 1;
    uint64_t biggie = 0xffffffffffffffff;
    long long unsigned int some64bit = 0;
    long long unsigned int *result = &some64bit;

    bool flag = 0;

    fprintf(stderr,"this is a biggie   %" PRIu64 "\n", biggie);
    fprintf(stderr,"                   %" PRIx64 "\n", biggie);

    /* C99 claims that unsigned integers will not overflow.
     *
     * Well, sure, they do but you can not trap for that.
     *
     * ISO/IEC 9899:TC3 the glorious Septermber 7, 2007
     *
     * Section 6.5 Expressions - Nose Demons
     *
     *    If an exceptional condition occurs during the evaluation
     *    of an expression (that is, if the result is not mathematically
     *    defined or not in the range of representable values for its
     *    type), the behavior is undefined.
     *
     * Section 6.2.5 Types
     *
     *    The range of nonnegative values of a signed integer type is a
     *    subrange of the corresponding unsigned integer type, and the
     *    representation of the same value in each type is the same.
     *
     *    The same representation and alignment requirements are meant
     *    to imply interchangeability as arguments to functions, return
     *    values from functions, and members of unions.
     *
     *    A computation involving unsigned operands can never overflow,
     *    because a result that cannot be represented by the resulting
     *    unsigned integer type is reduced modulo the number that is one
     *    greater than the largest value that can be represented by the
     *    resulting type.
     *
     * Want to detect a carry flag on an integer operation? For that you
     * need assembly language and the ability to return the state of the
     * carry flag to the calling code. However modern GCC may also have
     * some builtin functions to detect overflow, underflow and similar.
     *
     * -----------------------------------------------------------------
     * From the GCC manual :
     * https://gcc.gnu.org/onlinedocs/gcc/Integer-Overflow-Builtins.html
     *
     * 
     * Built-in Function:
     * 
     * bool __builtin_uaddll_overflow (unsigned long long int a,
     *                                 unsigned long long int b,
     *                                 unsigned long long int *res)
     * 
     * These built-in functions promote the first two operands into
     * infinite precision signed type and perform addition on those
     * promoted operands. The result is then cast to the type the
     * third pointer argument points to and stored there. If the
     * stored result is equal to the infinite precision result, the
     * built-in functions return false, otherwise they return true.
     * As the addition is performed in infinite signed precision, these
     * built-in functions have fully defined behavior for all argument
     * values.
     * 
     * The first built-in function allows arbitrary integral types for
     * operands and the result type must be pointer to some integral
     * type other than enumerated or boolean type, the rest of the
     * built-in functions have explicit integer types.
     * 
     * The compiler will attempt to use hardware instructions to
     * implement these built-in functions where possible, like
     * conditional jump on overflow after addition, conditional
     * jump on carry etc.
     * 
     * 
     */

    biggie += one_64bit;

    fprintf(stderr,"\n");
    fprintf(stderr,"this is a biggie+1 %" PRIu64 "\n", biggie);
    fprintf(stderr,"                   %" PRIx64 "\n", biggie);


    /* now set biggie to 2^64 - 2 */
    fprintf(stderr,"\n\nnow set biggie to 2^64 - 2\n\n");
    biggie = 0xfffffffffffffffe;
    fprintf(stderr,"     2^64 - 2 is   %" PRIx64 "\n", biggie);


    /* this will likely NOT work without some modern GCC */
    fprintf(stderr,"\ncalling __builtin_uaddll_overflow ()\n");
    flag = __builtin_uaddll_overflow (biggie, one_64bit, result);

    fprintf(stderr,"\n");
    fprintf(stderr,"\nwe have some destination called \047result\047\n");
    fprintf(stderr,"result = %" PRIu64 "\n", *result);
    fprintf(stderr,"         %" PRIx64 "\n", *result);
    fprintf(stderr,"  flag = %i", flag);
    if ( flag ) {
        fprintf(stderr," <-- OVERFLOW FLAG");
    } else {
        fprintf(stderr," <-- no overflow");
    }
    fprintf(stderr,"\n");

    /* now we try to trigger an overflow flag condition */
    fprintf(stderr,"\nnow try to trigger an overflow flag\n");
    biggie = *result;
    flag = __builtin_uaddll_overflow (biggie, one_64bit, result);

    fprintf(stderr,"\n");
    fprintf(stderr,"result = %" PRIx64 "\n", *result);
    fprintf(stderr,"  flag = %i", flag);
    if ( flag ) {
        fprintf(stderr," <-- OVERFLOW FLAG CAUGHT");
    }
    fprintf(stderr,"\n\n");

    return 42;

}

