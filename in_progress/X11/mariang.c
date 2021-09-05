/*
 * cursor.c X11 calls to make a cursor
 *
 * Copyright (C) Dennis Clarke 2021
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
 *
 *    An XSI-conforming application should ensure that the feature
 *    test macro _XOPEN_SOURCE is defined with the value 600 before
 *    inclusion of any header. This is needed to enable the
 *    functionality described in The _POSIX_C_SOURCE Feature Test
 *    Macro and in addition to enable the XSI extension.
 *
 *********************************************************************/
#define _XOPEN_SOURCE 600

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

void
draw_a_circle (XColor hack_me_baby, XColor yellow, Display * dsp,
        Window win0, GC gc0, int mouse_x, int mouse_y);

void
draw_text_on_screen (Display * dsp, Window win0, int mouse_x, int mouse_y);


#define VERBOSE 1

Window create_borderless_topwin(Display * dsp,
				unsigned int width, unsigned int height,
				int x, int y, unsigned long bg_color);

GC create_gc(Display * dsp, Window win);

int X_error_handler(Display * dsp, XErrorEvent * errevt);

int sysinfo(int verbose);

/* local defs where 1044 pixels is more or less full screen
 * and 660 pixels square fits into a neat 720p res OBS setup */
#define WIN_WIDTH 1044
#define WIN_HEIGHT 1044

/* we offset the window from the upper left corner of the root
 * X11 display */
#define SCREEN_X_OFFSET 10
#define SCREEN_Y_OFFSET 10

#define MOUSE_LB	1
#define MOUSE_MB	2
#define MOUSE_RB	3
#define SCROLL_UP	4
#define SCROLL_DW	5


int main(int argc, char **argv)
{
/* our display and window and graphics context */
    Display *dsp;
    Window win0;
    XWMHints wmhints;		/* magic from XAllocSizeHints */
    GC gc0;
    Colormap screen_colormap;
    XEvent event;
    Font type_font;

    Pixmap cursor_pixmap, cursor_mask_pixmap;
    int x_hot_return_cursor, y_hot_return_cursor;
    int x_hot_return_mask_cursor, y_hot_return_mask_cursor;
    unsigned int width_return_cursor, height_return_cursor;
    unsigned int width_return_mask_cursor, height_return_mask_cursor;
    int cursor_err_flag = 0;

    XImage *foobar = NULL;

/* a very few colours */
    XColor red, green, blue, yellow, cyan, magenta;
    XColor cornflowerblue, royal_blue, very_dark_grey;
    XColor tomato, rebecca_purple, black, hack_me_baby;

/* setup mouse x and y */
    int mouse_x = -1, mouse_y = -1;
    int invert_mouse_x, invert_mouse_y;
    int mouse_x_raw, mouse_y_raw;

/* these next five are just mouse button counters where the
 * roll_up and roll_dn are mouse wheel events */
    int button = 0;

    /*	 
       int left_count, mid_count, right_count, roll_up_count,
roll_dn_count;
       left_count = 0;
       mid_count = 0;
       right_count = 0;
       roll_up_count = 0;
       roll_dn_count = 0;
     */
/* I know it seems like waste position, but we sum all events, or
 * used it as a parity check
 */
    unsigned int count[6] = { 0, 0, 0, 0, 0, 0 };

/* some primordial vars */
    int p, q;
    int disp_width, disp_height;
    unsigned int width, height;
    int conn_num, screen_num, depth;
    int offset_x, offset_y;
    int lx, ly, ux, uy;
    int gc0_x, gc0_y;
    int eff_width, eff_height, vbox_w, vbox_h;

/* These are the initial and normalized mouse fp64 values
 * from within a graphical context */
    double win_x, win_y;

/* small general purpose char buffer */
    char *buf = calloc((size_t) 128, sizeof(unsigned char));

    setlocale(LC_ALL, "C");
    sysinfo(VERBOSE);

    char *disp_name = NULL;
    unsigned int key = 0;

    width = WIN_WIDTH;
    height = WIN_HEIGHT;

    printf("\n X11 : ");
    printf("default width=%4i height=%4i\n", width, height);

    XSetErrorHandler(X_error_handler);

/* should work with a null display name */
    dsp = XOpenDisplay(disp_name);
    if (dsp == NULL) {
	fprintf(stderr, "%s: no X server?? '%s'\n", argv[0], disp_name);
	return EXIT_FAILURE;
    }

    conn_num = XConnectionNumber(dsp);
    printf("	 : connection number %i\n", conn_num);

    screen_num = DefaultScreen(dsp);
    printf("	 : screen number %i\n", screen_num);

    depth = XDefaultDepth(dsp, screen_num);
    printf("	 : default depth is %i\n", depth);

/* TODO get a list of the available fonts and then
 * use one that should work in the correct size */
    type_font =
	XLoadFont(dsp,
		 
"-xos4-termingus-medium-r-normal--16-160-72-72-c-80-iso10646-1");

    disp_width = DisplayWidth(dsp, screen_num);
    disp_height = DisplayHeight(dsp, screen_num);

    printf("	 : display seems to be %i wide and %i high.\n",
	   disp_width, disp_height);

    if ((disp_width < (int) width) || (disp_height < (int) height)) {
	fprintf(stderr, "ERROR: screen is too small\n\n");
	return EXIT_FAILURE;
    }

/* hard coded screen offset */
    offset_x = SCREEN_X_OFFSET;
    offset_y = SCREEN_Y_OFFSET;

    printf("	 : offset x=%i y=%i\n", offset_x, offset_y);

/* Our primary plotting window has a pale grey background
 * but for debugging mouse locations then it may be nice
 * to use tomato FF6347 */
    unsigned long gc0_bg = 0x0F0F0F;

    gc0_bg = 0x663399;		/* Rebecca Purple */


/* TODO deal with a real border better than just 4 magic pixels */
    XSetWindowAttributes win0_attribs;
    win0_attribs.override_redirect = 0; /* this was a nasty 1 */
    win0_attribs.background_pixmap = None;
    win0_attribs.backing_store = Always;

/* thanks again to great people mariang */
    int keybrd_mask = (KeyPressMask | KeyReleaseMask);
    int button_mask = (ButtonPressMask | ButtonReleaseMask);
    int window_mask = (EnterWindowMask | LeaveWindowMask);
    int motion_mask = (PointerMotionMask | ButtonMotionMask);
    int event_mask = (keybrd_mask | button_mask | window_mask);

    win0_attribs.event_mask = window_mask;

    win0_attribs.border_pixel = BlackPixel(dsp, screen_num);

/* as seen in
https://www.x.org/releases/X11R7.7/doc/libX11/libX11/libX11.html#Window_Att
ributes
 *
 *  Both InputOutput and InputOnly windows have the following common
 *  attributes, which are the only attributes of an InputOnly window:
 *
 *	 win-gravity, event-mask, do-not-propagate-mask,
 *	 override-redirect, cursor
 *
 * If you specify any other attributes for an InputOnly window, a
 * BadMatch error results.
 */
    unsigned long wtf = CWBackPixel | CWBorderPixel | CWEventMask;
    wtf = CWOverrideRedirect;

/* second to last parameter was CWOverrideRedirect but now 
 * we try wtf ?? */
    win0 = XCreateWindow(dsp,
			 RootWindow(dsp, DefaultScreen(dsp)),
			 offset_x, offset_y, width, height, 0,
			 CopyFromParent, CopyFromParent,
			 CopyFromParent, CWOverrideRedirect,
			 &win0_attribs);

    XSizeHints wmsize;
    wmsize.flags = USPosition | USSize; /* user specified pos and size */
    XSetWMNormalHints(dsp, win0, &wmsize);
    wmhints.initial_state = NormalState;
    wmhints.flags = StateHint;
    XSetWMHints(dsp, win0, &wmhints);

    XSetWindowBackground(dsp, win0, gc0_bg);
    XClearWindow(dsp, win0);
    XMapWindow(dsp, win0);
    XFlush(dsp);


/* TODO maybe we need this ? maybe not ? 
 */
    XSetInputFocus(dsp, win0, RevertToParent, CurrentTime);

    gc0 = create_gc(dsp, win0);

    XSync(dsp, False);

/* int XReadBitmapFile(display, d, filename, width_return,
 *		       height_return, bitmap_return,
 *		       x_hot_return, y_hot_return)
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
    cursor_err_flag = XReadBitmapFile(dsp, win0, "./x32",
				      &width_return_cursor,
				      &height_return_cursor,
				      &cursor_pixmap,
				      &x_hot_return_cursor,
				      &y_hot_return_cursor);

    if (cursor_err_flag != BitmapSuccess) {
	fprintf(stderr, "dBUG : bitmap fails to load %i\n",
		cursor_err_flag);
    } else {
	printf("INFO : cursor_pixmap	    width_return = %i\n",
	       width_return_cursor);

	printf("INFO : cursor_pixmap	   height_return = %i\n",
	       height_return_cursor);

	printf("INFO : cursor_pixmap	  hotspot = ( %2i, %2i )\n",
	       x_hot_return_cursor, y_hot_return_cursor);
    }

    cursor_err_flag = XReadBitmapFile(dsp, win0, "./x32m",
				      &width_return_mask_cursor,
				      &height_return_mask_cursor,
				      &cursor_mask_pixmap,
				      &x_hot_return_mask_cursor,
				      &y_hot_return_mask_cursor);

    if (cursor_err_flag != BitmapSuccess) {
	fprintf(stderr, "dBUG : mask bitmap fails to load %i\n",
		cursor_err_flag);
    } else {
	printf("INFO : cursor_mask_pixmap   width_return = %i\n",
	       width_return_cursor);

	printf("INFO : cursor_mask_pixmap  height_return = %i\n",
	       height_return_cursor);

	printf("INFO : cursor_mask_pixmap hotspot = ( %2i, %2i )\n",
	       x_hot_return_cursor, y_hot_return_cursor);
    }


/* now we do need some colors */
    screen_colormap = XDefaultColormap(dsp, DefaultScreen(dsp));
    if (XAllocNamedColor(dsp, screen_colormap, "red", &red, &red) == 0) {
	fprintf(stderr, "XAllocNamedColor - no red color?\n");
	return EXIT_FAILURE;
    }
    if (XAllocNamedColor(dsp, screen_colormap, "green", &green, &green) ==
	0) {
	fprintf(stderr, "XAllocNamedColor - red works but green no??\n");
	return EXIT_FAILURE;
    }
    if (XAllocNamedColor(dsp, screen_colormap, "blue", &blue, &blue) == 0)
{
	fprintf(stderr,
		"XAllocNamedColor - red and green okay but blue??\n");
	return EXIT_FAILURE;
    }
    if (XAllocNamedColor(dsp,
			 screen_colormap, "yellow", &yellow, &yellow) == 0)
    {
	fprintf(stderr, "XAllocNamedColor - yellow bork bork bork!\n");
	return EXIT_FAILURE;
    }

    if (XAllocNamedColor(dsp, screen_colormap, "cyan", &cyan, &cyan) == 0)
{
	fprintf(stderr, "XAllocNamedColor - cyan bork bork bork!\n");
	return EXIT_FAILURE;
    }

    if (XAllocNamedColor(dsp,
			 screen_colormap, "magenta", &magenta,
			 &magenta) == 0) {
	fprintf(stderr, "XAllocNamedColor - magenta bork bork!\n");
	return EXIT_FAILURE;
    }

/* for reasons obscure we need to define the colour black */
    if (XAllocNamedColor(dsp, screen_colormap, "black", &black, &black) ==
	0) {
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
			 screen_colormap, "tomato", &tomato, &tomato) == 0)
    {
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
 * will get whatever teh hardware can map closest to the
 * request */
    royal_blue.flags = DoRed | DoGreen | DoBlue;
    royal_blue.red = 0x4100;
    royal_blue.green = 0x6900;
    royal_blue.blue = 0xe100;
    if (XAllocColor(dsp, screen_colormap, &royal_blue) == 0) {
	fprintf(stderr, "XAllocColor - royal_blue fails.\n");
	return EXIT_FAILURE;
    }

/* We need an inner grid which in our main plot window
 * which should be a subtle very very dark grey.
 * Here we manually define the rgb components using 16bit
 * values and then create the new color */
    very_dark_grey.flags = DoRed | DoGreen | DoBlue;
    very_dark_grey.red = 0x1f00;
    very_dark_grey.green = 0x1f00;
    very_dark_grey.blue = 0x1f00;
    if (XAllocColor(dsp, screen_colormap, &very_dark_grey) == 0) {
	fprintf(stderr, "XAllocColor - very_dark_grey fails.\n");
	return EXIT_FAILURE;
    }

/* some dumb hack color to wreck havok with */
    hack_me_baby.flags = DoRed | DoGreen | DoBlue;
    hack_me_baby.red = 0x4100;
    hack_me_baby.green = 0x6900;
    hack_me_baby.blue = 0xe100;
    if (XAllocColor(dsp, screen_colormap, &hack_me_baby) == 0) {
	fprintf(stderr, "XAllocColor - hack_me_baby fails.\n");
	return EXIT_FAILURE;
    }


/* from the manpage
 *
 *  Cursor XCreatePixmapCursor(display, source, mask,
 *		 foreground_color, background_color, x, y)
 *
 *     Display *display;
 *     Pixmap source;
 *     Pixmap mask;
 *     XColor *foreground_color;
 *     XColor *background_color;
 *     unsigned int x, y;
 *
 *     x, y    Specify the x and y coordinates, which indicate
 *	       the hotspot relative to the source's origin.
 *
 * here we need cursor_pixmap and cursor_mask_pixmap
 * also just use XBlackPixel(display, screen_num) as background.
 */
    Cursor target_cursor = XCreatePixmapCursor(dsp, cursor_pixmap,
					       cursor_mask_pixmap,
					       &yellow,
					       &black,
					       x_hot_return_cursor,
					       y_hot_return_cursor);

    XDefineCursor(dsp, win0, target_cursor);


/* from the manpage 
 *
 *
 *    int XGrabPointer(display, grab_window, owner_events,
 *		       event_mask, pointer_mode,
 *		       keyboard_mode, confine_to, cursor, time)
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
 *	Display *display;
 *     Time time;
 *
 */

/* TODO the third to last parameter may confine the pointer to win0
 * or it may be left as None */

/* We DO NOT NEED to grab the pointer before we click on the window */
/* MarianG */

/* XGrabPointer(dsp, win0, False, event_mask, GrabModeAsync,
   GrabModeAsync, None, None, CurrentTime);
 */



/* maybe we copy and paste in the grid line stuff from Xmand */
/* main plot window yellow pixel at each corner 5 pixels indent */
    XSetForeground(dsp, gc0, yellow.pixel);
    XDrawPoint(dsp, win0, gc0, 5, 5);
    XDrawPoint(dsp, win0, gc0, 5, (int) height - 5);
    XDrawPoint(dsp, win0, gc0, (int) width - 5, 5);
    XDrawPoint(dsp, win0, gc0, (int) width - 5, (int) height - 5);

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
    lx = (int) width - offset_x;
    ly = (int) height - offset_y;

/* therefore we have effective box width and height */
    eff_width = lx - ux;
    eff_height = ly - uy;

    printf("	 : eff_width = %5i    eff_height = %5i\n\n",
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
     *	   vbox_w = eff_width/16
     *
     *	   vbox_h = eff_height/16
     *
     * These may come in handy later to identify where the user has
     * clicked and to perhaps identify a small region that can be
     * computed without the burden of computing the entire viewport.
     ****************************************************************/
    vbox_w = eff_width / 16;
    vbox_h = eff_height / 16;

/* horizontal tic marks */
    for (q = offset_x + vbox_w; q < lx; q += vbox_w) {
	XDrawLine(dsp, win0, gc0, q, 8, q, 12);
	XDrawLine(dsp, win0, gc0, q, (int) height - 8, q,
		  (int) height - 12);
    }
    XFlush(dsp);

/* vertical minor tic marks at every 16th of the interior viewport
 * drawing area */
    for (p = offset_y + vbox_h; p < ly; p += vbox_h) {
	XDrawLine(dsp, win0, gc0, 8, p, 12, p);
	XDrawLine(dsp, win0, gc0, (int) width - 8, p, (int) width - 12, p);
    }
    XFlush(dsp);

/* now we use the very dark grey color we created */
    XSetForeground(dsp, gc0, very_dark_grey.pixel);


/* draw the vertical lines */
    for (q = offset_x + vbox_w; q < lx; q += vbox_w) {
	XDrawLine(dsp, win0, gc0, q, 13, q, (int) height - 13);
    }

/* draw the horizontal lines */
    for (q = offset_y + vbox_h; q < ly; q += vbox_h) {
	XDrawLine(dsp, win0, gc0, 13, q, (int) width - 13, q);
    }

/* green text as default */
    XSetForeground(dsp, gc0, green.pixel);

/* royal blue border around the main viewport */
    XSetForeground(dsp, gc0, royal_blue.pixel);
    XDrawLine(dsp, win0, gc0, 11, 11, (int) width - 11, 11);
    XDrawLine(dsp, win0, gc0, (int) width - 11, 11, (int) width - 11,
	      (int) height - 10);
    XDrawLine(dsp, win0, gc0, (int) width - 10, (int) height - 10, 10,
	      (int) height - 10);
    XDrawLine(dsp, win0, gc0, 10, (int) height - 10, 10, 11);

    XFlush(dsp);


/* this is not really useful but fun to look at anyways */
    int pixmap_format_count;
    XPixmapFormatValues *list_of_pixmap_formats =
	XListPixmapFormats(dsp, &pixmap_format_count);
    if (pixmap_format_count != 0) {
	printf("\n-------- XListPixmapFormats count is %2i --------\n",
	       pixmap_format_count);
	for (p = 0; p < pixmap_format_count; p++) {
	    printf("PixmapFormat[%02i] {\n", p);
	    printf("		 depth = %i\n",
		   list_of_pixmap_formats[p].depth);
	    printf("	bits_per_pixel = %i\n",
		   list_of_pixmap_formats[p].bits_per_pixel);
	    printf("	  scanline_pad = %i\n",
		   list_of_pixmap_formats[p].scanline_pad);
	    printf("		     }\n");
	}
	printf("------------------------------------------------\n");
    }

/* this is a horror show with four possible ways to define
 * binary data order for bitmap and image data */
    int image_byte_order = ImageByteOrder(dsp);
    printf("	ImageByteOrder returns ");
    if (image_byte_order == LSBFirst) {
	printf("LSBFirst");
    } else {
	printf("MSBFirst");
    }
    printf("\n");

    int bitmap_bit_order = BitmapBitOrder(dsp);
    printf("	BitmapBitOrder returns ");
    if (bitmap_bit_order == LSBFirst) {
	printf("LSBFirst");
    } else {
	printf("MSBFirst");
    }
    printf("\n------------------------------------------------\n");

    XSelectInput(dsp, win0, window_mask);

    while (1) {

	XNextEvent(dsp, &event);
/* in the future this will not be wise
 * if we track mouse drags */
	mouse_x = event.xbutton.x;
	mouse_y = event.xbutton.y;

	switch (event.type) {
	case EnterNotify:
	    printf("\nGrabbing pointer\n");
	    XSelectInput(dsp, win0, button_mask);

	    break;
	case LeaveNotify:
	    printf("\nReleasing pointer / keyboard\n");
	    XSelectInput(dsp, win0, window_mask);
	    break;

	case KeyPress:
	    key = XLookupKeysym(&event.xkey, 0);
	    switch (key) {
	    case XK_Escape:
		printf("\n ESC was presses, clean and exit\n");
		goto cleanup;
	    default:
		/*
		   XSetForeground(dsp, gc0,red.pixel);
		   sprintf(buf,"key [%c]",key);
		   XDrawImageString(dsp, win0, gc0,mouse_x,mouse_y,buf,
		   (int) strlen(buf));
		 */
		fprintf(stderr, "%c", key);
		break;
	    }
	    break;

	case ButtonPress:

	    /* Draw info on window ... again, we will move to header */

	    XSetForeground(dsp, gc0, green.pixel);
	    sprintf(buf, "raw  [%-4i, %-4i]", mouse_x, mouse_y);
	    fprintf(stderr, "%s\n", buf);


	    /* gee .. how many times shall we do this ? duh
	     *
	     * TODO however for fun we can use the scroll wheel to
	     * adjust red green or blue pixel values just for 
	     * silly kicks ...
	     * */
	    XSetForeground(dsp, gc0, green.pixel);

	    XDrawImageString(dsp, win0, gc0,
			     (20 + count[MOUSE_LB] * 140) % 900,
			     (20 + count[MOUSE_RB] * 20) % 900, buf,
			     (int) strlen(buf));

	    count[event.xbutton.button] += 1;
	    switch (event.xbutton.button) {
	    case MOUSE_LB:
		XSelectInput(dsp, win0, event_mask);
		printf("left click - grabbing keyboard \n");
		break;
	    case MOUSE_MB:	/* middle mouse scroll button */
		printf("Middle click\n");
		draw_a_circle(hack_me_baby, yellow, dsp, win0,
			      gc0, mouse_x, mouse_y);
		break;
	    case MOUSE_RB:	/* right mouse button */
		printf("right click\n");
		draw_text_on_screen(dsp, win0, mouse_x, mouse_y);
		break;
	    case SCROLL_UP:	/* mouse scroll wheel up */
		printf("roll up\n");
		break;

	    case SCROLL_DW:	/* mouse scroll wheel down */
		printf("roll down\n");
		break;
	    }
	    break;
	default:
	    break;
	}

    }

  cleanup:
    XSelectInput(dsp, win0, NoEventMask);
    XFreeCursor(dsp, target_cursor);
    XFreePixmap(dsp, cursor_pixmap);
    XFreePixmap(dsp, cursor_mask_pixmap);
    XCloseDisplay(dsp);

    printf("\n");

/* it may seem insane to set the pointer to NULL after the
 * free() but why not have belt and suspenders safety? */
    free(buf);
    buf = NULL;

    if (list_of_pixmap_formats != NULL)
	XFree(list_of_pixmap_formats);

    return EXIT_SUCCESS;
}

void
draw_a_circle (XColor hack_me_baby,
               XColor yellow, Display * dsp,
               Window win0, GC gc0,
               int mouse_x, int mouse_y) {

    /* TODO hack a circle of colours
     *
     * we may do this sort of thing and hope it works however
     * it is not really correct :
     *
     * XColor.pixel = (((unsigned long)XColor.red) << 16)
     *               + (((unsigned long)XColor.green) << 8)
     *               + (unsigned long)XColor.blue;
     */

    int p;
    double angle, some_x, some_y;
    int radius_count = 0;

    /* for the heck of it 64 pixel radius */
    for (radius_count = 0; radius_count < 64; radius_count++) {
        for (p = 0; p < 720; p++) {

            /* quick hack convert from tens of degrees to
             * radians should be (p)( ( 2 x pi )/360 ) */

            angle = 2.0 * M_PI * p / 720.0;
            some_x = radius_count * cos (angle);
            some_y = radius_count * sin (angle);

            hack_me_baby.pixel =
                (((unsigned long) (p / 2) & 0xff) << 16) +
                (((unsigned long) radius_count) << 8) +
                (((unsigned long) (255.0 * ((float) p / 720.0))) & 0xff);

            XSetForeground (dsp, gc0, hack_me_baby.pixel);

            XDrawPoint (dsp, win0, gc0, mouse_x + (int) some_x, mouse_y + (int) some_y);

        }

        XFlush (dsp);

    }

    XSetForeground (dsp, gc0, yellow.pixel);

}

void
draw_text_on_screen (Display * dsp, Window win0, int mouse_x, int mouse_y)
{
    /*
     *  XImage *XGetImage(display, d, x, y, width,
     *                    height, plane_mask, format)
     *
     *  Display *display;
     *  Drawable d;
     *  int x, y;
     *  unsigned int width, height;
     *  unsigned long plane_mask;
     *  int format;
     */
    XImage *foobar = NULL;
    foobar =
 XGetImage (dsp, win0, mouse_x, mouse_y, 64, 64, AllPlanes, ZPixmap);

    if (foobar != NULL)
    {

 printf ("foobar = %p\n", foobar);

 printf ("foobar.width  = %i\n", foobar->width);
 printf ("foobar.height = %i\n", foobar->height);

 printf ("foobar.byte_order       = ");
 if (foobar->byte_order == LSBFirst)
 {
     printf ("LSBFirst\n");
 }
 else
 {
     printf ("MSBFirst\n");
 }

 printf ("foobar.bitmap_bit_order = ");
 if (foobar->bitmap_bit_order == LSBFirst)
 {
     printf ("LSBFirst\n");
 }
 else
 {
     printf ("MSBFirst\n");
 }

 printf ("foobar.bitmap_unit       = %i\n", foobar->bitmap_unit);

 /* we never should be looking at the raw image data anyways
  *
  *    bad bad abd crap do not do this damn it 
  *
  */

 /*
    int offset = 0;
    if ( foobar->bitmap_unit%8 == 0 ) {

    printf("foobar.bitmap_unit/8 = %i\n", foobar->bitmap_unit / 8 );
    printf("\n-----------------------------");
    printf ("\n");
    for ( p = 0; p < foobar->width; p++ )
    for ( q = 0; q < foobar->height; q++ )
    {
    if ( offset%16 == 0 ) printf ("\n%08x    ", offset);
    printf (" %02x", (uint8_t) *((foobar->data)+offset));
    offset += 1;
    }
    }
    printf ("\n-----------------------------\n");

  */

 /* we love that this is totally ass different from XFreeFOO() */
 //XDestroyImage(foobar);
 /* free(foobar); */
 foobar = NULL;

    }

    /* TODO what the heck does this do ?
     *
     *     XImage *XGetSubImage(display, d, x, y, width, height,
     *                          plane_mask, format, dest_image,
     *                          dest_x, dest_y)
     *
     *           Display *display;
     *           Drawable d;
     *           int x, y;
     *           unsigned int width, height;
     *           unsigned long plane_mask;
     *           int format;
     *           XImage *dest_image;
     *           int dest_x, dest_y;
     */
}


