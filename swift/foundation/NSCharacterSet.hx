package swift.foundation;
import swift.foundation.NSObject;

@:framework("Foundation")
extern class NSCharacterSet extends NSObject implements NSCopying implements NSMutableCopying implements NSCoding {

	public function controlCharacterSet():NSCharacterSet;
	public function whitespaceCharacterSet():NSCharacterSet;
	public function whitespaceAndNewlineCharacterSet():NSCharacterSet;
	public function decimalDigitCharacterSet():NSCharacterSet;
	public function letterCharacterSet():NSCharacterSet;
	public function lowercaseLetterCharacterSet():NSCharacterSet;
	public function uppercaseLetterCharacterSet():NSCharacterSet;
	public function nonBaseCharacterSet():NSCharacterSet;
	public function alphanumericCharacterSet():NSCharacterSet;
	public function decomposableCharacterSet():NSCharacterSet;
	public function illegalCharacterSet():NSCharacterSet;
	public function punctuationCharacterSet():NSCharacterSet;
	public function capitalizedLetterCharacterSet():NSCharacterSet;
	public function symbolCharacterSet():NSCharacterSet;
	public function newlineCharacterSet():NSCharacterSet;

	public static function characterSetWithRange( aRange:NSRange):NSCharacterSet;
	public static function characterSetWithCharactersInString( aString:String):NSCharacterSet;
	public static function characterSetWithBitmapRepresentation( data:NSData):NSCharacterSet;
	public static function characterSetWithContentsOfFile( fName:String):NSCharacterSet;
	
	public function characterIsMember( aCharacter:String):Bool;
	public function bitmapRepresentation():NSData;
	public function invertedSet():NSCharacterSet;
	
	public function longCharacterIsMember( theLongChar:String):Bool;
	
	public function isSupersetOfSet( theOtherSet:NSCharacterSet):Bool;
	public function hasMemberInPlane( thePlane:Int):Bool;
	
}

@:framework("Foundation")
extern class NSMutableCharacterSet extends NSCharacterSet {

	public function addCharactersInRange( aRange:NSRange):Void;
	public function removeCharactersInRange( aRange:NSRange):Void;
	public function addCharactersInString( aString:String):Void;
	public function removeCharactersInString( aString:String):Void;
	public function formUnionWithCharacterSet( otherSet:NSCharacterSet):Void;
	public function formIntersectionWithCharacterSet( otherSet:NSCharacterSet):Void;
	public function invert():Void;

}
