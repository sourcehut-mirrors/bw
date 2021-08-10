
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

#include <stdlib.h>
#include <stdint.h>

#define COLLATZ_LIM 6148914691236517204UL

typedef struct collatz {
     uint64_t c0;
     uint64_t path_len;
     uint64_t height_location;
     uint64_t path_height;
     uint64_t upwards_count;
} collatz_type;

