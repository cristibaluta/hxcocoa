package objc.foundation;

import objc.foundation.NSLocale;
import objc.foundation.NSTimeZone;
import objc.foundation.NSString;
import objc.foundation.NSRange;


typedef NSCalendarUnit = Int;
private typedef NSTimeInterval = Int;

@:framework("Foundation")
extern class NSCalendar extends NSObject/* implements NSCopying implements NSCoding*/ {
	
	inline public static var kCFCalendarUnitEra = 0;
	inline public static var kCFCalendarUnitYear = 1;
	inline public static var kCFCalendarUnitMonth = 2;
	inline public static var kCFCalendarUnitDay = 3;
	inline public static var kCFCalendarUnitHour = 4;
	inline public static var kCFCalendarUnitMinute = 5;
	inline public static var kCFCalendarUnitSecond = 6;
	inline public static var kCFCalendarUnitWeekday = 7;
	inline public static var kCFCalendarUnitWeekdayOrdinal = 8;
	inline public static var NSEraCalendarUnit = kCFCalendarUnitEra;
	inline public static var NSYearCalendarUnit = kCFCalendarUnitYear;
	inline public static var NSMonthCalendarUnit = kCFCalendarUnitMonth;
	inline public static var NSDayCalendarUnit = kCFCalendarUnitDay;
	inline public static var NSHourCalendarUnit = kCFCalendarUnitHour;
	inline public static var NSMinuteCalendarUnit = kCFCalendarUnitMinute;
	inline public static var NSSecondCalendarUnit = kCFCalendarUnitSecond;
	inline public static var NSWeekdayCalendarUnit = kCFCalendarUnitWeekday;
	inline public static var NSWeekdayOrdinalCalendarUnit = kCFCalendarUnitWeekdayOrdinal;

						
	public static function currentCalendar () :NSCalendar; // users preferred calendar, tracks changes
	public static function autoupdatingCurrentCalendar () :NSCalendar;

	public function initWithCalendarIdentifier (ident:String) :NSCalendar;

	public function calendarIdentifier () :String;


	public function setLocale (locale:NSLocale) :Void;
	public function locale () :NSLocale;

	public function setTimeZone (tz:NSTimeZone) :Void;
	public function timeZone () :NSTimeZone;

	public function setFirstWeekday (weekday:Int) :Void;
	public function firstWeekday () :Int;

	public function setMinimumDaysInFirstWeek (mdw:Int) :Void;
	public function minimumDaysInFirstWeek () :Int;


	public function minimumRangeOfUnit(unit:NSCalendarUnit) :NSRange;
	public function maximumRangeOfUnit(unit:NSCalendarUnit) :NSRange;

	public function rangeOfUnit (smaller:NSCalendarUnit, inUnit:NSCalendarUnit, forDate:NSDate) :NSRange;
	public function ordinalityOfUnit (smaller:NSCalendarUnit, inUnit:NSCalendarUnit, forDate:NSDate) :NSRange;

	//public function rangeOfUnit (unit:NSCalendarUnit, startDate:NSDate, interval:NSTimeInterval, forDate:NSDate) :Bool;

	public function dateFromComponents (comps:NSDateComponents) :NSDate;
	public function components (unitFlags:Int, fromDate:NSDate) :NSDateComponents;

	public function dateByAddingComponents (comps:NSDateComponents, toDate:NSDate, options:Int) :NSDate;

	//public function components (unitFlags:Int, fromDate:NSDate, toDate:NSDate, options:Int) :NSDateComponents;
}


typedef NSUndefinedDateComponent = Int;

extern class NSDateComponents extends NSObject/* implements NSCopying implements NSCoding*/ {
	
	public function calendar () :NSCalendar;
	public function timeZone () :NSTimeZone;
	public function era() :Int;
	public function year() :Int;
	public function month() :Int;
	public function day() :Int;
	public function hour() :Int;
	public function minute() :Int;
	public function second() :Int;
	public function week() :Int;
	public function weekday() :Int;
	public function weekdayOrdinal() :Int;
	public function quarter() :Int;
	#if (osx_10_7 || ios_5_0)
	public function weekOfMonth() :Int;
	public function weekOfYear() :Int;
	public function yearForWeekOfYear() :Int;
	#end
	
	#if (osx_10_7 || ios_4_0)
	public function setCalendar (cal:NSCalendar) :Void;
	public function setTimeZone (tz:NSTimeZone) :Void;
	#end
	public function setEra (v:Int) :Void;
	public function setYear (v:Int) :Void;
	public function setMonth (v:Int) :Void;
	public function setDay (v:Int) :Void;
	public function setHour (v:Int) :Void;
	public function setMinute (v:Int) :Void;
	public function setSecond (v:Int) :Void;
	public function setWeek (v:Int) :Void;
	public function setWeekday (v:Int) :Void;
	public function setWeekdayOrdinal (v:Int) :Void;
	#if (osx_10_6 || ios_4_0)
	public function setQuarter (v:Int) :Void;
	public function setWeekOfMonth (v:Int) :Void;
	public function setWeekOfYear (v:Int) :Void;
	#end
	#if (osx_10_7 || ios_5_0)
	public function setYearForWeekOfYear (v:Int) :Void;
	#end
	#if (osx_10_7 || ios_4_0)
	public function date () :NSDate;
	#end
}
