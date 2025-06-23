
/*
 * create_borderless_topwin.c create a top focus window with libX11
 *                            calls and with no border and draw it
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2019 Dennis Clarke
 *
 *    Permission is hereby granted, free of charge, to any person
 *    obtaining a copy of this software and associated documentation
 *    files (the "Software"), to deal in the Software without
 *    restriction, including without limitation the rights to use,
 *    copy, modify, merge, publish, distribute, sublicense, and/or
 *    sell copies of the Software, and to permit persons to whom the
 *    Software is furnished to do so, subject to the following
 *    conditions:
 *
 *    The above copyright notice and this permission notice shall be
 *    included in all copies or substantial portions of the Software.
 *
 *        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
 *        KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 *        WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 *        PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
 *        OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 *        OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 *        OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 *        SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * ------------------------------------------------------------------
 */

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

#include <X11/Xlib.h>

Window
create_borderless_topwin(Display *dsp,
                         unsigned int width, unsigned int height,
                         int offset_x, int offset_y,
                         unsigned long bg_color)
{
    Window wn;
    XSetWindowAttributes attribs;
    attribs.override_redirect = 1;
    /* note parameter 7 for border width is zero */
    wn = XCreateWindow(dsp,
                       RootWindow(dsp, DefaultScreen(dsp)),
                       offset_x, offset_y, width, height, 0,
                       CopyFromParent, CopyFromParent,
                       CopyFromParent, CWOverrideRedirect,
                       &attribs);
    XSetWindowBackground( dsp, wn, bg_color);
    XClearWindow(dsp, wn);
    /* draw the window on the display so we can see it */
    XMapWindow(dsp, wn);
    XFlush(dsp);
    return wn;
}

