//
//  UITapGestureRecognizer.h
package ios.ui;

// Recognizes: when numberOfTouchesRequired have tapped numberOfTapsRequired times

// Touch Location Behaviors:
//     locationInView:         location of the tap, from the first tap in the sequence if numberOfTapsRequired > 1. this is the centroid if numberOfTouchesRequired > 1
//     locationOfTouch:inView: location of a particular touch, from the first tap in the sequence if numberOfTapsRequired > 1

@:framework("UIKit")
extern class UITapGestureRecognizer extends UIGestureRecognizer {

	public var numberOfTapsRequired :Int;// Default is 1. The number of taps required to match
	public var numberOfTouchesRequired :Int;// Default is 1. The number of fingers required to match

}
