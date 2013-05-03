package objc.foundation;
import objc.foundation.NSObject;
private typedef NSTimeInterval = Int;

@:framework("Foundation")
extern class NSTimeZone extends NSObject implements NSCopying implements NSSecureCoding {

	//Constants

	//Static Methods
	public function defaultTimeZone() :NSTimeZone;
	public function knownTimeZoneNames() :Array<NSTimeZone>;
	public function timeZoneDataVersion():String;
	public function localTimeZone():NSTimeZone;
	public function resetSystemTimeZone():Void;
	public function timeZoneWithName( tzName:String):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public function timeZoneWithName1( tzName:String,  aData:NSData):Dynamic;
	public function abbreviationDictionary():NSDictionary;
	public function timeZoneForSecondsFromGMT( seconds:Int):Dynamic;
	public function systemTimeZone():NSTimeZone;
	public function setDefaultTimeZone( aTimeZone:NSTimeZone):Void;
	public function setAbbreviationDictionary( dict:NSDictionary):Void;
	public function timeZoneWithAbbreviation( abbreviation:String):Dynamic;

	//Properties

	//Methods
	public function name():String;
	public function daylightSavingTimeOffset():NSTimeInterval;
	public function nextDaylightSavingTimeTransition():Date;
	public function secondsFromGMTForDate( aDate:Date):Int;
	public function abbreviationForDate( aDate:Date):String;
	public function isDaylightSavingTimeForDate( aDate:Date):Bool;
	public function description():String;
	public function localizedName( style:NSTimeZoneNameStyle,  locale:NSLocale):String;
	public function secondsFromGMT():Int;
	public function isEqualToTimeZone( aTimeZone:NSTimeZone):Bool;
	public function daylightSavingTimeOffsetForDate( aDate:Date):NSTimeInterval;
	public function nextDaylightSavingTimeTransitionAfterDate( aDate:Date):Date;
	public function isDaylightSavingTime():Bool;
	public function initWithName( tzName:String):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public function initWithName1( tzName:String,  aData:NSData):Dynamic;
	public function data():NSData;
	public function abbreviation():String;
}

@:framework("Foundation")
extern enum NSTimeZoneNameStyle {
	
	NSTimeZoneNameStyleStandard;
	NSTimeZoneNameStyleShortStandard;
	NSTimeZoneNameStyleDaylightSaving;
	NSTimeZoneNameStyleShortDaylightSaving;
	NSTimeZoneNameStyleGeneric;
	NSTimeZoneNameStyleShortGeneric;
}

/*	NSTimeZone.h
	

package objc.foundation;
#import <Foundation/NSDate.h>

@class NSString, Array<>, NSDictionary, NSDate, NSData, NSLocale;

extern class NSTimeZone extends NSObject implements NSCopying, NSSecureCoding>

- (NSString *)name;
- (NSData *)data;

- (Int)secondsFromGMTForDate:(NSDate *)aDate;
- (NSString *)abbreviationForDate:(NSDate *)aDate;
- (Bool)isDaylightSavingTimeForDate:(NSDate *)aDate;
- (NSTimeInterval)daylightSavingTimeOffsetForDate:(NSDate *)aDate NS_AVAILABLE(10_5, 2_0);
- (NSDate *)nextDaylightSavingTimeTransitionAfterDate:(NSDate *)aDate NS_AVAILABLE(10_5, 2_0);

}

extern class NSTimeZone (NSExtendedTimeZone)

+ (NSTimeZone *)systemTimeZone;
+ (void)resetSystemTimeZone;

+ (NSTimeZone *)defaultTimeZone;
+ (void)setDefaultTimeZone:(NSTimeZone *)aTimeZone;

+ (NSTimeZone *)localTimeZone;

+ (Array<> *)knownTimeZoneNames;

+ (NSDictionary *)abbreviationDictionary;
+ (void)setAbbreviationDictionary:(NSDictionary *)dict NS_AVAILABLE(10_6, 4_0);

+ (NSString *)timeZoneDataVersion NS_AVAILABLE(10_6, 4_0);

- (Int)secondsFromGMT;
- (NSString *)abbreviation;
- (Bool)isDaylightSavingTime;
- (NSTimeInterval)daylightSavingTimeOffset NS_AVAILABLE(10_5, 2_0); // for current instant
- (NSDate *)nextDaylightSavingTimeTransition NS_AVAILABLE(10_5, 2_0); // after current instant

- (NSString *)description;

- (Bool)isEqualToTimeZone:(NSTimeZone *)aTimeZone;

typedef NS_ENUM(Int, NSTimeZoneNameStyle) {
	NSTimeZoneNameStyleStandard,		// Central Standard Time
	NSTimeZoneNameStyleShortStandard,	// CST
	NSTimeZoneNameStyleDaylightSaving,	// Central Daylight Time
	NSTimeZoneNameStyleShortDaylightSaving,	// CDT
	NSTimeZoneNameStyleGeneric,		// Central Time
	NSTimeZoneNameStyleShortGeneric		// CT
};

- (NSString *)localizedName:(NSTimeZoneNameStyle)style locale:(NSLocale *)locale NS_AVAILABLE(10_5, 2_0);

}

extern class NSTimeZone (NSTimeZoneCreation)

// Primary creation method is +timeZoneWithName:; the
// data-taking variants should rarely be used directly

+ (id)timeZoneWithName:(NSString *)tzName;
+ (id)timeZoneWithName:(NSString *)tzName data:(NSData *)aData;

- (id)initWithName:(NSString *)tzName;
- (id)initWithName:(NSString *)tzName data:(NSData *)aData;

// Time zones created with this never have daylight savings and the
// offset is constant no matter the date; the name and abbreviation
// do NOT follow the POSIX convention (of minutes-west).
+ (id)timeZoneForSecondsFromGMT:(Int)seconds;

+ (id)timeZoneWithAbbreviation:(NSString *)abbreviation;

}

FOUNDATION_EXPORT NSString * const NSSystemTimeZoneDidChangeNotification NS_AVAILABLE(10_5, 2_0);

*/