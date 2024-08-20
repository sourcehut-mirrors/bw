

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <xcb/xcb.h>
#include <xcb/xcb_util.h>
#include <xcb/xcb_icccm.h>

int main(int argc, char *argv[])
{

    int screen_num;
    xcb_connection_t *xcb_conn = xcb_connect(NULL, &screen_num);

    if(xcb_connection_has_error(xcb_conn))
    {
        fprintf(stderr,"Failed to connect!\n");
        return EXIT_FAILURE;
    }
    else
    {
        printf("Received preferred screen:%d\n",screen_num);
    }

    /*
    //Longwinded way to do this
    const xcb_setup_t *setup = xcb_get_setup(xcb_conn);
    xcb_screen_iterator_t screen_it = xcb_setup_roots_iterator(setup);
    xcb_screen_t *screen = screen_it.data;
    */

    xcb_screen_t *screen = xcb_aux_get_screen(xcb_conn,screen_num);

    xcb_window_t win = xcb_generate_id(xcb_conn);

    xcb_create_window(xcb_conn,screen->root_depth,win,screen->root,
                      20,20,600,600,0,XCB_WINDOW_CLASS_INPUT_OUTPUT,
                      screen->root_visual, XCB_CW_BACK_PIXEL,
                      &(int[]){0});

    char *title = "xcb intro";
    int title_len=strlen(title);

    /*
      //Longwinded way
      xcb_change_property(xcb_conn, XCB_PROP_MODE_REPLACE, win,
      XCB_ATOM_WM_NAME, XCB_ATOM_STRING, 8,
      title_len,title);
    */

    xcb_icccm_set_wm_name(xcb_conn,win,XCB_ATOM_STRING, 8, title_len, title);

    xcb_map_window(xcb_conn,win); 
    
    if(!xcb_flush(xcb_conn))
    {
        fprintf(stderr, "Could not flush\n");
    }
    
    while(1)
    {

    }
    
    xcb_disconnect(xcb_conn);
    printf("All is well, disconnecting!\n");
    return 0;
}
 

