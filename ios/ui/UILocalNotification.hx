//
//  UILocalNotification.h
package ios.ui;

import objc.foundation.NSObject;
import objc.foundation.NSCalendar;
import objc.foundation.NSDictionary;

typedef NSCalendarUnit = Int;
typedef NSTimeZone = Int;


extern class UILocalNotification extends NSObject implements NSCopying implements NSCoding {

	public var fireDate :Date;
// the time zone to interpret fireDate in. pass nil if fireDate is an absolute GMT time (e.g. for an egg timer).
// pass a time zone to interpret fireDate as a wall time to be adjusted automatically upon time zone changes (e.g. for an alarm clock).
	public var timeZone :NSTimeZone;

	public var repeatInterval :NSCalendarUnit;      // 0 means don't repeat
	public var repeatCalendar :NSCalendar;

// alerts
	public var alertBody :String;      // defaults to nil. pass a string or localized string key to show an alert
	public var hasAction :Bool;        // defaults to YES. pass NO to hide launching button/slider
	public var alertAction :String;    // used in UIAlert button or 'slide to unlock...' slider in place of unlock
	public var alertLaunchImage :String;   // used as the launch image (UILaunchImageFile) when launch button is tapped

// sound
	public var soundName :String;      // name of resource in app's bundle to play or UILocalNotificationDefaultSoundName

// badge
	public var applicationIconBadgeNumber :Int;  // 0 means no change. defaults to 0

// user info
	public var userInfo :NSDictionary;   // throws if contains non-property list types

}
