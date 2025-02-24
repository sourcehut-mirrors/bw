
#define _XOPEN_SOURCE 500

/* 
 * Don Knuth (The Art of Computer Programming Vol IV, p 11), in the
 * first textbook on programming, The Preparation of Programs for an
 * Electronic Digital Computer by Wilkes, Wheeler and Gill (1957,
 * reprinted 1984), pages 191--193 presented Nifty Parallel Count
 * by D B Gillies and J C P Miller. 
 */

#include <stdint.h>

/* note we can only handle 4 byte unsigned long types */
int popc (unsigned long x) {

    const unsigned long k1 = 0x55555555UL;
    const unsigned long k2 = 0x33333333UL;
    const unsigned long k4 = 0x0f0f0f0fUL;

    x =   x             - ((x >> 1)  & k1);
    x = ( x & k2 )      + ((x >> 2)  & k2);
    x = ( x             +  (x >> 4)) & k4 ;

    x = ( x * 0x01010101UL) >> 56;

    /* beware beware the 16-bit int */
    return (int)(x & 0xffffffff);

}

