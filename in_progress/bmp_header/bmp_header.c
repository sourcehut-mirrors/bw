
#define _XOPEN_SOURCE 600
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <locale.h>

int sysinfo(void);

int main ( int argc, char **argv ) 
{

    /* we shall define the value we need as the 
     * little endian bytes for a 32-bit integer
     * at bmp_header[4] to bmp_header[7] */

    uint8_t bmp_header[12] = { 0, 1, 2, 3,
                               0, 4, 0, 0,
                               0,12,34, 1 };

    /* thus the bytes 0x00 0x04 0x00 0x00 must be 
     * a little endian integer of value 1024 decimal */

    uint32_t pi =  31415926; /* should be 0x1DF5E76 */ 
    printf("DBUG : our test pi = 0x%08X\n", pi );
    printf("     : should be     0x01DF5E76\n");

    /* this is the bmp_width data that we are really trying
     * to extract from that array bmp_header. We shall set
     * this to a reasonable interpretation of the bytes
     * once we know what this machine "thinks" and integer
     * really is. */
    int bmp_width;
    int endian_flag;

    /* lets stick to a trivial C or POSIX locale */
    setlocale( LC_ALL, "C" );

    /* output some basic information about this machine */
    endian_flag = sysinfo();

    if ( endian_flag ) {

        printf ("This is a little endian machine.\n");

        printf ("DBUG :    (uint32_t)bmp_header[7]        = %08X\n",  (uint32_t)bmp_header[7] );
        printf ("DBUG : ( ((uint32_t)bmp_header[6])<<8  ) = %08X\n",  ( ((uint32_t)bmp_header[6])<<8  ) );
        printf ("DBUG : ( ((uint32_t)bmp_header[5])<<16 ) = %08X\n",  ( ((uint32_t)bmp_header[5])<<16 ) );
        printf ("DBUG : ( ((uint32_t)bmp_header[4])<<24 ) = %08X\n",  ( ((uint32_t)bmp_header[4])<<24 ) );

        bmp_width =  ( ( (uint32_t)bmp_header[7] )     ) 
                   | ( ( (uint32_t)bmp_header[6] )<<8  ) 
                   | ( ( (uint32_t)bmp_header[5] )<<16 )
                   | ( ( (uint32_t)bmp_header[4] )<<24 );

    } else {

        printf ("This is a big endian machine.\n");

        printf ("DBUG :    (uint32_t)bmp_header[4]        = %08X\n",  (uint32_t)bmp_header[4] );
        printf ("DBUG : ( ((uint32_t)bmp_header[5])<<8  ) = %08X\n",  ( ((uint32_t)bmp_header[5])<<8  ) );
        printf ("DBUG : ( ((uint32_t)bmp_header[6])<<16 ) = %08X\n",  ( ((uint32_t)bmp_header[6])<<16 ) );
        printf ("DBUG : ( ((uint32_t)bmp_header[7])<<24 ) = %08X\n",  ( ((uint32_t)bmp_header[7])<<24 ) );

        bmp_width =  ( bmp_header[4]     ) 
                   | ( bmp_header[5]<<8  ) 
                   | ( bmp_header[6]<<16 )
                   | ( bmp_header[7]<<24 );

    }

    printf ( "\nbmp_width = %i\n", bmp_width );

    printf("\n***********************************************\n");
    printf("\n\ntheddmage says just keep it simple stupid\n\n");
    bmp_width = ( (bmp_header[7]<<24)|(bmp_header[6]<<16)|(bmp_header[5]<<8)|bmp_header[4] );
    printf ( "bmp_width = %i\n", bmp_width );

    /* should be 1024 */

    return EXIT_SUCCESS;

}

