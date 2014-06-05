package ios.ui;
import swift.foundation.NSObject;
import swift.foundation.NSCalendar;
import swift.foundation.NSTimeZone;
import swift.foundation.NSDate;

@:framework("UIKit")
extern enum UIDatePickerMode {
	UIDatePickerModeTime;
	UIDatePickerModeDate;
	UIDatePickerModeDateAndTime;
	UIDatePickerModeCountDownTimer;
}


@:framework("UIKit")
extern class UIDatePicker extends UIControl implements NSObject {
	
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
