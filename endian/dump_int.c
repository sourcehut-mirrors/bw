
#include <inttypes.h>
#include <locale.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
int main ( int argc, char **argv )
{
    setlocale( LC_ALL, "C" );
    uint8_t p, q;

    /* sample int which is 0x499602D2h */
    int some_int = 1234567890;

    /* ask the compiler how large the int type is */
    size_t size_int = sizeof(int);

    /* really big int thing which is 0xAB54A98EEE391EEAh */
    uint64_t big_int = 12345678909876543210UL;

    /* ask the compiler how large the big int type is */
    size_t size_big_int = sizeof(uint64_t);

    printf("We are trying to print out 0x499602D2h\n");
    /* now just shift the bits around of some int thing and 
     * print them out as hexadecimal bytes */
    for ( p = 0; p < size_int; p++ ) {
        /* 8 bits per byte so we need to shift our bits to
         * the right to isolate a particular byte.  */
        q = some_int >> ( ( size_int * 8 ) - ( ( p + 1 ) * 8 ) );
        printf("%2i    %02X\n", p, q);
    }

    printf("We are trying to print out 0xAB54A98EEE391EEAh\n");
    for ( p = 0; p < size_big_int; p++ ) {
        q = big_int >> ( ( size_big_int * 8 ) - ( ( p + 1 ) * 8 ) );
        printf("%2i    %02X\n", p, q);
    }

    return EXIT_SUCCESS;

}

