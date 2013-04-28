//
//  UIStoryboard.h
package ios.ui;

@:framework("UIKit")
@:require(ios5_0)
extern class UIStoryboard extends NSObject {

	public static function storyboardWithName (name:String, bundle:NSBundle) :UIStoryboard;

	public function instantiateInitialViewController () :UIStoryboard;
	public function instantiateViewControllerWithIdentifier (identifier:String) :UIStoryboard;

}
