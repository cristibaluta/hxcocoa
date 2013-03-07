package objc.foundation;
import objc.foundation.NSObject;


extern class NSValue extends NSObject implements NSCopying implements NSSecureCoding {

	public function getValue (value:Void) :Void;
	public function objCType () :String;

// NSValueCreation

	public function initWithBytes (value:Void, objCType:String) :Void;
	public static function valueWithBytes (value:Void, objCType:String) :NSValue;
	public static function value (value:Void, withObjCType:String) :NSValue;

// NSValueExtensionMethods

	public static function valueWithNonretainedObject (anObject:Dynamic) :NSValue;
	public function nonretainedObjectValue () :NSValue;

	public static function valueWithPointer (pointer:Void) :NSValue;
	public function pointerValue () :Void;

	public function isEqualToValue (value:NSValue) :Bool;

}

extern class NSNumber extends NSValue {

	public function charValue () :String;
	public function unsignedCharValue () :String;
//- (short)shortValue;
//- (unsigned short)unsignedShortValue;
	public function intValue () :Int;
	public function unsignedIntValue () :Int;
//- (long)longValue;
//- (unsigned long)unsignedLongValue;
//- (long long)longLongValue;
//- (unsigned long long)unsignedLongLongValue;
	public function floatValue () :Float;
	//public function  (double)doubleValue;
	public function boolValue () :Bool;
	public function integerValue () :Int;
	public function unsignedIntegerValue () :Int;

	public function stringValue () :String;

	public function compare (otherNumber:NSNumber) :NSComparisonResult;

	public function isEqualToNumber (number:Number) :Bool;

	public function descriptionWithLocale (locale:Dynamic) :String;


// NSNumberCreation

	public function initWithChar (value:String) :NSNumber;
	public function initWithUnsignedChar (value:String) :NSNumber;
	//public function initWithShort (short)value) :NSNumber;
	//public function initWithUnsignedShort (unsigned short)value) :NSNumber;
	public function initWithInt (value:Int) :NSNumber;
	public function initWithUnsignedInt (value:Int) :NSNumber;
	//public function initWithLong (long)value) :NSNumber;
	//public function initWithUnsignedLong (unsigned long)value) :NSNumber;
	//public function initWithLongLong (long long)value) :NSNumber;
	//public function initWithUnsignedLongLong (unsigned long long)value) :NSNumber;
	public function initWithFloat (value:Float) :NSNumber;
	//public function initWithDouble (double)value) :NSNumber;
	public function initWithBool (value:Bool) :NSNumber;
	public function initWithInteger (value:Int) :NSNumber;
	public function initWithUnsignedInteger (value:Int) :NSNumber;

	public static function numberWithChar (value:String) :NSNumber;
	public static function numberWithUnsignedChar (value:String) :NSNumber;
	//public static function numberWithShort (short)value) :NSNumber;
	//public static function numberWithUnsignedShort (unsigned short)value) :NSNumber;
	public static function numberWithInt (value:Int) :NSNumber;
	public static function numberWithUnsignedInt (value:Int) :NSNumber;
	//public static function numberWithLong (value:Float) :NSNumber;
	//public static function numberWithUnsignedLong (value:Float) :NSNumber;
	//public static function numberWithLongLong (value:Float) :NSNumber;
	//public static function numberWithUnsignedLongLong (value:Float) :NSNumber;
	public static function numberWithFloat (value:Float) :NSNumber;
	//public static function numberWithDouble (value:Float) :NSNumber;
	public static function numberWithBool (value:Bool) :NSNumber;
	public static function numberWithInteger (value:Int) :NSNumber;
	public static function numberWithUnsignedInteger (value:Int) :NSNumber;

}

