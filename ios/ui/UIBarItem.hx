//
//  UIBarItem.h
package ios.ui;
import ios.ui.UIGeometry;
import ios.ui.UIControl;
import objc.foundation.NSObject;
import objc.foundation.NSDictionary;


@:framework("UIKit")
extern class UIBarItem extends NSObject implements UIAppearance {

	public var enabled :Bool;      // default is YES
	public var title :String;        // default is nil
	public var image :UIImage;        // default is nil
	@:require(ios5_0)public var landscapeImagePhone :UIImage;
	public var imageInsets :UIEdgeInsets;  // default is UIEdgeInsetsZero
	@:require(ios5_0)public var landscapeImagePhoneInsets :UIEdgeInsets;
	public var tag :Int;          // default is 0
	
	@:require(ios5_0)public function setTitleTextAttributes (attributes:NSDictionary, forState:UIControlState) :Void;
	@:require(ios5_0)public function titleTextAttributesForState (state:UIControlState) :NSDictionary;

}
