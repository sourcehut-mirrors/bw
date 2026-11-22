
/*
 * xcb_intro.c  this is the lowest and most trivial X11 stuff
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

/* hack this away on the OpenBSD world for now 
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif
*/

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <xcb/xcb.h>

int main(void)
{
    int j, screen_num = 0;
    const xcb_setup_t *setup = NULL;
    const char *title;
    xcb_screen_iterator_t screen_it;
    xcb_screen_t *screen = NULL;
    xcb_window_t win;
    xcb_generic_event_t *ev;
    uint32_t title_len;
    uint32_t mask_vals[] = { 0 };

    xcb_connection_t *xcb_conn = xcb_connect(NULL, &screen_num);

    if (xcb_connection_has_error(xcb_conn)) {
        fprintf(stderr, "FAIL : Failed X11 connect\n");
        return EXIT_FAILURE;
    }

    printf("INFO : preferred screen: %d\n", screen_num);

    setup = xcb_get_setup(xcb_conn);
    screen_it = xcb_setup_roots_iterator(setup);

    /* only you can stop the abuse of i as an iterator */
    for (j = 0; j < screen_num; j++) {
        xcb_screen_next(&screen_it);
    }

    screen = screen_it.data;

    win = xcb_generate_id(xcb_conn);

    xcb_create_window(xcb_conn,
                      screen->root_depth,
                      win,
                      screen->root,
                      20, 20, 600, 600, 0,
                      XCB_WINDOW_CLASS_INPUT_OUTPUT,
                      screen->root_visual,
                      XCB_CW_BACK_PIXEL,
                      mask_vals);

    title = "xcb intro";
    title_len = (uint32_t)strlen(title);

    xcb_change_property(xcb_conn,
                        XCB_PROP_MODE_REPLACE,
                        win,
                        XCB_ATOM_WM_NAME,
                        XCB_ATOM_STRING,
                        8,
                        title_len,
                        title);

    xcb_map_window(xcb_conn, win);

    if (xcb_flush(xcb_conn) <= 0) {
        fprintf(stderr, "WARN : Could not xcb_flush(xcb_conn)\n");
    }

    while ((ev = xcb_wait_for_event(xcb_conn)) != NULL) {
        free(ev);
    }

    xcb_disconnect(xcb_conn);
    printf("INFO : works fine and disconnecting\n");

    return EXIT_SUCCESS;

}

