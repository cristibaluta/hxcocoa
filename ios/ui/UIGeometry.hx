package ios.ui;
import objc.graphics.CGGeometry;
import objc.graphics.CGAffineTransform;

@:framework("UIKit")
extern class UIEdgeInsets {
	public var top :Float;
	public var left :Float;
	public var bottom :Float;
	public var right :Float;
    public function new (top:Float, left:Float, bottom:Float, right:Float) :Void;
}

@:framework("UIKit")
extern class UIOffset {
	public var horizontal :Float;
	public var vertical :Float;
	public function new (horizontal:Float, vertical:Float) :Void;
}

@:framework("UIKit")
extern class UIGeometry {
	
@:c public static function UIEdgeInsetsMake(top:Float, left:Float, bottom:Float, right:Float) :UIEdgeInsets;

@:c public static function UIEdgeInsetsInsetRect(rect:CGRect, insets:UIEdgeInsets) :CGRect;

@:c public static function UIOffsetMake(horizontal:Float, vertical:Float) :UIOffset;

@:c public static function UIEdgeInsetsEqualToEdgeInsets(insets1:UIEdgeInsets, insets2:UIEdgeInsets) :Bool;

@:c public static function UIOffsetEqualToOffset(offset1:UIOffset, offset2:UIOffset) :Bool;

@:c public static var UIEdgeInsetsZero :UIEdgeInsets;
@:c public static var UIOffsetZero :UIOffset;

@:c public static function NSStringFromCGPoint(point:CGPoint) :String;
@:c public static function NSStringFromCGSize(size:CGSize) :String;
@:c public static function NSStringFromCGRect(rect:CGRect) :String;
@:c public static function NSStringFromCGAffineTransform(transform:CGAffineTransform) :String;
@:c public static function NSStringFromUIEdgeInsets(insets:UIEdgeInsets) :String;
@:c public static function NSStringFromUIOffset(offset:UIOffset) :String;

@:c public static function CGPointFromString(string:String) :CGPoint;
@:c public static function CGSizeFromString(string:String) :CGSize;
@:c public static function CGRectFromString(string:String) :CGRect;
@:c public static function CGAffineTransformFromString(string:String) :CGAffineTransform;
@:c public static function UIEdgeInsetsFromString(string:String) :UIEdgeInsets;
@:c public static function UIOffsetFromString(string:String) :UIOffset;

}
