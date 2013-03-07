package objc.image;

import objc.foundation.NSObject;
import objc.graphics.CGGeometry;
//#import <CoreVideo/CoreVideo.h>


@:framework("CoreImage")
extern class CIImage extends NSObject implements NSCopying {

/* Pixel formats. */

typedef CIFormat = Int;

CORE_IMAGE_EXPORT CIFormat kCIFormatARGB8 __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_6_0);
CORE_IMAGE_EXPORT CIFormat kCIFormatBGRA8 __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);
CORE_IMAGE_EXPORT CIFormat kCIFormatRGBA8 __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);

CORE_IMAGE_EXPORT CIFormat kCIFormatRGBA16 __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);
CORE_IMAGE_EXPORT CIFormat kCIFormatRGBAf __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);

/* RGBA values that are IEEE 754-2008 half float compliant. */
CORE_IMAGE_EXPORT CIFormat kCIFormatRGBAh __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_6_0);

/* Image dictionary keys. */

/* A CGColorSpaceRef defining the color space of the image. This value 
 * overrides the image's implicit color space. 
 * If [NSNull null] then dont color manage the image. */
CORE_IMAGE_EXPORT NSString *kCIImageColorSpace;

/* A NSDictionary of metadata properties to pass to CIImage initialization methods.
 * When used with imageWithCGImage:options:, initWithCGImage:options:, imageWithData:options:, initWithData:options:
 *   If this option is not specified, the properties will be set to CGImageSourceCopyPropertiesAtIndex.
 *   If this option is [NSNull null], the properties will be set to nil.
 */
CORE_IMAGE_EXPORT NSString *kCIImageProperties __OSX_AVAILABLE_STARTING(__MAC_10_8, __IPHONE_5_0);

/* Creates a new image from the contents of 'image'. */
	public static function imageWithCGImage (image:CGImageRef) :CIImage;
	public static function imageWithCGImage (image:CGImageRef, options:NSDictionary) :CIImage;

/* Creates a new image from the contents of 'layer'. */
	@:require(osx_10_4) public static function imageWithCGLayer (layer:CGLayerRef) :CIImage;
	@:require(osx_10_4) public static function imageWithCGLayer (layer:CGLayerRef, options:NSDictionary) :CIImage;

/* Creates a new image whose bitmap data is from 'd'. Each row contains 'bpr'
 * bytes. The dimensions of the image are defined by 'size'. 'f' defines
 * the format and size of each pixel. 'cs' defines the color space
 * that the image is defined in, if nil, the image is not color matched. */
	public static function imageWithBitmapData (d:NSData, bytesPerRow:size_t, size:CGSize, format:CIFormat, colorSpace:CGColorSpaceRef) :CIImage;

/* Creates a new image referencing the contents of the GL texture object
 * with identifier 'name'. The texture should have dimensions as defined
 * by 'size'. If 'flag' is true, then the contents of the texture are
 * flipped vertically when referenced. 'cs' defines the color space
 * that the image is defined in, if nil, the texture is not color matched.*/
	@:require(osx_10_4,ios_6_0) public static function imageWithTexture (name:Int, size:CGSize, flipped:Bool colorSpace:CGColorSpaceRef) :CIImage;

	public static function imageWithContentsOfURL (url:NSURL) :CIImage;
	public static function imageWithContentsOfURL (url:NSURL, options:NSDictionary) :CIImage;

	public static function imageWithData (data:NSData) :CIImage;
	public static function imageWithData (data:NSData, options:NSDictionary) :CIImage;

/* Creates a new image whose data is from the contents of a CVImageBuffer. */
	@:require(osx_10_4) public static function imageWithCVImageBuffer (imageBuffer:CVImageBufferRef) :CIImage;
	@:require(osx_10_4) public static function imageWithCVImageBuffer (imageBuffer:CVImageBufferRef, options:NSDictionary) :CIImage;

/* Creates a new image whose data is from the contents of a CVPixelBufferRef. */
	@:require(ios5_0) public static function imageWithCVPixelBuffer (buffer:CVPixelBufferRef) :CIImage;
	@:require(ios5_0) public static function imageWithCVPixelBuffer (buffer:CVPixelBufferRef, options:NSDictionary) :CIImage;

/* Creates a new image from the contents of an IOSurface. */
#if !ios
	@:require(osx_10_6) public static function imageWithIOSurface (surface:IOSurfaceRef) :CIImage;
	@:require(osx_10_6) public static function imageWithIOSurface (surface:IOSurfaceRef, options:NSDictionary) :CIImage;
#end

/* Return or initialize a new image with an infinite amount of the color
 * 'color'. */
	public static function imageWithColor (color:CIColor) :CIImage;

/* Create an empty Image. */
	public static function emptyImage () :CIImage;

/* Initializers. */

	public function initWithCGImage:(CGImageRef)image;
	public function initWithCGImage:(CGImageRef)image options:(NSDictionary *)d;

	public function initWithCGLayer:(CGLayerRef)layer __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);
	public function initWithCGLayer:(CGLayerRef)layer options:(NSDictionary *)d __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);

	public function initWithData:(NSData *)data;
	public function initWithData:(NSData *)data options:(NSDictionary *)d;

	public function initWithBitmapData:(NSData *)d bytesPerRow:(size_t)bpr size:(CGSize)size 
format:(CIFormat)f colorSpace:(CGColorSpaceRef)c;

	public function initWithTexture:(unsigned int)name size:(CGSize)size flipped:(BOOL)flag colorSpace:(CGColorSpaceRef)cs __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_6_0);

	public function initWithContentsOfURL:(NSURL *)url;
	public function initWithContentsOfURL:(NSURL *)url options:(NSDictionary *)d;

#if !ios
	public function initWithIOSurface:(IOSurfaceRef)surface __OSX_AVAILABLE_STARTING(__MAC_10_6, __IPHONE_NA);
	public function initWithIOSurface:(IOSurfaceRef)surface options:(NSDictionary *)d __OSX_AVAILABLE_STARTING(__MAC_10_6, __IPHONE_NA);
#end

	public function initWithCVImageBuffer:(CVImageBufferRef)imageBuffer __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);
	public function initWithCVImageBuffer:(CVImageBufferRef)imageBuffer options:(NSDictionary *)dict __OSX_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_NA);

	public function initWithCVPixelBuffer:(CVPixelBufferRef)buffer __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);
	public function initWithCVPixelBuffer:(CVPixelBufferRef)buffer options:(NSDictionary *)dict __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);

	public function initWithColor (color:CIColor) :CIImage;

/* Returns a new image representing the original image with the transform
 * 'matrix' appended to it. */
	public function imageByApplyingTransform (matrix:CGAffineTransform) :CIImage;

/* Return a new image cropped to the rectangle or shape. */
	public function imageByCroppingToRect (r:CGRect) :CIImage;

/* Return a rect the defines the bounds of non-(0,0,0,0) pixels */
	public function extent () :CGRect;

/* Returns the metadata properties of an image. If the image is the
 * output of one or more CIFilters, then the metadata of the root inputImage
 * will be returned. See also kCIImageProperties. */
	@:require(osx_10_8,ios_5_0) public function properties () :NSDictionary;

/* Return the Domain of Definition of the image. */
	@:require(osx_10_4) public function definition () :CIFilterShape;

/* Returns the URL of the image when the image was created using the imageWithContentsOfURL APIs.
 * This method will return nil, if the URL cannot be determined. */
	@:require(osx_10_4) public function url () :NSURL;

/* Returns if possible the color space of the image it was defined in.
 * This method will return nil, if the color space cannot be determined. */
	@:require(osx_10_4) public function colorSpace () :CGColorSpaceRef;

//extern class CIImage (AutoAdjustment)

/* Image auto adjustment keys. */

/* These are the options dictionarey keys which can be specified when calling 
 * the autoAdjustmentFiltersWithOptions: method.
 */

/* If CFBoolean value is false then dont attempt to apply enhancement filters.
 * If not specified, the option is assumed to be present and true.
 */
CORE_IMAGE_EXPORT NSString *kCIImageAutoAdjustEnhance __OSX_AVAILABLE_STARTING(__MAC_10_8, __IPHONE_5_0);

/* If CFBoolean value is false then dont attempt to apply red eye filter.
 * If not specified, the option is assumed to be present and true.
 */
CORE_IMAGE_EXPORT NSString *kCIImageAutoAdjustRedEye __OSX_AVAILABLE_STARTING(__MAC_10_8, __IPHONE_5_0);

/* If value is an array of detected CIFeatures, then use these features
 * to determine the AutoAdjustEnhance and or AutoAdjustRedEye filters.
 * If not specified, reciever will call CIDetector.
 */
CORE_IMAGE_EXPORT NSString *kCIImageAutoAdjustFeatures __OSX_AVAILABLE_STARTING(__MAC_10_8, __IPHONE_5_0);


/* Return an array of filters to apply to an image to improve its 
 * skin tones, saturation, contrast, shadows and repair red-eyes or LED-eyes.
 *
 * The options dictionary can contain a CIDetectorImageOrientation key value. 
 * The value for this key is an integer NSNumber from 1..8 such as that
 * found in kCGImagePropertyOrientation.  If present, the adjustment will be done
 * based on that orientation but any coordinates in the returned filters will
 * still be based on those of the sender image.
 */
	@:require(osx_10_8,ios_5_0) public function autoAdjustmentFilters () :Array<CIFilter>;
	@:require(osx_10_8,ios_5_0) public function autoAdjustmentFiltersWithOptions (dict:NSDictionary) :Array<CIFilter>;

}
