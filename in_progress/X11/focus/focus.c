
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/Xatom.h>

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    Display *dpy;
    Window current;
    int revert_to;

    if ( (dpy = XOpenDisplay(NULL)) == NULL)
        return EXIT_FAILURE;

    XGetInputFocus(dpy, &current, &revert_to);
    printf("current: %p\n", (void *)current);

    return EXIT_SUCCESS;
}

