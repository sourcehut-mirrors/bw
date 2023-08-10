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

/*
 * see 
 *
 *  void *memcpy(void dest[restrict .n],
 *               const void src[restrict .n],
 *               size_t n);
 *
 *
 * https://gcc.gnu.org/pipermail/gcc-help/2023-July/142693.html
 *
 * https://blog.llvm.org/2011/05/what-every-c-programmer-should-know.html
 *
 * Violating Type Rules: It is undefined behavior to cast an int* to a
 * float* and dereference it (accessing the "int" as if it were a
 * "float"). C requires that these sorts of type conversions happen
 * through memcpy: using pointer casts is not correct and undefined
 * behavior results. The rules for this are quite nuanced and I don't
 * want to go into the details here...
 *
 * Andrew Haley
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>

/* I was surprised to see that iso646.h may not exist
 * on some Linux systems */
#define bitand  &

int dumpbuf (size_t n, void *buf)
{
/* this is your friend.
 *
 *  void *memcpy(void dest[restrict .n],
 *               const void src[restrict .n],
 *               size_t n);
 */

    int this_line = 0;
    int j = n;

    /* baloney ? */
    if (( n == 0 )||(buf==NULL)){
        return EXIT_FAILURE;
    }

    unsigned char *data=calloc(n,sizeof(unsigned char));
    if ( data == NULL ) {
        /* really? possible ENOMEM? */
        if ( errno == ENOMEM ) {

            fprintf(stderr,
                 "FAIL : calloc returns ENOMEM at %s:%d\n",
                  __FILE__, __LINE__ );

        } else {

            fprintf(stderr,
                 "FAIL : calloc fails at %s:%d\n",
                  __FILE__, __LINE__ );

        }
        perror("FAIL ");
        /* NOTE : it is very nasty to bail out this way
         *        but why bother to continue ?
         */
        return EXIT_FAILURE;
    }

    memcpy(data,buf,n);

    while (j-- > 0) {
        printf( "%02X ", *data++);
        this_line += 1;

        if ( ( ( this_line bitand 0x0f ) == 0 ) || (j == 0) ) {
            fputs (" ", stdout );

            for (j = this_line; j<16; j++) fputs (" ", stdout );

            for (j = this_line; j>0; j--) {
                fputc(isprint(buf[j]) ? buf[j] : '.', stdout );
            }

            fputs("\n", stdout );
            this_line = 0;
        }
    }

    free(data);

    return EXIT_SUCCESS;

}

