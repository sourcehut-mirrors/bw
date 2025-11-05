
#include <png.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#if ! defined (STUFFED)
#include "stuff.h"
#endif

pixel_t *pix_at(bitmap_t *bitmap, int x, int y) {
    /* return pixel data at ( x, y ) */
    return bitmap->pixels + bitmap->width * y + x;
}

