package ios.ui;
import objc.foundation.NSObject;

/*typedef NS_ENUM(NSInteger, UIDeviceOrientation) {
    UIDeviceOrientationUnknown,
    UIDeviceOrientationPortrait,            // Device oriented vertically, home button on the bottom
    UIDeviceOrientationPortraitUpsideDown,  // Device oriented vertically, home button on the top
    UIDeviceOrientationLandscapeLeft,       // Device oriented horizontally, home button on the right
    UIDeviceOrientationLandscapeRight,      // Device oriented horizontally, home button on the left
    UIDeviceOrientationFaceUp,              // Device oriented flat, face up
    UIDeviceOrientationFaceDown             // Device oriented flat, face down
};

typedef NS_ENUM(NSInteger, UIDeviceBatteryState) {
    UIDeviceBatteryStateUnknown,
    UIDeviceBatteryStateUnplugged,   // on battery, discharging
    UIDeviceBatteryStateCharging,    // plugged in, less than 100%
    UIDeviceBatteryStateFull,        // plugged in, at 100%
};              // available in iPhone 3.0

typedef NS_ENUM(NSInteger, UIUserInterfaceIdiom) {
#if __IPHONE_3_2 <= __IPHONE_OS_VERSION_MAX_ALLOWED
    UIUserInterfaceIdiomPhone,           // iPhone and iPod touch style UI
    UIUserInterfaceIdiomPad,             // iPad style UI
#endif
};


#define UI_USER_INTERFACE_IDIOM() ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)] ? [[UIDevice currentDevice] userInterfaceIdiom] : UIUserInterfaceIdiomPhone)

#define UIDeviceOrientationIsPortrait(orientation)  ((orientation) == UIDeviceOrientationPortrait || (orientation) == UIDeviceOrientationPortraitUpsideDown)
#define UIDeviceOrientationIsLandscape(orientation) ((orientation) == UIDeviceOrientationLandscapeLeft || (orientation) == UIDeviceOrientationLandscapeRight)
*/
extern class UIDevice extends NSObject {

	public static function currentDevice () :UIDevice;

	public var name (default, null) :String;              // e.g. "My iPhone"
	public var model (default, null) :String;             // e.g. @"iPhone", @"iPod touch"
	public var localizedModel (default, null) :String;    // localized version of model
	public var systemName (default, null) :String;        // e.g. @"iOS"
	public var systemVersion (default, null) :String;     // e.g. @"4.0"
	//public var orientation (default, null) :UIDeviceOrientation;
	public var uniqueIdentifier (default, null) :String;//  NS_DEPRECATED_IOS(2_0, 5_0);  // a string unique to each device based on various hardware info.

/*	public var (default, null) identifierForVendor :NSUUID NS_AVAILABLE_IOS(6_0);

	public var (nonatomic,readonly,getter=isGeneratingDeviceOrientationNotifications) BOOL generatesDeviceOrientationNotifications;
	public function beginGeneratingDeviceOrientationNotifications;      // nestable
	public function endGeneratingDeviceOrientationNotifications;

	public var (nonatomic,getter=isBatteryMonitoringEnabled) BOOL batteryMonitoringEnabled NS_AVAILABLE_IOS(3_0);  // default is NO
	public var (default, null) UIDeviceBatteryState          batteryState NS_AVAILABLE_IOS(3_0);  // UIDeviceBatteryStateUnknown if monitoring disabled
	public var (default, null) float                         batteryLevel NS_AVAILABLE_IOS(3_0);  // 0 .. 1.0. -1.0 if UIDeviceBatteryStateUnknown

	public var (nonatomic,getter=isProximityMonitoringEnabled) BOOL proximityMonitoringEnabled NS_AVAILABLE_IOS(3_0); // default is NO
	public var (default, null)                            BOOL proximityState NS_AVAILABLE_IOS(3_0);  // always returns NO if no proximity detector

	public var (nonatomic,readonly,getter=isMultitaskingSupported) BOOL multitaskingSupported NS_AVAILABLE_IOS(4_0);

	public var (default, null) userInterfaceIdiom :UIUserInterfaceIdiom;

	public function playInputClick NS_AVAILABLE_IOS(4_2);*/

}

extern interface UIInputViewAudioFeedback {
//@optional

//	public var BOOL enableInputClicksWhenVisible; // If YES, an input view will enable playInputClick.

}

/*UIKIT_EXTERN NSString *const UIDeviceOrientationDidChangeNotification;
UIKIT_EXTERN NSString *const UIDeviceBatteryStateDidChangeNotification   NS_AVAILABLE_IOS(3_0);
UIKIT_EXTERN NSString *const UIDeviceBatteryLevelDidChangeNotification   NS_AVAILABLE_IOS(3_0);
UIKIT_EXTERN NSString *const UIDeviceProximityStateDidChangeNotification NS_AVAILABLE_IOS(3_0);*/
