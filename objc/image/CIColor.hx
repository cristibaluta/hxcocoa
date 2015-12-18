package objc.image;

import objc.foundation.NSObject;

@:framework("CoreImage")
extern class CIColor extends NSObject implements NSCopying {

/* Create a new color object. */
	public static function colorWithCGColor (c:CGColorRef) :CIColor;;

/* Create a new color object.
 It's created using the GenericRGB color space. To create a CIColor with a different color space, use +colorWithCGColor:. */
	public static function colorWithRed (r:Float, green:Float, blue:Float, alpha:Float) :CIColor;
	public static function colorWithRed (r:Float, green:Float, blue:Float) :CIColor;

/* Create a new color object, 'representation' should be a string in one of
 * the formats returned by the stringRepresentation method. */
	public static function colorWithString (representation:String) :CIColor;

/* Initializer. */

	public function initWithCGColor (c:CGColorRef) :CIColor;

/* Return the number of color components (including alpha). */
	public function numberOfComponents () :Int;

/* Return the color components (including alpha). */
	public function components () :Array<Float>;

/* Return the alpha value of the color. */
	public function alpha () :Float;

/* Return the color space object associated with the color. */
	public function colorSpace () :CGColorSpaceRef;

/* Return the (unpremultiplied) red, green or blue components of the color. */
	public function red () :Float;
	public function green () :Float;
	public function blue () :Float;

/* Returns a formatted string with the components of the color. */
	public function stringRepresentation () :String;

}
