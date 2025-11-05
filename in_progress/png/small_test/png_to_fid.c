
#include <png.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#if ! defined (STUFFED)
#include "stuff.h"
#endif

/* dump "bitmap" to a PNG file */
int png_to_fid(bitmap_t *bitmap, const char *path)
{
    FILE * fp;
    png_structp png_ptr = NULL;
    png_infop info_ptr = NULL;
    size_t x, y;
    png_byte **row_pointers = NULL;
    pixel_t *pixel = NULL;

    /* assume failure */
    int status = -1;

    /* I have no idea why pixel size is 3 */
    int pixel_size = 3;
    int depth = 8;
    
    /* TODO : use a stat check with error data */
    fp = fopen (path, "wb");
    if (! fp) {
        goto fopen_failed;
    }

    png_ptr = png_create_write_struct (PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
    if (png_ptr == NULL) {
        goto png_create_write_struct_failed;
    }
    
    info_ptr = png_create_info_struct (png_ptr);
    if (info_ptr == NULL) {
        goto png_create_info_struct_failed;
    }
    
    /* some error handling. */
    if (setjmp (png_jmpbuf (png_ptr))) {
        goto png_failure;
    }
    
    /* image attributes. */
    png_set_IHDR (png_ptr, info_ptr,
                  bitmap->width, bitmap->height, depth,
                  PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE,
                  PNG_COMPRESSION_TYPE_DEFAULT,
                  PNG_FILTER_TYPE_DEFAULT);
    
    /* init rows of PNG. */
    row_pointers = png_malloc(png_ptr, bitmap->height * sizeof (png_byte *));
    /* TODO : check the malloc worked */

    for (y = 0; y < bitmap->height; y++) {
        png_byte *row = png_malloc(png_ptr, sizeof (uint8_t) * bitmap->width * pixel_size);
        row_pointers[y] = row;
        for (x = 0; x < bitmap->width; x++) {
            pixel = pix_at(bitmap, x, y);
            *row++ = pixel->red;
            *row++ = pixel->green;
            *row++ = pixel->blue;
        }
    }
    
    /* dump image data to "fp" */
    png_init_io (png_ptr, fp);
    png_set_rows (png_ptr, info_ptr, row_pointers);
    png_write_png (png_ptr, info_ptr, PNG_TRANSFORM_IDENTITY, NULL);

    /* hopefully not a failure at this point */
    status = 0;
    
    /* free up stuff */
    for (y = 0; y < bitmap->height; y++) {
        png_free (png_ptr, row_pointers[y]);
    }
    png_free (png_ptr, row_pointers);
    
png_failure:
png_create_info_struct_failed:
    png_destroy_write_struct (&png_ptr, &info_ptr);
png_create_write_struct_failed:
    fclose (fp);
fopen_failed:
    return status;
}

