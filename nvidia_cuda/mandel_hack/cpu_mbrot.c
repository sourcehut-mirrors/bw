
#include <inttypes.h>
#include <math.h>

uint32_t cpu_mbrot( double c_r, double c_i, uint32_t bail_out )
{
    /* point c belongs to the Mandelbrot set if and only if
     * the magnitude of the f(c) <= 2.0 */
    uint32_t height = 0;
    double zr = 0.0;
    double zi = 0.0;
    double tmp_r, tmp_i;
    double mag = 0.0;

    double temp0, temp1;

    while ( ( height < bail_out ) && ( mag < 4.0 ) ) {

        /*     tmp_r = ( zr * zr ) - ( zi * zi );     */
        temp0 = -1.0 * zi * zi;
        tmp_r = fma( zr, zr, temp0);

        /*     tmp_i = ( zr * zi ) + ( zr * zi );     */
        temp1 = zr * zi;
        tmp_i = fma( zr, zi, temp1);

        zr = tmp_r + c_r;
        zi = tmp_i + c_i;

        /* mag = zr * zr + zi * zi; */
        temp0 = zi * zi;
        mag = fma ( zr, zr, temp0);

        mag = zr * zr + zi * zi;

        height += 1;
    }

    return height;

}


