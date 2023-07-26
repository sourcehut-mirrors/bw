
#define _XOPEN_SOURCE 600

#include <stdlib.h>
#include <stdio.h>
#include <inttypes.h>

int main(int argc, char **argv)
{

    uint64_t biggie = 0xffffffffffffffff;

    fprintf(stderr,"this is a biggie   %" PRIu64 "\n", biggie);

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
     * carry flag to the calling code.
     */

    biggie += 1;

    fprintf(stderr,"this is a biggie+1 %" PRIu64 "\n", biggie);

    return 42;

}

