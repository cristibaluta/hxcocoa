//
//  UIToolbar.h
package ios.ui;

import ios.ui.UIInterface;
import ios.ui.UIBarButtonItem;

@:framework("UIKit")
extern enum UIToolbarPosition {
    UIToolbarPositionAny;
    UIToolbarPositionBottom;
    UIToolbarPositionTop;
}

@:framework("UIKit")
extern class UIToolbar extends UIView {

	public var barStyle :UIBarStyle;    // default is UIBarStyleDefault (blue)
	public var items :Array<UIBarButtonItem>;// get/set visible UIBarButtonItem. default is nil. changes not animated. shown in order
	public var translucent :Bool;

	public function setItems (items:Array<UIBarButtonItem>, animated:Bool) :Void;

/* Default tintColor is nil. When non-nil, bordered buttons and segmented controls in the toolbar
 will pick up the same tint unless their tints are independently set.
 */
	public var tintColor :UIColor;


	@:require(ios5)public function setBackgroundImage (backgroundImage:UIImage, forToolbarPosition:UIToolbarPosition, barMetrics:UIBarMetrics) :Void;
	@:require(ios5)public function backgroundImageForToolbarPosition (topOrBottom:UIToolbarPosition, barMetrics:UIBarMetrics) :UIImage;

	@:require(ios6)public function setShadowImage (shadowImage:UIImage, forToolbarPosition:UIToolbarPosition) :Void;
	@:require(ios6)public function shadowImageForToolbarPosition (topOrBottom:UIToolbarPosition) :UIImage;

}
