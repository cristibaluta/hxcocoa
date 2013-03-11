package ios.opengles.es2;


/*
** License Applicability. Except to the extent portions of this file are
** made subject to an alternative license as permitted in the SGI Free
** Software License B, Version 1.0 (the "License"), the contents of this
** file are subject only to the provisions of the License. You may not use
** this file except in compliance with the License. You may obtain a copy
** of the License at Silicon Graphics, Inc., attn: Legal Services, 1600
** Amphitheatre Parkway, Mountain View, CA 94043-1351, or at:
**
** http://oss.sgi.com/projects/FreeB
**
** Note that, as provided in the License, the Software is distributed on an
** "AS IS" basis, with ALL EXPRESS AND IMPLIED WARRANTIES AND CONDITIONS
** DISCLAIMED, INCLUDING, WITHOUT LIMITATION, ANY IMPLIED WARRANTIES AND
** CONDITIONS OF MERCHANTABILITY, SATISFACTORY QUALITY, FITNESS FOR A
** PARTICULAR PURPOSE, AND NON-INFRINGEMENT.
**
** Original Code. The Original Code is: OpenGL Sample Implementation,
** Version 1.2.1, released January 26, 2000, developed by Silicon Graphics,
** Inc. The Original Code is Copyright (c) 1991-2000 Silicon Graphics, Inc.
** Copyright in any portions created by third parties is as indicated
** elsewhere herein. All Rights Reserved.
**
** Additional Notice Provisions: The application programming interfaces
** established by SGI in conjunction with the Original Code are The
** OpenGL(R) Graphics System: A Specification (Version 1.2.1), released
** April 1, 1999; The OpenGL(R) Graphics System Utility Library (Version
** 1.3), released November 4, 1998; and OpenGL(R) Graphics with the X
** Window System(R) (Version 1.3), released October 19, 1998. This software
** was created using the OpenGL(R) version 1.2.1 Sample Implementation
** published by SGI, but has not been independently verified as being
** compliant with the OpenGL(R) version 1.2.1 Specification.
*/


/*define GL_APIENTRY
define GL_APIextern*/


/*-------------------------------------------------------------------------
 * Data type definitions
 *-----------------------------------------------------------------------*/

typedef GLvoid = Void;
typedef GLchar = String;
typedef GLenum = Enum;
typedef GLboolean = Bool;
typedef GLbitfield = Int;
typedef GLbyte = String;
typedef GLshort = String;
typedef GLint = Int;
typedef GLsizei = Int;
typedef GLubyte = String;//?
typedef GLushort = String;//?
typedef GLuint = Int;
typedef GLfloat = Float;
typedef GLclampf = Float;
typedef GLfixed = Int;
typedef GLclampx = Int;

/* GL types for handling large vertex buffer objects */
typedef GLintptr = Int;//Long
typedef GLsizeiptr = Int;//?


/* OpenGL ES core versions */
extern enum GLCoreVersions {
	GL_ES_VERSION_2_0;
}

/* ClearBufferMask */
extern enum GLClearBufferMask {
	GL_DEPTH_BUFFER_BIT;
	GL_STENCIL_BUFFER_BIT;
	GL_COLOR_BUFFER_BIT;
}

/* Boolean */
extern enum GLBoolean {
	GL_FALSE;
	GL_TRUE;
}

/* BeginMode */
extern enum GLBeginMode {
	GL_POINTS;
	GL_LINES;
	GL_LINE_LOOP;
	GL_LINE_STRIP;
	GL_TRIANGLES;
	GL_TRIANGLE_STRIP;
	GL_TRIANGLE_FAN;
}

/* AlphaFunction (not supported in ES20) */
/*      GL_NEVER */
/*      GL_LESS */
/*      GL_EQUAL */
/*      GL_LEQUAL */
/*      GL_GREATER */
/*      GL_NOTEQUAL */
/*      GL_GEQUAL */
/*      GL_ALWAYS */

/* BlendingFactorDest */
extern enum GLBlendingFactorDest {
	GL_ZERO;
	GL_ONE;
	GL_SRC_COLOR;
	GL_ONE_MINUS_SRC_COLOR;
	GL_SRC_ALPHA;
	GL_ONE_MINUS_SRC_ALPHA;
	GL_DST_ALPHA;
	GL_ONE_MINUS_DST_ALPHA;
}

/* BlendingFactorSrc */
extern enum GLBlendingFactorSrc {
/*      GL_ZERO */
/*      GL_ONE */
	GL_DST_COLOR;
	GL_ONE_MINUS_DST_COLOR;
	GL_SRC_ALPHA_SATURATE;
}
/*      GL_SRC_ALPHA */
/*      GL_ONE_MINUS_SRC_ALPHA */
/*      GL_DST_ALPHA */
/*      GL_ONE_MINUS_DST_ALPHA */

/* BlendEquationSeparate */
extern enum GLBlendEquationSeparate {
	GL_FUNC_ADD;
	GL_BLEND_EQUATION;
	GL_BLEND_EQUATION_RGB;    /* same as BLEND_EQUATION */
	GL_BLEND_EQUATION_ALPHA;
}

/* BlendSubtract */
extern enum GLBlendSubtract {
	GL_FUNC_SUBTRACT;
	GL_FUNC_REVERSE_SUBTRACT;
}

/* Separate Blend Functions */
extern enum GLSeparateBlendFunctions {
	GL_BLEND_DST_RGB;
	GL_BLEND_SRC_RGB;
	GL_BLEND_DST_ALPHA;
	GL_BLEND_SRC_ALPHA;
	GL_CONSTANT_COLOR;
	GL_ONE_MINUS_CONSTANT_COLOR;
	GL_CONSTANT_ALPHA;
	GL_ONE_MINUS_CONSTANT_ALPHA;
	GL_BLEND_COLOR;
}

/* Buffer Objects */
extern enum GLBufferObjects {
	GL_ARRAY_BUFFER;
	GL_ELEMENT_ARRAY_BUFFER;
	GL_ARRAY_BUFFER_BINDING;
	GL_ELEMENT_ARRAY_BUFFER_BINDING;

	GL_STREAM_DRAW;
	GL_STATIC_DRAW;
	GL_DYNAMIC_DRAW;

	GL_BUFFER_SIZE;
	GL_BUFFER_USAGE;

	GL_CURRENT_VERTEX_ATTRIB;
}

/* CullFaceMode */
extern enum GLCullFaceMode {
	GL_FRONT;
	GL_BACK;
	GL_FRONT_AND_BACK;
}

/* DepthFunction */
/*      GL_NEVER */
/*      GL_LESS */
/*      GL_EQUAL */
/*      GL_LEQUAL */
/*      GL_GREATER */
/*      GL_NOTEQUAL */
/*      GL_GEQUAL */
/*      GL_ALWAYS */

/* EnableCap */
extern enum GLEnableCap {
	GL_TEXTURE_2D;
	GL_CULL_FACE;
	GL_BLEND;
	GL_DITHER;
	GL_STENCIL_TEST;
	GL_DEPTH_TEST;
	GL_SCISSOR_TEST;
	GL_POLYGON_OFFSET_FILL;
	GL_SAMPLE_ALPHA_TO_COVERAGE;
	GL_SAMPLE_COVERAGE;
}

/* ErrorCode */
extern enum GLErrorCode {
	GL_NO_ERROR;
	GL_INVALID_ENUM;
	GL_INVALID_VALUE;
	GL_INVALID_OPERATION;
	GL_OUT_OF_MEMORY;
}

/* FrontFaceDirection */
extern enum GLFrontFaceDirection {
	GL_CW;
	GL_CCW;
}

/* GetPName */
extern enum GLGetPName {
	GL_LINE_WIDTH;
	GL_ALIASED_POINT_SIZE_RANGE;
	GL_ALIASED_LINE_WIDTH_RANGE;
	GL_CULL_FACE_MODE;
	GL_FRONT_FACE;
	GL_DEPTH_RANGE;
	GL_DEPTH_WRITEMASK;
	GL_DEPTH_CLEAR_VALUE;
	GL_DEPTH_FUNC;
	GL_STENCIL_CLEAR_VALUE;
	GL_STENCIL_FUNC;
	GL_STENCIL_FAIL;
	GL_STENCIL_PASS_DEPTH_FAIL;
	GL_STENCIL_PASS_DEPTH_PASS;
	GL_STENCIL_REF;
	GL_STENCIL_VALUE_MASK;
	GL_STENCIL_WRITEMASK;
	GL_STENCIL_BACK_FUNC;
	GL_STENCIL_BACK_FAIL;
	GL_STENCIL_BACK_PASS_DEPTH_FAIL;
	GL_STENCIL_BACK_PASS_DEPTH_PASS;
	GL_STENCIL_BACK_REF;
	GL_STENCIL_BACK_VALUE_MASK;
	GL_STENCIL_BACK_WRITEMASK;
	GL_VIEWPORT;
	GL_SCISSOR_BOX;
/*      GL_SCISSOR_TEST */
	GL_COLOR_CLEAR_VALUE;
	GL_COLOR_WRITEMASK;
	GL_UNPACK_ALIGNMENT;
	GL_PACK_ALIGNMENT;
	GL_MAX_TEXTURE_SIZE;
	GL_MAX_VIEWPORT_DIMS;
	GL_SUBPIXEL_BITS;
	GL_RED_BITS;
	GL_GREEN_BITS;
	GL_BLUE_BITS;
	GL_ALPHA_BITS;
	GL_DEPTH_BITS;
	GL_STENCIL_BITS;
	GL_POLYGON_OFFSET_UNITS;
/*      GL_POLYGON_OFFSET_FILL */
	GL_POLYGON_OFFSET_FACTOR;
	GL_TEXTURE_BINDING_2D;
	GL_SAMPLE_BUFFERS;
	GL_SAMPLES;
	GL_SAMPLE_COVERAGE_VALUE;
	GL_SAMPLE_COVERAGE_INVERT;
}

/* GetTextureParameter */
extern enum GLGetTextureParameter {
/*      GL_TEXTURE_MAG_FILTER */
/*      GL_TEXTURE_MIN_FILTER */
/*      GL_TEXTURE_WRAP_S */
/*      GL_TEXTURE_WRAP_T */

	GL_NUM_COMPRESSED_TEXTURE_FORMATS;
	GL_COMPRESSED_TEXTURE_FORMATS;
}

/* HintMode */
extern enum GLHintMode {
	GL_DONT_CARE;
	GL_FASTEST;
	GL_NICEST;
}

/* HintTarget */
	extern enum GLHintTarget {
	GL_GENERATE_MIPMAP_HINT;
}

/* DataType */
extern enum GLDataType {
	GL_BYTE;
	GL_UNSIGNED_BYTE;
	GL_SHORT;
	GL_UNSIGNED_SHORT;
	GL_INT;
	GL_UNSIGNED_INT;
	GL_FLOAT;
	GL_FIXED;
}

/* PixelFormat */
extern enum GLPixelFormat {
	GL_DEPTH_COMPONENT;
	GL_ALPHA;
	GL_RGB;
	GL_RGBA;
	GL_LUMINANCE;
	GL_LUMINANCE_ALPHA;
}

/* PixelType */
extern enum GLPixelType {
/*      GL_UNSIGNED_BYTE */
	GL_UNSIGNED_SHORT_4_4_4_4;
	GL_UNSIGNED_SHORT_5_5_5_1;
	GL_UNSIGNED_SHORT_5_6_5;
}

/* Shaders */
extern enum GLShaders {
	GL_FRAGMENT_SHADER;
	GL_VERTEX_SHADER;
	GL_MAX_VERTEX_ATTRIBS;
	GL_MAX_VERTEX_UNIFORM_VECTORS;
	GL_MAX_VARYING_VECTORS;
	GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS;
	GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS;
	GL_MAX_TEXTURE_IMAGE_UNITS;
	GL_MAX_FRAGMENT_UNIFORM_VECTORS;
	GL_SHADER_TYPE;
	GL_DELETE_STATUS;
	GL_LINK_STATUS;
	GL_VALIDATE_STATUS;
	GL_ATTACHED_SHADERS;
	GL_ACTIVE_UNIFORMS;
	GL_ACTIVE_UNIFORM_MAX_LENGTH;
	GL_ACTIVE_ATTRIBUTES;
	GL_ACTIVE_ATTRIBUTE_MAX_LENGTH;
	GL_SHADING_LANGUAGE_VERSION;
	GL_CURRENT_PROGRAM;
}

/* StencilFunction */
extern enum GLStencilFunction {
	GL_NEVER;
	GL_LESS;
	GL_EQUAL;
	GL_LEQUAL;
	GL_GREATER;
	GL_NOTEQUAL;
	GL_GEQUAL;
	GL_ALWAYS;
}

/* StencilOp */
extern enum GLStencilOp {
/*      GL_ZERO */
	GL_KEEP;
	GL_REPLACE;
	GL_INCR;
	GL_DECR;
	GL_INVERT;
	GL_INCR_WRAP;
	GL_DECR_WRAP;
}

/* StringName */
extern enum GLStringName {
	GL_VENDOR;
	GL_RENDERER;
	GL_VERSION;
	GL_EXTENSIONS;
}

/* TextureMagFilter */
extern enum GLTextureMagFilter {
	GL_NEAREST;
	GL_LINEAR;
}

/* TextureMinFilter */
extern enum GLTextureMinFilter {
/*      GL_NEAREST */
/*      GL_LINEAR */
	GL_NEAREST_MIPMAP_NEAREST;
	GL_LINEAR_MIPMAP_NEAREST;
	GL_NEAREST_MIPMAP_LINEAR;
	GL_LINEAR_MIPMAP_LINEAR;
}

/* TextureParameterName */
extern enum GLTextureParameterName {
	GL_TEXTURE_MAG_FILTER;
	GL_TEXTURE_MIN_FILTER;
	GL_TEXTURE_WRAP_S;
	GL_TEXTURE_WRAP_T;
}

/* TextureTarget */
extern enum GLTextureTarget {
/*      GL_TEXTURE_2D */
	GL_TEXTURE;

	GL_TEXTURE_CUBE_MAP;
	GL_TEXTURE_BINDING_CUBE_MAP;
	GL_TEXTURE_CUBE_MAP_POSITIVE_X;
	GL_TEXTURE_CUBE_MAP_NEGATIVE_X;
	GL_TEXTURE_CUBE_MAP_POSITIVE_Y;
	GL_TEXTURE_CUBE_MAP_NEGATIVE_Y;
	GL_TEXTURE_CUBE_MAP_POSITIVE_Z;
	GL_TEXTURE_CUBE_MAP_NEGATIVE_Z;
	GL_MAX_CUBE_MAP_TEXTURE_SIZE;
}

/* TextureUnit */
extern enum GLTextureUnit {
	GL_TEXTURE0;
	GL_TEXTURE1;
	GL_TEXTURE2;
	GL_TEXTURE3;
	GL_TEXTURE4;
	GL_TEXTURE5;
	GL_TEXTURE6;
	GL_TEXTURE7;
	GL_TEXTURE8;
	GL_TEXTURE9;
	GL_TEXTURE10;
	GL_TEXTURE11;
	GL_TEXTURE12;
	GL_TEXTURE13;
	GL_TEXTURE14;
	GL_TEXTURE15;
	GL_TEXTURE16;
	GL_TEXTURE17;
	GL_TEXTURE18;
	GL_TEXTURE19;
	GL_TEXTURE20;
	GL_TEXTURE21;
	GL_TEXTURE22;
	GL_TEXTURE23;
	GL_TEXTURE24;
	GL_TEXTURE25;
	GL_TEXTURE26;
	GL_TEXTURE27;
	GL_TEXTURE28;
	GL_TEXTURE29;
	GL_TEXTURE30;
	GL_TEXTURE31;
	GL_ACTIVE_TEXTURE;
}

/* TextureWrapMode */
extern enum GLTextureWrapMode {
	GL_REPEAT;
	GL_CLAMP_TO_EDGE;
	GL_MIRRORED_REPEAT;
}

/* Uniform Types */
extern enum GLUniformTypes {
	GL_FLOAT_VEC2;
	GL_FLOAT_VEC3;
	GL_FLOAT_VEC4;
	GL_INT_VEC2;
	GL_INT_VEC3;
	GL_INT_VEC4;
	GL_BOOL;
	GL_BOOL_VEC2;
	GL_BOOL_VEC3;
	GL_BOOL_VEC4;
	GL_FLOAT_MAT2;
	GL_FLOAT_MAT3;
	GL_FLOAT_MAT4;
	GL_SAMPLER_2D;
	GL_SAMPLER_CUBE;
}

/* Vertex Arrays */
extern enum GLVertexArrays {
	GL_VERTEX_ATTRIB_ARRAY_ENABLED;
	GL_VERTEX_ATTRIB_ARRAY_SIZE;
	GL_VERTEX_ATTRIB_ARRAY_STRIDE;
	GL_VERTEX_ATTRIB_ARRAY_TYPE;
	GL_VERTEX_ATTRIB_ARRAY_NORMALIZED;
	GL_VERTEX_ATTRIB_ARRAY_POINTER;
	GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING;
}

/* Read Format */
extern enum GLReadFormat {
	GL_IMPLEMENTATION_COLOR_READ_TYPE;
	GL_IMPLEMENTATION_COLOR_READ_FORMAT;
}

/* Shader Source */
extern enum GLShaderSource {
	GL_COMPILE_STATUS;
	GL_INFO_LOG_LENGTH;
	GL_SHADER_SOURCE_LENGTH;
	GL_SHADER_COMPILER;
}

/* Shader Binary */
extern enum GLShaderBinary {
	GL_SHADER_BINARY_FORMATS;
	GL_NUM_SHADER_BINARY_FORMATS;
}

/* Shader Precision-Specified Types */
extern enum GLShaderPrecisionSpecifiedTypes {
	GL_LOW_FLOAT;
	GL_MEDIUM_FLOAT;
	GL_HIGH_FLOAT;
	GL_LOW_INT;
	GL_MEDIUM_INT;
	GL_HIGH_INT;
}

/* Framebuffer Object. */
extern enum GLFramebufferObject {
	GL_FRAMEBUFFER;
	GL_RENDERBUFFER;

	GL_RGBA4;
	GL_RGB5_A1;
	GL_RGB565;
	GL_DEPTH_COMPONENT16;
	GL_STENCIL_INDEX;
	GL_STENCIL_INDEX8;

	GL_RENDERBUFFER_WIDTH;
	GL_RENDERBUFFER_HEIGHT;
	GL_RENDERBUFFER_INTERNAL_FORMAT;
	GL_RENDERBUFFER_RED_SIZE;
	GL_RENDERBUFFER_GREEN_SIZE;
	GL_RENDERBUFFER_BLUE_SIZE;
	GL_RENDERBUFFER_ALPHA_SIZE;
	GL_RENDERBUFFER_DEPTH_SIZE;
	GL_RENDERBUFFER_STENCIL_SIZE;

	GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE;
	GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME;
	GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL;
	GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE;

	GL_COLOR_ATTACHMENT0;
	GL_DEPTH_ATTACHMENT;
	GL_STENCIL_ATTACHMENT;

	GL_NONE;

	GL_FRAMEBUFFER_COMPLETE;
	GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT;
	GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT;
	GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS;
	GL_FRAMEBUFFER_UNSUPPORTED;

	GL_FRAMEBUFFER_BINDING;
	GL_RENDERBUFFER_BINDING;
	GL_MAX_RENDERBUFFER_SIZE;

	GL_INVALID_FRAMEBUFFER_OPERATION;
}

/*-------------------------------------------------------------------------
 * GL core functions.
 *-----------------------------------------------------------------------*/

extern Class gl {
	
	@:c public static function glActiveTexture (texture:GLTextureUnit) :Void;
	@:c public static function glAttachShader (program:GLuint, shader:GLuint) :Void;
	@:c public static function glBindAttribLocation (program:GLuint, index:GLuint, const GLchar* name) :Void;
	@:c public static function glBindBuffer (target:GLBufferObjects, GLuint buffer);
	@:c public static function glBindFramebuffer (target:GLenum, GLuint framebuffer) :Void;
	@:c public static function glBindRenderbuffer (target:GLenum, GLuint renderbuffer) :Void;
	@:c public static function glBindTexture (target:GLenum, GLuint texture);
	@:c public static function glBlendColor (GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha) :Void;
	@:c public static function glBlendEquation ( GLenum mode ) :Void;
	@:c public static function glBlendEquationSeparate (GLenum modeRGB, GLenum modeAlpha) :Void;
	@:c public static function glBlendFunc (GLenum sfactor, GLenum dfactor);
	@:c public static function glBlendFuncSeparate (GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha) :Void;
	@:c public static function glBufferData (target:GLenum, GLsizeiptr size, const GLvoid* data, GLenum usage);
	@:c public static function glBufferSubData (target:GLenum, GLintptr offset, GLsizeiptr size, const GLvoid* data);
GL_API GLenum       GL_APIENTRY glCheckFramebufferStatus (target:GLenum) :Void;
	@:c public static function glClear (GLbitfield mask);
	@:c public static function glClearColor (GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
	@:c public static function glClearDepthf (depth:GLclampf);
	@:c public static function glClearStencil (GLint s);
	@:c public static function glColorMask (GLboolean red, GLboolean green, blue:GLboolean, GLboolean alpha);
	@:c public static function glCompileShader (shader:GLuint) :Void;
	@:c public static function glCompressedTexImage2D (target:GLenum, level:GLint, GLenum internalformat, width:GLsizei, height:GLsizei, GLint border, GLsizei imageSize, const GLvoid* data);
	@:c public static function glCompressedTexSubImage2D (target:GLenum, level:GLint, x:GLintoffset, y:GLintoffset, width:GLsizei, height:GLsizei, GLenum format, GLsizei imageSize, const GLvoid* data);
	@:c public static function glCopyTexImage2D (target:GLenum, level:GLint, GLenum internalformat, x:GLint, y:GLint, width:GLsizei, height:GLsizei, GLint border);
	@:c public static function glCopyTexSubImage2D (target:GLenum, level:GLint, x:GLintoffset, y:GLintoffset, x:GLint, y:GLint, width:GLsizei, height:GLsizei);
GL_API GLuint       GL_APIENTRY glCreateProgram (void) :Void;
GL_API GLuint       GL_APIENTRY glCreateShader (GLenum type) :Void;
	@:c public static function glCullFace (GLenum mode);
	@:c public static function glDeleteBuffers (n:GLsizei, const GLuint* buffers);
	@:c public static function glDeleteFramebuffers (n:GLsizei, const GLuint* framebuffers) :Void;
	@:c public static function glDeleteProgram (program:GLuint) :Void;
	@:c public static function glDeleteRenderbuffers (n:GLsizei, const GLuint* renderbuffers) :Void;
	@:c public static function glDeleteShader (shader:GLuint) :Void;
	@:c public static function glDeleteTextures (n:GLsizei, const GLuint* textures);
	@:c public static function glDepthFunc (GLenum func);
	@:c public static function glDepthMask (GLboolean flag);
	@:c public static function glDepthRangef (GLclampf zNear, GLclampf zFar);
	@:c public static function glDetachShader (program:GLuint, shader:GLuint) :Void;
	@:c public static function glDisable (GLenum cap);
	@:c public static function glDisableVertexAttribArray (index:GLuint) :Void;
	@:c public static function glDrawArrays (mode:GLenum, first:GLint, count:GLsizei);
	@:c public static function glDrawElements (GLenum mode, GLsizei count, GLenum type, const GLvoid* indices);
	@:c public static function glEnable (GLenum cap);
	@:c public static function glEnableVertexAttribArray (index:GLuint) :Void;
	@:c public static function glFinish (void);
	@:c public static function glFlush (void);
	@:c public static function glFramebufferRenderbuffer (target:GLenum, attachment:GLenum, GLenum renderbuffertarget, GLuint renderbuffer) :Void;
	@:c public static function glFramebufferTexture2D (target:GLenum, attachment:GLenum, GLenum textarget, GLuint texture, level:GLint) :Void;
	@:c public static function glFrontFace (GLenum mode);
	@:c public static function glGenBuffers (n:GLsizei, GLuint* buffers);
	@:c public static function glGenerateMipmap (target:GLenum) :Void;
	@:c public static function glGenFramebuffers (n:GLsizei, GLuint* framebuffers) :Void;
	@:c public static function glGenRenderbuffers (n:GLsizei, GLuint* renderbuffers) :Void;
	@:c public static function glGenTextures (n:GLsizei, GLuint* textures);
	@:c public static function glGetActiveAttrib (program:GLuint, index:GLuint, bufsize:GLsizei, GLsizei* length, GLint* size, GLenum* type, GLchar* name) :Void;
	@:c public static function glGetActiveUniform (program:GLuint, index:GLuint, bufsize:GLsizei, GLsizei* length, GLint* size, GLenum* type, GLchar* name) :Void;
	@:c public static function glGetAttachedShaders (program:GLuint, GLsizei maxcount, GLsizei* count, GLuint* shaders) :Void;
GL_API int          GL_APIENTRY glGetAttribLocation (program:GLuint, const GLchar* name) :Void;
	@:c public static function glGetBooleanv (pname:GLenum, GLboolean* params);
	@:c public static function glGetBufferParameteriv (target:GLenum, pname:GLenum, GLint* params);
GL_API GLenum       GL_APIENTRY glGetError (void);
	@:c public static function glGetFloatv (pname:GLenum, GLfloat* params);
	@:c public static function glGetFramebufferAttachmentParameteriv (target:GLenum, attachment:GLenum, pname:GLenum, GLint* params) :Void;
	@:c public static function glGetIntegerv (pname:GLenum, GLint* params);
	@:c public static function glGetProgramiv (program:GLuint, pname:GLenum, GLint* params) :Void;
	@:c public static function glGetProgramInfoLog (program:GLuint, bufsize:GLsizei, GLsizei* length, GLchar* infolog) :Void;
	@:c public static function glGetRenderbufferParameteriv (target:GLenum, pname:GLenum, GLint* params) :Void;
	@:c public static function glGetShaderiv (shader:GLuint, pname:GLenum, GLint* params) :Void;
	@:c public static function glGetShaderInfoLog (shader:GLuint, bufsize:GLsizei, GLsizei* length, GLchar* infolog) :Void;
	@:c public static function glGetShaderPrecisionFormat (GLenum shadertype, GLenum precisiontype, GLint* range, GLint* precision) :Void;
	@:c public static function glGetShaderSource (shader:GLuint, bufsize:GLsizei, GLsizei* length, GLchar* source) :Void;
GL_API const GLubyte* GL_APIENTRY glGetString (GLenum name);
	@:c public static function glGetTexParameterfv (target:GLenum, pname:GLenum, GLfloat* params);
	@:c public static function glGetTexParameteriv (target:GLenum, pname:GLenum, GLint* params);
	@:c public static function glGetUniformfv (program:GLuint, location:GLInt, GLfloat* params) :Void;
	@:c public static function glGetUniformiv (program:GLuint, location:GLInt, GLint* params) :Void;
GL_API int          GL_APIENTRY glGetUniformLocation (program:GLuint, const GLchar* name) :Void;
	@:c public static function glGetVertexAttribfv (index:GLuint, pname:GLenum, GLfloat* params) :Void;
	@:c public static function glGetVertexAttribiv (index:GLuint, pname:GLenum, GLint* params) :Void;
	@:c public static function glGetVertexAttribPointerv (index:GLuint, pname:GLenum, GLvoid** pointer) :Void;
	@:c public static function glHint (target:GLenum, mode:GLenum);
GL_API GLboolean    GL_APIENTRY glIsBuffer (buffer:GLuint);
GL_API GLboolean    GL_APIENTRY glIsEnabled (cap:GLenum);
GL_API GLboolean    GL_APIENTRY glIsFramebuffer (framebuffer:GLuint) :Void;
GL_API GLboolean    GL_APIENTRY glIsProgram (program:GLuint);
GL_API GLboolean    GL_APIENTRY glIsRenderbuffer (renderbuffer:GLuint) :Void;
GL_API GLboolean    GL_APIENTRY glIsShader (shader:GLuint) :Void;
GL_API GLboolean    GL_APIENTRY glIsTexture (texture:GLuint);
	@:c public static function glLineWidth (GLfloat width);
	@:c public static function glLinkProgram (program:GLuint) :Void;
	@:c public static function glPixelStorei (pname:GLenum, param:GLint);
	@:c public static function glPolygonOffset (factor:GLfloat, GLfloat units);
	@:c public static function glReadPixels (x:GLint, y:GLint, width:GLsizei, height:GLsizei, GLenum format, GLenum type, GLvoid* pixels);
	@:c public static function glReleaseShaderCompiler (void) :Void;
	@:c public static function glRenderbufferStorage (target:GLenum, GLenum internalformat, width:GLsizei, height:GLsizei) :Void;
	@:c public static function glSampleCoverage (GLclampf value, GLboolean invert);
	@:c public static function glScissor (x:GLint, y:GLint, width:GLsizei, height:GLsizei);
	@:c public static function glShaderBinary (n:GLsizei, const GLuint* shaders, GLenum binaryformat, const GLvoid* binary, GLsizei length) :Void;
	@:c public static function glShaderSource (shader:GLuint, GLsizei count, const GLchar** string, const GLint* length) :Void;
	@:c public static function glStencilFunc (GLenum func, GLint ref, GLuint mask);
	@:c public static function glStencilFuncSeparate (GLenum face, GLenum func, GLint ref, GLuint mask) :Void;
	@:c public static function glStencilMask (GLuint mask);
	@:c public static function glStencilMaskSeparate (GLenum face, GLuint mask) :Void;
	@:c public static function glStencilOp (fail:GLenum, GLenum zfail, GLenum zpass);
	@:c public static function glStencilOpSeparate (GLenum face, fail:GLenum, GLenum zfail, GLenum zpass) :Void;
	@:c public static function glTexImage2D (target:GLenum, level:GLint, GLint internalformat, width:GLsizei, height:GLsizei, GLint border, GLenum format, GLenum type, const GLvoid* pixels);
	@:c public static function glTexParameterf (target:GLenum, pname:GLenum, GLfloat param);
	@:c public static function glTexParameterfv (target:GLenum, pname:GLenum, const GLfloat* params);
	@:c public static function glTexParameteri (target:GLenum, pname:GLenum, param:GLint);
	@:c public static function glTexParameteriv (target:GLenum, pname:GLenum, const GLint* params);
	@:c public static function glTexSubImage2D (target:GLenum, level:GLint, x:GLintoffset, y:GLintoffset, width:GLsizei, height:GLsizei, GLenum format, GLenum type, const GLvoid* pixels);
	@:c public static function glUniform1f (location:GLInt, x:GLfloat) :Void;
	@:c public static function glUniform1fv (location:GLInt, GLsizei count, const GLfloat* v) :Void;
	@:c public static function glUniform1i (location:GLInt, x:GLint) :Void;
	@:c public static function glUniform1iv (location:GLInt, GLsizei count, const GLint* v) :Void;
	@:c public static function glUniform2f (location:GLInt, x:GLfloat, y:GLfloat) :Void;
	@:c public static function glUniform2fv (location:GLInt, GLsizei count, const GLfloat* v) :Void;
	@:c public static function glUniform2i (location:GLInt, x:GLint, y:GLint) :Void;
	@:c public static function glUniform2iv (location:GLInt, GLsizei count, const GLint* v) :Void;
	@:c public static function glUniform3f (location:GLInt, x:GLfloat, y:GLfloat, z:GLfloat) :Void;
	@:c public static function glUniform3fv (location:GLInt, GLsizei count, const GLfloat* v) :Void;
	@:c public static function glUniform3i (location:GLInt, x:GLint, y:GLint, GLint z) :Void;
	@:c public static function glUniform3iv (location:GLInt, GLsizei count, const GLint* v) :Void;
	@:c public static function glUniform4f (location:GLInt, x:GLfloat, y:GLfloat, z:GLfloat, GLfloat w) :Void;
	@:c public static function glUniform4fv (location:GLInt, GLsizei count, const GLfloat* v) :Void;
	@:c public static function glUniform4i (location:GLInt, x:GLint, y:GLint, GLint z, GLint w) :Void;
	@:c public static function glUniform4iv (location:GLInt, GLsizei count, const GLint* v) :Void;
	@:c public static function glUniformMatrix2fv (location:GLInt, GLsizei count, GLboolean transpose, const GLfloat* value) :Void;
	@:c public static function glUniformMatrix3fv (location:GLInt, GLsizei count, GLboolean transpose, const GLfloat* value) :Void;
	@:c public static function glUniformMatrix4fv (location:GLInt, GLsizei count, GLboolean transpose, const GLfloat* value) :Void;
	@:c public static function glUseProgram (program:GLuint) :Void;
	@:c public static function glValidateProgram (program:GLuint) :Void;
	@:c public static function glVertexAttrib1f (indx:GLuint, x:GLfloat) :Void;
	@:c public static function glVertexAttrib1fv (indx:GLuint, const GLfloat* values) :Void;
	@:c public static function glVertexAttrib2f (indx:GLuint, x:GLfloat, y:GLfloat) :Void;
	@:c public static function glVertexAttrib2fv (indx:GLuint, const GLfloat* values) :Void;
	@:c public static function glVertexAttrib3f (indx:GLuint, x:GLfloat, y:GLfloat, z:GLfloat) :Void;
	@:c public static function glVertexAttrib3fv (indx:GLuint, const GLfloat* values) :Void;
	@:c public static function glVertexAttrib4f (indx:GLuint, x:GLfloat, y:GLfloat, z:GLfloat, GLfloat w) :Void;
	@:c public static function glVertexAttrib4fv (indx:GLuint, const GLfloat* values) :Void;
	@:c public static function glVertexAttribPointer (indx:GLuint, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const GLvoid* ptr) :Void;
	@:c public static function glViewport (x:GLint, y:GLint, width:GLsizei, height:GLsizei);

}
