
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

#include <locale.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <inttypes.h>
#include <unistd.h>
#include <sys/resource.h>
#include <sys/utsname.h>
#include <math.h>
#include <fenv.h>

#define VERBOSE 1

int sysinfo(int verbose);

int main(int argc, char **argv)
{

    setlocale( LC_ALL, "C" );
    int err_flag = sysinfo( VERBOSE );
    if ( err_flag == EXIT_FAILURE ) {
        fprintf(stderr,"FAIL : sysinfo returns EXIT_FAILURE\n");
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;

}

