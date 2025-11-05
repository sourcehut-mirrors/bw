
#include <inttypes.h>

#define STUFFED 1

typedef struct {
    uint8_t red;
    uint8_t green;
    uint8_t blue;
} pixel_t;

typedef struct {
    pixel_t *pixels;
    size_t width;
    size_t height;
} bitmap_t;
    
pixel_t *pix_at(bitmap_t *bitmap, int x, int y);
int png_to_fid(bitmap_t *bitmap, const char *path);
int pix(int value, int max);

