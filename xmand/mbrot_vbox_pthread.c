
/*
 * mbrot_vbox_pthread.c Actual POSIX thread that is dispatched to
 *                      perform the computation in the mandelbrot map
 * Copyright (C) Dennis Clarke 2019
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

#include <fenv.h>
#ifndef __FAST_MATH__
#pragma STDC FENV_ACCESS ON
#endif
#pragma STDC FP_CONTRACT ON

#include <stdint.h>
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include "mandelbrot.h" 

/* This will be a dispatched POSIX pthread that shall receive
 * a point to a struct of type thread_parm.  Then we shall
 * pull out the values needed from that struct and simply
 * compute the mandelbrot height for each coordinate in a
 * given vbox region on the screen */
void *mbrot_vbox_pthread(void *recv_parm)
{
    thread_parm *p = (thread_parm *)recv_parm;
    double win_r, win_j, x_prime, y_prime;
    int mand_x_pix, mand_y_pix;
    int mand_y_pix_start, mand_y_pix_stop;

    /* required for some fp routines */
    fp64 cplex;

    /* throw away buffer */
    char buff[256];

    /* point c belongs to the Mandelbrot set if and only if
     * the magnitude of the f(c) <= 2.0 */
    uint32_t height;
    double zr, zi, tmp_r, tmp_i, mag;

    /* lets come up with an imaginary axis start and stop
     * based on this thread t_num */
    mand_y_pix_start = ( p->vbox_h / p->t_total ) * p->t_num;

    mand_y_pix_stop = mand_y_pix_start
                      + ( p->vbox_h / p->t_total )
                      - 1;

    /* It may be better to use flockfile() and funlockfile() but
     * those are blocking and the recent kernel on Linux and FreeBSD
     * seem to assure us that stdio output functions like printf
     * and puts are thread safe. At the very least output from
     * other threads will not be intermingled and mangled on a
     * single output line.
     */
    sprintf(buff,"[ t%02i ] : v[%-2i][%-2i] rows %-2i -> %-2i", 
            p->t_num, p->vbox_r, p->vbox_j,
            mand_y_pix_start, mand_y_pix_stop);
    puts(buff);
    buff[0]='\0';

    for ( mand_y_pix = mand_y_pix_start; mand_y_pix <= mand_y_pix_stop; mand_y_pix++ ) {

        for ( mand_x_pix = 0; mand_x_pix < p->vbox_w; mand_x_pix++ ) {

            fp_vbox(p->vbox_r, p->vbox_j, mand_x_pix, mand_y_pix,
                    p->eff_width, p->eff_height, &cplex);

            win_r = cplex.r;
            win_j = cplex.j;

            /*
            sprintf(buff,"[ t%02i ] : v[%-2i][%-2i][%-2i][%-2i].Wr = %-+32.26e",
                    p->t_num, p->vbox_r, p->vbox_j, mand_x_pix, mand_y_pix, win_r);
            puts(buff);
            buff[0]='\0';

            sprintf(buff,"[ t%02i ] : v[%-2i][%-2i][%-2i][%-2i].Wj = %-+32.26e",
                    p->t_num, p->vbox_r, p->vbox_j, mand_x_pix, mand_y_pix, win_j);
            puts(buff);
            buff[0]='\0';
            */

            fp_translate(win_r, win_j, p->magnify, p->r_translate, p->i_translate, &cplex);
            x_prime = cplex.r;
            y_prime = cplex.j;

            /* store the coordinate data */
            p->coord_r[array_offset(p->vbox_r,p->vbox_j,mand_x_pix,mand_y_pix)] = x_prime;
            p->coord_j[array_offset(p->vbox_r,p->vbox_j,mand_x_pix,mand_y_pix)] = y_prime;

            /*
            sprintf(buff,"[ t%02i ] : v[%-2i][%-2i][%-2i][%-2i].x\' = %-+32.26e",
                    p->t_num, p->vbox_r, p->vbox_j, mand_x_pix, mand_y_pix, x_prime);
            puts(buff);
            buff[0]='\0';

            sprintf(buff,"[ t%02i ] : v[%-2i][%-2i][%-2i][%-2i].y\' = %-+32.26e",
                    p->t_num, p->vbox_r, p->vbox_j, mand_x_pix, mand_y_pix, y_prime);
            puts(buff);
            buff[0]='\0';
            */

            height = 0;
            zr = 0.0;
            zi = 0.0;
            mag = 0.0;

            while ( ( height < ( p->bail_out ) ) && ( mag <= 4.0 ) ) {
                tmp_r = ( zr * zr ) - ( zi * zi );
                tmp_i = ( zr * zi ) + ( zr * zi );
                zr = tmp_r + x_prime;
                zi = tmp_i + y_prime;
                mag = zr * zr + zi * zi;
                height += 1;
            }

            p->mandel_val[array_offset(p->vbox_r,p->vbox_j,mand_x_pix,mand_y_pix)] = height;

            /*
            sprintf(buff,"[ t%02i ] : v[%-2i][%-2i][%-2i][%-2i].M = %6i",
                    p->t_num, p->vbox_r, p->vbox_j, mand_x_pix, mand_y_pix, height);
            puts(buff);
            buff[0]='\0';
            */
        }
    }

    p->ret_val = 0;

    return NULL;

}

