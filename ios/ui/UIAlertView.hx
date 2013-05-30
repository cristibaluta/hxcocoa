package ios.ui;


extern enum UIAlertViewStyle {
    UIAlertViewStyleDefault;
    UIAlertViewStyleSecureTextInput;
    UIAlertViewStylePlainTextInput;
    UIAlertViewStyleLoginAndPasswordInput;
}

@:framework("UIKit")
extern class UIAlertView extends UIView {

	public function initWithTitle (title:String, message:String, delegate:UIAlertViewDelegate, cancelButtonTitle:String, otherButtonTitles:String) :UIAlertView;

	public var delegate :UIAlertViewDelegate;
	public var title :String;
	public var message :String;

	public function addButtonWithTitle (title:String) :Int;
	public function buttonTitleAtIndex (buttonIndex:Int) :String;
	public var numberOfButtons (default, null) :Int;
	public var cancelButtonIndex :Int;

	public var firstOtherButtonIndex (default, null) :Int;
	public var visible (default, null) :Bool;

	public function show () :Void;
	public function dismissWithClickedButtonIndex (buttonIndex:Int, animated:Bool) :Void;

	@:require(ios5_0) public var alertViewStyle :UIAlertViewStyle;
	//@:require(ios5_0) public function textFieldAtIndex (textFieldIndex:Int) :UITextField;
}

@:framework("UIKit")
extern interface UIAlertViewDelegate {
#if display
/*	public function alertView (alertView:UIAlertView, clickedButtonAtIndex:Int) :Void;
	public function alertViewCancel (alertView:UIAlertView) :Void;
	public function willPresentAlertView (alertView:UIAlertView) :Void;
	public function didPresentAlertView (alertView:UIAlertView) :Void;
	public function alertView (alertView:UIAlertView, willDismissWithButtonIndex:Int) :Void;
	public function alertView (alertView:UIAlertView, didDismissWithButtonIndex:Int) :Void;
	public function alertViewShouldEnableFirstOtherButton (alertView:UIAlertView) :Bool;*/
#end
}
