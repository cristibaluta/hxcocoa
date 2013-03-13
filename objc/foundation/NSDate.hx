package objc.foundation;

import objc.foundation.NSObject;

typedef NSComparisonResult = Int;

@:framework("Foundation")
extern class NSDate extends NSObject implements NSCopying implements NSSecureCoding {
	
	public static function timeIntervalSinceReferenceDate () :Int;
	public static function dateWithTimeInterval( ti:Int, date:Date):NSDate;
	public static function dateWithTimeIntervalSinceReferenceDate( secs:Int) :NSDate;
	public static function dateWithTimeIntervalSince1970 (secs:Int) :NSDate;
	public static function date() :NSDate;
	public static function dateWithTimeIntervalSinceNow (secs:Int) :NSDate;
	public static function distantFuture():NSDate;
	public static function distantPast():NSDate;
	
	//public  function timeIntervalSinceReferenceDate():Int;
	public  function timeIntervalSinceNow():Int;
	public  function timeIntervalSince1970():Int;
	public  function timeIntervalSinceDate( anotherDate:Date):Int;
	
	public  function laterDate( anotherDate:Date):Date;
	public  function earlierDate( anotherDate:Date):Date;
	public  function description():String;
	public  function compare (other:NSDate) :NSComparisonResult;
	public  function isEqualToDate (otherDate:NSDate) :Bool;
	public  function descriptionWithLocale( locale:Dynamic):String;
	
	override public function init() :NSDate;
	public  function initWithTimeIntervalSinceNow( secs:Int) :NSDate;
	public  function initWithTimeIntervalSinceReferenceDate( secsToBeAdded:Int) :NSDate;
	public  function initWithTimeIntervalSince1970( ti:Int) :NSDate;
	public  function initWithTimeInterval( secsToBeAdded:Int, anotherDate:Date) :NSDate;
}
