package ios.ui;

import objc.graphics.CGGeometry;

extern enum UITouchPhase {
    UITouchPhaseBegan;             // whenever a finger touches the surface.
    UITouchPhaseMoved;             // whenever a finger moves on the surface.
    UITouchPhaseStationary;        // whenever a finger is touching the surface but hasn't moved since the previous event.
    UITouchPhaseEnded;             // whenever a finger leaves the surface.
    UITouchPhaseCancelled;         // whenever a touch doesn't end but we need to stop tracking (e.g. putting device to face)
}

extern class UITouch extends UIView {
	
	function new () : Void;

	 public var timestamp : Float;
	 public var phase : UITouchPhase;
	 public var tapCount : Int;   // touch down within a certain point within a certain amount of time

	 //public var window : UIWindow;
	 public var view : UIView;
	 //public var gestureRecognizers : Array<Dynamic>;

	 public function locationInView (view:UIView) :CGPoint;
	 public function previousLocationInView (view:UIView) :CGPoint;

}
