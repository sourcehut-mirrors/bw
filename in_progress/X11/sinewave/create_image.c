 
/* request a buffer with a width and height and we get
 * back a pointer. If bork bork bork then return NULL.
 * and also who the heck knows what errno does in X11? */
static XImage *create_image(int width_request, int height_request)
{

    int bitmap_pad, bytes_per_pixel, bytes_per_line;
    /* a pixel is really just uint32_t */

    pixel_t *data;
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
 
