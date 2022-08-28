
/* some possible values for modern GPU tech 
 * 67108864     64M
 * 134217728    128M
 * 268435456    256M
 * 402653184    384M
 * 469762048    448M
 * 536870912    512M
 * 1073741824   1G
 *
 * minimal low level entry point at 16M is 
 *            16777216   elements
 *
 * NOTE :   Pay attention to the fact that the 
 *          64-bit elements are 8 bytes each and
 *          the 32-bit elements are 4 bytes each.
 */

#define NUM_ELEMENTS 500000000
#define THREADS_PER_BLOCK 1024
#define EPSILON 1e-12

