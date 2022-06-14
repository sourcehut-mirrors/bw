
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

#include <stdint.h>

#define NUM_ELEMENTS 1048576
#define BAIL_OUT 32768
#define MAGNIFY 268435456
#define REAL_COORD 0.399750960350502282381
#define IMAG_COORD 0.205251797480741515756

uint64_t rot8(uint64_t x);
uint32_t rot4(uint32_t x);

