package objc.foundation;
import objc.foundation.NSObject;

@:framework("Foundation")
extern class NSCharacterSet extends NSObject implements NSCopying implements NSMutableCopying implements NSCoding {

	public  function decomposableCharacterSet():Dynamic;
	public  function symbolCharacterSet():Dynamic;
	public  function newlineCharacterSet():Dynamic;
	public  function lowercaseLetterCharacterSet():Dynamic;
	public  function punctuationCharacterSet():Dynamic;
	public  function alphanumericCharacterSet():Dynamic;
	public  function controlCharacterSet():Dynamic;
	public  function whitespaceCharacterSet():Dynamic;
	public  function characterSetWithContentsOfFile( fName:String):Dynamic;
	public  function characterSetWithBitmapRepresentation( data:NSData):Dynamic;
	public  function whitespaceAndNewlineCharacterSet():Dynamic;
	public  function letterCharacterSet():Dynamic;
	public  function uppercaseLetterCharacterSet():Dynamic;
	public  function nonBaseCharacterSet():Dynamic;
	public  function illegalCharacterSet():Dynamic;
	public  function capitalizedLetterCharacterSet():Dynamic;
	public  function characterSetWithCharactersInString( aString:String):Dynamic;
	public  function decimalDigitCharacterSet():Dynamic;
	public static function characterSetWithRange( aRange:NSRange):Dynamic;

	public  function invertedSet():NSCharacterSet;
	public  function isSupersetOfSet( theOtherSet:NSCharacterSet):Bool;
	public  function removeCharactersInString( aString:String):Void;
	public  function formIntersectionWithCharacterSet( otherSet:NSCharacterSet):Void;
	public  function invert():Void;
	public  function characterIsMember( aCharacter:String):Bool;
	public  function hasMemberInPlane( thePlane:Int):Bool;
	public  function formUnionWithCharacterSet( otherSet:NSCharacterSet):Void;
	public  function addCharactersInRange( aRange:NSRange):Void;
	public  function longCharacterIsMember( theLongChar:String):Bool;
	public  function removeCharactersInRange( aRange:NSRange):Void;
	public  function addCharactersInString( aString:String):Void;
	public  function bitmapRepresentation():NSData;
}

/*	

#import <CoreFoundation/CFCharacterSet.h>
import objc.foundation.NSObject;
#import <Foundation/NSRange.h>
#import <Foundation/NSString.h>

@class NSData;

enum {
    NSOpenStepUnicodeReservedBase = 0xF400
};

extern class NSCharacterSet extends NSObject implements NSCopying, NSMutableCopying, NSCoding>

+ (id)controlCharacterSet;
+ (id)whitespaceCharacterSet;
+ (id)whitespaceAndNewlineCharacterSet;
+ (id)decimalDigitCharacterSet;
+ (id)letterCharacterSet;
+ (id)lowercaseLetterCharacterSet;
+ (id)uppercaseLetterCharacterSet;
+ (id)nonBaseCharacterSet;
+ (id)alphanumericCharacterSet;
+ (id)decomposableCharacterSet;
+ (id)illegalCharacterSet;
+ (id)punctuationCharacterSet;
+ (id)capitalizedLetterCharacterSet;
+ (id)symbolCharacterSet;
+ (id)newlineCharacterSet NS_AVAILABLE(10_5, 2_0);

+ (id)characterSetWithRange:(NSRange)aRange;
+ (id)characterSetWithCharactersInString:(NSString *)aString;
+ (id)characterSetWithBitmapRepresentation:(NSData *)data;
+ (id)characterSetWithContentsOfFile:(NSString *)fName;

- (Bool)characterIsMember:(unichar)aCharacter;
- (NSData *)bitmapRepresentation;
- (NSCharacterSet *)invertedSet;

- (Bool)longCharacterIsMember:(UTF32Char)theLongChar;

- (Bool)isSupersetOfSet:(NSCharacterSet *)theOtherSet;
- (Bool)hasMemberInPlane:(uint8_t)thePlane;
}

extern class NSMutableCharacterSet extends NSCharacterSet <NSCopying, NSMutableCopying>

- (void)addCharactersInRange:(NSRange)aRange;
- (void)removeCharactersInRange:(NSRange)aRange;
- (void)addCharactersInString:(NSString *)aString;
- (void)removeCharactersInString:(NSString *)aString;
- (void)formUnionWithCharacterSet:(NSCharacterSet *)otherSet;
- (void)formIntersectionWithCharacterSet:(NSCharacterSet *)otherSet;
- (void)invert;

}
*/
