
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

    dst = src + 1;

    printf("%d\n", dst);

    return EXIT_SUCCESS;

}

