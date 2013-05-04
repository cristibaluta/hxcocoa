//
//  GLKEffectPropertyTexture.h
//  GLESEffects
//
//  Copyright 2011 Apple Inc. All rights reserved.
//

#import <GLKit/GLKEffectProperty.h>

// Texture target
typedef enum
{
    GLKTextureTarget2D = GL_TEXTURE_2D,
    GLKTextureTargetCubeMap = GL_TEXTURE_CUBE_MAP,
    GLKTextureTargetCt = 2
} GLKTextureTarget;

// Texture env mode
typedef enum
{
    GLKTextureEnvModeReplace,
    GLKTextureEnvModeModulate,
    GLKTextureEnvModeDecal
} GLKTextureEnvMode;


// GLKEffectPropertyTexture
//
// GLKEffectPropertyTexture simply contains properties to configure GL texture rendering.
//

@interface GLKEffectPropertyTexture : GLKEffectProperty
{
    // Texture Enabled
    GLboolean           _enabled;

    // Texture Name
    GLuint              _name;

    // Texture Target 2D or Cube Map
    GLKTextureTarget    _target;

    // Texture Env Mode Replace, Modulate or Decal
    GLint               _envMode;
}

// Properties                                                  // Default Value
@property (nonatomic, assign) GLboolean            enabled;    // Is this texture enabled
@property (nonatomic, assign) GLuint               name;       // Texture name from glGenTextures()
@property (nonatomic, assign) GLKTextureTarget     target;     // GLKTextureTarget2D
@property (nonatomic, assign) GLint                envMode;    // GLKTextureEnvModeModulate

@end
