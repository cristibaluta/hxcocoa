package objc.foundation;


extern class NSDateFormatter extends NSFormatter
{

	//Constants

	//Static Methods
	public  function localizedStringFromDate( date:Date,  dstyle:NSDateFormatterStyle,  tstyle:NSDateFormatterStyle):String;
	public  function defaultFormatterBehavior():NSDateFormatterBehavior;
	public  function setDefaultFormatterBehavior( behavior:NSDateFormatterBehavior):Void;
	public  function dateFormatFromTemplate( tmplate:String,  opts:Int,  locale:NSLocale):String;

	//Properties

	//Methods
	public  function timeZone():NSTimeZone;
	public  function twoDigitStartDate():Date;
	public  function setDoesRelativeDateFormatting( b:Bool):Void;
	public  function setLongEraSymbols( array:Array<>):Void;
	public  function formatterBehavior():NSDateFormatterBehavior;
	public  function shortStandaloneQuarterSymbols():Array<>;
	public  function calendar():NSCalendar;
	public  function setShortStandaloneQuarterSymbols( array:Array<>):Void;
	public  function isLenient():Bool;
	public  function setMonthSymbols( array:Array<>):Void;
	public  function shortQuarterSymbols():Array<>;
	public  function setLocale( locale:NSLocale):Void;
	public  function dateFromString( string:String):Date;
	public  function dateStyle():NSDateFormatterStyle;
	public  function setLenient( b:Bool):Void;
	public  function PMSymbol():String;
	public  function setTimeStyle( style:NSDateFormatterStyle):Void;
	public  function setVeryShortWeekdaySymbols( array:Array<>):Void;
	public  function setGeneratesCalendarDates( b:Bool):Void;
	public  function setStandaloneWeekdaySymbols( array:Array<>):Void;
	public  function veryShortStandaloneWeekdaySymbols():Array<>;
	public  function gregorianStartDate():Date;
	public  function timeStyle():NSDateFormatterStyle;
	public  function dateFormat():String;
	public  function setTimeZone( tz:NSTimeZone):Void;
	public  function setShortStandaloneMonthSymbols( array:Array<>):Void;
	public  function veryShortWeekdaySymbols():Array<>;
	public  function setVeryShortStandaloneMonthSymbols( array:Array<>):Void;
	public  function setVeryShortStandaloneWeekdaySymbols( array:Array<>):Void;
	public  function shortMonthSymbols():Array<>;
	public  function setPMSymbol( string:String):Void;
	public  function setStandaloneMonthSymbols( array:Array<>):Void;
	public override function getObjectValue( obj:outid,  string:String,  rangep:inoutNSRange,  error:outNSError*):Bool;
	public  function AMSymbol():String;
	public  function stringFromDate( date:Date):String;
	public  function setShortMonthSymbols( array:Array<>):Void;
	public  function setShortWeekdaySymbols( array:Array<>):Void;
	public  function weekdaySymbols():Array<>;
	public  function initWithDateFormat( format:String,  flag:Bool):Dynamic;
	public  function shortWeekdaySymbols():Array<>;
	public  function longEraSymbols():Array<>;
	public  function setTwoDigitStartDate( date:Date):Void;
	public  function setDefaultDate( date:Date):Void;
	public  function allowsNaturalLanguage():Bool;
	public  function locale():NSLocale;
	public  function setAMSymbol( string:String):Void;
	public  function setEraSymbols( array:Array<>):Void;
	public  function standaloneWeekdaySymbols():Array<>;
	public  function setDateFormat( string:String):Void;
	public  function defaultDate():Date;
	public  function shortStandaloneWeekdaySymbols():Array<>;
	public  function generatesCalendarDates():Bool;
	public  function setShortQuarterSymbols( array:Array<>):Void;
	public  function eraSymbols():Array<>;
	public  function monthSymbols():Array<>;
	public  function setWeekdaySymbols( array:Array<>):Void;
	public  function quarterSymbols():Array<>;
	public  function setGregorianStartDate( date:Date):Void;
	public  function setDateStyle( style:NSDateFormatterStyle):Void;
	public  function veryShortStandaloneMonthSymbols():Array<>;
	public  function setStandaloneQuarterSymbols( array:Array<>):Void;
	public  function setCalendar( calendar:NSCalendar):Void;
	public  function shortStandaloneMonthSymbols():Array<>;
	public  function setFormatterBehavior( behavior:NSDateFormatterBehavior):Void;
	public  function setShortStandaloneWeekdaySymbols( array:Array<>):Void;
	public  function veryShortMonthSymbols():Array<>;
	public  function setVeryShortMonthSymbols( array:Array<>):Void;
	public  function setQuarterSymbols( array:Array<>):Void;
	public  function standaloneMonthSymbols():Array<>;
	public  function standaloneQuarterSymbols():Array<>;
	public  function doesRelativeDateFormatting():Bool;
}

extern enum NSDateFormatterBehavior
{
	NSDateFormatterBehaviorDefault;
	#if;
	#endif;
}

/*	NSDateFormatter.h
	Copyright (c) 1995-2012, Apple Inc. All rights reserved.
*/

#import <Foundation/NSFormatter.h>
#include <CoreFoundation/CFDateFormatter.h>

@class NSLocale, NSDate, NSCalendar, NSTimeZone, NSError, Array<>, NSMutableDictionary;

extern class NSDateFormatter extends NSFormatter {
@private
    NSMutableDictionary *_attributes;
    __strong CFDateFormatterRef _formatter;
    NSUInteger _counter;
}

// - (id)init; // designated initializer

// Report the used range of the string and an NSError, in addition to the usual stuff from NSFormatter

- (Bool)getObjectValue:(out id *)obj forString:(NSString *)string range:(inout NSRange *)rangep error:(out NSError **)error;

// Even though NSDateFormatter responds to the usual NSFormatter methods,
//   here are some convenience methods which are a little more obvious.

- (NSString *)stringFromDate:(NSDate *)date;
- (NSDate *)dateFromString:(NSString *)string;

typedef NS_ENUM(NSUInteger, NSDateFormatterStyle) {    // date and time format styles
    NSDateFormatterNoStyle = kCFDateFormatterNoStyle,
    NSDateFormatterShortStyle = kCFDateFormatterShortStyle,
    NSDateFormatterMediumStyle = kCFDateFormatterMediumStyle,
    NSDateFormatterLongStyle = kCFDateFormatterLongStyle,
    NSDateFormatterFullStyle = kCFDateFormatterFullStyle
};

typedef NS_ENUM(NSUInteger, NSDateFormatterBehavior) {
    NSDateFormatterBehaviorDefault = 0,
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
    NSDateFormatterBehavior10_0 = 1000,
#endif
    NSDateFormatterBehavior10_4 = 1040,
};


+ (NSString *)localizedStringFromDate:(NSDate *)date dateStyle:(NSDateFormatterStyle)dstyle timeStyle:(NSDateFormatterStyle)tstyle NS_AVAILABLE(10_6, 4_0);

+ (NSString *)dateFormatFromTemplate:(NSString *)tmplate options:(NSUInteger)opts locale:(NSLocale *)locale NS_AVAILABLE(10_6, 4_0);
	// no options defined, pass 0 for now

// Attributes of an NSDateFormatter

- (NSString *)dateFormat;

- (NSDateFormatterStyle)dateStyle;
- (void)setDateStyle:(NSDateFormatterStyle)style;

- (NSDateFormatterStyle)timeStyle;
- (void)setTimeStyle:(NSDateFormatterStyle)style;

- (NSLocale *)locale;
- (void)setLocale:(NSLocale *)locale;

- (Bool)generatesCalendarDates;
- (void)setGeneratesCalendarDates:(Bool)b;

- (NSDateFormatterBehavior)formatterBehavior;
- (void)setFormatterBehavior:(NSDateFormatterBehavior)behavior;

+ (NSDateFormatterBehavior)defaultFormatterBehavior;
+ (void)setDefaultFormatterBehavior:(NSDateFormatterBehavior)behavior;

- (void)setDateFormat:(NSString *)string;

- (NSTimeZone *)timeZone;
- (void)setTimeZone:(NSTimeZone *)tz;

- (NSCalendar *)calendar;
- (void)setCalendar:(NSCalendar *)calendar;

- (Bool)isLenient;
- (void)setLenient:(Bool)b;

- (NSDate *)twoDigitStartDate;
- (void)setTwoDigitStartDate:(NSDate *)date;

- (NSDate *)defaultDate;
- (void)setDefaultDate:(NSDate *)date;

- (Array<> *)eraSymbols;
- (void)setEraSymbols:(Array<> *)array;

- (Array<> *)monthSymbols;
- (void)setMonthSymbols:(Array<> *)array;

- (Array<> *)shortMonthSymbols;
- (void)setShortMonthSymbols:(Array<> *)array;

- (Array<> *)weekdaySymbols;
- (void)setWeekdaySymbols:(Array<> *)array;

- (Array<> *)shortWeekdaySymbols;
- (void)setShortWeekdaySymbols:(Array<> *)array;

- (NSString *)AMSymbol;
- (void)setAMSymbol:(NSString *)string;

- (NSString *)PMSymbol;
- (void)setPMSymbol:(NSString *)string;

- (Array<> *)longEraSymbols NS_AVAILABLE(10_5, 2_0);
- (void)setLongEraSymbols:(Array<> *)array NS_AVAILABLE(10_5, 2_0);

- (Array<> *)veryShortMonthSymbols NS_AVAILABLE(10_5, 2_0);
- (void)setVeryShortMonthSymbols:(Array<> *)array NS_AVAILABLE(10_5, 2_0);

- (Array<> *)standaloneMonthSymbols NS_AVAILABLE(10_5, 2_0);
- (void)setStandaloneMonthSymbols:(Array<> *)array NS_AVAILABLE(10_5, 2_0);

- (Array<> *)shortStandaloneMonthSymbols NS_AVAILABLE(10_5, 2_0);
- (void)setShortStandaloneMonthSymbols:(Array<> *)array NS_AVAILABLE(10_5, 2_0);

- (Array<> *)veryShortStandaloneMonthSymbols NS_AVAILABLE(10_5, 2_0);
- (void)setVeryShortStandaloneMonthSymbols:(Array<> *)array NS_AVAILABLE(10_5, 2_0);

- (Array<> *)veryShortWeekdaySymbols NS_AVAILABLE(10_5, 2_0);
- (void)setVeryShortWeekdaySymbols:(Array<> *)array NS_AVAILABLE(10_5, 2_0);

- (Array<> *)standaloneWeekdaySymbols NS_AVAILABLE(10_5, 2_0);
- (void)setStandaloneWeekdaySymbols:(Array<> *)array NS_AVAILABLE(10_5, 2_0);

- (Array<> *)shortStandaloneWeekdaySymbols NS_AVAILABLE(10_5, 2_0);
- (void)setShortStandaloneWeekdaySymbols:(Array<> *)array NS_AVAILABLE(10_5, 2_0);

- (Array<> *)veryShortStandaloneWeekdaySymbols NS_AVAILABLE(10_5, 2_0);
- (void)setVeryShortStandaloneWeekdaySymbols:(Array<> *)array NS_AVAILABLE(10_5, 2_0);

- (Array<> *)quarterSymbols NS_AVAILABLE(10_5, 2_0);
- (void)setQuarterSymbols:(Array<> *)array NS_AVAILABLE(10_5, 2_0);

- (Array<> *)shortQuarterSymbols NS_AVAILABLE(10_5, 2_0);
- (void)setShortQuarterSymbols:(Array<> *)array NS_AVAILABLE(10_5, 2_0);

- (Array<> *)standaloneQuarterSymbols NS_AVAILABLE(10_5, 2_0);
- (void)setStandaloneQuarterSymbols:(Array<> *)array NS_AVAILABLE(10_5, 2_0);

- (Array<> *)shortStandaloneQuarterSymbols NS_AVAILABLE(10_5, 2_0);
- (void)setShortStandaloneQuarterSymbols:(Array<> *)array NS_AVAILABLE(10_5, 2_0);

- (NSDate *)gregorianStartDate NS_AVAILABLE(10_5, 2_0);
- (void)setGregorianStartDate:(NSDate *)date NS_AVAILABLE(10_5, 2_0);

- (Bool)doesRelativeDateFormatting NS_AVAILABLE(10_6, 4_0);
- (void)setDoesRelativeDateFormatting:(Bool)b NS_AVAILABLE(10_6, 4_0);

}

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
extern class NSDateFormatter (NSDateFormatterCompatibility)

- (id)initWithDateFormat:(NSString *)format allowNaturalLanguage:(Bool)flag;
- (Bool)allowsNaturalLanguage;

}
#endif

