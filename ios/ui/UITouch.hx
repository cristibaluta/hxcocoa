package ios;

extern typedef UITouchPhase = {
    UITouchPhaseBegan,             // whenever a finger touches the surface.
    UITouchPhaseMoved,             // whenever a finger moves on the surface.
    UITouchPhaseStationary,        // whenever a finger is touching the surface but hasn't moved since the previous event.
    UITouchPhaseEnded,             // whenever a finger leaves the surface.
    UITouchPhaseCancelled,         // whenever a touch doesn't end but we need to stop tracking (e.g. putting device to face)
}

extern class UIWebView extends UIView {
	
	function new() : Void;

	 public var timestamp : NSTimeInterval;
	 public var phase : UITouchPhase;
	 public var tapCount : NSUInteger;   // touch down within a certain point within a certain amount of time

	 public var window : UIWindow;
	 public var view extends UIView;
	 public var gestureRecognizers : Array;

	 public function locationInView (view:UIView) :CGPoint;
	 public function previousLocationInView (view:UIView) :CGPoint;

}
