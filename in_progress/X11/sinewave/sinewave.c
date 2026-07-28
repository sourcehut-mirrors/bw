
/* sinewave.c  with a pile of X11 new old stuff to use a front
 *             buffer and back image buffer. Which means swap
 *             the back to the front AFTER putting stuff into
 *             the back buffer only and then slam that into a
 *             X11 graphics context.
 *
 *             The idea of nanosleep() a while to allow for time
 *             to draw the backbuffer is a bit janky.
 *
 * ------------------------------------------------------------------
 *
 * NOTE : a pile of code snippets were yanked from all over the
 *        place and coffee was spilled. Most of this is all me
 *        and the X11 manpages and whatever I can rip from the
 *        glorious intertubes. Not yet a fully dead internet. Yet.
 *        Also, whiskey. There was whiskey.
 *
 * Copyright (c) 2026 Dennis Clarke
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
 
/* OpenBSD will have a fit and barf. Too bad. */
#if ! defined (_XOPEN_SOURCE)
#define _XOPEN_SOURCE 600
#endif

#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>
 
#include <errno.h>

/* the nightmare of PNG where https://lodev.org/lodepng would
 * get the job done. Just ask Matthew R. Wilson */
#include <png.h>
 
#include <inttypes.h>

/* strictly for clarity when reading I use iso646.h */
#include <iso646.h>

#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
 
/* file stuff however better code is in the stat_test
 * directory btu for now this mostly works.
 *
 * Really I have done all this before and would prefer
 * a more rigourous error checking step.
 */
#include <sys/stat.h>
 
/* I hate macros however this is a clamp similar
 * to the stuff in xmand.c only more neat looking.
 * Trivial, make sure the value v is in the number
 * range [ a, b ] where the notation means a is
 * a valid number and so is b and they are in the
 * valid range. Otherwise (a,b) means they are not
 * in the range. Just integers only here. 
 *
 * See xmand.c line 2137 etc for similar stuff.
 */
#define CLAMP(v, a, b) ((v) < (a) ? (a) : ((v) > (b) ? (b) : (v)))
 
/* 32 bit pixel data is RGBA with 8bits per colour.
 *
 * I am not really sure about transparency A-stuff
 */
typedef uint32_t pixel_t;
 
/* a whack of globals until I can slam all this into
 * some neat little struct to pass around a pointer
 */
static Display *dsp = NULL;
static int screen_num;
static int conn_num;
static Visual *default_vis = NULL;
static int depth = 0;
 
/* I try to avoid magic numbers but these are needed
 */
#define BITS_PER_PIXEL 32
#define BG_COLOUR 0x000000
#define XY_AXIS_COLOUR 0xFFFF00
#define SINE_COLOUR 0x00FF00
#define INFO_TEXT_COLOUR 0x00FF00
 
/* good luck over ssh with X11 passthrough
 * In fact .. 
 *    * * *    D O    N O T    E V E N    T R Y    I T    * * *
 */
#define FRAMES_PER_SEC 10
#define TIME_NANOSEC 0.000000001

/* really conservative plot window size */
#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600

/* itty bitty separate window for info text */
#define INFO_WIDTH 360
#define INFO_HEIGHT 240

/* the usual sysinfo() */
#define VERBOSE 1
int sysinfo(int verbose);
 
/* main plot window */
static Window win;
static GC gc;
 
/* separate info window */
static Window info_win;
static GC info_gc;
static int info_w = 360;
static int info_h = 80;

/* I still have very few clues about fonts */
static XFontStruct *info_font = NULL;
 
/* front and back buffer images */
static XImage *buf_front = NULL;
static XImage *buf_back = NULL;

/* GLOBAL width and height in pixels of the back and front buffers */
static int buf_w = 0;
static int buf_h = 0;
 
/* request a buffer with a width and height and we get
 * back a pointer. If bork bork bork then return NULL.
 * and also who the heck knows what errno does in X11?
 *
 * Update : I have been told that errno does nothing.
 */
static XImage *create_image(int width_request, int height_request)
{
    /* recall that this is really just uint32_t */
    pixel_t *data;
    int bitmap_pad, bytes_per_pixel, bytes_per_line;
    XImage *img;
 
    errno = 0;
    data = calloc( (size_t)(width_request * height_request),
                    sizeof(uint32_t) );

    if (!data) {
        /* really? possible ENOMEM? EAGAIN may happen but really
         * who wants to deal with that? */
        if ( errno == ENOMEM ) {
            fprintf(stderr,"FAIL : calloc returns ENOMEM at %s:%d\n",
                    __FILE__, __LINE__ );
        } else {
            fprintf(stderr,"FAIL : calloc fails at %s:%d\n",
                    __FILE__, __LINE__ );
        }
        perror("FAIL ");

        /* well, really, we could just give up */
        return NULL;
    }
 
    /* the use of calloc saves us this need to clear out
     * the data region :
     *
     *    memset( data, 0, (size_t)( width_request height_request )
     *                      * sizeof(pixel_t) );
     *
     * bitmap_pad : Specifies the quantum of a scanline (8, 16, or 32).
     *
     * In other words, the start of one scanline is separated in client
     * memory from the start of the next scanline by an integer multiple
     * of this many bits
     *
     * Easy way to ponder is 32 bits per pixel.
     */

    bitmap_pad = BITS_PER_PIXEL;

    /* strangely we have pixel_t as just uint32_t which
     * is the same as BITS_PER_PIXEL / 8 for bytes
     * or just 4 bytes per pixel
     */
    bytes_per_pixel = sizeof(pixel_t);
    bytes_per_line = width_request * bytes_per_pixel;
 
    /* need X11 documentation to understand why we
     * cast the pointer to (char *) ? No clue.
     *
     * https://www.x.org/releases/X11R7.6/doc/man/man3/XCreateImage.3.xhtml
     *
     * XImage *XCreateImage(Display *display, Visual *visual,
     *                      unsigned int depth, int format, int offset,
     *                      char *data,
     *                      unsigned int width, unsigned int height,
     *                      int bitmap_pad, int bytes_per_line);
     *
     * The XCreateImage function allocates the memory needed for
     * an XImage structure for the specified display but does not
     * allocate space for the image itself. Rather, it initializes
     * the structure byte-order, bit-order, and bitmap-unit values
     * from the display and returns a pointer to the XImage structure.
     * The red, green, and blue mask values are defined for Z format
     * images only and are derived from the Visual structure passed in.
     * Other values also are passed in. The offset permits the rapid
     * displaying of the image without requiring each scanline to be
     * shifted into position.
     *
     * If you pass a zero value in bytes_per_line, Xlib assumes that
     * the scanlines are contiguous in memory and calculates the value
     * of bytes_per_line itself.
     *
     * smart move is to set the bytes_per_line ourselves. 
     *
     * TODO : note we never called XInitImage() anywhere?
     *        SEE X11/Xutil.h and good luck.
     */
    img = XCreateImage(dsp, default_vis,
                       depth, ZPixmap, 0,
                       (char *)data,
                       width_request, height_request,
                       bitmap_pad, bytes_per_line);
 
    /* Do we get any error messages at all?
     * Not today. Tomorrow is not looking good either.
     */
    if ( !img ) {
        free(data);
        return NULL;
    }
 
    return img;
 
}
 
/* I really do not know what the heck XDestroyImage() does */
static void destroy_image(XImage **imgp)
{
    /* check if the calling routine is a moron and gave
     * us bogus pointer. 
     * Also pointer to pointer may be bork!?
     */
    if ( ( !imgp ) || ( !*imgp ) ) {
        return;
    }
 
    /* The XDestroyImage function deallocates the memory
     * associated with the XImage structure.
     *
     * TODO : which means what? Same as free()? No clue.
     */
    XDestroyImage(*imgp);
 
    *imgp = NULL;
 
}
 
/* does what it does to resize the front and
 * back buffers and returns -1 of things go wrong.
 * otherwise you get a 0 and just be happy X11 works
 */
static int resize_buffers(int new_width, int new_height)
{
    /* do not try impossible windows?
     * TODO : restrict the user from doing itty bitty
     *        size that make no sense. */
    if ( ( new_width <= 0 ) || ( new_height <= 0 ) ) {
        return -1;
    }
 
    /* if there is no change then do nothing.
     *
     * We are still using globals and so here
     * I just check with the buf_w and buf_h */
    if ( ( new_width == buf_w ) &&  ( new_height == buf_h ) ) {
        return 0;
    }
 
    /* likely the compiler will optimize out these
     * calls but I want the option to debug X11 madness
     *
     * TODO : do I really need to destroy both front and back?
     */
    destroy_image(&buf_front);
    destroy_image(&buf_back);
 
    /* recreate the front buffer with the new size */
    buf_front = create_image( new_width, new_height );
    if ( !buf_front ) {
        destroy_image(&buf_front);
        return -1;
    }
 
    /* recreate the back buffer with the new size */
    buf_back = create_image( new_width, new_height);
    if ( !buf_back ) {
        destroy_image(&buf_front);
        destroy_image(&buf_back);
        return -1;
    }
 
    /* TODO : need to be wrapped into a pointer to a struct
     * at some stage. You can not pass globals to some thread
     * easily and that will need to be done.
     */
    buf_w = new_width;
    buf_h = new_height;
 
    return 0;
 
}
 
/* given a pointer to some X11 image buffer we set
 * a specific pixel at coordinates ( x, y ) with
 * a pixel data thing pixel_t.
 *
 * I am not a fan of void functions but X11 is a
 * mystery in many ways. Great documentation eh?
 */
static void image_set_pixel(XImage *img, int x, int y, pixel_t color)
{
    /* is the pointer something valid? */
    if ( !img ) {
        /* I needed this during initial tests because
         * things would go wrong. oops */
        return;
    }
 
    /* check if those coordinates fit inside the image
     *
     * We need this check because the dots being plotted
     * are actually 3x3 boxes around some x,y coordinates
     *
     */
    if ( ( x < 0 ) || ( x >= img->width )
        ||
         ( y < 0 ) || ( y >= img->height ) ) {
       
        return;
 
    }
 
    XPutPixel(img, x, y, color);
 
}
 
/* clear or paint the back buffer with a given color */
static void clear_back(pixel_t color)
{
    int x, y;
 
    if ( !buf_back ) {
        return;
    }
 
    /* With X11 we may work from top to bottom and
     * then left to right in each row of pixels.
     *
     * TODO : could a memset() get the job done?
     *        likely but we would sidestep the X11
     *        abi entirely. Not a good idea. Yet.
     */
    for ( y = 0; y < buf_h; ++y) {
        for ( x = 0; x < buf_w; ++x) {
            image_set_pixel(buf_back, x, y, color);
        }
    }
    /* no error checks or nothing */
 
}
 
/* trig and the use of phase offset in radians
 * where we slowly move the phase with a little
 * offset for each time we draw the back buffer.
 */
static void draw_sine(double phase)
{
    int x, y, midy, vx, dx, dy;
    double amp, freq, s, xx;
    pixel_t bg, axis, sinec;
 
    /* we only put stuff on the back buffer */
    if ( !buf_back ) {
        /* should never happen. this is stoopid. do nothing */
        return;
    }
 
    bg = BG_COLOUR;
    clear_back(bg);
 
    /* set every pixel along that line. 
     *
     * TODO : why not draw line? 
     *        cause we are pushing pixels around?
     *        Mostly because we are only doing pixel operations
     *        into a back buffer and not drawing on the graphics
     *        context within a given display.
     *
     *        Will likely need to write my own linear line draw
     *        from ( x0, y0 ) to ( x1, y1 ) and that entails the
     *        disaster of possible smooth lines?
     *
     * Otherwise we need :
     *     XSetLineAttributes(dsp, gc, 1,
     *                        LineSolid, CapButt, JoinMiter);
     *
     *     XSetForeground(dsp, gc, yellow.pixel);
     *
     * see https://www.x.org/releases/X11R7.6/doc/man/man3/XDrawLine.3.xhtml
     */
    axis = XY_AXIS_COLOUR;

    /* find the middle of the buffer height for a horizontal axis */
    midy = buf_h / 2;

    /* draw the line pixel by pixel in a straight horizontal line */
    for ( x = 0; x < buf_w; x++) {
        image_set_pixel(buf_back, x, midy, axis);
    }
 
    /* draw a vertical axis at the x=20 pixel position 
     *
     *  CLAMP(v, a, b) ((v) < (a) ? (a) : ((v) > (b) ? (b) : (v)))
     *
     * See xmand.c line 2137 for the only time I used a logical
     * clamp() to keep values within a boundary. However that
     * was for red, green, blue values to be hacked into a
     * pixel data element. Whatever. I rarely ever use this
     * syntax but it works. Fuxking stupid when we know that
     * we have a 20 pixel position and really we are checking
     * if the user did a resize less than 20 pixels wide. Users
     * are stoopid that way. :)
     */
    vx = CLAMP(20, 0, buf_w - 1);
    /* draw a vertical line pixel by pixel */
    for ( y = 0; y < buf_h; ++y) {
        image_set_pixel(buf_back, vx, y, axis);
    }
 
    /* HACK amplitude is just 80% the buffer height we have */
    amp = (buf_h / 2.0) * 0.8;

    /* the frequency or width of a full wave will be
     * half the width of the window. So that means 
     * we get two full sine waves across the width :
     *
     *    freq = 2.0 * M_PI * 2.0/(double)buf_w
     *
     * same thing as :
     *
     *    freq = 4.0 * M_PI/(double)buf_w
     */
    freq = 4.0 * M_PI/(double)buf_w;

    /* draw the dots as just BIG FAT 3x3 pixels */
    sinec = SINE_COLOUR;
    for ( x = 0; x < buf_w; ++x) {
        /* bit of a joke but double(x) is xx as a double */
        xx = 1.0 * x;

        /* do your own trivial trig :) with a little phase offset */
        s = sin( ( xx * freq ) + phase );

        /* pixels are not floating point things 
         *
         * TODO check if we get outside the buffer ?
         *
         *      if we CLAMP to 80% of the height we should be
         *      okay but not on the horizontal which may fall
         *      outside the left and right edge. maybe
         */
        y = (int)round( midy - s * amp);

        /* Make fat 3x3 boxes as the stuff we can see. Otherwise
         * modern monitors will be a tiny single pixel and that
         * is impossible for some of us to see.
         *
         * height and width of the dot is -1 to +1 around the x,y
         * and thus we get nice fat 3x3 pixels plotted
         *
         *     Note X11 has upper left corner as 0,0
         *          +-------+-------+-------+
         *          |       |       |       |
         *          | -1,-1 |  0,-1 | +1,-1 |
         *          |       |       |       |
         *          +-------+-------+-------+
         *          |       |       |       |
         *          | -1, 0 |  x, y | +1, 0 |
         *          |       |       |       |
         *          +-------+-------+-------+
         *          |       |       |       |
         *          | -1,+1 |  0,+1 | +1,+1 |
         *          |       |       |       |
         *          +-------+-------+-------+
         *
         * TODO : May fall out of bounds?
         *        fixed that in the image_set_pixel() wrapper
         *
         * TODO : can Drawrectngle work on X11 image buffers?
         *          no clue.
         */
        for ( dy = -1; dy <= 1; ++dy) {
            for ( dx = -1; dx <= 1; ++dx) {
                image_set_pixel(buf_back, x + dx, y + dy, sinec);
            }
        }

    }

}
 
/* does what it says */
static void swap_buffers(void)
{
    /* NOTE : these are globals at the moment */
    XImage *tmp = buf_front;
    buf_front = buf_back;
    buf_back = tmp;
}
 
static void present_front(void)
{
    int status = 0;

    /* again check if the calling routine is a moron */
    if ( !buf_front ) {
        return;
    }

    /* https://www.x.org/releases/X11R7.6/doc/man/man3/XPutImage.3.xhtml
     *
     * https://xorg.freedesktop.org/archive/X11R7.6/doc/man/man3/XPutImage.3.xhtml
     *
     * int XPutImage(Display *display, Drawable d, GC gc,
     *               XImage *image,
     *               int src_x, int src_y,
     *               int dest_x, int dest_y,
     *               unsigned int width, unsigned int height);
     *
     * what the heck does this return ? a status integer?
     *
     *     XPutImage can generate BadDrawable, BadGC,
     *                   BadMatch, and BadValue errors.
     *
     *                   are those return int values?
     *
     * good luck.
     */
    status = XPutImage(dsp, win, gc,
              buf_front,
              0, 0,
              0, 0,
              buf_front->width, buf_front->height);

    if ( status != 0 ) {
        fprintf(stderr,"WARN : in present_front() we get status = %i\n", status);
    }

    XFlush(dsp);

}
 
/* 16 bytes needed for UTC timestamp YYYYMMDDHHMMSS into char buf */
static void utc_timestamp(char *buf, size_t bufsz)
{

    /* TODO check if char *buf, size_t bufsz are reasonable? */

    time_t time_utc;
    struct tm gmt_time;
    /*
     * time - get time
     *
     * #include <sys/types.h>
     * #include <time.h>
     *
     * time_t time(time_t *tloc);
     *
     * The time() function returns the value of time in seconds
     * since 00:00:00 UTC, January 1, 1970.
     *
     * If tloc is non-zero, the return value is also stored in
     * the location to which tloc points. If tloc points to an
     * illegal address, time() fails and its actions are undefined.
     *
     * Upon successful completion, time() returns the value of time.
     * Otherwise, (time_t)-1 is returned and errno is set to indicate
     * the error.
     *
     * TODO : actually try to check for a bogus situation
     */
    time_utc = time(NULL);

    /* 
     *     struct tm *gmtime_r(const time_t *restrict clock,
     *                         struct tm *restrict res);
     *
     * the gmtime() function converts directly to Coordinated Universal
     * Time (UTC), which is what the UNIX system uses internally.
     *
     * RETURN VALUES
     * Upon successful completion, the gmtime() and localtime()
     * functions return a pointer to a struct tm. If an error
     * is detected, gmtime() and localtime() return a null pointer.
     *
     * Upon successful completion, the gmtime_r() and localtime_r()
     * functions return the address of the structure pointed to by
     * the res argument. If an error is detected, gmtime_r() and
     * localtime_r() return a null pointer and set errno to indicate
     * the error.
     *
     * In Solaris 10, gmtime(), gmtime_r(), localtime(), and
     * localtime_r() were  updated  to  return  a null pointer
     * if an error is detected. This change was based on the
     * SUSv3 specification.
     *
     * TODO : check for an error condition and use errno?
     */
    gmtime_r(&time_utc, &gmt_time);

    strftime(buf, bufsz, "%Y%m%d%H%M%S", &gmt_time);

}
 
/* get file size in bytes or return -1 if bork bork
 * where I have done ALL this before with far better
 * error checking.
 *
 * TODO : why not use uint64_t ?  */
static long get_file_size(const char *filename)
{
    struct stat status;
    /* see stat_test/check_file_stat.c for glorious
     * verbose error checking and status reports
     * for now, it works or does not.
     */
    if ( stat(filename, &status) != 0 ) {
        /* yeah .. this is stoopid compared to the code
         * I wrote before. I will get to that .. soon */
        return -1;
    }

    /* just return the filesize */
    return (long)status.st_size;

}
 
/* * * *    H A D    T O    R E A D    LibPNG   D O C S    * * *
 *
 * Made a review of sample code from all over the place to
 * get this to work at all. It may still blow up. No clue.
 *
 * Save front buffer to 32-bit RGBA PNG using libpng.
 *
 *     * * *    only process the front buffer   * * *
 *
 * On success, fills out filename_out and we get the
 * image width and height and filesize.
 *
 * This returns 0 if all works fine and -1 if bork bork bork
 *
 * WARNING : the libpng stuff is magic and poorly documented
 */
static int save_front_to_png(char *filename_out,
                             size_t fn_out_size,
                             int *out_width, int *out_height,
                             long *out_bytes)
{
    /* timestamp only needs 16 bytes but I may want that
     * to be a filename also with some other stuff */
    char timestamp_str[32];

    FILE *fp;
    long file_size;

    png_structp png_ptr;
    png_infop info_ptr;

    /* data to PNG image file is one row at a time */
    png_bytep row;

    /* a pile of stuff for red green and blue masks and shifting
     * nightmares to make data for libPNG. Reading how this
     * works and why is a great way to lose hair and sanity.
     *
     * TODO : fetch beer
     */
    int x, y, rr, gg, bb;
    unsigned long red_colour_mask, green_colour_mask, blue_colour_mask,
                  rmaskw, gmaskw, bmaskw;

    /* hack a pixel together with red, green, blue data */
    unsigned long pixel, pr, pg, pb;
    unsigned int r8, g8, b8;

    if ( !buf_front ) {
        /* really? */
        return -1;
    }

    /* see manpage for :
     *     struct tm *gmtime_r(const time_t *restrict clock,
     *                         struct tm *restrict res);
     */
    utc_timestamp(timestamp_str, sizeof(timestamp_str));

    /* now copy that UTC timestamp into a filename */
    snprintf(filename_out, fn_out_size, "%s.png", timestamp_str);
 
    errno = 0;
    fp = fopen(filename_out, "wb");
    if ( !fp ) {
        fprintf(stderr, "Failed to open %s: %s\n",
                         filename_out, strerror(errno));
        /* really need a better way to handle this bork
         * and see stat_test/check_file_stat.c */
        return -1;
    }
 
    /* libPNG will keep anyone awake all night trying to read
     * the documentation. This is as trivial as it gets and
     * yes please see :
     *
     *    https://libpng.org/pub/png/book/chapter15.html
     *
     * whatever works there seems to work. magic?
     *
     * look on that page for "boilerplate" usage of this
     * lovely png_create_write_struct() and yes Matthew
     * says just use https://lodev.org/lodepng/
     */
    png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING,
                                      NULL, NULL, NULL);

    if ( !png_ptr ) {
        /* we have no error handler so bork bork bork */
        fclose(fp);
        return -1;
    }

    /* this either works or not .. no clue why */
    info_ptr = png_create_info_struct(png_ptr);
    if ( !info_ptr ) {
        png_destroy_write_struct(&png_ptr, NULL);
        fclose(fp);
        return -1;
    }
 
    /* what the hell ? 
     *
     * From the libpng manual :
     *
     *     https://www.libpng.org/pub/png/libpng-1.2.5-manual.html
     *
     * When libpng encounters an error, it expects to longjmp back to
     * your routine. Therefore, you will need to call setjmp and pass
     * your png_jmpbuf(png_ptr). If you read the file from different
     * routines, you will need to update the jmpbuf field every time
     * you enter a new routine that will call a png_*() function.
     *
     *   +------------------------------------------------------------+
     *   | The solution is a custom error handler, though that's a    |
     *   | slight misnomer in our case. Completely custom error       |
     *   | handlers can certainly be installed, but libpng currently  |
     *   | assumes that its error-handling routine will never return. |
     *   +------------------------------------------------------------+
     *
     *   ^ directly from https://libpng.org/pub/png/book/chapter15.html
     *
     * Right so?
     */
    if (setjmp(png_jmpbuf(png_ptr))) {
        /* see https://www.libpng.org/pub/png/libpng-1.2.5-manual.html#section-5 */
        png_destroy_write_struct(&png_ptr, &info_ptr);
        fclose(fp);
        /* give up */
        return -1;
    }
 
    png_init_io(png_ptr, fp);

    /* setup the information header section 
     *
     * see https://libpng.org/pub/png/book/chapter15.html
     *
     * At this point, we can set the basic image parameters. We have
     * the option of using several functions, each of which sets a
     * single parameter, but there is really no point in doing so.
     * Instead we set all of them with a single call to :
     *
     *  png_set_IHDR(png_ptr, info_ptr,
     *               mainprog_ptr->width, mainprog_ptr->height,
     *               mainprog_ptr->sample_depth,
     *               color_type, interlace_type,
     *               PNG_COMPRESSION_TYPE_DEFAULT,
     *               PNG_FILTER_TYPE_DEFAULT);
     *
     * yup .. literal use that but sample_depth has me baffled.
     * why is sample depth 8 bits or 8 bytes in 32bit colour??
     *        * * *   n o    c l u e   * * *
     */
    png_set_IHDR(png_ptr, info_ptr,
                 buf_front->width, buf_front->height,
                 8,
                 PNG_COLOR_TYPE_RGBA, PNG_INTERLACE_NONE,
                 PNG_COMPRESSION_TYPE_DEFAULT,
                 PNG_FILTER_TYPE_DEFAULT);

    /* any error checking? nope. magic. */
    png_write_info(png_ptr, info_ptr);
 
    /* cast a void pointer? use calloc() ?  */
    row = (png_bytep)malloc((size_t)buf_front->width * 4);

    if ( !row ) {
        /* this is a disaster and messy */
        png_destroy_write_struct(&png_ptr, &info_ptr);
        fclose(fp);
        return -1;
    }
 
    /* mask shifts and widths? Example code needed and
     * still a disaster to really know what libPNG
     * wants for this .. however these lines work
     * and I did something similar in xmand.c for
     * fancy colour pixels. see xmand/xmand.c#L2124 etc
     *
     * NOTE we are using information taken from the X11
     * default_vis struct.
     *
     * see https://tronche.com/gui/x/xlib/utilities/visual.html
     *
     *
     *    typedef struct {
     *                    Visual *visual;
     *                    VisualID visualid;
     *                    int screen;
     *                    unsigned int depth;
     *                    int class;
     *                    unsigned long red_mask;
     *                    unsigned long green_mask;
     *                    unsigned long blue_mask;
     *                    int colormap_size;
     *                    int bits_per_rgb;
     *                   } XVisualInfo;
     *
     * I can use GDB and try to figure out that stuff all day long.
     * Get beer.
     */

    /* red mask shift counter */
    rr = 0;
    red_colour_mask = default_vis->red_mask;
    while ( red_colour_mask && ( (red_colour_mask bitand 1) == 0 ) ) {
        red_colour_mask >>= 1;
        /* we are counting right shifts until the LSB bit
         * of red_colour_mask is a 1 bit */
        rr++;
    }

    /* green */
    gg = 0;
    green_colour_mask = default_vis->green_mask;
    while ( green_colour_mask && ( (green_colour_mask bitand 1) == 0 ) ) {
        green_colour_mask >>= 1;
        gg++;
    }


    /* blue */
    bb = 0;
    blue_colour_mask = default_vis->blue_mask;
    while ( blue_colour_mask && ( (blue_colour_mask bitand 1) == 0 ) ) {
        blue_colour_mask >>= 1;
        bb++;
    }

    rmaskw = default_vis->red_mask >> rr;
    gmaskw = default_vis->green_mask >> gg;
    bmaskw = default_vis->blue_mask >> bb;
 
    /* yeah .. sample code that worked elsewhere and I just did my
     * best to drag it into here ... where it works? */
    for ( y = 0; y < buf_front->height; ++y) {
        png_bytep rp = row;
        for ( x = 0; x < buf_front->width; ++x) {
            /* get a single pixel from the front buffer */
            pixel = XGetPixel(buf_front, x, y);

            /* PNG magic stuff */
            pr = (pixel bitand default_vis->red_mask) >> rr;
            pg = (pixel bitand default_vis->green_mask) >> gg;
            pb = (pixel bitand default_vis->blue_mask) >> bb;

            r8 = rmaskw ? (unsigned int)((pr * 255) / rmaskw) : 0;
            g8 = gmaskw ? (unsigned int)((pg * 255) / gmaskw) : 0;
            b8 = bmaskw ? (unsigned int)((pb * 255) / bmaskw) : 0;

            *rp++ = (png_byte)r8;
            *rp++ = (png_byte)g8;
            *rp++ = (png_byte)b8;
            *rp++ = (png_byte)255;
        }
        /* see https://libpng.org/pub/png/book/chapter15.html
         * 15.7. Noninterlaced PNG: writepng_encode_row()
         */
        png_write_row(png_ptr, row);
    }
 
    free(row);

    /* do we need png_write_end() for noninterlaced PNG? */
    png_write_end(png_ptr, info_ptr);

    png_destroy_write_struct(&png_ptr, &info_ptr);
    fclose(fp);
 
    file_size = get_file_size(filename_out);

    /* really? check pointers are valid?
     * well this would blow up over and over until
     * I did this sort of thing. Really one must
     * be certain that the pointers are valid */
    if ( out_width ) {
        *out_width = buf_front->width;
    }

    if ( out_height ) {
        *out_height = buf_front->height;
    }

    if ( out_bytes ) {
        *out_bytes = file_size;
    }

    return 0;

}
 
/* status text into info window */
static void update_info_window(const char *text)
{
    /* pixel offset into the window from upper left ( 0, 0 ) */
    int x_offset = 8;
    int y_offset = 16;
    int font_height;

    const char *ptr_to_text;
    int line;

    /* need a buffer for a few lines of text
     * TODO : maybe use the PAGE_SIZE ? */
    char buf[512];

    /* only you can stop the abuse of i for iteration */
    size_t j;

    /* if the window does not exist then bail out */
    if ( !info_win ) {
        return;
    }

    /* black background */
    XSetWindowBackground(dsp, info_win, BlackPixel(dsp, screen_num));
    XClearWindow(dsp, info_win);

    /* some nice colour for the text */
    XSetForeground(dsp, info_gc, INFO_TEXT_COLOUR);

    /* currently the font is just "fixed"
     * however terminus or termingus would be cool */
    if (info_font) {
        /* see https://www.x.org/releases/X11R7.6/doc/man/man3/XSetFont.3.xhtml
         * which tells me almost nothing!
         *
         * also https://tronche.com/gui/x/xlib/GC/convenience-functions/font.html
         * ^ really worthless ^
         */
        XSetFont(dsp, info_gc, info_font->fid);
    }

    /* we are only going to allow 4 lines of text */
    line = 0;
    ptr_to_text = text;
    while ( *ptr_to_text && ( line < 4 ) ) {
        /* move one char at a time scanning for newline */
        j = 0;

        while ( ptr_to_text[j] 
                && ( ptr_to_text[j] != '\n' ) 
                && ( ( j + 1 ) < sizeof(buf) ) ) {
            /* not a newline char and not end of text yet */
            j++;
        }

        memcpy(buf, ptr_to_text, j);
        /* terminate the buffer with a NUL char because
         * memcpy only takes the j chars in the copy */
        buf[j] = '\0';

        /* tons of fun 
         * https://www.x.org/releases/X11R7.6/doc/man/man3/XDrawString.3.xhtml
         *
         * the y offset is the x and y coordinates, which are
         * relative to the origin ( upper left corner ) of the
         * specified drawable and define the origin of the first
         * character.
         *
         * the trick is to calculate the offset downwards from
         * the window origin (0,0) to where that first char
         * will land. for this we need the font height info
         * which is the ascent + descent + 1 pixel above and 
         * 1 more pixel below :
         *
         *     info_font->ascent + info_font->descent + 2
         *
         * Or just 16 pixels if the font is bork bork bork
         *
         */

        font_height = info_font ? (info_font->ascent + info_font->descent + 2) : 16;

        XDrawString(dsp, info_win, info_gc,
                    x_offset, 
                    y_offset + line * font_height,
                    buf, (int)strlen(buf));

        if (ptr_to_text[j] == '\n') {
            /* hit a newline char so skip over it
             * because X11 does not render a newline
             * or carraige return that way */
            ptr_to_text += j + 1;
        } else {
            ptr_to_text += j;
        }

        line++;
    }

    XFlush(dsp);

}
 
int main(int argc, char **argv)
{

    /* this is hilarious : 
     *
     * https://www.x.org/releases/X11R7.6/doc/man/man3/XEvent.3.xhtml
     *
     * XAnyEvent, XEvent − generic X event structures
     *
     * All the event structures declared in <X11/Xlib.h> have
     * the following common members:
     *
     *     typedef struct {
     *                      int type;
     *                      unsigned long serial;
     *                      Bool send_event;
     *                      Display *display;
     *                      Window window;
     *                    } XAnyEvent;
     *
     * Where : serial is # of last request processed by server
     *         send_event is true if this came from a SendEvent request
     *         display is obviously the Display the event was read from
     *
     * Also the X11 docs claim that most events also contain a time
     * member, which is the time at which an event occurred.
     *   * * *  ^ however I can not find that anywhere ^ * * *
     */
    XEvent evnt;

    /* https://www.x.org/releases/X11R7.7/doc/man/man3/XConfigureEvent.3.xhtml */
    XConfigureEvent *config_evnt;

    /* have a way to stop the loop */
    int run_flag;

    /* every time we redraw the plot window we need to
     * shift things a little bit. See below where I set
     * the little step to be 2*pi/100 for a small change
     * around the angle circle thingie. Keep the Greeks
     * happy with nice radians */
    double phase, phase_step, frame_interval, delta_time;

    /* we need to track time data also */
    struct timespec now, last_plot_time, remainder;
    double wait_time;
 
    /* something in the information window to start */
    char info_text[512] = "Press P in the main window to save a PNG file";

    /* be able to catch a key pressed and
     * 8 bytes should be enough even for
     * bizarre UTF-8 */
    char key_buf[8];

    /* we may be able to save a file in the current
     * working directory ? */
    char filename[128];
    int png_width, png_height;
    long png_bytes;

    int win_w = WINDOW_WIDTH;
    int win_h = WINDOW_HEIGHT;

    /* should work with a null display name */
    char *disp_name = NULL;

    int sys_err = sysinfo(VERBOSE);

    /* lifted out of xmand.c */
    dsp = XOpenDisplay(disp_name);
    if (dsp == NULL) {
        fprintf(stderr, "%s: no X server?? '%s'\n",
            argv[0], disp_name);
        return EXIT_FAILURE;
    }

    conn_num = XConnectionNumber(dsp);
    printf("INFO : X11 connection number %i\n", conn_num);

    screen_num = DefaultScreen(dsp);
    printf("     : X11 screen number %i\n", screen_num);

    depth = XDefaultDepth(dsp,screen_num);
    printf("     : default depth is %i\n", depth);

    /* we will need red, green and blue colour mask data from the
     * default visual. good luck.
     */
    default_vis = DefaultVisual(dsp, screen_num);
 
    /* endless fun to read 
     * https://www.x.org/releases/X11R7.6/doc/man/man3/XCreateSimpleWindow.3.xhtml
     *
     *    Window XCreateSimpleWindow(Display *display,
     *                               Window parent,
     *                               int x, int y,
     *                               unsigned int width, unsigned int height,
     *                               unsigned int border_width,
     *                               unsigned long border,
     *                               unsigned long background);
     *
     * NOTE : x and y coordinates are the top-left outside corner of
     *        the window’s borders and are relative to the inside
     *        of the parent window’s borders.
     *
     *        good luck.
     */
    win = XCreateSimpleWindow(dsp,
              RootWindow(dsp, screen_num),
              100, 100,
              win_w, win_h, 1,
              BlackPixel(dsp, screen_num),
              BlackPixel(dsp, screen_num));

    /* key press and button press on the mouse should work */
    XSelectInput(dsp, win,
                     ExposureMask
                     | StructureNotifyMask
                     | KeyPressMask
                     | ButtonPressMask );

    gc = XCreateGC(dsp, win, 0, NULL);
    XMapWindow(dsp, win);
 
    /* separate graphics context for info
     * lock the size so it can be moved but
     * not re-sized
     */
    info_w = INFO_WIDTH;
    info_h = INFO_HEIGHT;

    info_win = XCreateSimpleWindow(dsp,
                   RootWindow(dsp, screen_num),
                   800, 200,
                   info_w, info_h, 1,
                   BlackPixel(dsp, screen_num),
                   BlackPixel(dsp, screen_num));

    /* this is black magic from the X11 docs */
    XSizeHints hints;
    hints.flags = PSize | PMinSize | PMaxSize;

    /* width and height will not change */
    hints.width = info_w;
    hints.height = info_h;

    /* I do not think these work at all */
    hints.min_width = info_w;
    hints.min_height = info_h;
    hints.max_width = info_w;
    hints.max_height = info_h;

    XSetWMNormalHints(dsp, info_win, &hints);
    XSelectInput(dsp, info_win, ExposureMask);

    /* do all that again for the little infomation window */
    info_gc = XCreateGC(dsp, info_win, 0, NULL);
    XSetForeground(dsp, info_gc, INFO_TEXT_COLOUR);

    /* font magic where I want something that should exist.
     * soon to test a termingus or terminus style */
    info_font = XLoadQueryFont(dsp, "fixed");

    /* if this fails I have no clue
     * see https://www.x.org/releases/X11R7.6/doc/man/man3/XSetFont.3.xhtml
     */
    if ( info_font ) {
        XSetFont(dsp, info_gc, info_font->fid);
    } else {
        fprintf(stderr, "\nWARN : font \"fixed\" does not work?\n");
    }

    XMapWindow(dsp, info_win);
 
    if ( resize_buffers(win_w, win_h) != 0 ) {
        fprintf(stderr, "\nFAIL : can not create buffers\n");
        return EXIT_FAILURE;
    }
 
    /* the X11 windows are done so now set the math bits */
    phase = 0.0;

    /* one hundredth of a full rotation in the circle */
    phase_step = 2.0 * M_PI / 100.0;
 
    /* this is to check on how long to nanosleep before
     * trying to plot anything in the plot window.
     * A modern fast machine will rip along at blazing
     * speed and you just see trash in the plot window
     * if anything at all.
     * Slow things down. */
    frame_interval = 1.0 / FRAMES_PER_SEC;
 
    /**************************************************
     * TODO : fix this with proper clock code
     *
     * this is crap for now. far better code in the
     * time_and_date directory where I check if the
     * clock exists and then deal with it
     * ************************************************/
    clock_gettime(CLOCK_MONOTONIC, &last_plot_time);
 
    /* write something into the information window */
    update_info_window(info_text);
 
    run_flag = 1;
    while (run_flag) {
        /* total X11 magic where we are watching a queue of events
         * see https://www.x.org/releases/X11R7.6/doc/man/man3/XPending.3.xhtml
         *
         * The XPending function returns the number of events that have
         * been received from the X server but have not been removed
         * from the event queue. XPending is identical to XEventsQueued
         * with the mode QueuedAfterFlush specified.
         *
         * TODO : what is QueuedAfterFlush?
         */
        while ( XPending(dsp) ) {

            XNextEvent(dsp, &evnt);

            switch (evnt.type) {
                case Expose:
                    /* there are only two windows so check
                     * which one was just exposed. likely
                     * with a mouse click or some other thing
                     * was moved
                     */
                    if ( evnt.xexpose.window == win ) {
                        /* redraw the main plot window */
                        present_front();
                    } else if (evnt.xexpose.window == info_win) {
                        /* put the current message text back into
                         * the info_window
                         *
                         * NOTE : the info_text chars can change
                         */
                        update_info_window(info_text);
                    }
                break;

                case ConfigureNotify: {
                    /* https://www.x.org/releases/X11R7.7/doc/man/man3/XConfigureEvent.3.xhtml
                     * This is a "what just happened?" event thing.
                     */
                    config_evnt = (XConfigureEvent *)&evnt;

                    /* we only care about our main plot window */
                    if ( config_evnt->window == win ) {
                        /* did the size of that window change ?
                         * TODO : is there a way to stop the user from
                         *        doing a stoopid size like 5x3 ? */
                        if ( ( config_evnt->width != buf_w )
                             ||
                             ( config_evnt->height != buf_h ) ) {

                            /* yup. so try to resize the front and back buffers */
                            if (resize_buffers(config_evnt->width, config_evnt->height) != 0) {
                                /* this is bad. stop whatever we are doing */
                                fprintf(stderr, "\nWARN : resize_buffers bork bork bork\n");
                                /* bail out */
                                run_flag = 0;
                            } else {
                                /*
                                 * DO NOT PRINT OUT txt to stderr just because
                                 * we landed here. we get thousands of lines
                                 * of trash that way.
                                 *
                                 * the back buffer gets slammed into the plot
                                 * window. DO NOT ADJUST phase angle here!
                                 */
                                draw_sine(phase);
                                /* swap back to front and yup double buffer */
                                swap_buffers();
                                /* redraw the main plot window with the new
                                 * back buffer data which is in the front now */
                                present_front();
                            }
                        }
                    }
                    /* TODO : tack on an else config_evnt->window == info_win ?
                     *  can we lock the information window size ? no way to mess
                     *  with it ?  No idea at this time. X11 is fun.
                     */
                }
                break;

                /* check if the ESC key was pressed or the capital Q
                 *     or the capital P to wreck havok with libPNG */
                case KeyPress: {
                    KeySym key_sym;
    
                    /* no idea if this is needed but looks safe */
                    key_buf[0] = '\0';
    
                    XLookupString(&evnt.xkey, key_buf, sizeof(key_buf) - 1,
                                  &key_sym, NULL);
    
                    /* ESC key or the capital Q ? */
                    if ( (key_sym == XK_Escape) || (key_sym == XK_q) ) {
                        /* yes! so we can bail out */
                        run_flag = 0;
                    } else if (key_sym == XK_P) {
                        /* capital P and now the libPNG magic */
                        if ( save_front_to_png(filename, sizeof(filename),
                                               &png_width, &png_height,
                                               &png_bytes) == 0 ) {

                            snprintf(info_text,
                                     sizeof(info_text),
                                     "PNG file : %s\nsize %d x %d px\nbytes: %ld",
                                     filename, png_width, png_height, png_bytes);

                            update_info_window(info_text);

                            fprintf(stderr,"\nINFO : %s\n", info_text);

                        } else {
                            /**********************************
                             * No clue what to do here really *
                             **********************************/
                            snprintf(info_text, sizeof(info_text),
                                    "PNG file failed bork bork bork");

                            update_info_window(info_text);

                        }
                    }
                }
                break;

                /* if we fall to here then we didn't need to do
                 * anything */
                default:
                    break;

            }
        }
 
        /* wait with a nanosleep to match FRAMES_PER_SEC */
        clock_gettime(CLOCK_MONOTONIC, &now);

        /* THIS IS CRAP and may give bizarre delta_time
         * there is code that actually works in the time_and_date
         * directory and this is just a hack for now.
         *
         * TODO : negative time may happen? */
        delta_time = ( now.tv_sec - last_plot_time.tv_sec )
                   + ( ( now.tv_nsec - last_plot_time.tv_nsec ) * TIME_NANOSEC );

        /* this is crap and we may get a borked display 
         * wherein the time and sleep stuff does not
         * make sense anymore. 
         * TODO : figure that out ? 
         */
        if ( delta_time < frame_interval) {
            /* frame_interval is 1.0 / FRAMES_PER_SEC */
            wait_time = frame_interval - delta_time;
            remainder.tv_sec = (time_t)wait_time;
            remainder.tv_nsec = (long)((wait_time - remainder.tv_sec) * 1e9);
            nanosleep(&remainder, NULL);
            clock_gettime(CLOCK_MONOTONIC, &now);
            /* TODO replace this crap with proper diff time code */
            delta_time = ( now.tv_sec - last_plot_time.tv_sec )
                       + ( ( now.tv_nsec - last_plot_time.tv_nsec ) * TIME_NANOSEC );
        }
        last_plot_time = now;
 
        /* push forwards the phase angle by a little bit and redraw */
        phase += phase_step;

        /* plot a new sine wave into the back buffer only */
        draw_sine(phase);

        /* swap the front to back to front buffer double buffer */
        swap_buffers();

        /* get the new front buffer into the plot window */
        present_front();

    } /* end of while (run_flag) */
 
    /* clean up the front and back buffer */
    destroy_image(&buf_front);
    destroy_image(&buf_back);

    /* we have a font also? It may have failed */
    if ( info_font ) {
        XFreeFont(dsp, info_font);
    }

    /* nuke the graphics contexts and the windows */
    XFreeGC(dsp, info_gc);
    XDestroyWindow(dsp, info_win);

    XFreeGC(dsp, gc);
    XDestroyWindow(dsp, win);

    /* goodbye to X11 for now */
    XCloseDisplay(dsp);

    return EXIT_SUCCESS;

}
 
