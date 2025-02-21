

#define _XOPEN_SOURCE 600

#include <inttypes.h>

uint8_t
popcount(uint32_t x) {
	uint8_t c = 0;
	for(; x; c++) x = x & (x - 1);
	return c;
}

