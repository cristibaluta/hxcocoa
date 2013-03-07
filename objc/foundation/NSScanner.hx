package objc.foundation;


extern class NSScanner implements NSCopying
{

	//Constants

	//Static Methods
	public  function scannerWithString( string:String):Dynamic;
	public  function localizedScannerWithString( string:String):Dynamic;

	//Properties

	//Methods
	public  function scanLongLong( value:longlong):Bool;
	public  function setCaseSensitive( flag:Bool):Void;
	public  function scanInt( value:int):Bool;
	public  function scanHexLongLong( result:unsignedlonglong):Bool;
	public  function scanInteger( value:Int):Bool;
	public  function scanHexDouble( result:double):Bool;
	public  function scanFloat( value:float):Bool;
	public  function scanCharactersFromSet( set:NSCharacterSet,  value:NSString*):Bool;
	public  function string():String;
	public  function setScanLocation( pos:Int):Void;
	public  function scanHexFloat( result:float):Bool;
	public  function locale():Dynamic;
	public  function scanUpToString( string:String,  value:NSString*):Bool;
	public  function initWithString( string:String):Dynamic;
	public  function scanLocation():Int;
	public  function setCharactersToBeSkipped( set:NSCharacterSet):Void;
	public  function setLocale( locale:Dynamic):Void;
	public  function charactersToBeSkipped():NSCharacterSet;
	public  function scanDouble( value:double):Bool;
	public  function isAtEnd():Bool;
	public  function scanHexInt( value:unsigned):Bool;
	public  function scanUpToCharactersFromSet( set:NSCharacterSet,  value:NSString*):Bool;
	public  function caseSensitive():Bool;
	public  function scanString( string:String,  value:NSString*):Bool;
}

/*	NSScanner.h
	Copyright (c) 1994-2012, Apple Inc. All rights reserved.
*/

#import <Foundation/NSObject.h>

@class NSString, NSCharacterSet, NSDictionary;

extern class NSScanner extends NSObject implements NSCopying>

- (NSString *)string;
- (NSUInteger)scanLocation;
- (void)setScanLocation:(NSUInteger)pos;
- (void)setCharactersToBeSkipped:(NSCharacterSet *)set;
- (void)setCaseSensitive:(Bool)flag;
- (void)setLocale:(id)locale;

}

extern class NSScanner (NSExtendedScanner)

- (NSCharacterSet *)charactersToBeSkipped;
- (Bool)caseSensitive;
- (id)locale;

- (Bool)scanInt:(int *)value;
- (Bool)scanInteger:(NSInteger *)value NS_AVAILABLE(10_5, 2_0);
- (Bool)scanHexLongLong:(unsigned long long *)result NS_AVAILABLE(10_5, 2_0);
- (Bool)scanHexFloat:(float *)result NS_AVAILABLE(10_5, 2_0);		// Corresponding to %a or %A formatting. Requires "0x" or "0X" prefix. 
- (Bool)scanHexDouble:(double *)result NS_AVAILABLE(10_5, 2_0);		// Corresponding to %a or %A formatting. Requires "0x" or "0X" prefix. 
- (Bool)scanHexInt:(unsigned *)value;		// Optionally prefixed with "0x" or "0X"
- (Bool)scanLongLong:(long long *)value;
- (Bool)scanFloat:(float *)value;
- (Bool)scanDouble:(double *)value;

- (Bool)scanString:(NSString *)string intoString:(NSString **)value;
- (Bool)scanCharactersFromSet:(NSCharacterSet *)set intoString:(NSString **)value;

- (Bool)scanUpToString:(NSString *)string intoString:(NSString **)value;
- (Bool)scanUpToCharactersFromSet:(NSCharacterSet *)set intoString:(NSString **)value;

- (Bool)isAtEnd;

- (id)initWithString:(NSString *)string;
+ (id)scannerWithString:(NSString *)string;
+ (id)localizedScannerWithString:(NSString *)string;

}

