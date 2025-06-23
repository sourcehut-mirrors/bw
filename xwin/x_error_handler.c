
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
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <stdio.h>
#include <stdlib.h>
#include <X11/Xlib.h>

int X_error_handler(Display *dsp, XErrorEvent *errevt)
{
    char error_string[128];
    Font type_font;

    int get_error_flag = XGetErrorText(dsp, errevt->error_code,
                                       error_string,
                                       sizeof(error_string));

    fprintf(stderr, "Error %d (%s): request %d.%d\n",
                     errevt->error_code, error_string,
                     errevt->request_code,
                     errevt->minor_code);

    if (    ( errevt->error_code == 15 )
         && ( errevt->request_code == 45 )
         && ( errevt->minor_code == 0 ) ) {

        fprintf(stderr,"dBUG : error code from XLoadFont() = %i\n",
                errevt->error_code);

        type_font = XLoadFont(dsp,
                              "-misc-fixed-medium-r-normal--18-120-100-100-c-90-iso10646-1");

        fprintf(stderr,"dBUG : tried to load font \"");
        fprintf(stderr,"-misc-fixed-medium-r-normal--18-120-100-100-c-90-iso10646-1\"\n");

    }

    /* the errevt->error_code is returned */
    return errevt->error_code;

}

