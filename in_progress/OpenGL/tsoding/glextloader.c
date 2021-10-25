
/*
 * Copyright 2021 Alexey Kutepov <reximkut@gmail.com>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

static PFNGLCREATESHADERPROC glCreateShader = NULL;
static PFNGLSHADERSOURCEPROC glShaderSource = NULL;
static PFNGLCOMPILESHADERPROC glCompileShader = NULL;
static PFNGLGETSHADERIVPROC glGetShaderiv = NULL;
static PFNGLGETSHADERINFOLOGPROC glGetShaderInfoLog = NULL;
static PFNGLCREATEPROGRAMPROC glCreateProgram = NULL;
static PFNGLATTACHSHADERPROC glAttachShader = NULL;
static PFNGLLINKPROGRAMPROC glLinkProgram = NULL;
static PFNGLGETPROGRAMIVPROC glGetProgramiv = NULL;
static PFNGLGETPROGRAMINFOLOGPROC glGetProgramInfoLog = NULL;
static PFNGLDELETESHADERPROC glDeleteShader = NULL;
static PFNGLUSEPROGRAMPROC glUseProgram = NULL;
static PFNGLGENVERTEXARRAYSPROC glGenVertexArrays = NULL;
static PFNGLBINDVERTEXARRAYPROC glBindVertexArray = NULL;
static PFNGLDEBUGMESSAGECALLBACKPROC glDebugMessageCallback = NULL;
static PFNGLDELETEPROGRAMPROC glDeleteProgram = NULL;
static PFNGLGETUNIFORMLOCATIONPROC glGetUniformLocation = NULL;
static PFNGLUNIFORM2FPROC glUniform2f = NULL;
static PFNGLGENBUFFERSPROC glGenBuffers = NULL;
static PFNGLBINDBUFFERPROC glBindBuffer = NULL;
static PFNGLBUFFERDATAPROC glBufferData = NULL;
static PFNGLENABLEVERTEXATTRIBARRAYPROC glEnableVertexAttribArray = NULL;
static PFNGLVERTEXATTRIBPOINTERPROC glVertexAttribPointer = NULL;
static PFNGLUNIFORM1FPROC glUniform1f = NULL;
static PFNGLBUFFERSUBDATAPROC glBufferSubData = NULL;
static PFNGLDRAWARRAYSINSTANCEDPROC glDrawArraysInstanced = NULL;

static void load_gl_extensions(void)
{
    // TODO: check for failtures?
    // Maybe some of the functions are not available
    glCreateShader            = (PFNGLCREATESHADERPROC) glfwGetProcAddress("glCreateShader");
    glShaderSource            = (PFNGLSHADERSOURCEPROC) glfwGetProcAddress("glShaderSource");
    glCompileShader           = (PFNGLCOMPILESHADERPROC) glfwGetProcAddress("glCompileShader");
    glGetShaderiv             = (PFNGLGETSHADERIVPROC) glfwGetProcAddress("glGetShaderiv");
    glGetShaderInfoLog        = (PFNGLGETSHADERINFOLOGPROC) glfwGetProcAddress("glGetShaderInfoLog");
    glAttachShader            = (PFNGLATTACHSHADERPROC) glfwGetProcAddress("glAttachShader");
    glCreateProgram           = (PFNGLCREATEPROGRAMPROC) glfwGetProcAddress("glCreateProgram");
    glLinkProgram             = (PFNGLLINKPROGRAMPROC) glfwGetProcAddress("glLinkProgram");
    glGetProgramiv            = (PFNGLGETPROGRAMIVPROC) glfwGetProcAddress("glGetProgramiv");
    glGetProgramInfoLog       = (PFNGLGETPROGRAMINFOLOGPROC) glfwGetProcAddress("glGetProgramInfoLog");
    glDeleteShader            = (PFNGLDELETESHADERPROC) glfwGetProcAddress("glDeleteShader");
    glUseProgram              = (PFNGLUSEPROGRAMPROC) glfwGetProcAddress("glUseProgram");
    glGenVertexArrays         = (PFNGLGENVERTEXARRAYSPROC) glfwGetProcAddress("glGenVertexArrays");
    glBindVertexArray         = (PFNGLBINDVERTEXARRAYPROC) glfwGetProcAddress("glBindVertexArray");
    glDeleteProgram           = (PFNGLDELETEPROGRAMPROC) glfwGetProcAddress("glDeleteProgram");
    glGetUniformLocation      = (PFNGLGETUNIFORMLOCATIONPROC) glfwGetProcAddress("glGetUniformLocation");
    glUniform2f               = (PFNGLUNIFORM2FPROC) glfwGetProcAddress("glUniform2f");
    glGenBuffers              = (PFNGLGENBUFFERSPROC) glfwGetProcAddress("glGenBuffers");
    glBindBuffer              = (PFNGLBINDBUFFERPROC) glfwGetProcAddress("glBindBuffer");
    glBufferData              = (PFNGLBUFFERDATAPROC) glfwGetProcAddress("glBufferData");
    glEnableVertexAttribArray = (PFNGLENABLEVERTEXATTRIBARRAYPROC) glfwGetProcAddress("glEnableVertexAttribArray");
    glVertexAttribPointer     = (PFNGLVERTEXATTRIBPOINTERPROC) glfwGetProcAddress("glVertexAttribPointer");
    glUniform1f               = (PFNGLUNIFORM1FPROC) glfwGetProcAddress("glUniform1f");
    glBufferSubData           = (PFNGLBUFFERSUBDATAPROC) glfwGetProcAddress("glBufferSubData");

    if (glfwExtensionSupported("GL_ARB_debug_output")) {
        fprintf(stderr, "INFO: ARB_debug_output is supported\n");
        glDebugMessageCallback = (PFNGLDEBUGMESSAGECALLBACKPROC) glfwGetProcAddress("glDebugMessageCallback");
    } else {
        fprintf(stderr, "WARN: ARB_debug_output is NOT supported\n");
    }

    if (glfwExtensionSupported("GL_EXT_draw_instanced")) {
        fprintf(stderr, "INFO: EXT_draw_instanced is supported\n");
        glDrawArraysInstanced = (PFNGLDRAWARRAYSINSTANCEDPROC) glfwGetProcAddress("glDrawArraysInstanced");
    } else {
        fprintf(stderr, "WARN: EXT_draw_instanced is NOT supported\n");
    }
}
