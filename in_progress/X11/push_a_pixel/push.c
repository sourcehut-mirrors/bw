
/*
 * push.c X11 calls to push a pixel around a toroid
 *
 *     Zusammengestohlen aus Verschiedenem diesem und jenem.
 *                            Ludwig van Beethoven
 *
 *     "Cobbled together from various things, this and that."
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
#include <X11/Xutil.h>

#include <X11/keysym.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <sched.h>
#include <time.h>
#include <math.h>
#include <fenv.h>

#include <inttypes.h>

#include <locale.h>
#include <unistd.h>
#include <errno.h>


#define VERBOSE 1

void
get_and_look_image(Display * dsp, Window win0, int mouse_x, int mouse_y);

GC create_gc(Display *dsp, Window win);

int X_error_handler(Display *dsp, XErrorEvent *errevt);

int sysinfo(int verbose);

/* local defs where 1044 pixels is more or less full screen
 * and 660 pixels square fits into a neat 720p res OBS setup */
#define WIN_WIDTH 1044
#define WIN_HEIGHT 1044

/* we offset the window from the upper left corner of the root
 * X11 display */
#define SCREEN_X_OFFSET 10
#define SCREEN_Y_OFFSET 10

int main(int argc, char **argv)
{
    /* our display and window and graphics context */
    Display *dsp;
    Window win0;
    XWMHints wmhints;  /* magic from XAllocSizeHints */
    GC gc0;
    Colormap screen_colormap;
    XEvent event;
    Font type_font;

    Pixmap cursor_pixmap, cursor_mask_pixmap;
    unsigned int x_hot_return_cursor, y_hot_return_cursor;
    int bitmap_x_hot_return_cursor, bitmap_y_hot_return_cursor;
    int bitmap_mask_x_hot_return_cursor, bitmap_mask_y_hot_return_cursor;
    unsigned int width_return_cursor, height_return_cursor;
    unsigned int width_return_mask_cursor, height_return_mask_cursor;
    int cursor_err_flag = 0;
    Cursor target_cursor;
    int pixmap_format_count;
    int image_byte_order;
    int bitmap_bit_order;
    XPixmapFormatValues *list_of_pixmap_formats;

    /* Our primary plotting window has a pale grey 0x0F0F0f bg
     * but for debugging mouse locations then it may be nice
     * to use tomato FF6347 */
    unsigned long gc0_bg = 0xFF6347;

    /* there is no reason to think this is anything less than
     * a pure hack and thus all of this will be ugly and I
     * dont really give a damn ... at this time */
    double alpha, beta, delta_s;

    /* a very few colours */
    XColor red, green, blue, yellow, cyan, magenta;
    XColor cornflowerblue, royal_blue, very_dark_grey;
    XColor tomato, rebecca_purple, black, hack_me_baby;

    /* setup mouse x and y */
    int mouse_x = -1, mouse_y = -1;
    int mouse_x_raw, mouse_y_raw;

    /* some primordial vars */
    int disp_width, disp_height;
    int disp_width_mm, disp_height_mm;
    unsigned int width, height;
    int conn_num, screen_num, depth;
    int offset_x, offset_y;
    int p, q, lx, ly, ux, uy;
    int eff_width, eff_height, vbox_w, vbox_h;

    /* these next few are just mouse button counters where the
     * roll_up and roll_dn are mouse wheel events that I have
     * not bothered to track ... yet */
    int button = 0;
    int left_count, mid_count, right_count, roll_up_count, roll_dn_count;

    char *disp_name = NULL;

    /* TODO deal with a real border better than just 4 magic pixels */
    XSetWindowAttributes win0_attribs;
    unsigned long win_attributes_mask = CWBackPixel | CWBorderPixel | CWEventMask;

    /* thanks again to great people mariang */
    int keybrd_mask = (KeyPressMask | KeyReleaseMask);
    int button_mask = (ButtonPressMask | ButtonReleaseMask);
    int window_mask = (EnterWindowMask | LeaveWindowMask);
    int motion_mask = (PointerMotionMask | ButtonMotionMask);
    int event_mask  = (keybrd_mask | button_mask | window_mask );

    /* small general purpose char buffer */
    char *buf = calloc((size_t)128,sizeof(unsigned char));
    size_t buf_len = 0;

    /* I do not recall what this is for but we need it */
    XSizeHints wmsize;

    /* most of these are not even used ... yet */
    left_count = 0;
    right_count = 0;
    mid_count = 0;
    roll_up_count = 0;
    roll_dn_count = 0;

    setlocale(LC_ALL, "C");
    sysinfo(VERBOSE);

    printf("\n X11 :\n");
    XSetErrorHandler(X_error_handler);

    /* should work with a null display name */
    dsp = XOpenDisplay(disp_name);
    if (dsp == NULL) {
        fprintf(stderr, "%s: no X server?? '%s'\n", argv[0], disp_name);
        return EXIT_FAILURE;
    }

    conn_num = XConnectionNumber(dsp);
    printf("     : connection number %i\n", conn_num);

    screen_num = DefaultScreen(dsp);
    printf("     : screen number %i\n", screen_num);

    depth = XDefaultDepth(dsp,screen_num);
    printf("     : default depth is %i\n", depth);

    /* TODO get a list of the available fonts and then
     * use one that should work in the correct size */
    type_font = XLoadFont(dsp,
            "-xos4-termingus-medium-r-normal--16-160-72-72-c-80-iso10646-1");

    disp_width = DisplayWidth(dsp, screen_num);
    disp_height = DisplayHeight(dsp, screen_num);

    disp_width_mm = DisplayWidthMM(dsp, screen_num);
    disp_height_mm = DisplayHeightMM(dsp, screen_num);

    printf("     : display resolution %i wide and %i high.\n",
                                   disp_width, disp_height);

    printf("     : display size in mm %i wide and %i high.\n",
                                   disp_width_mm, disp_height_mm);

    /* hard coded size for the whole mess */
    width = WIN_WIDTH;
    height = WIN_HEIGHT;
    if ( ( disp_width < (int)width ) || ( disp_height < (int)height ) ) {
        fprintf(stderr, "ERROR: screen is too small\n\n");
        return EXIT_FAILURE;
    }

    /* hard coded screen offset */
    offset_x = SCREEN_X_OFFSET;
    offset_y = SCREEN_Y_OFFSET;

    printf("     : offset x=%i y=%i\n", offset_x, offset_y);

    /* if we want a non-resizable window set override_redirect = 1
     * otherwise leave it as zero */
    win0_attribs.override_redirect = 1;
    win0_attribs.background_pixmap = None;
    win0_attribs.backing_store = Always;
    win0_attribs.event_mask = event_mask; 
    win0_attribs.border_pixel = BlackPixel(dsp, screen_num);

    /* second to last parameter is CWOverrideRedirect but if we
     * try wtf then this tosses an error ?? for unknown reasons
     *
     *
     * as seen in
     * https://www.x.org/releases/X11R7.7/doc/libX11/libX11/libX11.html#Window_Attributes
     *
     *  Both InputOutput and InputOnly windows have the following common
     *  attributes, which are the only attributes of an InputOnly window:
     *
     *       win-gravity, event-mask, do-not-propagate-mask,
     *       override-redirect, cursor
     *
     * If you specify any other attributes for an InputOnly window, a
     * BadMatch error results.
     *
     * this should just work but it does not 
     *         wtf = CWOverrideRedirect;
     */
    win_attributes_mask = CWBackPixel | CWBorderPixel | CWEventMask;
    win0 = XCreateWindow(dsp,
                         RootWindow(dsp, DefaultScreen(dsp)),
                         offset_x, offset_y, width, height, 0,
                         CopyFromParent, CopyFromParent,
                         CopyFromParent, win_attributes_mask,
                         &win0_attribs);

    wmsize.flags = USPosition | USSize; /* user specified pos and size */

    XSetWMNormalHints( dsp, win0, &wmsize );
    wmhints.initial_state = NormalState;
    wmhints.flags = StateHint;
    XSetWMHints( dsp, win0, &wmhints);

    XSetWindowBackground( dsp, win0, gc0_bg);
    XClearWindow(dsp, win0);
    XMapWindow(dsp, win0);
    XFlush(dsp);


    /* TODO maybe we need this ? maybe not ? 
     */
    XSetInputFocus(dsp, win0, RevertToParent, CurrentTime);
    gc0 = create_gc(dsp, win0);

    XSync(dsp, False);

    /* int XReadBitmapFile(display, d, filename, width_return,
     *                     height_return, bitmap_return,
     *                     x_hot_return, y_hot_return)
     *
     *     Display *display;
     *     Drawable d;
     *     char *filename;
     *     unsigned int *width_return, *height_return;
     *     Pixmap *bitmap_return;
     *     int *x_hot_return, *y_hot_return;
     *
     * The XReadBitmapFile function reads in a file containing a bitmap.
     * The file is parsed in the encoding of the current locale. The
     * ability to read other than the standard format is implementation
     * dependent. If the file cannot be opened, XReadBitmapFile returns
     * BitmapOpenFailed. If the file can be opened but does not contain
     * valid bitmap data, it returns BitmapFileInvalid. If insufficient
     * working storage is allocated, it returns BitmapNoMemory. If the
     * file is readable and valid, it returns BitmapSuccess.
     */
    cursor_err_flag = XReadBitmapFile( dsp, win0, "./x32",
                                       &width_return_cursor,
                                       &height_return_cursor,
                                       &cursor_pixmap,
                                       &bitmap_x_hot_return_cursor,
                                       &bitmap_y_hot_return_cursor);

    if ( cursor_err_flag != BitmapSuccess ) {
        /* TODO should be a show stopper given that we need
         * an X11 cursor overlay */
        fprintf (stderr,"dBUG : bitmap fails to load %i\n",
                                                       cursor_err_flag);
    } else {
        printf ("INFO : cursor_pixmap        width_return = %i\n",
                                                   width_return_cursor);

        printf ("INFO : cursor_pixmap       height_return = %i\n",
                                                  height_return_cursor);

        printf ("INFO : cursor_pixmap      hotspot = ( %2i, %2i )\n",
                                                   bitmap_x_hot_return_cursor,
                                                   bitmap_y_hot_return_cursor);
    }

    cursor_err_flag = XReadBitmapFile( dsp, win0, "./x32m",
                                       &width_return_mask_cursor,
                                       &height_return_mask_cursor,
                                       &cursor_mask_pixmap,
                                       &bitmap_mask_x_hot_return_cursor,
                                       &bitmap_mask_y_hot_return_cursor);

    if ( cursor_err_flag != BitmapSuccess ) {
        /* TODO this is a show stopper given that we need the X11 cursor mask */
        fprintf (stderr,"dBUG : mask bitmap fails to load %i\n", cursor_err_flag );
    } else {
        printf ("INFO : cursor_mask_pixmap   width_return = %i\n",
                                                   width_return_cursor);

        printf ("INFO : cursor_mask_pixmap  height_return = %i\n",
                                                  height_return_cursor);

        printf ("INFO : cursor_mask_pixmap hotspot = ( %2i, %2i )\n",
                                                   bitmap_mask_x_hot_return_cursor,
                                                   bitmap_mask_y_hot_return_cursor);
    }

    /* for the sake of being really pedantic we should check that the
     * cursor image and cursor mask image both have the same hot spot */
    if ( ( bitmap_x_hot_return_cursor != bitmap_mask_x_hot_return_cursor )
            ||
         ( bitmap_y_hot_return_cursor != bitmap_mask_y_hot_return_cursor ) ) {
        printf ("WARN : the bitmap image and bitmap mask have diff hotspot\n");
        printf ("     : we shall assume the bitmap image is correct and ignore\n");
        printf ("     : the bitmap mask hotspot data\n");
    }
    x_hot_return_cursor = (unsigned int)bitmap_x_hot_return_cursor;
    y_hot_return_cursor = (unsigned int)bitmap_y_hot_return_cursor;

    /* now we do need some colors */
    screen_colormap = XDefaultColormap(dsp, DefaultScreen(dsp));
    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "red", &red, &red) == 0) {
        fprintf(stderr, "XAllocNamedColor - no red color?\n");
        return EXIT_FAILURE;
    }
    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "green", &green, &green) == 0) {
        fprintf(stderr, "XAllocNamedColor - red works but green no??\n");
        return EXIT_FAILURE;
    }
    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "blue", &blue, &blue) == 0) {
        fprintf(stderr, "XAllocNamedColor - red and green okay but blue??\n");
        return EXIT_FAILURE;
    }
    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "yellow", &yellow, &yellow) == 0) {
        fprintf(stderr, "XAllocNamedColor - yellow bork bork bork!\n");
        return EXIT_FAILURE;
    }

    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "cyan", &cyan, &cyan) == 0) {
        fprintf(stderr, "XAllocNamedColor - cyan bork bork bork!\n");
        return EXIT_FAILURE;
    }

    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "magenta", &magenta, &magenta) == 0) {
        fprintf(stderr, "XAllocNamedColor - magenta bork bork!\n");
        return EXIT_FAILURE;
    }

    /* for reasons obscure we need to define the colour black */
    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "black", &black, &black) == 0) {
        fprintf(stderr, "XAllocNamedColor - black bork bork!\n");
        return EXIT_FAILURE;
    }

    /* cornflowerblue is #6495ED */
    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "cornflowerblue",
                         &cornflowerblue, &cornflowerblue) == 0) {
        fprintf(stderr, "XAllocNamedColor - cornflowerblue fails.\n");
        return EXIT_FAILURE;
    }

    /* tomato is #FF6347 */
    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "tomato",
                         &tomato, &tomato) == 0) {
        fprintf(stderr, "XAllocNamedColor - tomato fails.\n");
        return EXIT_FAILURE;
    }

    /* Rebecca Purple is 0x663399 */
    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "Rebecca Purple",
                         &rebecca_purple, &rebecca_purple) == 0) {
        fprintf(stderr, "XAllocNamedColor - Rebecca Purple fails.\n");
        return EXIT_FAILURE;
    }

    /* request Royal Blue which should be #4169E1 however we
     * will get whatever the hardware can map closest to the
     * request */
    royal_blue.flags= DoRed | DoGreen | DoBlue;
    royal_blue.red = 0x4100;
    royal_blue.green = 0x6900;
    royal_blue.blue = 0xe100;
    if ( XAllocColor(dsp, screen_colormap, &royal_blue) == 0 ) {
        fprintf(stderr, "XAllocColor - royal_blue fails.\n");
        return EXIT_FAILURE;
    }

    /* We need an inner grid which in our main plot window
     * which should be a subtle very very dark grey.
     * Here we manually define the rgb components using 16bit
     * values and then create the new color */
    very_dark_grey.flags= DoRed | DoGreen | DoBlue;
    very_dark_grey.red = 0x1f00;
    very_dark_grey.green = 0x1f00;
    very_dark_grey.blue = 0x1f00;
    if ( XAllocColor(dsp, screen_colormap, &very_dark_grey) == 0 ) {
        fprintf(stderr, "XAllocColor - very_dark_grey fails.\n");
        return EXIT_FAILURE;
    }

    /* some dumb hack color to wreck havok with */
    hack_me_baby.flags= DoRed | DoGreen | DoBlue;
    hack_me_baby.red = 0x4100;
    hack_me_baby.green = 0x6900;
    hack_me_baby.blue = 0xe100;
    if ( XAllocColor(dsp, screen_colormap, &hack_me_baby) == 0 ) {
        fprintf(stderr, "XAllocColor - hack_me_baby fails.\n");
        return EXIT_FAILURE;
    }


    /* from the manpage
     *
     *  Cursor XCreatePixmapCursor(display, source, mask,
     *               foreground_color, background_color, x, y)
     *
     *     Display *display;
     *     Pixmap source;
     *     Pixmap mask;
     *     XColor *foreground_color;
     *     XColor *background_color;
     *     unsigned int x, y;
     *
     *     x, y    Specify the x and y coordinates, which indicate
     *             the hotspot relative to the source's origin.
     *
     * here we need cursor_pixmap and cursor_mask_pixmap
     * also just use XBlackPixel(display, screen_num) as background.
     */

    target_cursor = XCreatePixmapCursor(dsp, cursor_pixmap,
                                             cursor_mask_pixmap,
                                             &yellow, &black,
                                             x_hot_return_cursor,
                                             y_hot_return_cursor);

    XDefineCursor(dsp, win0, target_cursor);


    /* from the manpage 
     *
     *
     *    int XGrabPointer(display, grab_window, owner_events,
     *                     event_mask, pointer_mode,
     *                     keyboard_mode, confine_to, cursor, time)
     *
     *     Display *display;
     *     Window grab_window;
     *     Bool owner_events;
     *     unsigned int event_mask;
     *     int pointer_mode, keyboard_mode;
     *     Window confine_to;
     *     Cursor cursor;
     *     Time time;
     *
     * also of course 
     *
     *     XUngrabPointer(display, time)
     *      Display *display;
     *     Time time;
     *
     */

    /* TODO the third to last parameter may confine the pointer to win0
     * or it may be left as None */

/* We DO NOT NEED to grab the pointer before we click on the window

    XGrabPointer(dsp, win0, False, ButtonPressMask, GrabModeAsync,
                           GrabModeAsync, None, None, CurrentTime);
*/

    /* slide in the ExposureMask just to see what happens */
    XSelectInput(dsp, win0, ExposureMask | ButtonPressMask | KeyPressMask);


    /* main plot window yellow pixel at each corner 5 pixels indent */
    XSetForeground(dsp, gc0, yellow.pixel);
    XDrawPoint(dsp, win0, gc0, 4, 4);
    XDrawPoint(dsp, win0, gc0, 4, (int)height - 5);
    XDrawPoint(dsp, win0, gc0, (int)width - 5, 5);
    XDrawPoint(dsp, win0, gc0, (int)width - 5, (int)height - 5);

    XSetLineAttributes(dsp, gc0, 1, LineSolid, CapButt, JoinMiter);

    /* set our graph box inside by OFFSET pixels
     *
     * reuse the offset_foo vars from above as we do not
     * need them for window location anymore. So we can
     * use them as interior offset distances for our plot.
     */
     offset_x = 10;
     offset_y = 10;

     /* upper left point */
     ux = offset_x;
     uy = offset_y;

     /* lower right point */
     lx = (int)width - offset_x;
     ly = (int)height - offset_y;

     /* therefore we have effective box width and height */
     eff_width = lx - ux;
     eff_height = ly - uy;

     printf("     : eff_width = %5i    eff_height = %5i\n\n",
                            eff_width, eff_height);
     printf("--------------------------------------------\n");

     XSetForeground(dsp, gc0, WhitePixel(dsp, screen_num));

    /****************************************************************
     *
     * The viewport is made up of a neat grid of 16 x 16 little box
     * areas and we can lay down a lightly colored dashed lines to
     * indicate where they are. We may as well refer to these little
     * boxes as view box regions. Starting from the lower left at
     * vbox [0] [0] upwards to the upper most right corner which
     * we can call vbox [15] [15].
     *
     * Each of these vbox elements has a height and width in the
     * on screen pixels of :
     *
     *     vbox_w = eff_width/16
     *
     *     vbox_h = eff_height/16
     *
     * These may come in handy later to identify where the user has
     * clicked and to perhaps identify a small region that can be
     * computed without the burden of computing the entire viewport.
     ****************************************************************/
    vbox_w = eff_width/16;
    vbox_h = eff_height/16;

    /* horizontal tic marks */
    for ( q=offset_x + vbox_w; q<lx; q+=vbox_w ){
        XDrawLine(dsp, win0, gc0, q, 8, q, 12);
        XDrawLine(dsp, win0, gc0, q, (int)height - 8, q, (int)height - 12);
    }
    XFlush(dsp);

    /* vertical minor tic marks at every 16th of the interior viewport
     * drawing area */
    for ( p = offset_y + vbox_h; p < ly; p += vbox_h ){
        XDrawLine(dsp, win0, gc0, 8, p, 12, p);
        XDrawLine(dsp, win0, gc0, (int)width - 8, p, (int)width - 12, p);
    }
    XFlush(dsp);

    /* now we use the very dark grey color we created */
    XSetForeground(dsp, gc0, very_dark_grey.pixel);


    /* draw the vertical lines */
    for ( q=offset_x + vbox_w; q<lx; q+=vbox_w ){
        XDrawLine(dsp, win0, gc0, q, 13, q, (int)height - 13);
    }

    /* draw the horizontal lines */
    for ( q=offset_y + vbox_h; q<ly; q+=vbox_h ){
        XDrawLine(dsp, win0, gc0, 13, q, (int)width - 13, q);
    }

    /* green text as default */
    XSetForeground(dsp, gc0, green.pixel);

    /* royal blue border around the main viewport */
    XSetForeground(dsp, gc0, royal_blue.pixel);
    XDrawLine(dsp, win0, gc0, 11, 11, (int)width - 11, 11);
    XDrawLine(dsp, win0, gc0, (int)width - 11, 11, (int)width - 11, (int)height - 10);
    XDrawLine(dsp, win0, gc0, (int)width - 10, (int)height - 10, 10, (int)height - 10);
    XDrawLine(dsp, win0, gc0, 10, (int)height - 10, 10, 11);

    XFlush(dsp);


    list_of_pixmap_formats = XListPixmapFormats(dsp, &pixmap_format_count);

    if ( pixmap_format_count != 0 ) {

        printf ("\n-------- XListPixmapFormats count is %2i --------\n",
                           pixmap_format_count);

        for ( p = 0; p < pixmap_format_count; p++ ) {
            printf ("PixmapFormat[%02i] {\n", p);

            printf ("             depth = %i\n",
                                  list_of_pixmap_formats[p].depth);

            printf ("    bits_per_pixel = %i\n",
                                  list_of_pixmap_formats[p].bits_per_pixel);

            printf ("      scanline_pad = %i\n",
                                  list_of_pixmap_formats[p].scanline_pad);

            printf ("                 }\n");
        }
        printf ("------------------------------------------------\n");
    }

    image_byte_order = ImageByteOrder(dsp);
    bitmap_bit_order = BitmapBitOrder(dsp);

    /* I will need some floating point stuff */
    delta_s = M_PI / 1024.0;

    while(1){

        XNextEvent(dsp,&event);
        /* in the future this will not be wise
         * if we track mouse drags */
        mouse_x=event.xbutton.x;
        mouse_y=event.xbutton.y;

        if ( ( event.type == KeyPress ) 
             &&
             ( XLookupKeysym(&event.xkey, 0) == XK_Escape ) ) {
            printf("ESC\n");
            goto cleanup;
        }

        switch(event.type) {

            case EnterNotify:
                printf("Grabbing pointer\n");
                XSelectInput(dsp, win0, event_mask);
                break;

            case LeaveNotify:
                printf ("Releasing pointer\n");
                XSelectInput(dsp, win0, window_mask);
                XUngrabPointer (dsp, CurrentTime);
                break;

            case ButtonPress:
                /* display something so I have a clue where we are */
                XSetForeground (dsp, gc0, green.pixel);
                snprintf (buf, 127, "raw  [ %-4i , %-4i ]", mouse_x, mouse_y);
                fprintf (stderr, "%s\n", buf);

                XDrawImageString (dsp, win0, gc0,
                                      (20 + left_count * 140) % 900,
                                      (20 + right_count * 20) % 900, buf,
                                      (int) strlen (buf));


                alpha = M_PI * ((double)( mouse_x - 10 - 512 )) / 512.0;

                buf[0] = '\0';
                snprintf (buf, 127, "alpha %-+22.16e", alpha);
                buf_len = strlen(buf);

                XSetForeground (dsp, gc0, yellow.pixel);
                XDrawImageString (dsp, win0, gc0,
                                      (20 + left_count * 140) % 900,
                                      (40 + right_count * 20) % 900, buf,
                                      (int)buf_len);

                fprintf (stderr, "%s\n", buf);
                buf[0] = '\0';

                /* TODO fix this wrong shit */
                beta = M_PI * ((double)( mouse_x - 1024 - 10 )) / 512.0;

                snprintf (buf, 127, "beta %-+22.16e", beta);
                buf_len = strlen(buf);

                XDrawImageString (dsp, win0, gc0,
                                     (20 + left_count * 140) % 900,
                                     (60 + right_count * 20) % 900, buf,
                                     (int)buf_len);

                fprintf (stderr, "%s\n", buf);
                buf[0] = '\0';

                switch(event.xbutton.button) {

                    case Button1: /* left mouse button */
                        printf ("left click\n");
                        button=Button1;
                        left_count += 1;
                        break;

                    case Button2: /* middle mouse scroll button */
                        printf ("Middle click\n");
                        button=Button2;
                        mid_count += 1;

                        /* TODO need some way to push data around */

                        break;

                    case Button3: /* right mouse button */
                        printf ("right click\n");
                        button=Button3;
                        right_count += 1;
                        break;

                    case Button4: /* mouse scroll wheel up */
                        printf ("roll up\n");
                        button=Button4;
                        roll_up_count += 1;
                        break;

                    case Button5: /* mouse scroll wheel down */
                        printf ("roll down\n");
                        button=Button5;
                        roll_dn_count += 1;
                        break;

                    default:
                        break;
                }
            break;

            case KeyPress:
                printf ("'%c' was pressed\n", XLookupKeysym (&event.xkey, 0));
                break;

            case KeyRelease:
                printf ("Key released\n");
                break;
            case ButtonRelease:
                printf ("Button released\n");
                break;

        default:
            break;
        }

        if (event.type != KeyRelease && event.type != ButtonRelease) {
            printf ("event registered, while mouse was at %d %d \n", mouse_x, mouse_y);
        }

        mouse_x_raw = mouse_x;
        mouse_y_raw = mouse_y;

        if ( button == Button3 ) {
            get_and_look_image(dsp, win0, mouse_x, mouse_y);
        }
    }

cleanup:

    XFreeCursor(dsp, target_cursor);
    XFreePixmap(dsp, cursor_pixmap);
    XFreePixmap(dsp, cursor_mask_pixmap);
    XCloseDisplay(dsp);

    printf("\n");

    free(buf);
    buf = NULL;

    if ( list_of_pixmap_formats  != NULL ) XFree(list_of_pixmap_formats);

    return EXIT_SUCCESS;

}

void
get_and_look_image(Display *dsp, Window win0, int mouse_x, int mouse_y)
{
    int p, q, offset = 0;
    XImage *f64x64 = NULL;

    /* the only options that I care about are the width and height
     * at 64x64 as well as the possible image format. There are
     * two such formats : XYPixmap or ZPixmap.
     *
     * I have no idea what those mean.
     */
    f64x64 = XGetImage(dsp, win0, mouse_x, mouse_y,
                            64, 64,
                            AllPlanes, ZPixmap);

    if (f64x64 != NULL) {

        printf ("f64x64 = addr %p\n", f64x64);

        printf ("f64x64.width  = %i\n", f64x64->width);
        printf ("f64x64.height = %i\n", f64x64->height);

        /* X11 image data may be little endian or big endian
         * as well as the internal bit order may be reversed.
         * This means a big endian machine with big endian bits
         * will have data decimal 654321 == 0x09 FB F1 which looks
         * just fine to the human eye. However a little endian
         * and LSB bit order would be :
         *
         * reverse the 0x09 FB F1 : 0000 1001 1111 1011 1111 0001
         * where we now have        1000 1111 1101 1111 1001 0000
         *
         */
        printf ("f64x64.byte_order       = ");
        if (f64x64->byte_order == LSBFirst) {
            printf ("LSBFirst\n");
        } else {
            printf ("MSBFirst\n");
        }

        printf ("f64x64.bitmap_bit_order = ");
        if (f64x64->bitmap_bit_order == LSBFirst) {
            printf ("LSBFirst\n");
        } else {
            printf ("MSBFirst\n");
        }

        printf ("f64x64.bitmap_unit       = %i\n", f64x64->bitmap_unit);

        /* This is generally a bad idea */
        if ( f64x64->bitmap_unit%8 == 0 ) {
            printf("f64x64.bitmap_unit/8 = %i\n", f64x64->bitmap_unit / 8 );
            printf("\n-----------------------------");
            printf ("\n");
            for ( p = 0; p < f64x64->width; p++ ) {
                for ( q = 0; q < f64x64->height; q++ ) {
                    if ( offset%16 == 0 ) printf ("\n%08x    ", offset);
                    printf (" %02x", (uint8_t) *((f64x64->data)+offset));
                    offset += 1;
                }
            }
        }
        printf ("\n-----------------------------\n");

        XDestroyImage(f64x64);
        f64x64 = NULL;

    }
}

