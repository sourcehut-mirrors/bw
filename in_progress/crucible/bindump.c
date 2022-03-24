
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <locale.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
/*********************************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 *
 *********************************************************************/
#define _XOPEN_SOURCE 600

#define NUM_ELEMENTS 16777216
#define BAIL_OUT 32768
#define MAGNIFY 268435456
#define REAL_COORD 0.39975096035050228
#define IMAG_COORD 0.20525179748074152

int main ( int argc, char **argv) {

    FILE *fp;
    struct stat status_buffer;
    int status;
    size_t num_written;

    double c_r = REAL_COORD;
    double c_j = IMAG_COORD;
    int bail_out = BAIL_OUT;
    int magnify = MAGNIFY;
    int num_elements = NUM_ELEMENTS;

    if ( argc < 2 ) {
        fprintf(stderr,"FAIL : provide a filename or pathname\n");
        errno = EINVAL;
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    setlocale ( LC_ALL, "POSIX" );

    status = stat(argv[1], &status_buffer);
    if ( status == 0 ) {
        fprintf (stderr,"FAIL : file already exists?\n");
        return EXIT_FAILURE;
    }

    errno = 0;
    fp = fopen( argv[1], "wb");
    if ( fp == NULL ) {
        perror("FAIL ");
        return EXIT_FAILURE;
    }

    /* WARNING : these are blind writes and no effort has
     *           been made to check that the data was in
     *           fact actually written nor has there been
     *           any error checking. Trivial permission
     *           issues are caught by the fopen() call
     *           but not much else.
     */

    num_written = fwrite( &c_r, sizeof(double), 1, fp);
    printf("DBUG : %2lu byte double  c_r           num_written = %lu\n",
            sizeof(double), num_written);

    num_written = fwrite( &c_j, sizeof(double), 1, fp);
    printf("     : %2lu byte double  c_j           num_written = %lu\n",
            sizeof(double), num_written);

    num_written = fwrite( &bail_out, sizeof(int), 1, fp);
    printf("     : %2lu byte integer bail_out      num_written = %lu\n",
            sizeof(int), num_written);

    num_written = fwrite( &magnify, sizeof(int), 1, fp);
    printf("     : %2lu byte integer magnify       num_written = %lu\n",
            sizeof(int), num_written);

    num_written = fwrite( &num_elements, sizeof(int), 1, fp);
    printf("     : %2lu byte integer num_elements  num_written = %lu\n",
            sizeof(int), num_written);


    fclose(fp);

    return EXIT_SUCCESS;

}

