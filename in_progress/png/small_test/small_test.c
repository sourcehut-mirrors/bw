
#include <png.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#if ! defined (STUFFED)
#include "stuff.h"
#endif

int main (int argc, char **argv) {
    bitmap_t foobar;
    int x, y;
    int status;
    pixel_t *pixel = NULL;

    status = 0;

    foobar.width = 640;
    foobar.height = 640;

    foobar.pixels = calloc(foobar.width * foobar.height, sizeof (pixel_t));
    /* TODO check if that worked with errno.h */
    if (! foobar.pixels) {
    return -1;
    }

    for (y = 0; y < foobar.height; y++) {
        for (x = 0; x < foobar.width; x++) {
            /* get the pixel data at ( x, y ) */
            pixel = pix_at(&foobar, x, y);
            /* shove in a linear scaled redness */
            pixel->red = pix(x, foobar.width);
            /* also a linear scaled green */
            pixel->green = pix(y, foobar.height);
            /* TODO deal with blue and transparency someday */
        }
    }

    /* dump image to a file 'foobar.png' */
    if (png_to_fid(&foobar, "foobar.png")) {
        fprintf (stderr, "bork bork bork\n");
        status = -1;
    }

    free (foobar.pixels);

    return status;
}

