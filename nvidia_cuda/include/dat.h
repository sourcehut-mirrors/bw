
/* some possible values for modern GPU tech 
 * 67108864     64M
 * 134217728    128M
 * 268435456    256M
 * 402653184    384M
 * 469762048    448M
 * 520000000    should fit onto a 12G GPU card
 * 536870912    512M
 * 1073741824   1G
 *
 * minimal low level entry point at 16M is 
 *            16777216   elements
 *
 */

#define NUM_ELEMENTS 1073741824
#define THREADS_PER_BLOCK 1024

/* we may need to redefine this in some code */
#define EPSILON 1e-12

