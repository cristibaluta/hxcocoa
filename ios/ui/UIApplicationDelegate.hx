package ios.ui;

import objc.foundation.NSDictionary;

extern interface UIApplicationDelegate {

	//@optional

	public var window : UIWindow;

	//public function applicationDidFinishLaunching (application:UIApplication) :Void;
	//public function applicationWillFinishLaunchingWithOptions (application:UIApplication, willFinishLaunchingWithOptions:NSDictionary) :Bool;
	public function applicationDidFinishLaunchingWithOptions (application:UIApplication, didFinishLaunchingWithOptions:NSDictionary) :Bool;

	public function applicationDidBecomeActive (application:UIApplication) :Void;
	public function applicationWillResignActive (application:UIApplication) :Void;
/*	public function applicationHandleOpenURL (application:UIApplication, handleOpenURL:NSURL) :Bool;*/
	/*public function applicationOpenURL (application:UIApplication, openURL:NSURL, sourceApplication:String, annotation:Dynamic) :Bool;

	public function applicationDidReceiveMemoryWarning (application:UIApplication) :Void;
	public function applicationWillTerminate (application:UIApplication) :Void;
	public function applicationSignificantTimeChange (application:UIApplication) :Void;

	public function applicationWillChangeStatusBarOrientation (application:UIApplication, willChangeStatusBarOrientation:UIInterfaceOrientation, duration:Int) :Void;
	public function applicationDidChangeStatusBarOrientation (application:UIApplication, didChangeStatusBarOrientation:UIInterfaceOrientation) :Void;

	public function applicationWillChangeStatusBarFrame (application:UIApplication, willChangeStatusBarFrame:CGRect) :Void;
	public function applicationDidChangeStatusBarFrame (application:UIApplication, didChangeStatusBarFrame:CGRect) :Void;

	public function applicationDidRegisterForRemoteNotificationsWithDeviceToken (application:UIApplication, didRegisterForRemoteNotificationsWithDeviceToken:NSData) :Void;
	public function applicationDidFailToRegisterForRemoteNotificationsWithError (application:UIApplication, didFailToRegisterForRemoteNotificationsWithError:NSError) :Void;

	public function applicationDidReceiveRemoteNotification (application:UIApplication, didReceiveRemoteNotification :NSDictionary) :Void;
	public function applicationDidReceiveLocalNotification (application:UIApplication, didReceiveLocalNotification :UILocalNotification) :Void;

	public function applicationDidEnterBackground (application:UIApplication) :Void;
	public function applicationWillEnterForeground (application:UIApplication) :Void;

	public function applicationProtectedDataWillBecomeUnavailable (application:UIApplication) :Void;
	public function applicationProtectedDataDidBecomeAvailable (application:UIApplication) :Void;*/

	/*public function applicationSupportedInterfaceOrientationsForWindow (application:UIApplication, supportedInterfaceOrientationsForWindow:UIWindow) :Int;

	public function applicationViewControllerWithRestorationIdentifierPath (application:UIApplication, viewControllerWithRestorationIdentifierPath:NSArray, coder:NSCoder) :UIViewController;
	public function applicationShouldSaveApplicationState (application:UIApplication, shouldSaveApplicationState:NSCoder) :Bool;
	public function applicationShouldRestoreApplicationState (application:UIApplication, shouldRestoreApplicationState:NSCoder) :Bool;
	public function applicationWillEncodeRestorableStateWithCoder (application:UIApplication, willEncodeRestorableStateWithCoder:NSCoder) :Void;
	public function applicationDidDecodeRestorableStateWithCoder (application:UIApplication, didDecodeRestorableStateWithCoder:NSCoder) :Void;
	*/
}
