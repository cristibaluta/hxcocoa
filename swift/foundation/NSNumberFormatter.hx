package swift.foundation;


extern class NSNumberFormatter extends NSFormatter
{

	//Constants

	//Static Methods
	public function localizedStringFromNumber( num:Float,  nstyle:NSNumberFormatterStyle):String;
	public function defaultFormatterBehavior():NSNumberFormatterBehavior;
	public function setDefaultFormatterBehavior( behavior:NSNumberFormatterBehavior):Void;

	//Properties

	//Methods
	public function setTextAttributesForNegativeValues( newAttributes:NSDictionary):Void;
	public function setTextAttributesForNotANumber( newAttributes:NSDictionary):Void;
	public function negativeSuffix():String;
	public function setMaximumFractionDigits( number:Int):Void;
	public function positivePrefix():String;
	public function decimalSeparator():String;
	public function textAttributesForPositiveInfinity():NSDictionary;
	public function nilSymbol():String;
	public function isLenient():Bool;
	public function positiveFormat():String;
	public function setTextAttributesForNil( newAttributes:NSDictionary):Void;
	public function setLocale( locale:NSLocale):Void;
	public function isPartialStringValidationEnabled():Bool;
	public function generatesDecimalNumbers():Bool;
	public function setAllowsFloats( flag:Bool):Void;
	public function currencySymbol():String;
	public function format():String;
	public function setGroupingSeparator( string:String):Void;
	public function setFormatWidth( number:Int):Void;
	public function setExponentSymbol( string:String):Void;
	public function setCurrencyGroupingSeparator( string:String):Void;
	public function zeroSymbol():String;
	public function roundingIncrement():Float;
	public function notANumberSymbol():String;
	public function alwaysShowsDecimalSeparator():Bool;
	public function minimumFractionDigits():Int;
	public function minusSign():String;
	public function exponentSymbol():String;
	public override function getObjectValue( obj:outid,  string:String,  rangep:inoutNSRange,  error:outNSError*):Bool;
	public function numberStyle():NSNumberFormatterStyle;
	public function setUsesGroupingSeparator( b:Bool):Void;
	public function setNegativeFormat( format:String):Void;
	public function setTextAttributesForPositiveValues( newAttributes:NSDictionary):Void;
	public function setAttributedStringForZero( newAttributedString:NSAttributedString):Void;
	public function groupingSize():Int;
	public function positiveInfinitySymbol():String;
	public function setNegativeInfinitySymbol( string:String):Void;
	public function localizesFormat():Bool;
	public function locale():NSLocale;
	public function usesGroupingSeparator():Bool;
	public function minimum():Float;
	public function setMaximum( number:Float):Void;
	public function setNotANumberSymbol( string:String):Void;
	public function negativePrefix():String;
	public function setPlusSign( string:String):Void;
	public function maximumFractionDigits():Int;
	public function setHasThousandSeparators( flag:Bool):Void;
	public function allowsFloats():Bool;
	public function setCurrencySymbol( string:String):Void;
	public function setAttributedStringForNotANumber( newAttributedString:NSAttributedString):Void;
	public function setPaddingCharacter( string:String):Void;
	public function hasThousandSeparators():Bool;
	public function setPerMillSymbol( string:String):Void;
	public function currencyGroupingSeparator():String;
	public function numberFromString( string:String):Float;
	public function negativeFormat():String;
	public function textAttributesForPositiveValues():NSDictionary;
	public function setTextAttributesForPositiveInfinity( newAttributes:NSDictionary):Void;
	public function setMinimumIntegerDigits( number:Int):Void;
	public function currencyDecimalSeparator():String;
	public function setThousandSeparator( newSeparator:String):Void;
	public function setFormat( string:String):Void;
	public function groupingSeparator():String;
	public function textAttributesForNegativeInfinity():NSDictionary;
	public function setRoundingMode( mode:NSNumberFormatterRoundingMode):Void;
	public function setCurrencyCode( string:String):Void;
	public function maximum():Float;
	public function setPartialStringValidationEnabled( b:Bool):Void;
	public function attributedStringForNil():NSAttributedString;
	public function setNegativePrefix( string:String):Void;
	public function setMinimumSignificantDigits( number:Int):Void;
	public function setGroupingSize( number:Int):Void;
	public function formatterBehavior():NSNumberFormatterBehavior;
	public function secondaryGroupingSize():Int;
	public function setAlwaysShowsDecimalSeparator( b:Bool):Void;
	public function setPaddingPosition( position:NSNumberFormatterPadPosition):Void;
	public function setAttributedStringForNil( newAttributedString:NSAttributedString):Void;
	public function setPositiveFormat( format:String):Void;
	public function setMinusSign( string:String):Void;
	public function setPositiveSuffix( string:String):Void;
	public function setPositiveInfinitySymbol( string:String):Void;
	public function negativeInfinitySymbol():String;
	public function formatWidth():Int;
	public function setLenient( b:Bool):Void;
	public function minimumIntegerDigits():Int;
	public function setNilSymbol( string:String):Void;
	public function plusSign():String;
	public function usesSignificantDigits():Bool;
	public function setUsesSignificantDigits( b:Bool):Void;
	public function minimumSignificantDigits():Int;
	public function setMinimumFractionDigits( number:Int):Void;
	public function setInternationalCurrencySymbol( string:String):Void;
	public function multiplier():Float;
	public function stringFromNumber( number:Float):String;
	public function positiveSuffix():String;
	public function setSecondaryGroupingSize( number:Int):Void;
	public function roundingBehavior():NSDecimalNumberHandler;
	public function setTextAttributesForNegativeInfinity( newAttributes:NSDictionary):Void;
	public function setNegativeSuffix( string:String):Void;
	public function maximumIntegerDigits():Int;
	public function setRoundingBehavior( newRoundingBehavior:NSDecimalNumberHandler):Void;
	public function maximumSignificantDigits():Int;
	public function setMaximumIntegerDigits( number:Int):Void;
	public function percentSymbol():String;
	public function setPercentSymbol( string:String):Void;
	public function textAttributesForNegativeValues():NSDictionary;
	public function setGeneratesDecimalNumbers( b:Bool):Void;
	public function thousandSeparator():String;
	public function setPositivePrefix( string:String):Void;
	public function roundingMode():NSNumberFormatterRoundingMode;
	public function attributedStringForZero():NSAttributedString;
	public function setNumberStyle( style:NSNumberFormatterStyle):Void;
	public function textAttributesForZero():NSDictionary;
	public function setRoundingIncrement( number:Float):Void;
	public function setMaximumSignificantDigits( number:Int):Void;
	public function paddingPosition():NSNumberFormatterPadPosition;
	public function perMillSymbol():String;
	public function setDecimalSeparator( string:String):Void;
	public function setZeroSymbol( string:String):Void;
	public function textAttributesForNotANumber():NSDictionary;
	public function setCurrencyDecimalSeparator( string:String):Void;
	public function setLocalizesFormat( flag:Bool):Void;
	public function setMinimum( number:Float):Void;
	public function internationalCurrencySymbol():String;
	public function setMultiplier( number:Float):Void;
	public function attributedStringForNotANumber():NSAttributedString;
	public function setFormatterBehavior( behavior:NSNumberFormatterBehavior):Void;
	public function currencyCode():String;
	public function setTextAttributesForZero( newAttributes:NSDictionary):Void;
	public function textAttributesForNil():NSDictionary;
	public function paddingCharacter():String;
}

extern enum NSNumberFormatterStyle
{
	NSNumberFormatterNoStyle;
	NSNumberFormatterDecimalStyle;
	NSNumberFormatterCurrencyStyle;
	NSNumberFormatterPercentStyle;
	NSNumberFormatterScientificStyle;
	NSNumberFormatterSpellOutStyle;
}

extern enum NSNumberFormatterBehavior
{
	NSNumberFormatterBehaviorDefault;
	#if;
	#endif;
}

extern enum NSNumberFormatterPadPosition
{
	NSNumberFormatterPadBeforePrefix;
	NSNumberFormatterPadAfterPrefix;
	NSNumberFormatterPadBeforeSuffix;
	NSNumberFormatterPadAfterSuffix;
}

extern enum NSNumberFormatterRoundingMode
{
	NSNumberFormatterRoundCeiling;
	NSNumberFormatterRoundFloor;
	NSNumberFormatterRoundDown;
	NSNumberFormatterRoundUp;
	NSNumberFormatterRoundHalfEven;
	NSNumberFormatterRoundHalfDown;
	NSNumberFormatterRoundHalfUp;
}

/*	NSNumberFormatter.h
	Copyright (c) 1996-2012, Apple Inc. All rights reserved.
*/

#import <Foundation/NSFormatter.h>
#include <CoreFoundation/CFNumberFormatter.h>

@class NSLocale, NSError, NSMutableDictionary;

extern class NSNumberFormatter extends NSFormatter {
@private
    NSMutableDictionary	*_attributes;
    __strong CFNumberFormatterRef _formatter;
    NSUInteger _counter;
    void *_reserved[12];
}

// - (id)init; // designated initializer

// Report the used range of the string and an NSError, in addition to the usual stuff from NSFormatter

- (Bool)getObjectValue:(out id *)obj forString:(NSString *)string range:(inout NSRange *)rangep error:(out NSError **)error;

// Even though NSNumberFormatter responds to the usual NSFormatter methods,
//   here are some convenience methods which are a little more obvious.

- (NSString *)stringFromNumber:(NSNumber *)number;
- (NSNumber *)numberFromString:(NSString *)string;

typedef NS_ENUM(NSUInteger, NSNumberFormatterStyle) {
    NSNumberFormatterNoStyle = kCFNumberFormatterNoStyle,
    NSNumberFormatterDecimalStyle = kCFNumberFormatterDecimalStyle,
    NSNumberFormatterCurrencyStyle = kCFNumberFormatterCurrencyStyle,
    NSNumberFormatterPercentStyle = kCFNumberFormatterPercentStyle,
    NSNumberFormatterScientificStyle = kCFNumberFormatterScientificStyle,
    NSNumberFormatterSpellOutStyle = kCFNumberFormatterSpellOutStyle
};

typedef NS_ENUM(NSUInteger, NSNumberFormatterBehavior) {
    NSNumberFormatterBehaviorDefault = 0,
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
    NSNumberFormatterBehavior10_0 = 1000,
#endif
    NSNumberFormatterBehavior10_4 = 1040,
};


+ (NSString *)localizedStringFromNumber:(NSNumber *)num numberStyle:(NSNumberFormatterStyle)nstyle NS_AVAILABLE(10_6, 4_0);

// Attributes of an NSNumberFormatter

- (NSNumberFormatterStyle)numberStyle;
public function setNumberStyle:(NSNumberFormatterStyle)style;

- (NSLocale *)locale;
public function setLocale:(NSLocale *)locale;

- (Bool)generatesDecimalNumbers;
public function setGeneratesDecimalNumbers:(Bool)b;

- (NSNumberFormatterBehavior)formatterBehavior;
public function setFormatterBehavior:(NSNumberFormatterBehavior)behavior;

+ (NSNumberFormatterBehavior)defaultFormatterBehavior;
+ (void)setDefaultFormatterBehavior:(NSNumberFormatterBehavior)behavior;

- (NSString *)negativeFormat;
public function setNegativeFormat:(NSString *)format;

- (NSDictionary *)textAttributesForNegativeValues;
public function setTextAttributesForNegativeValues:(NSDictionary *)newAttributes;

- (NSString *)positiveFormat;
public function setPositiveFormat:(NSString *)format;

- (NSDictionary *)textAttributesForPositiveValues;
public function setTextAttributesForPositiveValues:(NSDictionary *)newAttributes;

- (Bool)allowsFloats;
public function setAllowsFloats:(Bool)flag;

- (NSString *)decimalSeparator;
public function setDecimalSeparator:(NSString *)string;

- (Bool)alwaysShowsDecimalSeparator;
public function setAlwaysShowsDecimalSeparator:(Bool)b;

- (NSString *)currencyDecimalSeparator;
public function setCurrencyDecimalSeparator:(NSString *)string;

- (Bool)usesGroupingSeparator;
public function setUsesGroupingSeparator:(Bool)b;

- (NSString *)groupingSeparator;
public function setGroupingSeparator:(NSString *)string;


- (NSString *)zeroSymbol;
public function setZeroSymbol:(NSString *)string;

- (NSDictionary *)textAttributesForZero;
public function setTextAttributesForZero:(NSDictionary *)newAttributes;

- (NSString *)nilSymbol;
public function setNilSymbol:(NSString *)string;

- (NSDictionary *)textAttributesForNil;
public function setTextAttributesForNil:(NSDictionary *)newAttributes;

- (NSString *)notANumberSymbol;
public function setNotANumberSymbol:(NSString *)string;

- (NSDictionary *)textAttributesForNotANumber;
public function setTextAttributesForNotANumber:(NSDictionary *)newAttributes;

- (NSString *)positiveInfinitySymbol;
public function setPositiveInfinitySymbol:(NSString *)string;

- (NSDictionary *)textAttributesForPositiveInfinity;
public function setTextAttributesForPositiveInfinity:(NSDictionary *)newAttributes;

- (NSString *)negativeInfinitySymbol;
public function setNegativeInfinitySymbol:(NSString *)string;

- (NSDictionary *)textAttributesForNegativeInfinity;
public function setTextAttributesForNegativeInfinity:(NSDictionary *)newAttributes;


- (NSString *)positivePrefix;
public function setPositivePrefix:(NSString *)string;

- (NSString *)positiveSuffix;
public function setPositiveSuffix:(NSString *)string;

- (NSString *)negativePrefix;
public function setNegativePrefix:(NSString *)string;

- (NSString *)negativeSuffix;
public function setNegativeSuffix:(NSString *)string;

- (NSString *)currencyCode;
public function setCurrencyCode:(NSString *)string;

- (NSString *)currencySymbol;
public function setCurrencySymbol:(NSString *)string;

- (NSString *)internationalCurrencySymbol;
public function setInternationalCurrencySymbol:(NSString *)string;

- (NSString *)percentSymbol;
public function setPercentSymbol:(NSString *)string;

- (NSString *)perMillSymbol;
public function setPerMillSymbol:(NSString *)string;

- (NSString *)minusSign;
public function setMinusSign:(NSString *)string;

- (NSString *)plusSign;
public function setPlusSign:(NSString *)string;

- (NSString *)exponentSymbol;
public function setExponentSymbol:(NSString *)string;


- (NSUInteger)groupingSize;
public function setGroupingSize:(NSUInteger)number;

- (NSUInteger)secondaryGroupingSize;
public function setSecondaryGroupingSize:(NSUInteger)number;

- (NSNumber *)multiplier;
public function setMultiplier:(NSNumber *)number;

- (NSUInteger)formatWidth;
public function setFormatWidth:(NSUInteger)number;

- (NSString *)paddingCharacter;
public function setPaddingCharacter:(NSString *)string;


typedef NS_ENUM(NSUInteger, NSNumberFormatterPadPosition) {
    NSNumberFormatterPadBeforePrefix = kCFNumberFormatterPadBeforePrefix,
    NSNumberFormatterPadAfterPrefix = kCFNumberFormatterPadAfterPrefix,
    NSNumberFormatterPadBeforeSuffix = kCFNumberFormatterPadBeforeSuffix,
    NSNumberFormatterPadAfterSuffix = kCFNumberFormatterPadAfterSuffix
};

typedef NS_ENUM(NSUInteger, NSNumberFormatterRoundingMode) {
    NSNumberFormatterRoundCeiling = kCFNumberFormatterRoundCeiling,
    NSNumberFormatterRoundFloor = kCFNumberFormatterRoundFloor,
    NSNumberFormatterRoundDown = kCFNumberFormatterRoundDown,
    NSNumberFormatterRoundUp = kCFNumberFormatterRoundUp,
    NSNumberFormatterRoundHalfEven = kCFNumberFormatterRoundHalfEven,
    NSNumberFormatterRoundHalfDown = kCFNumberFormatterRoundHalfDown,
    NSNumberFormatterRoundHalfUp = kCFNumberFormatterRoundHalfUp
};


- (NSNumberFormatterPadPosition)paddingPosition;
public function setPaddingPosition:(NSNumberFormatterPadPosition)position;

- (NSNumberFormatterRoundingMode)roundingMode;
public function setRoundingMode:(NSNumberFormatterRoundingMode)mode;

- (NSNumber *)roundingIncrement;
public function setRoundingIncrement:(NSNumber *)number;

- (NSUInteger)minimumIntegerDigits;
public function setMinimumIntegerDigits:(NSUInteger)number;

- (NSUInteger)maximumIntegerDigits;
public function setMaximumIntegerDigits:(NSUInteger)number;

- (NSUInteger)minimumFractionDigits;
public function setMinimumFractionDigits:(NSUInteger)number;

- (NSUInteger)maximumFractionDigits;
public function setMaximumFractionDigits:(NSUInteger)number;

- (NSNumber *)minimum;
public function setMinimum:(NSNumber *)number;

- (NSNumber *)maximum;
public function setMaximum:(NSNumber *)number;

- (NSString *)currencyGroupingSeparator NS_AVAILABLE(10_5, 2_0);
public function setCurrencyGroupingSeparator:(NSString *)string NS_AVAILABLE(10_5, 2_0);

- (Bool)isLenient NS_AVAILABLE(10_5, 2_0);
public function setLenient:(Bool)b NS_AVAILABLE(10_5, 2_0);

- (Bool)usesSignificantDigits NS_AVAILABLE(10_5, 2_0);
public function setUsesSignificantDigits:(Bool)b NS_AVAILABLE(10_5, 2_0);

- (NSUInteger)minimumSignificantDigits NS_AVAILABLE(10_5, 2_0);
public function setMinimumSignificantDigits:(NSUInteger)number NS_AVAILABLE(10_5, 2_0);

- (NSUInteger)maximumSignificantDigits NS_AVAILABLE(10_5, 2_0);
public function setMaximumSignificantDigits:(NSUInteger)number NS_AVAILABLE(10_5, 2_0);

- (Bool)isPartialStringValidationEnabled NS_AVAILABLE(10_5, 2_0);
public function setPartialStringValidationEnabled:(Bool)b NS_AVAILABLE(10_5, 2_0);

}

@class NSDecimalNumberHandler;

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
extern class NSNumberFormatter (NSNumberFormatterCompatibility)

- (Bool)hasThousandSeparators;
public function setHasThousandSeparators:(Bool)flag;
- (NSString *)thousandSeparator;
public function setThousandSeparator:(NSString *)newSeparator;

- (Bool)localizesFormat;
public function setLocalizesFormat:(Bool)flag;

- (NSString *)format;
public function setFormat:(NSString *)string;

- (NSAttributedString *)attributedStringForZero;
public function setAttributedStringForZero:(NSAttributedString *)newAttributedString;
- (NSAttributedString *)attributedStringForNil;
public function setAttributedStringForNil:(NSAttributedString *)newAttributedString;
- (NSAttributedString *)attributedStringForNotANumber;
public function setAttributedStringForNotANumber:(NSAttributedString *)newAttributedString;

- (NSDecimalNumberHandler *)roundingBehavior;
public function setRoundingBehavior:(NSDecimalNumberHandler *)newRoundingBehavior;

}
#endif

