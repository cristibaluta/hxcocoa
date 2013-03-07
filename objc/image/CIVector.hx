package objc.image;

import objc.foundation.NSObject;


@:framework("CoreImage")
extern class CIVector extends NSObject implements NSCopying implements NSCoding {

/* Create a new vector object. */

	public static function vectorWithValues (values:Array<Float>, count:Int) :CIVector;

	@:overload( static function (x:Float) :CIVector {})
	@:overload( static function (x:Float, Y:Float) :CIVector {})
	@:overload( static function (x:Float, Y:Float, Z:Float) :CIVector {})
	public static function vectorWithX (x:Float, Y:Float, Z:Float, W:Float) :CIVector;

/* the CGPoint x and y values are stored in the first X and Y values of the CIVector. */
	@:require(ios5_0) public static function vectorWithCGPoint (p:CGPoint) :CIVector;

/* the CGRect x, y, width, height values are stored in the first X, Y, Z, W values of the CIVector. */
	@:require(ios5_0) public static function vectorWithCGRect (r:CGRect) :CIVector;

/* the CGAffineTransform's six values are stored in the first six values of the CIVector. */
	@:require(ios5_0) public static function vectorWithCGAffineTransform (t:CGAffineTransform) :CIVector;

	public static function vectorWithString (representation:String) :CIVector;

/* Initializers. */

	public function initWithValues (values:Array<Float>, count:Int) :CIVector;
	
	@:overload( function (X:Float) :CIVector {})
	@:overload( function (X:Float, Y:Float) :CIVector {})
	@:overload( function (X:Float, Y:Float, Z:Float) :CIVector {})
	public function initWithX (X:Float, Y:Float, Z:Float, W:Float) :CIVector;
	
	@:require(ios5_0) public function initWithCGPoint (p:CGPoint) :CIVector;
	@:require(ios5_0) public function initWithCGRect (r:CGRect) :CIVector;
	@:require(ios5_0) public function initWithCGAffineTransform (r:CGAffineTransform) :CIVector;

	public function initWithString (representation:String) :CIVector;

/* Return the value from the vector at position 'index' (zero-based).
 * Any 'index' value is valid, if the component would otherwise be
 * undefined, zero is returned. */
	public function valueAtIndex (index:Int) :Float;

/* Return the number of values stored in the vector. */
	public function count () :Int;

/* Getters. */

	public function X () :Float;
	public function Y () :Float;
	public function Z () :Float;
	public function W () :Float;
	@:require(ios5_0) public function CGPointValue () :CGPoint;
	@:require(ios5_0) public function CGRectValue () :CGRect;
	@:require(ios5_0) public function CGAffineTransformValue () :CGAffineTransform;

/* Return a string representing the vector such that a similar vector
 * can be created by calling the vectorWithString: method. */
	public function stringRepresentation () :String;

}
