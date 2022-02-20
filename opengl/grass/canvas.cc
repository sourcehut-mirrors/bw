#include <cstdlib>
#include <iostream>
#include <cassert>
#include <vector>

#include <stdbool.h>

#include <X11/Xlib.h>
#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <GL/glx.h>

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <png.h>
#include "texture.h"
#include "furtexture.h"
#include "furgeometry.h"
#include "shader.h"

using namespace std;

const int CANVAS_WIDTH = 500;
const int CANVAS_HEIGHT = 500;
const int FUR_DIM = 512;
const float FUR_DENSITY = 0.4f;
const int FUR_LAYERS = 40;
const int FUR_HEIGHT = 2.0;

int main(int argc, char** argv)
{

    GLFWwindow* window;
    int glfw_major_version, glfw_minor_version, glfw_rev,
        glfw_error_code, glfw_status = 0;

    const char *glfw_error_message;

    glfw_status = glfwInit();

    if (glfw_status != GLFW_TRUE) {
        cout << "glfwInit() fail\n";
        glfw_error_code = glfwGetError(&glfw_error_message);
        cout << "glfw error code = " << glfw_error_code << "\n";
        cout << "glfw error = \"" << glfw_error_message << "\"\n";
        return EXIT_FAILURE;
    } else {
        glfwGetVersion(&glfw_major_version,&glfw_minor_version,&glfw_rev);
        cout << "glfwInit() good.\n";
        cout << "glfw major version = " << glfw_major_version << "\n";
        cout << "glfw minor version = " << glfw_minor_version << "\n";
        cout << "glfw revision      = " << glfw_rev << "\n";
    }
  
    /* Ask for the OpenGL 3.3 Core Profile. */
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    glfwWindowHint(GLFW_SAMPLES, 8);
  
    /* Initialize GLFW window. */
    window = glfwCreateWindow(CANVAS_WIDTH, CANVAS_HEIGHT, "gldemo", NULL, NULL);
    if (!window) {
        cout << "glfwCreateWindow fail\n";
        glfw_error_code = glfwGetError(&glfw_error_message);
        cout << "glfw error code = " << glfw_error_code << "\n";
        cout << "glfw error = \"" << glfw_error_message << "\n";
        glfwTerminate();
        return EXIT_FAILURE;
    }
    glfwMakeContextCurrent(window);	

    cout << "OpenGL version: " << glGetString(GL_VERSION) << "\n";
  
    /* Using Core OpenGL version 3.3 one must specify you are 
     * using "new" and by GLEW terms "experimental" API.
     * Add this line before calling glewInit();
     * Otherwise glGenVertexArrays() fails without this.
     */
    glewExperimental = true;

    GLenum glew_error_code = glewInit();

    Display *glx_dsp = glXGetCurrentDisplay();
    if (glx_dsp == NULL) {
        cout << "\nOKAY we have glXGetCurrentDisplay() NULL!\n";
    }

    int glx_major, glx_minor;
    int status = glXQueryVersion(glx_dsp, &glx_major, &glx_minor);
    if ( status == 0 ) {
        cout << "NOTE glXQueryVersion tosses " << status << "\n";
    } else {
        cout << "NOTE glXversion = " << glx_major << "." << glx_minor << "\n";
    }

    cout << "GLEW version: " << glewGetString(GLEW_VERSION) << "\n";

    if (glew_error_code != GLEW_OK) {
        if ( glew_error_code == GLEW_ERROR_NO_GLX_DISPLAY ) {
            cout << "glewInit() returns GLEW_ERROR_NO_GLX_DISPLAY\n";
            cout << "glew error = \"" << glewGetErrorString(glew_error_code) << "\"\n";
            cout << "* * * we seem to not care? * * * \n\n";
        } else {
            cout << "glewInit() fail\n";
            cout << "glew error code = " << glew_error_code << "\n";
            cout << "glew error = \"" << glewGetErrorString(glew_error_code) << "\"\n";
            glfwTerminate();
            return EXIT_FAILURE;
        }
    }
 
  // Initialize shaders.
  ShaderProgram prog("default.vert", "default.frag");
  assert(prog.hasAttribute("pos"));
  assert(prog.hasAttribute("texCoord"));
  assert(prog.hasAttribute("layer"));
  //assert(prog.hasAttribute("norm"));
  assert(prog.hasUniform("modelView"));
  assert(prog.hasUniform("projection"));
  assert(prog.hasUniform("fur"));
  assert(prog.hasUniform("color"));
  assert(prog.hasUniform("displacement"));

  prog.use();
    
  // Load textures.
  glActiveTexture(GL_TEXTURE0);
  FurTexture fur(FUR_DIM, FUR_DIM, FUR_LAYERS, FUR_DENSITY);
  glUniform1i(prog.getUniform("fur"), 0);
  
  glActiveTexture(GL_TEXTURE1);
  Texture furColor("grass.png");
  glUniform1i(prog.getUniform("color"), 1);
  
  // Initialize geometry.
  vector<FurAttributes> vertices;
  
  // A---B
  // \   /
  //  C-D
  FurAttributes fa;
  fa = {{ 20.0, -20.0, 0.0}, {0.0, 0.0, 1.0}, {1.0, 0.0}, 0.0}; // D
  vertices.push_back(fa);
  fa = {{ 30.0,  20.0, 0.0}, {0.0, 0.0, 1.0}, {1.0, 1.0}, 0.0}; // B
  vertices.push_back(fa);
  fa = {{-30.0,  20.0, 0.0}, {0.0, 0.0, 1.0}, {0.0, 1.0}, 0.0}; // A
  vertices.push_back(fa);
  
  fa = {{-30.0,  20.0, 0.0}, {0.0, 0.0, 1.0}, {0.0, 1.0}, 0.0}; // A
  vertices.push_back(fa);
  fa = {{-20.0, -20.0, 0.0}, {0.0, 0.0, 1.0}, {0.0, 0.0}, 0.0}; // C
  vertices.push_back(fa);
  fa = {{ 20.0, -20.0, 0.0}, {0.0, 0.0, 1.0}, {1.0, 0.0}, 0.0}; // D
  vertices.push_back(fa);
  
  FurGeometry geom(vertices, prog, FUR_LAYERS, FUR_HEIGHT);

  // Gloabl GL stuff.
  glEnable(GL_MULTISAMPLE);
  glEnable(GL_DEPTH_TEST);
  glEnable(GL_BLEND);
  glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);

  // Simple physics.
  glm::vec3 gravity(0.0f, -0.8f, 0.0f);
  
  // Projection and model-view matrices.
  glm::vec3 xAxis(1.0f, 0.0f, 0.0f);
  glm::mat4 view = glm::translate(glm::mat4(1.0f), glm::vec3(0.0f, 0.0f, -30.0f)) *
    glm::rotate(glm::mat4(1.0f), glm::radians(-60.0f), xAxis);
  glUniformMatrix4fv(prog.getUniform("modelView"), 1, GL_FALSE,
    glm::value_ptr(view));

  while (!glfwWindowShouldClose(window)) {
    float ratio;
    int width, height;
    
    glfwGetFramebufferSize(window, &width, &height);
    ratio = width / (float) height;
    
    glViewport(0, 0, width, height);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);    
    
    glm::mat4 projection = glm::perspective(glm::radians(60.0f), ratio, 0.1f, 100.0f);
    glUniformMatrix4fv(prog.getUniform("projection"), 1, GL_FALSE,
      glm::value_ptr(projection));
    
    // Displacement/animation uniform.
    glm::vec3 force(sin(glfwGetTime()) * 0.5f, 0.0f, 0.0f);
    glm::vec3 disp = gravity + force;
    glUniform3f(prog.getUniform("displacement"), disp.x, disp.y, disp.z);
    
    // Draw.
    geom.draw();

    // Display and continue.
    glfwSwapBuffers(window);
    glfwPollEvents();
  }

  glfwTerminate();
  return EXIT_SUCCESS;
}
