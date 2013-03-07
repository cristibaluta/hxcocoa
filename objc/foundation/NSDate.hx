package objc.foundation;
import objc.foundation.NSObject;
typedef NSTimeInterval = Int;
typedef NSComparisonResult = Int;

@:framework("Foundation")
extern class NSDate extends NSObject implements NSCopying implements NSSecureCoding {

	//Constants

	//Static Methods
	public static function timeIntervalSinceReferenceDate () :NSTimeInterval;
	public static function dateWithTimeInterval( ti:NSTimeInterval,  date:Date):NSDate;
	public static function dateWithTimeIntervalSinceReferenceDate( secs:NSTimeInterval):NSDate;
	public static function dateWithTimeIntervalSince1970( secs:NSTimeInterval):NSDate;
	public static function date() :NSDate;
	public static function dateWithTimeIntervalSinceNow( secs:NSTimeInterval):NSDate;
	public static function distantFuture():NSDate;
	public static function distantPast():NSDate;
	
	//public  function timeIntervalSinceReferenceDate():NSTimeInterval;
	public  function timeIntervalSinceNow():NSTimeInterval;
	public  function timeIntervalSince1970():NSTimeInterval;
	public  function timeIntervalSinceDate( anotherDate:Date):NSTimeInterval;
	
	public  function laterDate( anotherDate:Date):Date;
	public  function earlierDate( anotherDate:Date):Date;
	public  function description():String;
	public  function compare (other:NSDate) :NSComparisonResult;
	public  function isEqualToDate (otherDate:NSDate) :Bool;
	public  function descriptionWithLocale( locale:Dynamic):String;
	
	override public function init() :NSDate;
	public  function initWithTimeIntervalSinceNow( secs:NSTimeInterval) :NSDate;
	public  function initWithTimeIntervalSinceReferenceDate( secsToBeAdded:NSTimeInterval) :NSDate;
	public  function initWithTimeIntervalSince1970( ti:NSTimeInterval) :NSDate;
	public  function initWithTimeInterval( secsToBeAdded:NSTimeInterval, anotherDate:Date) :NSDate;
}
