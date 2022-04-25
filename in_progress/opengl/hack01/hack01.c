

/* lifted directly from https://www.glfw.org/documentation.html */
/* then hacked at */

#include <stdio.h>

#ifndef GLUT_WRAP_H
#define GLUT_WRAP_H

#ifdef HAVE_FREEGLUT
#  include <GL/freeglut.h>
#elif defined __APPLE__
#  include <GLUT/glut.h>
#else
#  include <GL/glut.h>
#endif

#ifndef GLAPIENTRY
#define GLAPIENTRY
#endif

#endif /* lifted from mesa-demos */

#include <GLFW/glfw3.h>

static PFNGLCREATESHADERPROC glCreateShader = NULL;

int main(void)
{
    GLFWwindow* window;

    /* Initialize the library */
    if (!glfwInit()) {
        return -1;
    }

    /* Create a windowed mode window and its OpenGL context */
    window = glfwCreateWindow(640, 480, "Hello World", NULL, NULL);
    if (!window) {
        glfwTerminate();
        return -1;
    }

    /* Make the window's context current */
    glfwMakeContextCurrent(window);

    /* because marsen says so. however sadly this does not work and 
     * perhaps the string I am using here is wrong */
    if ( glfwExtensionSupported("glCreateShader") ) {
        fprintf(stderr, "INFO: glCreateShader is supported\n");
        glCreateShader = (PFNGLCREATESHADERPROC) glfwGetProcAddress("glCreateShader");
    } else {
        fprintf(stderr, "WARN: glCreateShader is NOT supported\n");
    }

    /* read https://www.khronos.org/registry/OpenGL-Refpages/es3/ 
     *
     *
     *  void glGetIntegerv(	GLenum pname, GLint *data);
     *
     * see GL_NUM_EXTENSIONS
     *
     *    data returns one value, the number of extensions supported
     *    by the GL implementation for the current context.
     *    See glGetString. 
     * */

    GLint num_of_extensions;
    glGetIntegerv(GL_NUM_EXTENSIONS, &num_of_extensions);

    /* at some point we need const GLubyte* glGetString(GLenum name); */

    /* what follows it outright stolen from  Brian Paul  October 3, 1997
     * in glinfo.c from mesa-demos */

    printf("GL_VERSION: %s\n", (char *) glGetString(GL_VERSION));
    printf("GL_RENDERER: %s\n", (char *) glGetString(GL_RENDERER));
    printf("GL_VENDOR: %s\n", (char *) glGetString(GL_VENDOR));
    printf("GL_EXTENSIONS: %s\n", (char *) glGetString(GL_EXTENSIONS));
    printf("GLU_VERSION: %s\n", (char *) gluGetString(GLU_VERSION));
    printf("GLU_EXTENSIONS: %s\n", (char *) gluGetString(GLU_EXTENSIONS));
    printf("GLUT_API_VERSION: %d\n", GLUT_API_VERSION);
#ifdef GLUT_XLIB_IMPLEMENTATION
    printf("GLUT_XLIB_IMPLEMENTATION: %d\n", GLUT_XLIB_IMPLEMENTATION);
#endif

    /* Loop until the user closes the window */
    while (!glfwWindowShouldClose(window)) {
        /* Render here */
        glClear(GL_COLOR_BUFFER_BIT);

        /* Swap front and back buffers */
        glfwSwapBuffers(window);

        /* Poll for and process events */
        glfwPollEvents();
    }

    glfwTerminate();
    return 0;

}

