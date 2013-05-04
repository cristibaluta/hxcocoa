//
//  GLKTextureLoader.h
//  GLKit
//
//  Copyright (c) 2011, Apple Inc. All rights reserved.
//

/*
 Convenience library for loading textures into OpenGL

 - Synchronous and asynchronous loading of textures
 - Supports most ImageIO formats and PVR files.

 Default Texture Parameters
 
 - The following values will be set as the default for the OpenGL filter and wrap texture parameters:
 
    GL_TEXTURE_MIN_FILTER: GL_LINEAR_MIPMAP_LINEAR if textures are mipmapped, GL_LINEAR otherwise
    
    GL_TEXTURE_MAG_FILTER: GL_LINEAR
    
    GL_TEXTURE_WRAP_S / GL_TEXTURE_WRAP_T: GL_CLAMP_TO_EDGE
 
    Any texture parameter not specified above will be set to OpenGL's default value.
*/

#import <CoreGraphics/CoreGraphics.h>

#import <Foundation/Foundation.h>

#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>

#pragma mark -
#pragma mark Definitions
#pragma mark -

/*
 Dictionary keys for texture loader properties
 */
extern NSString *const GLKTextureLoaderApplyPremultiplication;			/* A boolean NSNumber. */
                                                                        /* Non-alpha channels are premultiplied by corresponding alpha channel values. */
                                                                        /* For compressed formats, this option must be omitted, or false. */
                                                                        /* False by default. */

extern NSString *const GLKTextureLoaderGenerateMipmaps;					/* A boolean NSNumber */
                                                                        /* Generates all levels of mipmaps for the current image being loaded as a texture. */
                                                                        /* Generates mipmap levels for all faces when used with cube maps. */
                                                                        /* Sets GL_TEXTURE_MIN_FILTER parameter to GL_LINEAR_MIPMAP_LINEAR when true. */
                                                                        /* False by default. */

extern NSString *const GLKTextureLoaderOriginBottomLeft;				/* A boolean NSNumber. */
                                                                        /* Transform image data to match OpenGL's bottom left orientation specification. */
                                                                        /* False by default. */

extern NSString *const GLKTextureLoaderGrayscaleAsAlpha;                /* A boolean NSNumber. */
                                                                        /* If true, a single channel grayscale image is loaded as GL_ALPHA. */
                                                                        /* If false, it will be loaded as GL_LUMINANCE. */
                                                                        /* Has no effect on non-grayscale images */
                                                                        /* False by default. */

/*
 Error domain for GLKTextureLoader
 */
extern NSString *const GLKTextureLoaderErrorDomain;

/*
 Error keys for obtaining more error information
 */
extern NSString *const GLKTextureLoaderErrorKey;
extern NSString *const GLKTextureLoaderGLErrorKey;

/*
 Error codes
 */
enum {
    GLKTextureLoaderErrorFileOrURLNotFound = 0,
    GLKTextureLoaderErrorInvalidNSData = 1,
    GLKTextureLoaderErrorInvalidCGImage = 2,
    GLKTextureLoaderErrorUnknownPathType = 3,
    GLKTextureLoaderErrorUnknownFileType = 4,
    GLKTextureLoaderErrorPVRAtlasUnsupported = 5,
    GLKTextureLoaderErrorCubeMapInvalidNumFiles = 6,
    GLKTextureLoaderErrorCompressedTextureUpload = 7,
    GLKTextureLoaderErrorUncompressedTextureUpload = 8,
    GLKTextureLoaderErrorUnsupportedCubeMapDimensions = 9,
    GLKTextureLoaderErrorUnsupportedBitDepth = 10,
    GLKTextureLoaderErrorUnsupportedPVRFormat = 11,
    GLKTextureLoaderErrorDataPreprocessingFailure = 12,
    GLKTextureLoaderErrorMipmapUnsupported = 13,
    GLKTextureLoaderErrorUnsupportedOrientation = 14,
    GLKTextureLoaderErrorReorientationFailure = 15,
    GLKTextureLoaderErrorAlphaPremultiplicationFailure = 16,
    GLKTextureLoaderErrorInvalidEAGLContext = 17
};
typedef NSUInteger GLKTextureLoaderError;

#pragma mark -
#pragma mark GLKTextureInfo
#pragma mark -

/*
 Alpha state of loaded texture
 */
enum {
    GLKTextureInfoAlphaStateNone = 0,
    GLKTextureInfoAlphaStateNonPremultiplied,
    GLKTextureInfoAlphaStatePremultiplied
};
typedef NSUInteger GLKTextureInfoAlphaState;

/*
 Image origin of loaded texture
 */
enum {
    GLKTextureInfoOriginUnknown = 0,
    GLKTextureInfoOriginTopLeft,
    GLKTextureInfoOriginBottomLeft
};
typedef NSUInteger GLKTextureInfoOrigin;

/*
 Immutable Texture Object Data
 */
NS_CLASS_AVAILABLE(NA, 5_0)
@interface GLKTextureInfo : NSObject <NSCopying>
{
@private
    GLuint                      name;
    GLenum                      target;
    GLuint                      width;
    GLuint                      height;
    GLKTextureInfoAlphaState    alphaState;
    GLKTextureInfoOrigin        textureOrigin;
    BOOL                        containsMipmaps;
}

@property (readonly) GLuint                     name;
@property (readonly) GLenum                     target;
@property (readonly) GLuint                     width;
@property (readonly) GLuint                     height;
@property (readonly) GLKTextureInfoAlphaState   alphaState;
@property (readonly) GLKTextureInfoOrigin       textureOrigin;
@property (readonly) BOOL                       containsMipmaps;

@end

#pragma mark -
#pragma mark GLKTextureLoader
#pragma mark -

typedef void (^GLKTextureLoaderCallback) (GLKTextureInfo *textureInfo, NSError *outError);

NS_CLASS_AVAILABLE(NA, 5_0)
@interface GLKTextureLoader : NSObject  
{

}

#pragma mark Synchronous Methods

/*
 Synchronously load an image from disk into an OpenGL texture.
 Returns the generated texture object when the operation is complete, or the operation terminates with an error (returning nil).
 Returned error can be queried via 'error', which is nil otherwise.
 */
+ (GLKTextureInfo *)textureWithContentsOfFile:(NSString *)path                      /* File path of image. */
                                      options:(NSDictionary *)options               /* Options that control how the image is loaded. */
                                        error:(NSError **)outError;                 /* Error description. */

+ (GLKTextureInfo *)textureWithContentsOfURL:(NSURL *)url                           /* The URL from which to read. */
                                     options:(NSDictionary *)options                /* Options that control how the image is loaded. */
                                       error:(NSError **)outError;                  /* Error description. */

/*
 Synchronously create a texture from data residing in memory.
 Returns the generated texture object when the operation is complete, or the operation terminates with an error (returning nil).
 Returned error can be queried via 'error', which is nil otherwise.
 */
+ (GLKTextureInfo *)textureWithContentsOfData:(NSData *)data                        /* NSData containing image contents. */
                                      options:(NSDictionary *)options               /* Options that control how the image is loaded. */
                                        error:(NSError **)outError;                 /* Error description. */

/*
 Synchronously create a texture from a CGImageRef.
 Returns the generated texture object when the operation is complete, or the operation terminates with an error (returning nil).
 Returned error can be queried via 'error', which is nil otherwise.
 */
+ (GLKTextureInfo *)textureWithCGImage:(CGImageRef)cgImage                          /* CGImage reference. */
                               options:(NSDictionary *)options                      /* Options that control how the image is loaded. */
                                 error:(NSError **)outError;                        /* Error description. */

/*
 Synchronously load six images from disk into an OpenGL cubemap texture.
 Face ordering will always be interpreted as Right(+x), Left(-x), Top(+y), Bottom(-y), Front(+z), Back(-z).
 This coordinate system is left-handed if you think of yourself within the cube. The coordinate system is right-handed if you think of yourself outside of the cube.
 Returns the generated texture object when the operation is complete, or the operation terminates with an error (returning nil).
 Returned error can be queried via 'error' which is nil otherwise.
 */
+ (GLKTextureInfo*)cubeMapWithContentsOfFiles:(NSArray *)paths                      /* An array of paths (NSStrings or NSURLs). */
                                      options:(NSDictionary *)options               /* Otions that control how the image is loaded. */
                                        error:(NSError **)outError;                 /* Error description. */

/*
 Synchronously creates an OpenGL cubemap texture by splitting one image into six parts.
 Takes a single image file where height = 6 * width or width = 6 * height.
 The former (vertical orientation) is preferred to avoid image data extraction overhead.
 Face ordering will always be interpreted as Right(+x), Left(-x), Top(+y), Bottom(-y), Front(+z), Back(-z).
 This coordinate system is left-handed if you think of yourself within the cube. The coordinate system is right-handed if you think of yourself outside of the cube.
 Returns the generated texture object when the operation is complete, or the operation terminates with an error (returning nil).
 Returned error can be queried via 'error' which is nil otherwise.
 */
+ (GLKTextureInfo*)cubeMapWithContentsOfFile:(NSString *)path                       /* File path of image. */
                                     options:(NSDictionary *)options                /* Options that control how the image is loaded. */
                                       error:(NSError **)outError;                  /* Error description. */


+ (GLKTextureInfo*)cubeMapWithContentsOfURL:(NSURL *)url                            /* File path of image. */
                                    options:(NSDictionary *)options                 /* Options that control how the image is loaded. */
                                      error:(NSError **)outError;                   /* Error description. */

#pragma mark Asynchronous Methods

/*
 Internally creates a new shared context that will handle the texture creation operations.
 The sharegroup will be released upon releasing the GLKTextureLoader object. 
 */
- (id)initWithSharegroup:(EAGLSharegroup*)sharegroup;

/*
 Asynchronously load an image from disk into an OpenGL texture.
 Invokes the block on the provided queue when the operation is complete. If queue is NULL, the main queue will be used.
 */
- (void)textureWithContentsOfFile:(NSString *)path 					    /* File path of image. */
                          options:(NSDictionary *)options               /* Options that control how the image is loaded. */
                            queue:(dispatch_queue_t)queue				/* Dispatch queue, or NULL to use the main queue. */
                completionHandler:(GLKTextureLoaderCallback)block;		/* Block to be invoked on the above dispatch queue. */

- (void)textureWithContentsOfURL:(NSURL *)url                           /* File path of image. */
                         options:(NSDictionary *)options                /* Options that control how the image is loaded. */
                           queue:(dispatch_queue_t)queue				/* Dispatch queue, or NULL to use the main queue. */
               completionHandler:(GLKTextureLoaderCallback)block;		/* Block to be invoked on the above dispatch queue. */

/*
 Asynchronously create a texture from data residing in memory.
 Invokes the block on the provided queue when the operation is complete. If queue is NULL, the main queue will be used.
 */
- (void)textureWithContentsOfData:(NSData *)data 						/* NSData containing image contents. */
                          options:(NSDictionary *)options               /* Options that control how the image is loaded. */
                            queue:(dispatch_queue_t)queue				/* Dispatch queue, or NULL to use the main queue. */
                completionHandler:(GLKTextureLoaderCallback)block;		/* Block to be invoked on the above dispatch queue. */

/*
 Asynchronously create a texture from a CGImageRef.
 Invokes the block on the provided queue when the operation is complete. If queue is NULL, the main queue will be used.
 */
- (void)textureWithCGImage:(CGImageRef)cgImage							/* CGImage reference. */
                   options:(NSDictionary *)options                      /* Options that control how the image is loaded. */
                     queue:(dispatch_queue_t)queue						/* Dispatch queue, or NULL to use the main queue. */
         completionHandler:(GLKTextureLoaderCallback)block;				/* Block to be invoked on the above dispatch queue. */


/*
 Asynchronously load six images from disk into an OpenGL cubemap texture.
 Face ordering will always be interpreted as Right(+x), Left(-x), Top(+y), Bottom(-y), Front(+z), Back(-z).
 This coordinate system is left-handed if you think of yourself within the cube. The coordinate system is right-handed if you think of yourself outside of the cube.
 Invokes the block on the provided queue when the operation is complete. If queue is NULL, the main queue will be used.
 */
- (void)cubeMapWithContentsOfFiles:(NSArray *)paths                     /* An array of paths (NSStrings or NSURLs). */
                           options:(NSDictionary *)options              /* Options that control how the image is loaded. */
                             queue:(dispatch_queue_t)queue				/* Dispatch queue, or NULL to use the main queue. */
                 completionHandler:(GLKTextureLoaderCallback)block;		/* Block to be invoked on the above dispatch queue. */


/*
 Asynchronously creates an OpenGL cubemap texture by splitting one image into six parts.
 Takes a single image file where height = 6 * width or width = 6 * height.
 The former (vertical orientation) is preferred to avoid image data extraction overhead.
 Face ordering will always be interpreted as Right(+x), Left(-x), Top(+y), Bottom(-y), Front(+z), Back(-z).
 This coordinate system is left-handed if you think of yourself within the cube. The coordinate system is right-handed if you think of yourself outside of the cube.
 Invokes the block on the provided queue when the operation is complete. If queue is NULL, the main queue will be used.
 */
- (void)cubeMapWithContentsOfFile:(NSString *)path                      /* File path of image. */
                          options:(NSDictionary *)options               /* Options that control how the image is loaded. */
                            queue:(dispatch_queue_t)queue				/* Dispatch queue, or NULL to use the main queue. */
                completionHandler:(GLKTextureLoaderCallback)block;		/* Block to be invoked on the above dispatch queue. */


- (void)cubeMapWithContentsOfURL:(NSURL *)url                           /* File path of image. */
                         options:(NSDictionary *)options                /* Options that control how the image is loaded. */
                           queue:(dispatch_queue_t)queue				/* Dispatch queue, or NULL to use the main queue. */
               completionHandler:(GLKTextureLoaderCallback)block;       /* Block to be invoked on the above dispatch queue. */

@end
