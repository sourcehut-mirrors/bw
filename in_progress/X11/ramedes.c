
/*
 * ramedes.c  X11 calls to create a trivial window
 *
 * Submitted by some guy on twitch
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

#include <stdio.h>
#include <stdlib.h>
#include <X11/Xlib.h>

int main(int argc, char *argv[])
{
	Display *dpy;
	int screen;
	Window win;
	XEvent event;
	
	dpy = XOpenDisplay(NULL);
	
	if (dpy == NULL)
	{
		fprintf(stderr, "Cannot open display\n");
		exit(1);
	}
	
	screen = DefaultScreen(dpy);	
	win = XCreateSimpleWindow(dpy, RootWindow(dpy, screen),
	200, 200, 500, 300,
	1, BlackPixel(dpy, screen), WhitePixel(dpy, screen));	
	XSelectInput(dpy, win, ExposureMask| KeyPressMask);
	XMapWindow(dpy, win);
	
	while(1)
	{
		XNextEvent(dpy, &event);
	}
	
	return 0;
	
}

