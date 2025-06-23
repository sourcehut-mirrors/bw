
/*
 * create_gc.c  create an X11 graphics context and return GC type gc
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

#include <stdio.h>
#include <stdlib.h>
#include <X11/Xlib.h>

GC
create_gc(Display *display, Window win)
{
    GC gc;
    unsigned long valuemask = 0;
    XGCValues values;

    /* Assume a default line width of 2 pixels and then the
     * user can make their own changes to the Graphics Context
     * later if they want. */
    unsigned int line_width = 2;

    /* a few line style assumptions */
    int line_style = LineSolid;
    int cap_style = CapButt;
    int join_style = JoinBevel;

    int screen_num = DefaultScreen(display);

    gc = XCreateGC(display, win, valuemask, &values);
    /* note that a 32-bit system will throw a warning about
     * cast from pointer to integer of different size with
     * (int64_t) type used on a pointer comparison. 
     *
     * this is clumsy and there is even improper pointer comparison
     * being done.  LLVM/Clang barfs on this.
     *
     *    if ((int64_t)gc < 0) {
     *        fprintf(stderr, "XCreateGC failed\n");
     *        exit(EXIT_FAILURE);
     *    }
     */

    /* Assume basic White foreground on Black background */
    XSetForeground(display, gc, XWhitePixel(display, screen_num));
    XSetBackground(display, gc, XBlackPixel(display, screen_num));

    /* line style */
    XSetLineAttributes(display, gc,
        line_width, line_style,
        cap_style, join_style);

    /* fill style is solid */
    XSetFillStyle(display, gc, FillSolid);

    return gc;

}

