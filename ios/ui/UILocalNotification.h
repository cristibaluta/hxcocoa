//
//  UILocalNotification.h
package ios.ui;
//
//  Copyright (c) 2007-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>

NS_CLASS_AVAILABLE_IOS(4_0)extern class UILocalNotification extends NSObject<NSCopying, NSCoding>       // added in iOS 4.0

// scheduling
public var  NSDate *fireDate;
// the time zone to interpret fireDate in. pass nil if fireDate is an absolute GMT time (e.g. for an egg timer).
// pass a time zone to interpret fireDate as a wall time to be adjusted automatically upon time zone changes (e.g. for an alarm clock).
public var  NSTimeZone *timeZone;

	public var  NSCalendarUnit repeatInterval;      // 0 means don't repeat
public var  NSCalendar *repeatCalendar;

// alerts
public var  NSString *alertBody;      // defaults to nil. pass a string or localized string key to show an alert
	public var  BOOL hasAction;                // defaults to YES. pass NO to hide launching button/slider
public var  NSString *alertAction;    // used in UIAlert button or 'slide to unlock...' slider in place of unlock
public var  NSString *alertLaunchImage;   // used as the launch image (UILaunchImageFile) when launch button is tapped

// sound
public var  NSString *soundName;      // name of resource in app's bundle to play or UILocalNotificationDefaultSoundName

// badge
	public var  NSInteger applicationIconBadgeNumber;  // 0 means no change. defaults to 0

// user info
public var  NSDictionary *userInfo;   // throws if contains non-property list types

}


UIKIT_EXTERN NSString *const UILocalNotificationDefaultSoundName NS_AVAILABLE_IOS(4_0);
