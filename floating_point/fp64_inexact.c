
/*
 * fp64_inexact.c A trivial test case to determine glibc bug 26137
 *
 * Bug 26137 - strtod() triggers exception FE_INEXACT on reasonable
 *             input 
 *
 * https://sourceware.org/bugzilla/show_bug.cgi?id=26137
 *
 * Bugfix in release 2.32 :
 * https://sourceware.org/pipermail/libc-announce/2020/000029.html
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * https://www.gnu.org/licenses/gpl-3.0.txt
 */

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
 * See FreeBSD bug report :
 * https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=247370
 *
 * Also for Linux glibc :
 * https://sourceware.org/bugzilla/show_bug.cgi?id=26137
 *
 * Note that 26137 is fixed in glibc 2.32
 * https://sourceware.org/pipermail/libc-announce/2020/000029.html
 */

uint64_t system_memory(void);
int sysinfo(void);

int main ( int argc, char *argv[] )
{

    double candidate_double, num;
    int fpe_raised = 0;

    if ( argc < 2 ) {
        fprintf(stderr,"FAIL : provide a decimal number\n");
        return ( EXIT_FAILURE );
    }

    char *buf = malloc((size_t)32);
    if ( buf == NULL ) {
        perror ("malloc!");
        fprintf (stderr,"FAIL : malloc failed for buf\n");
        return(EXIT_FAILURE);
    }

    if ( argc > 3 ) {
        printf ("\nINFO : You suggest a locale of %s\n", argv[2]);
        buf = setlocale ( LC_ALL, argv[2] );
    } else {
        buf = setlocale ( LC_ALL, "POSIX" );
    }

    if ( buf == NULL ) {
        fprintf (stderr,"FAIL : setlocale fail\n");
        return(EXIT_FAILURE);
    }

    sysinfo();

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
        return ( EXIT_FAILURE );
    }

    if ( !isnormal(candidate_double) && ( candidate_double != 0.0 ) ) {
        fprintf(stderr,"FAIL : number is not normal\n");
        fprintf(stderr,"     : looks like %-+22.16e\n", candidate_double);
        return ( EXIT_FAILURE );
    }

    feclearexcept(FE_ALL_EXCEPT);

    num = candidate_double;
    /* slightly wide format spec to see many digits which should
     * be well past the FP64 precision */
    printf ("INFO : seems like a decimal number %-+36.34g\n", num);
    return ( EXIT_SUCCESS );

}

