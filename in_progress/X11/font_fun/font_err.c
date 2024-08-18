
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

/* some large number for the length of the fonts list */
#define N_START INT_MAX

#include <X11/Xlib.h>
#include <X11/Xutil.h>

/* #include <X11/keysym.h> */

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

/* we may need these later ....
void
draw_text_on_screen (Display * dsp, Window win0, int mouse_x, int mouse_y);

Window create_borderless_topwin(Display *dsp,
                         unsigned int width, unsigned int height,
                         int x, int y,
                         unsigned long bg_color);

GC create_gc(Display *dsp, Window win);

int sysinfo(int verbose);

*/

int X_error_handler(Display *dsp, XErrorEvent *errevt);

/* a window size */
#define WIN_WIDTH  640
#define WIN_HEIGHT 480

/* we offset the window from the upper left corner of the root
 * X11 display */
#define SCREEN_X_OFFSET 10
#define SCREEN_Y_OFFSET 10

int main(int argc, char **argv)
{
    /* our display and window and graphics context */
    Display *dsp;
    Window win0;

    /* why do I want window manager hints? I dunnoooo ...
    XWMHints wmhints;   magic from XAllocSizeHints 
    */

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

    /* dirty little pixmap that we use and throw away */
    XImage *foobar = NULL;

    /* dirty list of fonts */
    char **font_list;

    /* a very few colours */
    XColor red, green, blue, yellow, cyan, magenta;
    XColor cornflowerblue, royal_blue, very_dark_grey;
    XColor tomato, rebecca_purple, black, hack_me_baby;

    /* setup mouse x and y */
    int mouse_x = -1, mouse_y = -1;
    int mouse_x_raw, mouse_y_raw;

    /* some primordial vars */
    int p, q;
    int disp_width, disp_height;
    unsigned int width, height;
    int conn_num, screen_num, depth;
    int offset_x, offset_y;
    int lx, ly, ux, uy;
    int eff_width, eff_height, vbox_w, vbox_h;

    /* small general purpose char buffer */
    char *buf = calloc((size_t)128,sizeof(unsigned char));

    /* these next five are just mouse button counters where the
     * roll_up and roll_dn are mouse wheel events */
    int button = 0;
    int left_count, mid_count, right_count, roll_up_count, roll_dn_count;

    left_count = 0;
    mid_count = 0;
    right_count = 0;
    roll_up_count = 0;
    roll_dn_count = 0;

    /* keep this simple */
    setlocale(LC_ALL, "C");

    /* in the beginning we have nothing for a display */
    char *disp_name = NULL;

    width = WIN_WIDTH;
    height = WIN_HEIGHT;

    printf("\n X11 : default width=%4i height=%4i\n", width, height);

    /*
     * see
     * https://www.x.org/releases/current/doc/man/man3/XSetErrorHandler.3.xhtml
     *
     * per the great ddmage we know that the return value of this messy
     * thing is ignored
     */
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
    font_list = XListFonts(dsp, char *pattern, int maxnames, int *actual_count_return);



    type_font = XLoadFont(dsp,
            "-adobe-new c3ntury schoolbook-medium-r-normal--18-180-75-75-p-103-iso10646-1");

    disp_width = DisplayWidth(dsp, screen_num);
    disp_height = DisplayHeight(dsp, screen_num);

    printf("     : display seems to be %i wide and %i high.\n",
                                   disp_width, disp_height);

    if ( ( disp_width < (int)width ) || ( disp_height < (int)height ) ) {
        fprintf(stderr, "ERROR: screen is too small\n\n");
        return EXIT_FAILURE;
    }

    /* hard coded screen offset */
    offset_x = SCREEN_X_OFFSET;
    offset_y = SCREEN_Y_OFFSET;

    printf("     : offset x=%i y=%i\n", offset_x, offset_y);


cleanup:

    XCloseDisplay(dsp);

    printf("\n");

    /* it may seem insane to set the pointer to NULL after the
     * free() but why not have belt and suspenders safety? */
    free(buf);
    buf = NULL;

    return EXIT_SUCCESS;

}

int X_error_handler(Display *dsp, XErrorEvent *errevt)
{
    char error_string[128];
    Font type_font;

    int get_error_flag = XGetErrorText(dsp, errevt->error_code, error_string, sizeof(error_string));

    fprintf(stderr, "TRAP : Error %d (%s): request %d.%d serial %d\n",
                     errevt->error_code, error_string,
                     errevt->request_code, errevt->minor_code,
                     errevt->serial);

    /* Here is an example of error data :
     *
     * (gdb) print *errevt
     * $6 = {type = 0, display = 0x800c25000, resourceid = 52428801,
     *       serial = 7, error_code = 15 '\017', 
     *       request_code = 45 '-', minor_code = 0 '\000'}
     *
     * In the event that we fail to locate a FontName the normal
     * response would be this :
     *
     * X Error of failed request:  BadName (named color or font does not exist)
     *   Major opcode of failed request:  45 (X_OpenFont)
     *   Serial number of failed request:  7
     *   Current serial number in output stream:  9
     *
     */

    if (    ( errevt->error_code == 15 )
         && ( errevt->request_code == 45 )
         && ( errevt->minor_code == 0 )
         && ( errevt->serial == 7 ) ) {

        fprintf(stderr,"TRAP : X Error ");
        fprintf(stderr,"BadName (named color or font does not exist)\n");
        fprintf(stderr,"     :   Major opcode  : 45 (X_OpenFont)\n");
        fprintf(stderr,"     :   Error code    : 15 (XLoadFont)\n");
        fprintf(stderr,"     :   Minor opcode  :  0\n");
        fprintf(stderr,"     :   Serial number :  7\n");

        /* this may not exist for some people
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

/* 
static void
get_list(const char *pattern)
{
    char **fonts;
    int nnames = N_START;
    int available = nnames + 1;

    XFontStruct *info;

        for (;;) {
            if (long_list == L_MEDIUM)
                fonts = XListFontsWithInfo(dpy, pattern, nnames, &available,
                                           &info);
            else
                fonts = XListFonts(dpy, pattern, nnames, &available);
            if (fonts == NULL) {
                fprintf(stderr, "%s: pattern \"%s\" unmatched\n",
                        program_name, pattern);
                return;
            }
            if (available < nnames)
                break;
            if (long_list == L_MEDIUM)
                XFreeFontInfo(fonts, info, available);
            else
                XFreeFontNames(fonts);
            nnames = available * 2;
        }

        font_list = reallocarray(font_list,
                                 (font_cnt + available), sizeof(FontList));
        if (font_list == NULL)
            Fatal_Error("Out of memory!");
        for (int i = 0; i < available; i++) {
            font_list[font_cnt].name = fonts[i];
            if (long_list == L_MEDIUM)
                font_list[font_cnt].info = info + i;
            else
                font_list[font_cnt].info = NULL;

            font_cnt++;
        }
}
*/

