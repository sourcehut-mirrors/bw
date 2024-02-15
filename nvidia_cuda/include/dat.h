
/* some possible values for modern GPU tech 
 * 67108864     64M
 * 134217728    128M
 * 268435456    256M
 * 402653184    384M
 * 469762048    448M
 * 516979725    may fit into 12G
 * 536870912    512M
 * 689884610    may fit into 16G on the GPU
 * 1073741824   1G
 *
 * minimal low level entry point at 16M is 
 *            16777216   elements
 *
 */

#define NUM_ELEMENTS 689884610
#define THREADS_PER_BLOCK 1024

/* we may need to redefine this in some code */
#define EPSILON 1e-12

