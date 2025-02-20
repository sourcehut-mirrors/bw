

#define _XOPEN_SOURCE 600

#include <inttypes.h>

int popcount(uint32_t x) {
	int c = 0;
	for(; x; c++) x = x & (x - 1);
	return c;
}

