
/*************************************************
 * The Open Group Base Specifications Issue 6
 * IEEE Std 1003.1, 2004 Edition
 *************************************************/
#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <stdlib.h>
#include <X11/Xlib.h>

int X_error_handler(Display *dsp, XErrorEvent *errevt)
{
    char error_string[128];
    Font type_font;
    int get_error_flag = XGetErrorText(dsp, errevt->error_code, error_string, sizeof(error_string));

    fprintf(stderr, "Error %d (%s): request %d.%d\n",
                     errevt->error_code, error_string,
                     errevt->request_code,
                     errevt->minor_code);

    if (    ( errevt->error_code == 15 )
         && ( errevt->request_code == 45 )
         && ( errevt->minor_code == 0 ) ) {

        fprintf(stderr,"dBUG : we have an error code from XLoadFont() = %i\n", errevt->error_code);
        /* this may not exist for some people ... ha ha .. NixOS
        type_font = XLoadFont(dsp, "-xos4-terminus-medium-r-normal--16-160-72-72-c-80-iso10646-1");
        fprintf(stderr,"dBUG : tried to load font \"-xos4-terminus-medium-r-normal--16-160-72-72-c-80-iso10646-1\"\n");
        */
        type_font = XLoadFont(dsp, "-misc-fixed-medium-r-normal--18-120-100-100-c-90-iso10646-1");
        fprintf(stderr,"dBUG : tried to load font \"");
        fprintf(stderr,"-misc-fixed-medium-r-normal--18-120-100-100-c-90-iso10646-1\"\n");

    }

    /* the errevt->error_code is returned */
    return errevt->error_code;
}

