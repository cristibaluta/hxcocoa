package ios.ui;

import objc.foundation.NSObject;
import objc.foundation.NSData;
import objc.graphics.CGGeometry;
import objc.graphics.CGImage;

@:framework("UIKit")
extern enum UIImageOrientation {
    UIImageOrientationUp;            // default orientation
    UIImageOrientationDown;          // 180 deg rotation
    UIImageOrientationLeft;          // 90 deg CCW
    UIImageOrientationRight;         // 90 deg CW
    UIImageOrientationUpMirrored;    // as above but image mirrored along other axis. horizontal flip
    UIImageOrientationDownMirrored;  // horizontal flip
    UIImageOrientationLeftMirrored;  // vertical flip
    UIImageOrientationRightMirrored; // vertical flip
}

@:framework("UIKit")
extern enum UIImageResizingMode {
    UIImageResizingModeTile;
    UIImageResizingModeStretch;
}


@:framework("UIKit")
extern class UIImage extends NSObject {
	
	public static function imageNamed (name:String) :UIImage;// load from main bundle
	public static function imageWithContentsOfFile (name:String) :UIImage;// load from main bundle
	public static function imageWithData (name:NSData) :UIImage;// load from main bundle
	public static function imageWithCGImage (cgImage:CGImageRef) :UIImage;// load from main bundle
	
	public var size (default, null) :CGSize; // reflects orientation setting. In iOS 4.0 and later, this is measured in points. In 3.x and earlier, measured in pixels
	
	public function initWithData (data:NSData) :UIImage;


	@:require(ios6_0)public static function imageWithData (data:NSData, scale:Float) :UIImage;
	@:require(ios4_0)public static function imageWithCGImage (cgImage:CGImageRef, scale:Float, orientation:UIImageOrientation) :UIImage;
	@:require(ios5_0)public static function imageWithCIImage (ciImage:CIImage) :UIImage;
	@:require(ios6_0)public static function imageWithCIImage (ciImage:CIImage, scale:(Float)scale orientation:(UIImageOrientation)orientation NS_AVAILABLE_IOS(6_0);

/*- (id)initWithContentsOfFile:(String *)path;
- (id)initWithData:(NSData *)data;.............
- (id)initWithData:(NSData *)data scale:(Float)scale NS_AVAILABLE_IOS(6_0);
- (id)initWithCGImage:(CGImageRef)cgImage;
- (id)initWithCGImage:(CGImageRef)cgImage scale:(Float)scale orientation:(UIImageOrientation)orientation NS_AVAILABLE_IOS(4_0);
- (id)initWithCIImage:(CIImage *)ciImage NS_AVAILABLE_IOS(5_0);
- (id)initWithCIImage:(CIImage *)ciImage scale:(Float)scale orientation:(UIImageOrientation)orientation NS_AVAILABLE_IOS(6_0);
*/
	
	public var CGImage (default, null) :CGImageRef;
	@:require(ios5_0)public var CIImage (default, null) :CIImage;
	public var imageOrientation (default, null) :UIImageOrientation; // this will affect how the image is composited
	public var scale (default, null) :Float;

// animated images. When set as UIImageView.image, animation will play in an infinite loop until removed. Drawing will render the first image

	@:require(ios5_0)public static function animatedImageNamed:(String *)name duration:(NSTimeInterval)duration NS_AVAILABLE_IOS(5_0);  // read sequence of files with suffix starting at 0 or 1
	@:require(ios5_0)public static function animatedResizableImageNamed (name:String, capInsets:UIEdgeInsets, duration:Float) :UIImage; // sequence of files
	@:require(ios6_0)public static function animatedResizableImageNamed (name:String, capInsets:UIEdgeInsets, resizingMode:UIImageResizingMode, duration:Float) :UIImage;
	@:require(ios5_0)public static function animatedImageWithImages (images:Array<UIImage>, duration:Float) :UIImage;

	@:require(ios5_0)public var images (default, null) Array<>; // default is nil for non-animated images
	@:require(ios5_0)public var duration (default, null) Float; // total duration for all frames. default is 0 for non-animated images

// the these draw the image 'right side up' in the usual coordinate system with 'point' being the top-left.

	public function drawAtPoint (point:CGPoint) :Void;                                                        // mode = kCGBlendModeNormal, alpha = 1.0
	public function drawAtPoint (point:CGPoint, blendMode:CGBlendMode, alpha:Float) :Void;
	public function drawInRect (rect:CGRect) :Void;                                                           // mode = kCGBlendModeNormal, alpha = 1.0
	public function drawInRect (rect:CGRect, blendMode:CGBlendMode, alpha:Float) :Void;

	public function drawAsPatternInRect (rect:CGRect) :Void; // draws the image as a CGPattern

	@:require(ios5_0)public function resizableImageWithCapInsets (capInsets:UIEdgeInsets) :UIImage; // create a resizable version of this image. the interior is tiled when drawn.
	@:require(ios6_0)public function resizableImageWithCapInsets (capInsets:UIEdgeInsets, resizingMode:UIImageResizingMode) :UIImage; // the interior is resized according to the resizingMode

	@:require(ios5_0)public var capInsets (default, null) :UIEdgeInsets;   // default is UIEdgeInsetsZero for non resizable images
	@:require(ios6_0)public var resizingMode (default, null) :UIImageResizingMode; // default is UIImageResizingModeTile

// Support for constraint-based layout (auto layout)
// The alignmentRectInsets of a UIImage are used by UIImageView and other UIView and UIControl
//  subclasses that take custom images to determine the view's alignment rect insets for
//  constraint-based layout.
// The default alignmentRectInsets are UIEdgeInsetsZero.
	@:require(ios6_0)public function imageWithAlignmentRectInsets (alignmentInsets:UIEdgeInsets) :UIImage;
	@:require(ios6_0)public var alignmentRectInsets (default, null) :UIEdgeInsets;

}


//UIKIT_EXTERN NSData *UIImagePNGRepresentation(UIImage *image);
//UIKIT_EXTERN NSData *UIImageJPEGRepresentation(UIImage *image, Float compressionQuality);
