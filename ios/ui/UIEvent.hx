package ios.ui;

import objc.foundation.NSObject;
import objc.foundation.NSSet;

extern enum UIEventType {
    UIEventTypeTouches;
    UIEventTypeMotion;
    UIEventTypeRemoteControl;
}

extern enum UIEventSubtype {
    // available in iPhone OS 3.0
    UIEventSubtypeNone;
    
    // for UIEventTypeMotion, available in iPhone OS 3.0
    UIEventSubtypeMotionShake;
    
    // for UIEventTypeRemoteControl, available in iOS 4.0
    UIEventSubtypeRemoteControlPlay;
    UIEventSubtypeRemoteControlPause;
    UIEventSubtypeRemoteControlStop;
    UIEventSubtypeRemoteControlTogglePlayPause;
    UIEventSubtypeRemoteControlNextTrack;
    UIEventSubtypeRemoteControlPreviousTrack;
    UIEventSubtypeRemoteControlBeginSeekingBackward;
    UIEventSubtypeRemoteControlEndSeekingBackward;
    UIEventSubtypeRemoteControlBeginSeekingForward;
    UIEventSubtypeRemoteControlEndSeekingForward;
}

@:framework("UIKit")
extern class UIEvent extends NSObject {

	public var type : UIEventType;
	public var subtype : UIEventSubtype;

	public var timestamp : Int;

	public function allTouches () : NSSet;
	public function touchesForWindow (window:UIWindow) : NSSet;
	public function touchesForView (view:UIView) : NSSet;
	public function touchesForGestureRecognizer (gesture:UIGestureRecognizer) : NSSet;

}
