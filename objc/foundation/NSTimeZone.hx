package objc.foundation;
import objc.foundation.NSObject;
private typedef NSTimeInterval = Int;

@:framework("Foundation")
extern class NSTimeZone extends NSObject implements NSCopying implements NSSecureCoding {

	//Constants

	//Static Methods
	public  function defaultTimeZone() :NSTimeZone;
	public  function knownTimeZoneNames() :Array<NSTimeZone>;
	public  function timeZoneDataVersion():String;
	public  function localTimeZone():NSTimeZone;
	public  function resetSystemTimeZone():Void;
	public  function timeZoneWithName( tzName:String):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function timeZoneWithName1( tzName:String,  aData:NSData):Dynamic;
	public  function abbreviationDictionary():NSDictionary;
	public  function timeZoneForSecondsFromGMT( seconds:Int):Dynamic;
	public  function systemTimeZone():NSTimeZone;
	public  function setDefaultTimeZone( aTimeZone:NSTimeZone):Void;
	public  function setAbbreviationDictionary( dict:NSDictionary):Void;
	public  function timeZoneWithAbbreviation( abbreviation:String):Dynamic;

	//Properties

	//Methods
	public  function name():String;
	public  function daylightSavingTimeOffset():NSTimeInterval;
	public  function nextDaylightSavingTimeTransition():Date;
	public  function secondsFromGMTForDate( aDate:Date):Int;
	public  function abbreviationForDate( aDate:Date):String;
	public  function isDaylightSavingTimeForDate( aDate:Date):Bool;
	public  function description():String;
	public  function localizedName( style:NSTimeZoneNameStyle,  locale:NSLocale):String;
	public  function secondsFromGMT():Int;
	public  function isEqualToTimeZone( aTimeZone:NSTimeZone):Bool;
	public  function daylightSavingTimeOffsetForDate( aDate:Date):NSTimeInterval;
	public  function nextDaylightSavingTimeTransitionAfterDate( aDate:Date):Date;
	public  function isDaylightSavingTime():Bool;
	public  function initWithName( tzName:String):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithName1( tzName:String,  aData:NSData):Dynamic;
	public  function data():NSData;
	public  function abbreviation():String;
}

extern enum NSTimeZoneNameStyle
{
	NSTimeZoneNameStyleStandard;
	NSTimeZoneNameStyleShortStandard;
	NSTimeZoneNameStyleDaylightSaving;
	NSTimeZoneNameStyleShortDaylightSaving;
	NSTimeZoneNameStyleGeneric;
	NSTimeZoneNameStyleShortGeneric;
}

