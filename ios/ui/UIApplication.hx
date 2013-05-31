package ios.ui;
import objc.foundation.NSURL;
import objc.graphics.CGGeometry;

typedef UIBackgroundTaskIdentifier = Int;

@:framework("UIKit")
extern enum UIStatusBarStyle {
    UIStatusBarStyleDefault;
    UIStatusBarStyleBlackTranslucent;
    UIStatusBarStyleBlackOpaque;
}

@:framework("UIKit")
extern enum UIStatusBarAnimation {
    UIStatusBarAnimationNone;
    UIStatusBarAnimationFade;
    UIStatusBarAnimationSlide;
}

// Note that UIInterfaceOrientationLandscapeLeft is equal to UIDeviceOrientationLandscapeRight (and vice versa).
// This is because rotating the device to the left requires rotating the content to the right.
@:framework("UIKit")
extern enum UIInterfaceOrientation {
    UIInterfaceOrientationPortrait;
    UIInterfaceOrientationPortraitUpsideDown;
    UIInterfaceOrientationLandscapeLeft;
    UIInterfaceOrientationLandscapeRight;
}

@:framework("UIKit")
extern enum UIInterfaceOrientationMask {
    UIInterfaceOrientationMaskPortrait;
    UIInterfaceOrientationMaskLandscapeLeft;
    UIInterfaceOrientationMaskLandscapeRight;
    UIInterfaceOrientationMaskPortraitUpsideDown;
    UIInterfaceOrientationMaskLandscape;
    UIInterfaceOrientationMaskAll;
    UIInterfaceOrientationMaskAllButUpsideDown;
}

@:framework("UIKit")
extern enum UIRemoteNotificationType {
    UIRemoteNotificationTypeNone;
    UIRemoteNotificationTypeBadge;
    UIRemoteNotificationTypeSound;
    UIRemoteNotificationTypeAlert;
    UIRemoteNotificationTypeNewsstandContentAvailability;
}

@:framework("UIKit")
extern enum UIApplicationState {
    UIApplicationStateActive;
    UIApplicationStateInactive;
    UIApplicationStateBackground;
}

@:framework("UIKit")
@:require(ios5) extern enum UIUserInterfaceLayoutDirection {
    UIUserInterfaceLayoutDirectionLeftToRight;
    UIUserInterfaceLayoutDirectionRightToLeft;
}


@:framework("UIKit")
extern class UIApplication extends UIResponder {
	
	public static function sharedApplication () :UIApplication;
	
	public var delegate :UIApplicationDelegate;
	public var idleTimerDisabled :Bool;
	public var keyWindow :UIWindow;
	public var windows :Array<UIWindow>;

	public function beginIgnoringInteractionEvents () :Void;
	public function endIgnoringInteractionEvents () :Void;
	public function isIgnoringInteractionEvents () :Bool; // returns YES if we are at least one deep in ignoring events
	public function openURL (url:NSURL) :Bool;
	public function canOpenURL (url:NSURL) :Bool;

	public function sendEvent (event:UIEvent) :Void;

	public function sendAction (action:SEL, to:Dynamic, from:Dynamic, forEvent:UIEvent) :Bool;

	public var networkActivityIndicatorVisible :Bool; // showing network spinning gear in status bar. default is NO

	public var  statusBarStyle :UIStatusBarStyle; // default is UIStatusBarStyleDefault
	public function setStatusBarStyle (statusBarStyle:UIStatusBarStyle, animated:Bool) :Void;

	public var statusBarHidden :Bool;
	public function setStatusBarHidden (hidden:Bool, withAnimation:UIStatusBarAnimation) :Void;

// Rotate to a specific orientation.  This only rotates the status bar and updates the statusBarOrientation property.
// This does not change automatically if the device changes orientation.
// Explicit setting of the status bar orientation is more limited in iOS 6.0 and later.
	public var statusBarOrientation :UIInterfaceOrientation;
	public function setStatusBarOrientation (interfaceOrientation:UIInterfaceOrientation, animated:Bool) :Void;

// The system only calls this method if the application delegate has not
// implemented the delegate equivalent. It returns the orientations specified by
// the application's info.plist. If no supported interface orientations were
// specified it will return UIInterfaceOrientationMaskAll on an iPad and
// UIInterfaceOrientationMaskAllButUpsideDown on a phone.  The return value
// should be one of the UIInterfaceOrientationMask values which indicates the
// orientations supported by this application.
//- (NSUInteger)supportedInterfaceOrientationsForWindow:(UIWindow *)window NS_AVAILABLE_IOS(6_0);

	public var statusBarOrientationAnimationDuration (default, null) :Float; // Returns the animation duration for the status bar during a 90 degree orientation change.  It should be doubled for a 180 degree orientation change.
	public var statusBarFrame (default, null) :CGRect; // returns CGRectZero if the status bar is hidden

	public var applicationIconBadgeNumber :Int;  // set to 0 to hide. default is 0

	public var applicationSupportsShakeToEdit :Bool;

	public var applicationState (default, null) :UIApplicationState;
	public var backgroundTimeRemaining (default, null) :Float;

	public function beginBackgroundTaskWithExpirationHandler (handler:Void->Void) :UIBackgroundTaskIdentifier;
	public function endBackgroundTask (identifier:UIBackgroundTaskIdentifier) :Void;

	public function setKeepAliveTimeout (timeout:Float, handler:Void->Void) :Bool;
	public function clearKeepAliveTimeout () :Void;

	//public var (nonatomic,readonly,getter=isProtectedDataAvailable) BOOL protectedDataAvailable NS_AVAILABLE_IOS(4_0);

	//public var userInterfaceLayoutDirection (default, null) :UIUserInterfaceLayoutDirection  NS_AVAILABLE_IOS(5_0);

// UIApplication (UIRemoteNotifications)

	public function registerForRemoteNotificationTypes (types:UIRemoteNotificationType) :Void;
	public function unregisterForRemoteNotifications () :Void; // calls -registerForRemoteNotificationTypes with UIRemoteNotificationTypeNone

// returns the enabled types, also taking into account any systemwide settings; doesn't relate to connectivity
	public function enabledRemoteNotificationTypes () :UIRemoteNotificationType;

// UIApplication (UILocalNotifications)

	public function presentLocalNotificationNow (notification:UILocalNotification) :Void;

	public function scheduleLocalNotification (notification:UILocalNotification) :Void;
	public function cancelLocalNotification (notification:UILocalNotification) :Void;
	public function cancelAllLocalNotifications () :Void;
	public var scheduledLocalNotifications :Array<UILocalNotification>;

// UIRemoteControlEvents)

	public function beginReceivingRemoteControlEvents () :Void;
	public function endReceivingRemoteControlEvents () :Void;

// UINewsstand)
	public function setNewsstandIconImage (image:UIImage) :Void;

// UIStateRestoration)
	@:require(ios6) public function extendStateRestoration () :Void;
	@:require(ios6) public function completeStateRestoration () :Void;
	
	@:c public static function UIDeviceOrientationIsValidInterfaceOrientation(orientation:UIInterfaceOrientation) :Void;
	@:c public static function UIInterfaceOrientationIsPortrait(orientation:UIInterfaceOrientation) :Void;
	@:c public static function UIInterfaceOrientationIsLandscape(orientation:UIInterfaceOrientation) :Void;
	
}
