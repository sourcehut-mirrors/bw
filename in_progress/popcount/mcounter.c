
/* becauge Marian says so .. this is a no brancher */

#define _XOPEN_SOURCE 600

#include <inttypes.h>

uint32_t
mcounter ( uint32_t number )
{
    uint32_t result = 0;
    do {
        result += number & 0x1;
    } while (number>>=1);

    return result;

}

