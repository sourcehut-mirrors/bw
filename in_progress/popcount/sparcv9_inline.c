
/*
 * trying to get whatever the assembler opcodes are
 * for sparcv9
 */

#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <stdlib.h>

int
main ( int argc, char **argv )
{


    int src = 1;
    int dst;   

/*
         mov     1,%o0
         add     %o0,1,%o0
*/

    asm ("mov %1, %0\n\t"
        "add %0, $1, %0"
        : "=r" (dst) 
        : "r" (src));

    printf("%d\n", dst);

    return EXIT_SUCCESS;

}

