//
//  UIResponder.h
package ios.ui;

import swift.foundation.NSObject;
import swift.foundation.NSSet;
import ios.ui.UIEvent;

@:framework("UIKit")
extern class UIResponder extends NSObject {

	public function nextResponder () :UIResponder;

	public function canBecomeFirstResponder () :Bool;    // default is NO
	public function becomeFirstResponder () :Bool;
	public function canResignFirstResponder () :Bool;    // default is YES
	public function resignFirstResponder () :Bool;
	public function isFirstResponder () :Bool;

// Generally, all responders which do custom touch handling should override all four of these methods.
// Your responder will receive either touchesEnded:withEvent: or touchesCancelled:withEvent: for each
// touch it is handling (those touches it received in touchesBegan:withEvent:).
// *** You must handle cancelled touches to ensure correct behavior in your application.  Failure to
// do so is very likely to lead to incorrect behavior or crashes.
	public function touchesBegan (touches:NSSet, withEvent:UIEvent) :Void;
	public function touchesMoved (touches:NSSet, withEvent:UIEvent) :Void;
	public function touchesEnded (touches:NSSet, withEvent:UIEvent) :Void;
	public function touchesCancelled (touches:NSSet, withEvent:UIEvent) :Void;

/*		
	// Responding to Motion Events
	public function motionBegan (motion:UIEventSubtype, withEvent:UIEvent) :Void;
	public function motionEnded (motion:UIEventSubtype, withEvent:UIEvent) :Void;
	public function motionCancelled (motion:UIEventSubtype, withEvent:UIEvent) :Void;
	
	// Responding to Remote-Control Events
	public function remoteControlReceivedWithEvent (event:UIEvent) :Void;
	
	// Getting the Undo Manager
	public var undoManager :NSUndoManager;*/
	
	// Validating Commands
	public function canPerformAction (action:SEL, withSender:Dynamic) :Bool;

// (UIResponderInputViewAdditions)

// Called and presented when object becomes first responder.  Goes up the responder chain.
	public var inputView (default, null) :UIView;
	public var inputAccessoryView (default, null) :UIView;

// If called while object is first responder, reloads inputView and inputAccessoryView.  Otherwise ignored.
	public function reloadInputViews () :Void;

}
