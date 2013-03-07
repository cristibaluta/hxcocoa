package objc.image;

import objc.foundation.NSObject;

//#import <CoreVideo/CoreVideo.h>

@:framework("CoreImage")
extern class CIContext extends NSObject {

/* Keys that may be passed in the dictionary while creating contexts: */

/* A CGColorSpaceRef object defining the color space that images are
 * converted to before rendering into the context. */
CORE_IMAGE_EXPORT NSString * const kCIContextOutputColorSpace;

/* A CGColorSpaceRef object defining the color space in which all
 * intermediate operations are performed. */
CORE_IMAGE_EXPORT NSString * const kCIContextWorkingColorSpace;

/* An NSNumber with a boolean value. In CICGContext, requires software
 * rendering when true. */
CORE_IMAGE_EXPORT NSString * const kCIContextUseSoftwareRenderer;

/* Create a new CoreImage context object, all output will be drawn
 * into the surface attached to the OpenGL context 'ctx'. If 'pf' is
 * non-null it should be the pixel format object used to create 'ctx';
 * it's required to be valid for the lifetime of the CIContext.
 * The colorspace should be set to the colorspace of your target otherwise
 * CI will take the colorspace from the CGLContext if available. */
#if !ios
	public static function contextWithCGLContext (ctx:CGLContextObj, pixelFormat:CGLPixelFormatObj, colorSpace:CGColorSpaceRef, options:NSDictionary) :CIContext;
#end

/* Create a new CoreImage context object, all output will be drawn
 * into the CG context 'ctx'. */
	public static function contextWithCGContext (tx:CGContextRef, options:NSDictionary) :CIContext;

	@:require(ios5_0) public static function contextWithOptions (dict:NSDictionary) :CIContext;

/* Create a new CoreImage context object using 'eaglContext' 
 * Calls to drawImage:atPoint:fromRect: and drawImage:inRect:fromRect:
 * will draw directly though the context. */
	@:require(ios5_0) public static function contextWithEAGLContext (eaglContext:EAGLContext) :CIContext;
	@:require(ios5_0) public static function contextWithEAGLContext (eaglContext:EAGLContext, options:NSDictionary) :CIContext;

/* DEPRECATED - use -drawImage:inRect:fromRect:
 * Render the subregion 'src' of 'im' to point 'p' in the context's
 * destination. */
	public function drawImage (im:CIImage, atPoint:CGPoint, fromRect:CGRect) :Void;// __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_4, __MAC_10_8, __IPHONE_5_0, __IPHONE_6_0);

/* Render the rectangle 'src' of 'im' to the rectangle 'dest' in the
 * context's destination. */
	public function drawImage (im:CIImage, inRect:CGRect, fromRect:CGRect) :Void;

/* Render the region 'r' of image 'im' into a temporary buffer using
 * the context, then create and return a new CoreGraphics image with
 * the results. The caller is responsible for releasing the returned
 * image. */
	public function createCGImage (im:CIImage, fromRect:CGRect) :CGImageRef;

/* Create a new CGImage from the specified subrect of the image. If
 * non-nil the new image will be created in the specified format and
 * colorspace. */
	public function createCGImage (im:CIImage, fromRect:CGRect, format:CIFormat, colorSpace:CGColorSpaceRef) :CGImageRef;

/* Create a CoreGraphics layer object suitable for creating content for
 * subsequently rendering into this CI context. The 'd' parameter is
 * passed into CGLayerCreate () as the auxiliaryInfo dictionary. */
	@:require(osx_10_4_0) public function createCGLayerWithSize (size:CGSize, info:CFDictionaryRef) :CGLayerRef;

/* Render to the given bitmap. Null colorspace means to use the context's
 output colorspace. */
	public function render (im:CIImage, toBitmap:Void, rowBytes:ptrdiff_t, bounds:CGRect, format:CIFormat, colorSpace:CGColorSpaceRef) :Void;


/* Render to the given IOSurface. */
	@:require(osx_10_6) public function render (im:CIImage, toIOSurface:IOSurfaceRef, bounds:CGRect, colorSpace:CGColorSpaceRef) :Void;

/* Render 'image' into a CVPixelBuffer using the context. */
	@:require(ios5_0) public function render (image:CIImage, toCVPixelBuffer:CVPixelBufferRef) :Void;
	@:require(ios5_0) public function render (image:CIImage, toCVPixelBuffer:CVPixelBufferRef, bounds:CGRect, colorSpace:CGColorSpaceRef) :Void;

/* Runs the context's garbage collector to reclaim any resources that
 * are no longer required (e.g. removes textures from the texture cache
 * that reference deleted images.) This method is called automatically
 * after every rendering operation. */
	@:require(osx_10_4) public function reclaimResources () :Void;

/* Frees any cached data (such as temporary images) associated with the
 * context. This also runs the garbage collector. */
	@:require(osx_10_4) public function clearCaches () :Void;

/* Returns the maximum dimension for input images that can be processed 
 * on the currect context. */
	@:require(ios5_0) public function inputImageMaximumSize () :CGSize;

/* Returns the maximum dimension for image that can be rendered 
 * on the currect context. */
	@:require(ios5_0) public function outputImageMaximumSize () :CGSize;

}
