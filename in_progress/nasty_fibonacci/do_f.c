#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <stdio.h>
#include <stdlib.h>

unsigned long fib(unsigned int n);

int
main ( int argc, char **argv )
{
    int foo;
    if ( argc < 2 ) {
        fprintf(stderr,"WARN : helps to give a damn number!\n");
        return EXIT_FAILURE;
    } else {
        /* do not even bother with error or range checks */
        foo = atoi(argv[1]);
        if ( foo < 0 ) {
            fprintf(stderr,"FAIL : bad bad bad user!\n");
            return EXIT_FAILURE;
        }
    }
    /* just curious */

    printf("Please see reference https://oeis.org/A000045 for Fibonacci numbers.\n");
    printf("Fibonacci numbers: F(n) = F(n-1) + F(n-2) with F(0) = 0 and F(1) = 1.\n");
    printf("If you entered %i then fib(%i) may be %lu\n", foo, foo, fib(foo));
    return EXIT_SUCCESS;
}
