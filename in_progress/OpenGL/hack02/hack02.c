

/* lifted directly from https://www.glfw.org/documentation.html */
/* then hacked at with thanks to Nico and Steve Wills and other good
 * people that tazer me as needed */

#include <stdio.h>
#include <stdlib.h>
#include <GL/glut.h>
#include <GLFW/glfw3.h>

#define VERBOSE 1
int sysinfo(int verbose);

static PFNGLCREATESHADERPROC glCreateShader = NULL;

int main(void)
{

    sysinfo(VERBOSE);

    GLFWwindow* window;

    /* Initialize the library */
    if (!glfwInit()) {
        return EXIT_FAILURE;
    }

    /* Create a windowed mode window and its OpenGL context */
    window = glfwCreateWindow(640, 480, "Hello World", NULL, NULL);
    if (!window) {
        glfwTerminate();
        return EXIT_FAILURE;
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
     *  void glGetIntegerv(	GLenum pname, GLint *data);
     *
     * see GL_NUM_EXTENSIONS
     *
     *    data returns one value, the number of extensions supported
     *    by the GL implementation for the current context.
     *    See glGetString. 
     */

    GLint num_of_extensions;
    glGetIntegerv(GL_NUM_EXTENSIONS, &num_of_extensions);
    printf("INFO : num_of_extensions = %i\n", num_of_extensions);

    /* at some point we need const GLubyte* glGetString(GLenum name); */

    /* what follows it outright stolen from  Brian Paul  October 3, 1997
     * in glinfo.c from mesa-demos */

    printf("GL_VERSION: %s\n", (char *) glGetString(GL_VERSION));
    printf("GL_RENDERER: %s\n", (char *) glGetString(GL_RENDERER));
    printf("GL_VENDOR: %s\n\n", (char *) glGetString(GL_VENDOR));

    /* this dumps out one big long space separated list */
    printf("INFO : num_of_extensions = %i\n", num_of_extensions);
    printf("GL_EXTENSIONS: %s\n\n", (char *) glGetString(GL_EXTENSIONS));

    printf("GLU_VERSION: %s\n\n", (char *) gluGetString(GLU_VERSION));

    /* this also dumps out one big long space separated list */
    printf("GLU_EXTENSIONS: %s\n\n", (char *) gluGetString(GLU_EXTENSIONS));

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
    return EXIT_SUCCESS;

}

