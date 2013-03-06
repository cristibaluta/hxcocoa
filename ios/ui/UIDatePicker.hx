package ios.ui;
import objc.foundation.NSObject;
import objc.foundation.NSCalendar;
import objc.foundation.NSTimeZone;
import objc.foundation.NSDate;

typedef UIDatePickerMode = Int;


@:framework("UIKit")
extern class UIDatePicker extends UIControl, implements NSObject {
	
	inline public static var UIDatePickerModeTime = 0;
	inline public static var UIDatePickerModeDate = 1;
	inline public static var UIDatePickerModeDateAndTime = 2;
	inline public static var UIDatePickerModeCountDownTimer = 3;
	
	public var datePickerMode :UIDatePickerMode;
	public var locale :NSLocale;
	public var calendar :NSCalendar;
	public var timeZone :NSTimeZone;
	public var date :NSDate;
	public var minimumDate :NSDate;
	public var maximumDate :NSDate;
	public var countDownDuration :Float;
	public var minuteInterval :Int;
	
	public function setDate (date:Date, animated:Bool) :Void;

}
