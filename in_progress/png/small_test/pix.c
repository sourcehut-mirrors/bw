
#include <png.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#if ! defined (STUFFED)
#include "stuff.h"
#endif

/* linear interpolate between 0 and 255 for some value up to max */
int pix(int value, int max) {
    int ret;
    if (value < 0) {
        /* this should never happen but whatever */
        ret = 0;
    } else if (value > max) {
        ret = max;
    } else {
        ret = (int)(256.0 * ( (double)(value)/(double)max ));
    }
    return ret;
}

