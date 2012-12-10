
package ios.ui;

import objc.foundation.NSObject;


extern class UIResponder extends NSObject {
	
	// Managing the Responder Chain
	public function nextResponder () :UIResponder;
	public function isFirstResponder () :Bool;
	public function canBecomeFirstResponder () :Bool;
	public function becomeFirstResponder () :Bool;
	public function canResignFirstResponder () :Bool;
	public function resignFirstResponder () :Bool;
	
	// Managing Input Views
	public var inputView :UIView;
	public var inputAccessoryView :UIView;
	public function reloadInputViews () :Void;
/*	
	// Responding to Touch Events
	public function touchesBegan (touches:NSSet, withEvent:UIEvent) :Void;
	public function touchesMoved (touches:NSSet, withEvent:UIEvent) :Void;
	public function touchesEnded (touches:NSSet, withEvent:UIEvent) :Void;
	public function touchesCancelled (touches:NSSet, withEvent:UIEvent) :Void;
	
	// Responding to Motion Events
	public function motionBegan (motion:UIEventSubtype, withEvent:UIEvent) :Void;
	public function motionEnded (motion:UIEventSubtype, withEvent:UIEvent) :Void;
	public function motionCancelled (motion:UIEventSubtype, withEvent:UIEvent) :Void;
	
	// Responding to Remote-Control Events
	public function remoteControlReceivedWithEvent (event:UIEvent) :Void;
	
	// Getting the Undo Manager
	public var undoManager :NSUndoManager;*/
	
	// Validating Commands
	public function canPerformAction (action:Dynamic, withSender:Dynamic) :Bool;
}
