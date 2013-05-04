
#import <GLKit/GLKNamedEffect.h>
#import <GLKit/GLKBaseEffect.h>
#import <GLKit/GLKReflectionMapEffect.h>
#import <GLKit/GLKSkyboxEffect.h>


// Named vertex attributes for mapping GLKEffects logic to client vertex attrib enables
typedef enum {
    GLKVertexAttribPosition,
    GLKVertexAttribNormal,
    GLKVertexAttribColor,
    GLKVertexAttribTexCoord0,
    GLKVertexAttribTexCoord1,
} GLKVertexAttrib;