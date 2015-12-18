package ios.ui;
import objc.foundation.NSObject;
import objc.graphics.CGGeometry;


@:framework("UIKit")
extern enum UIGestureRecognizerState {
    UIGestureRecognizerStatePossible;   // the recognizer has not yet recognized its gesture, but may be evaluating touch events. this is the default state
    
    UIGestureRecognizerStateBegan;      // the recognizer has received touches recognized as the gesture. the action method will be called at the next turn of the run loop
    UIGestureRecognizerStateChanged;    // the recognizer has received touches recognized as a change to the gesture. the action method will be called at the next turn of the run loop
    UIGestureRecognizerStateEnded;      // the recognizer has received touches recognized as the end of the gesture. the action method will be called at the next turn of the run loop and the recognizer will be reset to UIGestureRecognizerStatePossible
    UIGestureRecognizerStateCancelled;  // the recognizer has received touches resulting in the cancellation of the gesture. the action method will be called at the next turn of the run loop. the recognizer will be reset to UIGestureRecognizerStatePossible
    
    UIGestureRecognizerStateFailed;     // the recognizer has received a touch sequence that can not be recognized as the gesture. the action method will not be called and the recognizer will be reset to UIGestureRecognizerStatePossible
    
    // Discrete Gestures – gesture recognizers that recognize a discrete event but do not report changes (for example, a tap) do not transition through the Began and Changed states and can not fail or be cancelled
    UIGestureRecognizerStateRecognized; // the recognizer has received touches recognized as the gesture. the action method will be called at the next turn of the run loop and the recognizer will be reset to UIGestureRecognizerStatePossible
}

@:framework("UIKit")
extern class UIGestureRecognizer extends NSObject {
	
	public function initWithTarget (target:Dynamic, action:SEL) :UIGestureRecognizer;

	public function addTarget (target:Dynamic, action:SEL) :Void;    // add a target/action pair. you can call this multiple times to specify multiple target/actions
	public function removeTarget (target:Dynamic, action:SEL) :Void; // remove the specified target/action pair. passing nil for target matches all targets, and the same for actions

	public var state (default, null) :UIGestureRecognizerState;  // the current state of the gesture recognizer

	public var delegate :UIGestureRecognizerDelegate; // the gesture recognizer's delegate

	public var enabled :Bool;  // default is YES. disabled gesture recognizers will not receive touches. when changed to NO the gesture recognizer will be cancelled if it's currently recognizing a gesture

// a UIGestureRecognizer receives touches hit-tested to its view and any of that view's subviews
	public var view (default, null) :UIView;           // the view the gesture is attached to. set by adding the recognizer to a UIView using the addGestureRecognizer: method

	public var cancelsTouchesInView :Bool;// default is YES. causes touchesCancelled:withEvent: to be sent to the view for all touches recognized as part of this gesture immediately before the action method is called
	public var delaysTouchesBegan :Bool;// default is NO.  causes all touch events to be delivered to the target view only after this gesture has failed recognition. set to YES to prevent views from processing any touches that may be recognized as part of this gesture
	public var delaysTouchesEnded :Bool;// default is YES. causes touchesEnded events to be delivered to the target view only after this gesture has failed recognition. this ensures that a touch that is part of the gesture can be cancelled if the gesture is recognized

// create a relationship with another gesture recognizer that will prevent this gesture's actions from being called until otherGestureRecognizer transitions to UIGestureRecognizerStateFailed
// if otherGestureRecognizer transitions to UIGestureRecognizerStateRecognized or UIGestureRecognizerStateBegan then this recognizer will instead transition to UIGestureRecognizerStateFailed
// example usage: a single tap may require a double tap to fail
	public function requireGestureRecognizerToFail (otherGestureRecognizer:UIGestureRecognizer) :Void;

// individual UIGestureRecognizer subclasses may provide subclass-specific location information. see individual subclasses for details
	public function locationInView (view:UIView) :CGPoint;// a generic single-point location for the gesture. usually the centroid of the touches involved

	public function numberOfTouches () :Int;// number of touches involved for which locations can be queried
	public function locationOfTouch (touchIndex:Int, inView:UIView) :CGPoint; // the location of a particular touch

}


@:framework("UIKit")
extern interface UIGestureRecognizerDelegate {
#if display
// called when a gesture recognizer attempts to transition out of UIGestureRecognizerStatePossible. returning NO causes it to transition to UIGestureRecognizerStateFailed
	public function gestureRecognizerShouldBegin (gestureRecognizer:UIGestureRecognizer) :Bool;

// called when the recognition of one of gestureRecognizer or otherGestureRecognizer would be blocked by the other
// return YES to allow both to recognize simultaneously. the default implementation returns NO (by default no two gestures can be recognized simultaneously)
//
// note: returning YES is guaranteed to allow simultaneous recognition. returning NO is not guaranteed to prevent simultaneous recognition, as the other gesture's delegate may return YES
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer;

// called before touchesBegan:withEvent: is called on the gesture recognizer for a new touch. return NO to prevent the gesture recognizer from seeing this touch
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch;
#end
}
