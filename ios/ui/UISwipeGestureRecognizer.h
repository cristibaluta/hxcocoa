//
//  UISwipeGestureRecognizer.h
package ios.ui;

@:framework("UIKit")
extern enum UISwipeGestureRecognizerDirection {
    UISwipeGestureRecognizerDirectionRight;
    UISwipeGestureRecognizerDirectionLeft;
    UISwipeGestureRecognizerDirectionUp;
    UISwipeGestureRecognizerDirectionDown;
}

@:framework("UIKit")
extern class UISwipeGestureRecognizer extends UIGestureRecognizer {

	public var numberOfTouchesRequired :Int; // default is 1. the number of fingers that must swipe
	public var direction :UISwipeGestureRecognizerDirection;// default is UISwipeGestureRecognizerDirectionRight. the desired direction of the swipe. multiple directions may be specified if they will result in the same behavior (for example, UITableView swipe delete)

}
