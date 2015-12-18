//
//  UIStoryboard.h
package ios.ui;
import objc.foundation.NSObject;
import objc.foundation.NSBundle;

@:framework("UIKit")
@:require(ios5)
extern class UIStoryboard extends NSObject {

	public static function storyboardWithName (name:String, bundle:NSBundle) :UIStoryboard;

	public function instantiateInitialViewController () :UIStoryboard;
	public function instantiateViewControllerWithIdentifier (identifier:String) :UIStoryboard;

}
