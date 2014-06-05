//
//  UIBezierPath.h
package ios.ui;
import swift.graphics.CGGeometry;
import swift.graphics.CGContext;

@:framework("UIKit")
extends enum UIRectCorner {
    UIRectCornerTopLeft;
    UIRectCornerTopRight;
    UIRectCornerBottomLeft;
    UIRectCornerBottomRight;
    UIRectCornerAllCorners;
}

@:framework("UIKit")
extern class UIBezierPath extends NSObject {

	public static function bezierPath () :UIBezierPath;
	public static function bezierPathWithRect (rect:CGRect) :UIBezierPath;
	public static function bezierPathWithOvalInRect (rect:CGRect) :UIBezierPath;
	public static function bezierPathWithRoundedRect (rect:CGRect, cornerRadius:Float) :UIBezierPath;
	public static function bezierPathWithRoundedRect (rect:CGRect, byRoundingCorners:UIRectCorner, cornerRadii:CGSize) :UIBezierPath;
	public static function bezierPathWithArcCenter (center:CGPoint, radius:Float, startAngle:Float, endAngle:Float, clockwise:Bool) :UIBezierPath;
	public static function bezierPathWithCGPath (CGPath:CGPathRef) :UIBezierPath;

// Returns an immutable CGPathRef which is only valid until the UIBezierPath is further mutated.
// Setting the path will create an immutable copy of the provided CGPathRef, so any further mutations on a provided CGMutablePathRef will be ignored.
	public var CGPath :CGPathRef;

// Path construction

	public function moveToPoint (point:CGPoint) :Void;
	public function addLineToPoint (point:CGPoint) :Void;
	public function addCurveToPoint (endPoint:CGPoint, controlPoint1:CGPoint, controlPoint2:CGPoint) :Void;
	public function addQuadCurveToPoint (endPoint:CGPoint, controlPoint:CGPoint) :Void;
	public function addArcWithCenter (center:CGPoint, radius:Float, startAngle:Float, endAngle:Float, clockwise:Bool) :Void;
	public function closePath () :Void;

	public function removeAllPoints () :Void;

// Appending paths

	public function appendPath (bezierPath :UIBezierPath) :Void;

// Modified paths

	public function bezierPathByReversingPath () :UIBezierPath;

// Transforming paths

	public function applyTransform (transform:CGAffineTransform) :Void;

// Path info

	public var empty (default, null) :Bool;
	public var bounds (default, null) :CGRect;
	public var currentPoint (default, null) :CGPoint;
	public function containsPoint (point:CGPoint) :Bool;

// Drawing properties

	public var lineWidth :Float;
	public var lineCapStyle :CGLineCap;
	public var lineJoinStyle :CGLineJoin;
	public var miterLimit :Float; // Used when lineJoinStyle is kCGLineJoinMiter
	public var flatness :Float;
	public var usesEvenOddFillRule :Bool; // Default is NO. When YES, the even-odd fill rule is used for drawing, clipping, and hit testing.

	public function setLineDash (pattern:Float, count:Int, phase:Float) :Void;
	public function getLineDash (pattern:Float, count:Int, phase:Float) :Void;

// Path operations on the current graphics context

	public function fill () :Void;
	public function stroke () :Void;

// These methods do not affect the blend mode or alpha of the current graphics context
	public function fillWithBlendMode (blendMode:CGBlendMode, alpha:Float) :Void;
	public function strokeWithBlendMode (blendMode:CGBlendMode, alpha:Float) :Void;

	public function addClip () :Void;

}
