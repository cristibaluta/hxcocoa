package ios.ui;
import objc.foundation.NSObject;

@:framework("UIKit")
extern enum UIDeviceOrientation {
    UIDeviceOrientationUnknown;
    UIDeviceOrientationPortrait;            // Device oriented vertically, home button on the bottom
    UIDeviceOrientationPortraitUpsideDown;  // Device oriented vertically, home button on the top
    UIDeviceOrientationLandscapeLeft;       // Device oriented horizontally, home button on the right
    UIDeviceOrientationLandscapeRight;      // Device oriented horizontally, home button on the left
    UIDeviceOrientationFaceUp;              // Device oriented flat, face up
    UIDeviceOrientationFaceDown;             // Device oriented flat, face down
}

@:framework("UIKit")
extern enum UIDeviceBatteryState {
    UIDeviceBatteryStateUnknown;
    UIDeviceBatteryStateUnplugged;   // on battery, discharging
    UIDeviceBatteryStateCharging;    // plugged in, less than 100%
    UIDeviceBatteryStateFull;        // plugged in, at 100%
}

@:framework("UIKit")
extern enum UIUserInterfaceIdiom {
    UIUserInterfaceIdiomPhone;           // iPhone and iPod touch style UI
    UIUserInterfaceIdiomPad;             // iPad style UI
}


@:framework("UIKit")
extern class UIDevice extends NSObject {

	@:c public static function UI_USER_INTERFACE_IDIOM():UIUserInterfaceIdiom;
	@:c public static function UIDeviceOrientationIsPortrait(orientation:UIDeviceOrientation):Bool;
	@:c public static function UIDeviceOrientationIsLandscape(orientation:UIDeviceOrientation):Bool;
	
	public static function currentDevice () :UIDevice;

	public var name (default, null) :String;              // e.g. "My iPhone"
	public var model (default, null) :String;             // e.g. @"iPhone", @"iPod touch"
	public var localizedModel (default, null) :String;    // localized version of model
	public var systemName (default, null) :String;        // e.g. @"iOS"
	public var systemVersion (default, null) :String;     // e.g. @"4.0"
	public var orientation (default, null) :UIDeviceOrientation;
	//public var uniqueIdentifier (default, null) :String;//  NS_DEPRECATED_IOS(2_0, 5_0);

	@:require(ios6_0)public var (default, null) identifierForVendor :NSUUID;

	public var generatesDeviceOrientationNotifications (default, null) :Bool;
	public function beginGeneratingDeviceOrientationNotifications () :Void;      // nestable
	public function endGeneratingDeviceOrientationNotifications () :Void;

	public var batteryMonitoringEnabled :Bool;
	public var batteryState (default, null) UIDeviceBatteryState;
	public var batteryLevel (default, null) :Float;
	public var proximityMonitoringEnabled :Bool;
	public var proximityState (default, null) :Bool;
	public var multitaskingSupported (default, null) :Bool;
	public var userInterfaceIdiom (default, null) :UIUserInterfaceIdiom;
	public function playInputClick () :Void;

}

@:framework("UIKit")
extern interface UIInputViewAudioFeedback {
//@optional
#if display
	public var enableInputClicksWhenVisible :Bool; // If YES, an input view will enable playInputClick.
#end
}

/*UIKIT_EXTERN NSString *const UIDeviceOrientationDidChangeNotification;
UIKIT_EXTERN NSString *const UIDeviceBatteryStateDidChangeNotification   NS_AVAILABLE_IOS(3_0);
UIKIT_EXTERN NSString *const UIDeviceBatteryLevelDidChangeNotification   NS_AVAILABLE_IOS(3_0);
UIKIT_EXTERN NSString *const UIDeviceProximityStateDidChangeNotification NS_AVAILABLE_IOS(3_0);*/
