
#define _XOPEN_SOURCE 600

#include <inttypes.h>

uint8_t
shifter ( uint64_t foo )
{

    uint64_t j, k;
    uint8_t bar;

    /* bit shifting and counting where this is not
     * even remotely efficient
     *
     *   k will be the number of '1' bits
     *   j is the number being tested
     */

    j = foo;
    k = 0;

    while (j) {
        if ( j & 1 ) { /* test the LSB position */
            k += 1;    /* count the '1' bit */
        }
        j = j >> 1;    /* shift left */
    }

    bar = (uint8_t)( k & 0xff );

    return bar;

}

