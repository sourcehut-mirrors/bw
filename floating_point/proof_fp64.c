
#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{

    /* at best we have mantissa of 52 bits plus an implied one bit
     * thus epsilon will be 2^(-50) may work
     */
    double epsilon = 0.000000000000000888178419700125232338905334472656250;

    printf("see, told you = %+-42.38e\n", epsilon);


    return EXIT_SUCCESS;

}


