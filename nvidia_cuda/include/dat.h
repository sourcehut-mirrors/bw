
/* some possible values for modern GPU tech 
 *  84000000    may fit into 2G lowest trash GPU
 * 516979725    may fit into 12G
 * 689884610    may fit into 16G on the GPU
 *
 * minimal low level entry point at 16M is 
 *            16777216   elements
 *
 */

#define NUM_ELEMENTS 1006632960
#define THREADS_PER_BLOCK 1024

/* we may need to redefine this in some code */
#define EPSILON 1e-12

