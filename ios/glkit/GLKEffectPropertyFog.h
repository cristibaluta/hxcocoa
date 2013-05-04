//
//  GLKEffectPropertyFog.h
//  GLKit
//
//  Copyright 2011 Apple Inc. All rights reserved.
//

#import <GLKit/GLKEffectProperty.h>

// Fog modes per the OpenGLES 1.1 specification
enum
{
    GLKFogModeExp=0,
    GLKFogModeExp2,
    GLKFogModeLinear
};


// GLKEffectPropertyFog
//
// GLKEffectPropertyFog allows specification of fog parameters and operation per the OpenGLES1.1 specification.
// Fog properties may be enabled or disabled through their enabled property.
//
// The default values of the properties of this class are as follows:
//
//      enabled         GL_TRUE
//      mode            GLKFogModeExp
//      color           { 0.0, 0.0, 0.0, 0.0 }
//      density         1.0
//      start           0.0
//      end             1.0
// 

@interface GLKEffectPropertyFog : GLKEffectProperty 
{
    @private
    
    GLboolean     _enabled;    // Switch fog on or off
    GLint         _mode;       // GLKFogMode as defined above
    GLKVector4    _color;      // Fog color
    GLfloat       _density;    // Fog density
    GLfloat       _start;      // Fog start boundary for GLKFogModeLinear
    GLfloat       _end;        // Fog end boundary for GLKFogModeLinear    
}

// Properties                                              // Default Value
@property (nonatomic, assign)    GLboolean     enabled;    // GL_FALSE
@property (nonatomic, assign)    GLint         mode;       // GLKFogModeExp
@property (nonatomic, assign)    GLKVector4    color;      // { 0.0, 0.0, 0.0, 0.0 }
@property (nonatomic, assign)    GLfloat       density;    // 1.0
@property (nonatomic, assign)    GLfloat       start;      // 0.0
@property (nonatomic, assign)    GLfloat       end;        // 1.0

@end
