//
//  UIRotationGestureRecognizer.h
package ios.ui;

// Begins:  when two touches have moved enough to be considered a rotation
// Changes: when a finger moves while two fingers are down
// Ends:    when both fingers have lifted

@:framework("UIKit")
extern class UIRotationGestureRecognizer extends UIGestureRecognizer {

	public var rotation :Float;            // rotation in radians
	public var velocity (default, null) :Float;            // velocity of the pinch in radians/second

}
