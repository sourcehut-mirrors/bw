
/* this was ripping directly out of the GCC docs */

#define _XOPEN_SOURCE 600

#include <stdlib.h>
#include <stdio.h>

int
main ( int argc, char **argv )
{

    int src = 1;
    int dst;   

    asm ("mov %1, %0\n\t"
        "add $1, %0"
        : "=r" (dst) 
        : "r" (src));

    printf("%d\n", dst);

    return EXIT_SUCCESS;

}

