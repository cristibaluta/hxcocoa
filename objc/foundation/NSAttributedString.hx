package objc.foundation;


@:framework("Foundation")
extern class NSAttributedString implements NSCopying implements NSMutableCopying implements NSCoding {

	public  function endEditing():Void;
	public  function isEqualToAttributedString( other:NSAttributedString):Bool;
	public  function addAttribute( name:String,  value:Dynamic,  range:NSRange):Void;
	public  function appendAttributedString( attrString:NSAttributedString):Void;
	public  function deleteCharactersInRange( range:NSRange):Void;
	public  function setAttributedString( attrString:NSAttributedString):Void;
	public  function beginEditing():Void;
	public  function length():Int;
	public  function initWithAttributedString( attrStr:NSAttributedString):Dynamic;
	public  function enumerateAttributesInRange( enumerationRange:NSRange,  opts:NSAttributedStringEnumerationOptions,  block:Dynamic):Void;
	public  function attributesAtIndex( location:Int,  range:NSRangePointer):NSDictionary;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function attributesAtIndex1( location:Int,  range:NSRangePointer,  rangeLimit:NSRange):NSDictionary;
	public  function replaceCharactersInRange( range:NSRange,  str:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function replaceCharactersInRange1( range:NSRange,  attrString:NSAttributedString):Void;
	public  function removeAttribute( name:String,  range:NSRange):Void;
	public  function string():String;
	public  function attributedSubstringFromRange( range:NSRange):NSAttributedString;
	public  function enumerateAttribute( attrName:String,  enumerationRange:NSRange,  opts:NSAttributedStringEnumerationOptions,  block:Dynamic):Void;
	public  function initWithString( str:String):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithString1( str:String,  attrs:NSDictionary):Dynamic;
	public  function setAttributes( attrs:NSDictionary,  range:NSRange):Void;
	public  function attribute( attrName:String,  location:Int,  range:NSRangePointer):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function attribute1( attrName:String,  location:Int,  range:NSRangePointer,  rangeLimit:NSRange):Dynamic;
	public  function mutableString():NSMutableString;
	public  function addAttributes( attrs:NSDictionary,  range:NSRange):Void;
	public  function insertAttributedString( attrString:NSAttributedString,  loc:Int):Void;
}

extern enum NSAttributedStringEnumerationOptions
{
	NSAttributedStringEnumerationReverse;
	NSAttributedStringEnumerationLongestEffectiveRangeNotRequired;
}

