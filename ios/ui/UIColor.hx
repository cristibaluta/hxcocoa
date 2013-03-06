package ios.ui;
import objc.foundation.NSObject;

@:framework("UIKit")
extern class UIColor extends NSObject {
	
	public static function colorWithRed (red:Float, green:Float, blue:Float, alpha:Float) :UIColor;
	//public static function colorWithCGColor (cgColor:CGColorRef) :UIColor;
	public static function colorWithPatternImage (image:UIImage) :UIColor;
	//@:require(ios5_0) public static function colorWithCIColor (ciColor:CIColor) :UIColor;
	public static function colorWithWhite (white:Float, alpha:Float) :UIColor;
	public static function colorWithHue (hue:Float, saturation:Float, brightness:Float, alpha:Float) :UIColor;
	

	public function initWithWhite (white:Float, alpha:Float) :UIColor;
	public function initWithHue (hue:Float, saturation:Float, brightness:Float, alpha:Float) :UIColor;
	public function initWithRed (red:Float, green:Float, blue:Float, alpha:Float) :UIColor;
	//public function initWithCGColor (cgColor:CGColorRef) :UIColor;
	public function initWithPatternImage (image:UIImage) :UIColor;
	//@:require(ios5_0) public function initWithCIColor (ciColor:CIColor) :UIColor;

	public static function blackColor () : UIColor;      // 0.0 white 
	public static function darkGrayColor () : UIColor;   // 0.333 white 
	public static function lightGrayColor () : UIColor;  // 0.667 white 
	public static function whiteColor () : UIColor;      // 1.0 white 
	public static function grayColor () : UIColor;       // 0.5 white 
	public static function redColor () : UIColor;        // 1.0, 0.0, 0.0 RGB 
	public static function greenColor () : UIColor;      // 0.0, 1.0, 0.0 RGB 
	public static function blueColor () : UIColor;       // 0.0, 0.0, 1.0 RGB 
	public static function cyanColor () : UIColor;       // 0.0, 1.0, 1.0 RGB 
	public static function yellowColor () : UIColor;     // 1.0, 1.0, 0.0 RGB 
	public static function magentaColor () : UIColor;    // 1.0, 0.0, 1.0 RGB 
	public static function orangeColor () : UIColor;     // 1.0, 0.5, 0.0 RGB 
	public static function purpleColor () : UIColor;     // 0.5, 0.0, 0.5 RGB 
	public static function brownColor () : UIColor;      // 0.6, 0.4, 0.2 RGB 
	public static function clearColor () : UIColor;      // 0.0 white, 0.0 alpha 

	public function set () :Void;
	public function setFill () :Void;
	public function setStroke () :Void;

	@:require(ios5_0) public function getWhite (white:Float, alpha:Float) :Bool;
	@:require(ios5_0) public function getHue (hue:Float, saturation:Float, brightness:Float, alpha:Float) :Bool; 
	@:require(ios5_0) public function getRed (red:Float, green:Float, blue:Float, alpha:Float) :Bool;

	public function colorWithAlphaComponent (alpha:Float) :UIColor;

	//public var CGColorRef (default, null) :CGColor;
	//public var CIColor (default, null) :CIColor;

	@:require(ios5_0) public function initWithColor (color:UIColor) :UIColor;

}
