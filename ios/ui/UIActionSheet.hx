//
//  UIActionSheet.h
package ios.ui;

import objc.foundation.NSObject;

typedef UIActionSheetStyle = Int;


extern class UIActionSheet extends UIView {
	
	inline public static var UIActionSheetStyleAutomatic = -1;
	inline public static var UIActionSheetStyleDefault = UIBarStyleDefault;
	inline public static var UIActionSheetStyleBlackTranslucent = UIBarStyleBlackTranslucent;
	inline public static var UIActionSheetStyleBlackOpaque = UIBarStyleBlackOpaque;
	
	public function initWithTitle (title:String, delegate:UIActionSheetDelegate, cancelButtonTitle:String, destructiveButtonTitle:String, otherButtonTitles:String) :UIActionSheet;

	public var delegate :UIActionSheetDelegate;
	public var title :String;
	public var actionSheetStyle :UIActionSheetStyle;
	
	public function addButtonWithTitle (title:String) :Int;
	public function buttonTitleAtIndex (buttonIndex:Int) :String;
	public var numberOfButtons (default, null) :Int;
	public var cancelButtonIndex :Int;
	public var destructiveButtonIndex :Int;

	public var firstOtherButtonIndex (default, null) :Int;
	public var visible (default, null) :Bool;

	public function showFromToolbar (view:UIToolbar) :Void;
	public function showFromTabBar (view:UITabBar) :Void;
	public function showFromBarButtonItem (item:UIBarButtonItem, animated:Bool) :Void;
	public function showFromRect (rect:CGRect, inView:UIView, animated:Bool) :Void;
	public function showInView (view:UIView) :Void;

	public function dismissWithClickedButtonIndex (buttonIndex:Int, animated:Bool) :Void;

}


extern interface UIActionSheetDelegate {
//@optional
	//public function actionSheet (actionSheet:UIActionSheet, clickedButtonAtIndex:Int) :Void;
	//public function actionSheetCancel (actionSheet:UIActionSheet) :Void;

	//public function willPresentActionSheet (actionSheet:UIActionSheet) :Void;
	//public function didPresentActionSheet (actionSheet:UIActionSheet) :Void;

	//public function actionSheet (actionSheet:UIActionSheet, willDismissWithButtonIndex:Int) :Void;
	//public function actionSheet (actionSheet:UIActionSheet, didDismissWithButtonIndex:Int) :Void;

}
