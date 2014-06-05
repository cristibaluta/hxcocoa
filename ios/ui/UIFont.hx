package ios.ui;
import swift.foundation.NSObject;

@:framework("UIKit")
extern class UIFont extends NSObject {

	public static function fontWithName (fontName:String, fontSize:Float) :UIFont;

	// Returns an array of font family names for all installed fonts
	public static function familyNames () :Array<String>;
	// Returns an array of font names for the specified family name
	public static function fontNamesForFamilyName (familyName:String) :Array<String>;

	// Some convenience methods to create system fonts
	public static function systemFontOfSize (fontSize:Float) :UIFont;
	public static function boldSystemFontOfSize (fontSize:Float) :UIFont;
	public static function italicSystemFontOfSize (fontSize:Float) :UIFont;

	// Font attributes
	public var familyName :String;
	public var fontName :String;
	public var pointSize :Float;
	public var ascender :Float;
	public var descender :Float;
	public var capHeight :Float;
	public var xHeight :Float;
	public var lineHeight :Float;

	 // Create a new font that is identical to the current font except the specified size
	public function fontWithSize (fontSize:Float) :UIFont;

//	(UIFontSystemFonts)
	public static function labelFontSize () :Float;
	public static function buttonFontSize () :Float;
	public static function smallSystemFontSize () :Float;
	public static function systemFontSize () :Float;
}
