
package ios.ui;
import objc.foundation.NSObject;

extern class UISwitch extends UIControl, implements NSObject {

	@:require(ios5_0) public var onTintColor () :UIColor;
	@:require(ios6_0) public var tintColor () :UIColor;
	@:require(ios6_0) public var thumbTintColor () :UIColor;

	@:require(ios6_0) public var onImage () :UIImage;
	@:require(ios6_0) public var offImage () :UIImage;

	public var on :Bool;

	public function initWithFrame (frame:CGRect) :UISwitch;
	public function setOn (on:Bool, animated:Bool) :Void;

}
