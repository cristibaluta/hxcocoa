package objc.quartz;

import objc.foundation.NSObject;
import objc.foundation.NSDictionary;
import objc.graphics.CGGeometry;
import objc.graphics.CGAffineTransform;

typedef CGContextRef = Dynamic;
typedef CGColorRef = Dynamic;
typedef CGPathRef = Dynamic;
typedef CFTimeInterval = Float;

extern enum CAEdgeAntialiasingMask {
	kCALayerLeftEdge;//Minimum X edge. 
	kCALayerRightEdge;//Maximum X edge. 
	kCALayerBottomEdge;//Minimum Y edge. 
	kCALayerTopEdge;//Maximum Y edge. 
}

extern class CALayer extends NSObject implements NSCoding/* implements CAMediaTiming*/ {

	public static function layer () :CALayer;

	override public function init () :CALayer;
	public function initWithLayer (layer:CALayer) :CALayer;
	public function presentationLayer () :CALayer;
	public function modelLayer () :CALayer;

	public static function defaultValueForKey (key:String) :CALayer;
	public static function needsDisplayForKey (key:String) :Bool;

	public function shouldArchiveValueForKey (key:String) :Bool;

	public var bounds :CGRect;
	public var position :CGPoint;
	public var zPosition :Float;

	public var anchorPoint :CGPoint;
	public var anchorPointZ :Float;
	public var transform :CATransform3D;

	public function affineTransform () :CGAffineTransform;
	public function setAffineTransform (m:CGAffineTransform) :Void;

	public var frame :CGRect;
	public var hidden :Bool;
	public var doubleSided :Bool;
	public var geometryFlipped :Bool;
	public function contentsAreFlipped () :Bool;
	public var superlayer (default, null) :CALayer; 
	public function removeFromSuperlayer () :Void;
 	public var sublayers :Array<CALayer>;
	public function addSublayer (layer:CALayer) :Void;
	@:overload(function (layer:CALayer, atIndex:Int) :Void {})
	@:overload(function (layer:CALayer, below:CALayer) :Void {})
	public function insertSublayer (layer:CALayer, above:CALayer) :Void;

	public function replaceSublayer (layer:CALayer, with:CALayer) :Void;

	public var sublayerTransform :CATransform3D;
	public var mask :CALayer;
	public var masksToBounds :Bool;

//Mapping between layer coordinate and time spaces. 

	@:overload(function (p:CGPoint, fromLayer:CALayer) :CGPoint {})
	public function convertPoint (p:CGPoint, toLayer:CALayer) :CGPoint;
	@:overload(function (r:CGRect, fromLayer:CALayer) :CGRect {})
	public function convertRect (r:CGRect, toLayer:CALayer) :CGRect;
	@:overload(function (t:CFTimeInterval, fromLayer:CALayer) :CFTimeInterval {})
	public function convertTime (t:CFTimeInterval, toLayer:CALayer) :CFTimeInterval;


	public function hitTest (p:CGPoint) :CALayer;

	public function containsPoint (p:CGPoint) :Bool;


	public var contents :Dynamic;
	public var contentsRect :CGRect;
	public var contentsGravity :String;
	public var contentsScale :Float;
	public var contentsCenter :CGRect;
	public var minificationFilter :String;
	public var magnificationFilter :String;
	public var minificationFilterBias :Float;
	public var opaque :Bool;

	public function display () :Void;

	public function setNeedsDisplay () :Void;
	public function setNeedsDisplayInRect (r:CGRect) :Void;

	public function needsDisplay () :Bool;

	public function displayIfNeeded () :Void;

	public var needsDisplayOnBoundsChange :Bool;
	public var drawsAsynchronously :Bool;

	public function drawInContext (ctx:CGContextRef) :Void;

	public function renderInContext (ctx:CGContextRef) :Void;

	public var edgeAntialiasingMask :Int;
	public var backgroundColor :CGColorRef;
	public var cornerRadius :Float;
	public var borderWidth :Float;
	public var borderColor :CGColorRef;
	public var opacity :Float;
	public var compositingFilter :Dynamic;
	public var filters :Array<Dynamic>;
	public var backgroundFilters :Array<Dynamic>;
	public var shouldRasterize :Bool;
	public var rasterizationScale :Float;
	public var shadowColor :CGColorRef;
	public var shadowOpacity :Float;
	public var shadowOffset :CGSize;
	public var shadowRadius :Float;
	public var shadowPath :CGPathRef;

	public function preferredFrameSize () :CGSize;
	public function setNeedsLayout () :Void;
	public function needsLayout () :Bool;
	public function layoutIfNeeded () :Void;
	public function layoutSublayers () :Void;
	public static function defaultActionForKey (event:String) :CAAction;
	public function actionForKey (event:String) :CAAction;

	public var actions :NSDictionary;

	public function addAnimation (anim:CAAnimation, forKey:String) :Void;
	public function removeAllAnimations () :Void;
	public function removeAnimationForKey (key:String) :Void;
	public function animationKeys () :Array<String>;
	public function animationForKey (key:String) :CAAnimation;

	public var name :String;
	public var delegate :Dynamic;
	public var style :NSDictionary;

}

extern interface CAAction {

	public function runActionForKey (event:String, object:Dynamic, arguments:NSDictionary) :Void;

}

//Delegate methods. 

extern class CALayerDelegate {
	// category for NSObject

	public function displayLayer (layer:CALayer) :Void;
	public function drawLayer (layer:CALayer, inContext:CGContextRef) :Void;
	public function layoutSublayersOfLayer (layer:CALayer) :Void;
	public function actionForLayer (layer:CALayer, forKey:String) :CAAction;


	public static var kCAGravityCenter :String;
	public static var kCAGravityTop :String;
	public static var kCAGravityBottom :String;
	public static var kCAGravityLeft :String;
	public static var kCAGravityRight :String;
	public static var kCAGravityTopLeft :String;
	public static var kCAGravityTopRight :String;
	public static var kCAGravityBottomLeft :String;
	public static var kCAGravityBottomRight :String;
	public static var kCAGravityResize :String;
	public static var kCAGravityResizeAspect :String;
	public static var kCAGravityResizeAspectFill :String;

//Contents filter names. 

	public static var kCAFilterNearest :String;
	public static var kCAFilterLinear :String;

	public static var kCAFilterTrilinear :String;

//Layer event names. 

	public static var kCAOnOrderIn :String;
	public static var kCAOnOrderOut :String;

//The animation key used for transitions. 

	public static var kCATransition :String;
	
}
