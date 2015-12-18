package ios.ui;

import objc.foundation.NSObject;

@:framework("UIKit")
@:require(6_0)
extern class UIActivity extends NSObject {

// override methods

	public function activityType () :String;       // default returns nil. subclass may override to return custom activity type that is reported to completion handler
	public function activityTitle () :String;      // default returns nil. subclass must override and must return non-nil value
	public function activityImage () :UIImage;       // default returns nil. subclass must override and must return non-nil value

	public function canPerformWithActivityItems (activityItems:Array<>) :Bool;   // override this to return availability of activity based on items. default returns NO
	public function prepareWithActivityItems (activityItems:Array<>) :String;// override to extract items and set up your HI. default does nothing

	public function activityViewController () :UIViewController;   // return non-nil to have vC presented modally. call activityDidFinish at end. default returns nil
	public function performActivity () :Void;// if no view controller, this method is called. call activityDidFinish when done. default calls [self activityDidFinish:NO]

// state method

	public function activityDidFinish (completed:Bool) :Void;   // activity must call this when activity is finished. can be called on any thread

}
