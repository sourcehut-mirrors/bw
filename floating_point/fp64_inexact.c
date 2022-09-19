
/*********************************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 *********************************************************************/
#define _XOPEN_SOURCE 600

#include <errno.h>
#include <locale.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>
#include <sys/utsname.h>
#include <time.h>
#include <unistd.h>

#include <fenv.h>
#pragma STDC FENV_ACCESS ON

#define __STDC_FORMAT_MACROS
#include <inttypes.h>

/* Accept ascii data on the command line and attempt to convert
 * to IEEE 754-2008 floating point FP64 data.
 *
 * FreeBSD 12 RELEASE triggers a floating point exception
 * FE_INEXACT on some data that should be accepted perfectly.
 *
 * Possibly also FreeBSD 14.0-CURRENT main-n258068-e4505364c08
 */

int main ( int argc, char *argv[] )
{

    char *buf;
    double candidate_double, num;
    int fpe_raised = 0;

    if ( argc < 2 ) {
        fprintf(stderr,"FAIL : provide a decimal number\n");
        return EXIT_FAILURE;
    }

    if ( argc > 2 ) {
        printf ("\nINFO : You suggest a locale of %s\n", argv[2]);
        buf = setlocale ( LC_NUMERIC, argv[2] );
    } else {
        buf = setlocale ( LC_NUMERIC, "C" );
    }

    if ( buf == NULL ) {
        fprintf (stderr,"FAIL : setlocale fail\n");
        return EXIT_FAILURE;
    }
    printf ("     : LC_NUMERIC locale is now %s\n", buf);

    errno = 0;
    feclearexcept(FE_ALL_EXCEPT);

    candidate_double = strtod(argv[1], (char **)NULL);

    fpe_raised = fetestexcept(FE_ALL_EXCEPT);
    if (fpe_raised!=0){
        printf("INFO : FP Exception raised is");
        if ( fpe_raised & FE_INEXACT ) printf(" FE_INEXACT");
        if ( fpe_raised & FE_DIVBYZERO ) printf(" FE_DIVBYZERO");
        if ( fpe_raised & FE_UNDERFLOW ) printf(" FE_UNDERFLOW");
        if ( fpe_raised & FE_OVERFLOW ) printf(" FE_OVERFLOW");
        if ( fpe_raised & FE_INVALID ) printf(" FE_INVALID");
        printf("\n");
    }

    if ( fpe_raised & FE_INEXACT ) {
        printf("WARN : FE_INEXACT returned by strtod()\n");
    }

    if ( ( errno == ERANGE ) || ( errno == EINVAL ) ){
        fprintf(stderr,"FAIL : number not understood\n");
        perror("     ");
        return EXIT_FAILURE;
    }

    if ( !isnormal(candidate_double) && ( candidate_double != 0.0 ) ) {
        fprintf(stderr,"FAIL : number is not normal\n");
        fprintf(stderr,"     : looks like %-+22.16e\n", candidate_double);
        return EXIT_FAILURE;
    }

    feclearexcept(FE_ALL_EXCEPT);

    num = candidate_double;
    /* slightly wide format spec to see many digits which should
     * be well past the FP64 precision */
    printf ("INFO : seems like a decimal number\n");
    printf ("     : %-+68.60g\n", num);

    return EXIT_SUCCESS;

}

