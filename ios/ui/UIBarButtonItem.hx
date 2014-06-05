//
//  UIBarButtonItem.h
package ios.ui;

import swift.foundation.NSSet;
import ios.ui.UIControl;
import ios.ui.UIGeometry;


@:framework("UIKit")
extern enum UIBarMetrics {
    UIBarMetricsDefault;
    UIBarMetricsLandscapePhone;
}

@:framework("UIKit")
extern enum UIBarButtonItemStyle {
    UIBarButtonItemStylePlain;    // shows glow when pressed
    UIBarButtonItemStyleBordered;
    UIBarButtonItemStyleDone;
}

@:framework("UIKit")
extern enum UIBarButtonSystemItem {
    UIBarButtonSystemItemDone;
    UIBarButtonSystemItemCancel;
    UIBarButtonSystemItemEdit;
    UIBarButtonSystemItemSave;
    UIBarButtonSystemItemAdd;
    UIBarButtonSystemItemFlexibleSpace;
    UIBarButtonSystemItemFixedSpace;
    UIBarButtonSystemItemCompose;
    UIBarButtonSystemItemReply;
    UIBarButtonSystemItemAction;
    UIBarButtonSystemItemOrganize;
    UIBarButtonSystemItemBookmarks;
    UIBarButtonSystemItemSearch;
    UIBarButtonSystemItemRefresh;
    UIBarButtonSystemItemStop;
    UIBarButtonSystemItemCamera;
    UIBarButtonSystemItemTrash;
    UIBarButtonSystemItemPlay;
    UIBarButtonSystemItemPause;
    UIBarButtonSystemItemRewind;
    UIBarButtonSystemItemFastForward;
    UIBarButtonSystemItemUndo;
    UIBarButtonSystemItemRedo;
    UIBarButtonSystemItemPageCurl;
}


@:framework("UIKit")
extern class UIBarButtonItem extends UIBarItem {
	
	public function initWithImage (image:UIImage, style:UIBarButtonItemStyle, target:Dynamic, action:SEL) :UIBarButtonItem;
	//public function initWithImage (image:UIImage, landscapeImagePhone:UIImage, style:UIBarButtonItemStyle, target:Dynamic, action:SEL) :UIBarButtonItem; NS_AVAILABLE_IOS(5_0); // landscapeImagePhone will be used for the bar button image in landscape bars in UIUserInterfaceIdiomPhone only
	public function initWithTitle (title:String, style:UIBarButtonItemStyle, target:Dynamic, action:SEL) :UIBarButtonItem;
	public function initWithBarButtonSystemItem (systemItem:UIBarButtonSystemItem, target:Dynamic, action:SEL) :UIBarButtonItem;
	public function initWithCustomView (customView:UIView) :UIBarButtonItem;
	
	public var style :UIBarButtonItemStyle;            // default is UIBarButtonItemStylePlain
	public var width :Float;            // default is 0.0
	public var possibleTitles :NSSet;   // default is nil
	public var customView :UIView;       // default is nil
	public var action :SEL;           // default is NULL
	public var target :Dynamic;           // default is nil
	
	@:require(ios5)public function setBackgroundImage (backgroundImage:UIImage, forState:UIControlState, barMetrics:UIBarMetrics) :Void;
	@:require(ios5)public function backgroundImageForState (state:UIControlState, barMetrics:UIBarMetrics) :UIImage;

/* This sets the background image for buttons with a specific style. 
	When calling this on a UIBarButtonItem instance, the style argument must match the button's style; when calling on the UIAppearance proxy, any style may be passed.
 */
	//@:require(ios6)public function setBackgroundImage (backgroundImage:UIImage, forState:UIControlState, style:UIBarButtonItemStyle, barMetrics:UIBarMetrics) :Void;
	//@:require(ios6)public function backgroundImageForState (state:UIControlState, style:UIBarButtonItemStyle, barMetrics:UIBarMetrics) :UIImage;

	@:require(ios5)public var tintColor :UIColor;

/* For adjusting the vertical centering of bordered bar buttons within the bar 
 */
	@:require(ios5)public function setBackgroundVerticalPositionAdjustment (adjustment:Float, forBarMetrics:UIBarMetrics) :Void;
	@:require(ios5)public function backgroundVerticalPositionAdjustmentForBarMetrics (barMetrics:UIBarMetrics) :Float;

/* For adjusting the position of a title (if any) within a bordered bar button 
 */
	@:require(ios5)public function setTitlePositionAdjustment (adjustment:UIOffset, forBarMetrics:UIBarMetrics) :Void;
	@:require(ios5)public function titlePositionAdjustmentForBarMetrics (barMetrics:UIBarMetrics) :UIOffset;

/* The remaining appearance modifiers apply solely to UINavigationBar back buttons and are ignored by other buttons.
 */
/*
 backgroundImage must be a resizable image for good results.
 */
	@:require(ios5)public function setBackButtonBackgroundImage (backgroundImage:UIImage, forState:UIControlState, barMetrics:UIBarMetrics) :Void;
	@:require(ios5)public function backButtonBackgroundImageForState (state:UIControlState, barMetrics:UIBarMetrics) :UIImage;

	@:require(ios5)public function setBackButtonTitlePositionAdjustment (adjustment:UIOffset, forBarMetrics:UIBarMetrics) :Void;
	@:require(ios5)public function backButtonTitlePositionAdjustmentForBarMetrics (barMetrics:UIBarMetrics) :UIOffset;

/* For adjusting the vertical centering of bordered bar buttons within the bar 
 */
	@:require(ios5)public function setBackButtonBackgroundVerticalPositionAdjustment (adjustment:Float, forBarMetrics:UIBarMetrics) :Void;
	@:require(ios5)public function backButtonBackgroundVerticalPositionAdjustmentForBarMetrics (barMetrics:UIBarMetrics) :Float;

}
