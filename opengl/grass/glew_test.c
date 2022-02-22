
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <locale.h>
#include <unistd.h>

#include <X11/Xlib.h>
#include <GL/glew.h>
/* #include <GL/glxew.h> */
#include <GLFW/glfw3.h> 
#include <GL/glx.h>

int main(int argc, char** argv)
{

    setlocale( LC_ALL, "C" );


    int glfw_major_version, glfw_minor_version, glfw_rev,
        glfw_error_code, glfw_status = 0;

    const int CANVAS_WIDTH = 500;
    const int CANVAS_HEIGHT = 500;

    const char *glfw_error_message;

    glfw_status = glfwInit();

    if (glfw_status != GLFW_TRUE) {
        printf("glfwInit() fail\n");
        glfw_error_code = glfwGetError(&glfw_error_message);
        printf("glfw error code = %i\n", glfw_error_code);
        printf("glfw error = \"%s\"\n", glfw_error_message);
        return EXIT_FAILURE;
    } else {
        glfwGetVersion(&glfw_major_version,&glfw_minor_version,&glfw_rev);
        printf("glfwInit() good.\n");
        printf("glfw version = %i.%i.%i\n", glfw_major_version,
                                            glfw_minor_version,
                                            glfw_rev);
    }
  
    /* Ask for the OpenGL 3.3 Core Profile. */
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    glfwWindowHint(GLFW_SAMPLES, 8);
  
    /* Initialize GLFW window. */
    GLFWwindow *window = glfwCreateWindow(CANVAS_WIDTH, CANVAS_HEIGHT, "gldemo", NULL, NULL);
    if (!window) {
        printf("glfwCreateWindow fail\n");
        glfw_error_code = glfwGetError(&glfw_error_message);
        printf("glfw error code = %i\n", glfw_error_code);
        printf("glfw error = \"%s\"\n", glfw_error_message);
        glfwTerminate();
        return EXIT_FAILURE;
    }
    glfwMakeContextCurrent(window);	

    printf("OpenGL version: %s\n", glGetString(GL_VERSION));
  
    /* Using Core OpenGL version 3.3 one must specify you are 
     * using "new" and by GLEW terms "experimental" API.
     * Add this line before calling glewInit();
     * Otherwise glGenVertexArrays() fails without this.
     */
    glewExperimental = true;

    printf("GLEW version: %s\n", glewGetString(GLEW_VERSION));


    /* lets try a GLX display check here 
     * can we get a display from Xorg ? */
    Display *dsp;
    char *disp_name = NULL;
    int conn_num, screen_num, depth;

    /* TODO do we need to get an X11 display at all?
     *
    dsp = XOpenDisplay(disp_name);
    if (dsp == NULL) {
        fprintf(stderr, "%s: no X server?? '%s'\n",
            argv[0], disp_name);
        exit(EXIT_FAILURE);
    }
    conn_num = XConnectionNumber(dsp);
    printf("     : connection number %i\n", conn_num);

    screen_num = DefaultScreen(dsp);
    printf("     : screen number %i\n", screen_num);

    depth = XDefaultDepth(dsp,screen_num);
    printf("     : default depth is %i\n", depth);
    */


    GLenum glew_error_code = glewInit();

    Display *glx_dsp = glXGetCurrentDisplay();
    if (glx_dsp == NULL) {
        fprintf(stderr,"\nOKAY we have glXGetCurrentDisplay() NULL!\n");
    }

    int glx_major, glx_minor;
    glXQueryVersion(glx_dsp, &glx_major, &glx_minor);
    printf("NOTE glXversion = %i.%i\n", glx_major, glx_minor);

    if (glew_error_code != GLEW_OK) {
        if ( glew_error_code == GLEW_ERROR_NO_GLX_DISPLAY ) {
            printf("glewInit() returns GLEW_ERROR_NO_GLX_DISPLAY\n");
            printf("we may not care and there is no error message yet\n");
            printf("however there will be ... real soon now\n");
            printf("see glew_init_tail.c line 11\n");
            printf("glewGetErrorString() should say \"No GLX display\"\n");
        } else {
            printf("glewInit() fail\n");
            printf("glew error code = %i\n",glew_error_code);
            printf("glew error = \"%s\"\n", glewGetErrorString(glew_error_code));
            glfwTerminate();
            return EXIT_FAILURE;
        }
    } else {
        printf("glewInit() returns GLEW_OK on this platform\n");
    }
 
    glfwTerminate();
    return EXIT_SUCCESS;

}

