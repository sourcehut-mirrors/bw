
/*
 * numpad.c   Trivial X11 stuff to draw a numeric keypad where the
 *            only valid function seems to be HLT for halt
 *
 *
 *     * * *    W A R N I N G    * * *
 *   There are direct calls to use the termingus font. You may need
 *   to see github.com:neutaaaaan/termingus.git
 *
 *   Otherwise the fonts will be a mess.  Good luck.
 *
 * ------------------------------------------------------------------
 * Copyright (c) 2019 Dennis Clarke
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
#define _XOPEN_SOURCE 600

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>

Window
create_borderless_topwin(Display *dsp,
                         int width, int height,
                         int offset_x, int offset_y,
                         int bg_color);

GC create_gc(Display *dsp, Window win);

int X_error_handler(Display *dsp, XErrorEvent *errevt);

#define WIN_WIDTH 640
#define WIN_HEIGHT 480

int main (int argc, char *argv[])
{

    /* our display and window and graphics context */
    Display *dsp;
    Window win;
    GC gc;
    Font pad_font, dsp_font;
    Colormap screen_colormap;
    XEvent event;

    /* a very few colours */
    XColor red, green, blue, yellow, cyan, truecolor;

    Status retcode0;  /* not really needed for trivial stuff */
    int retcode1;     /* curious what some funcs return */
    int pad_hlt = 0;  /* has HLT been pressed ? */
    int pad_dot = 0;  /* has dot been pressed ? */
    int conn_num, screen_num, depth;
    int disp_width, disp_height;

    /* setup x and y as impossible negative values */
    int x = -1, y = -1;
    int button;

    /* get a display name but it is not really needed.
     * we can just assume null and Xwindows will go with
     * the DISPLAY env var anyways
     *    char *disp_name = getenv("DISPLAY");
     */
    char *disp_name = NULL;
    XSetErrorHandler(X_error_handler);
    dsp = XOpenDisplay(disp_name);
    if (dsp == NULL) {
        fprintf(stderr, "%s: no X server?? '%s'\n",
            argv[0], disp_name);
        exit(EXIT_FAILURE);
    }
    conn_num = XConnectionNumber(dsp);
    printf("connection number %i\n", conn_num);

    screen_num = DefaultScreen(dsp);
    printf("screen number %i\n", screen_num);

    depth = XDefaultDepth(dsp,screen_num);
    printf("default depth is %i\n", depth);

    disp_width = DisplayWidth(dsp, screen_num);
    disp_height = DisplayHeight(dsp, screen_num);

    printf("display seems to be %i wide and %i high.\n",
                                   disp_width, disp_height);


    /* 400x400 window at x=200 y=100 coords with black background
     *
     *     +---------+---------+---------+---------+
     */
    win = create_borderless_topwin(dsp, 400, 400, 200, 100, 0x000000 );
    gc = create_gc(dsp, win);

    /* setup mouse pointer grab allowed */
    XGrabPointer(dsp, win, False, ButtonPressMask, GrabModeAsync,
                           GrabModeAsync, None, None, CurrentTime);

    /* press a button any button */
    XSelectInput(dsp, win, ButtonPressMask);


    screen_colormap = XDefaultColormap(dsp, DefaultScreen(dsp));

    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "red", &red, &red) == 0) {
        fprintf(stderr, "XAllocNamedColor - no red color?\n");
        exit(EXIT_FAILURE);
    }

    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "green", &green, &green) == 0) {
        fprintf(stderr, "XAllocNamedColor - red works but green no??\n");
        exit(EXIT_FAILURE);
    }

    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "blue", &blue, &blue) == 0) {
        fprintf(stderr, "XAllocNamedColor - red and green okay but blue??\n");
        exit(EXIT_FAILURE);
    }

    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "yellow", &yellow, &yellow) == 0) {
        fprintf(stderr, "XAllocNamedColor - yellow bork bork bork!\n");
        exit(EXIT_FAILURE);
    }

    if (XAllocNamedColor(dsp,
                         screen_colormap,
                         "cyan", &cyan, &cyan) == 0) {
        fprintf(stderr, "XAllocNamedColor - cyan bork bork bork!\n");
        exit(EXIT_FAILURE);
    }


    /* draw a blue box around the win */
    XSetForeground(dsp, gc, blue.pixel);
    retcode0 = XSetLineAttributes(dsp, gc, 1, LineSolid, CapButt, JoinMiter);
    printf("gc XSetLineAttributes returns %i\n", retcode1 );
    XDrawRectangle(dsp, win, gc, 0, 0, 399, 399);

    /* now draw the key pads */
    int pad_x[8] = { 10,  90, 110, 190, 210, 290, 310, 390};
    int pad_y[8] = { 90, 150, 170, 230, 250, 310, 330, 390};
    int i, j;
    for ( i=0; i<8; i+=2 ){
        for ( j=0; j<8; j+=2 ){
            printf("pad [%3i][%3i][%3i][%3i]\n", pad_x[i], pad_y[j], pad_x[i]+80, pad_y[j]+60);
            XDrawRectangle(dsp, win, gc, pad_x[i], pad_y[j], 80, 60);
        }
    }

    /* we have no idea if these fonts exist however we need a big
     * one for the keypads and a little one for the display */
    pad_font = XLoadFont(dsp,"-xos4-termingus-medium-r-normal--32-320-72-72-c-160-iso10646-1");
    dsp_font = XLoadFont(dsp,"-xos4-termingus-medium-r-normal--16-160-72-72-c-80-iso10646-1");
    XSetFont(dsp, gc, pad_font);

    /* general purpose buffer */
    char *buf = calloc((size_t)64,sizeof(unsigned char));

    XSetForeground(dsp, gc, WhitePixel(dsp, screen_num));
    sprintf(buf,"%s", "0");
    XDrawImageString(dsp,win,gc, 140, 370,buf,strlen(buf)); 
    XDrawLine(dsp, win, gc, 143, 369, 155, 349);

    sprintf(buf,"%s", ".");
    XDrawImageString(dsp,win,gc, 240, 370,buf,strlen(buf)); 

    sprintf(buf,"%s", "1");
    XDrawImageString(dsp,win,gc,  40, 290,buf,strlen(buf));

    sprintf(buf,"%s", "2");
    XDrawImageString(dsp,win,gc, 140, 290,buf,strlen(buf));

    sprintf(buf,"%s", "3");
    XDrawImageString(dsp,win,gc, 240, 290,buf,strlen(buf));

    sprintf(buf,"%s", "4");
    XDrawImageString(dsp,win,gc,  40, 210,buf,strlen(buf));
    
    sprintf(buf,"%s", "5");
    XDrawImageString(dsp,win,gc, 140, 210,buf,strlen(buf));
    
    sprintf(buf,"%s", "6");
    XDrawImageString(dsp,win,gc, 240, 210,buf,strlen(buf));

    sprintf(buf,"%s", "7");
    XDrawImageString(dsp,win,gc,  40, 130,buf,strlen(buf));
    
    sprintf(buf,"%s", "8");
    XDrawImageString(dsp,win,gc, 140, 130,buf,strlen(buf));
   
    sprintf(buf,"%s", "9");
    XDrawImageString(dsp,win,gc, 240, 130,buf,strlen(buf));

    XSetForeground(dsp, gc, red.pixel);
    sprintf(buf,"%s", "HLT");
    XDrawImageString(dsp,win,gc, 320, 130,buf,strlen(buf));

    XSetForeground(dsp, gc, green.pixel);
    sprintf(buf,"%s", "PLT");
    XDrawImageString(dsp,win,gc, 320, 210,buf,strlen(buf));
    XDrawRectangle(dsp, win, gc, 10, 10, 380, 70);

    XSetForeground(dsp, gc, yellow.pixel);
    sprintf(buf,"%s", "CLR");
    XDrawImageString(dsp,win,gc, 20, 370,buf,strlen(buf)); 

    sprintf(buf,"%s", "-->");
    XDrawImageString(dsp,win,gc, 320, 290, buf,strlen(buf));

    sprintf(buf,"%s", "<--");
    XDrawImageString(dsp,win,gc, 320, 370, buf,strlen(buf));

    XSetForeground(dsp, gc, cyan.pixel);
    /* clear the buffer */
    buf[0]='\0';
    XSetFont(dsp, gc, dsp_font);

    /* we do a whole lot of nothing until HLT is clicked */
    while( pad_hlt == 0 ){

        XNextEvent(dsp,&event);

        switch(event.type){
            case ButtonPress:
                switch(event.xbutton.button){
                    case Button1:
                        x=event.xbutton.x;
                        y=event.xbutton.y;
                        button=Button1;
                        break;

                    case Button3:
                        x=event.xbutton.x;
                        y=event.xbutton.y;
                        button=Button3;
                        break;
                    default:
                        break;
                }
            break;
        default:
            break;
        }

        /* our numeric pad digits 
            char       coordinates
            -------------------------------
             7     pad [ 10][ 90][ 90][150]
             4     pad [ 10][170][ 90][230]
             1     pad [ 10][250][ 90][310]
             CLR   pad [ 10][330][ 90][390]
             8     pad [110][ 90][190][150]
             5     pad [110][170][190][230]
             2     pad [110][250][190][310]
             zero  pad [110][330][190][390]
             9     pad [210][ 90][290][150]
             6     pad [210][170][290][230]
             3     pad [210][250][290][310]
             dot   pad [210][330][290][390]
             HLT   pad [310][ 90][390][150]
             PLT   pad [310][170][390][230]
             <--   pad [310][250][390][310]
             -->   pad [310][330][390][390]

             display     10, 10, 380, 70

         */

        if (strlen(buf)<32){
            /* left most column */
            if ((x >  10) && (x <  90)){
                if ((y >  90) && (y < 150 )) strcat(buf,"7");
                if ((y > 170) && (y < 230 )) strcat(buf,"4");
                if ((y > 250) && (y < 310 )) strcat(buf,"1");
                if ((y > 330) && (y < 390 )){  /* CLR */
                    strcpy(buf,"                        ");
                    XDrawImageString(dsp, win, gc, 20, 40, buf, strlen(buf));
                    buf[0]='\0';
                    pad_dot = 0;
                }
            }
            /* center column */
            if ((x > 110) && (x < 190)){
                if ((y >  90) && (y < 150 )) strcat(buf,"8");
                if ((y > 170) && (y < 230 )) strcat(buf,"5");
                if ((y > 250) && (y < 310 )) strcat(buf,"2");
                if ((y > 330) && (y < 390 ) && (pad_dot == 1)) strcat(buf,"0");
            }
            /* nine right column */
            if ((x > 210) && (x < 290)){
                if ((y >  90) && (y < 150 )) strcat(buf,"9");
                if ((y > 170) && (y < 230 )) strcat(buf,"6");
                if ((y > 250) && (y < 310 )) strcat(buf,"3");
                if ((y > 330) && (y < 390 ) && (pad_dot == 0)){
                    strcat(buf,".");
                    pad_dot = 1;
                }
            }
            /* right most column */
            if ((x > 310) && (x < 390)){
                if ((y >  90) && (y < 150 )) pad_hlt = 1;    
                if ((y > 170) && (y < 230 )){ /* PLT */
                    XSetForeground(dsp, gc, green.pixel);
                    XDrawImageString(dsp, win, gc, 20, 60, buf, strlen(buf));
                    strcpy(buf,"                        ");
                    XSetForeground(dsp, gc, cyan.pixel);
                    XDrawImageString(dsp, win, gc, 20, 40, buf, strlen(buf));
                    pad_dot = 0;
                }
            }
            XDrawImageString(dsp, win, gc, 20, 40, buf, strlen(buf));
        }

        if ((x > 310) && (x < 390) && (y >  90) && (y < 150 )) pad_hlt = 1;

        if ((x > 310) && (x < 390) && (y > 170) && (y < 230 )){ /* PLT */
            XSetForeground(dsp, gc, green.pixel);
            XDrawImageString(dsp, win, gc, 20, 60, buf, strlen(buf));
            strcpy(buf,"                        ");
            XSetForeground(dsp, gc, cyan.pixel);
            XDrawImageString(dsp, win, gc, 20, 40, buf, strlen(buf));
            pad_dot = 0;
        }

        if ((x >  10) && (x <  90) && (y > 330) && (y < 390 )){  /* CLR */
            strcpy(buf,"                        ");
            XDrawImageString(dsp, win, gc, 20, 40, buf, strlen(buf));
            buf[0]='\0';
            pad_dot = 0;
        }

    } /* while */

    if ( button == Button1 ){
        printf("leftclick at %d %d \n", x, y);
    } else {
        printf("rightclick at %d %d \n", x, y);
    }

    XCloseDisplay(dsp);
    free(buf);
    return EXIT_SUCCESS;
}

