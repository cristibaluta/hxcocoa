package ios.ui;


/*!
 UINavigationController manages a stack of view controllers and a navigation bar.
 It performs horizontal view transitions for pushed and popped views while keeping the navigation bar in sync.
 
 Most clients will not need to subclass UINavigationController.
 
 If a navigation controller is nested in a tabbar controller, it uses the title and toolbar attributes of the bottom view controller on the stack.
 
 UINavigationController is rotatable if its top view controller is rotatable.
 Navigation between controllers with non-uniform rotatability is currently not supported.
*/


@:framework("UIKit")
extern class UINavigationController extends UIViewController {


/* Use this initializer to make the navigation controller use your custom bar class. 
   Passing nil for navigationBarClass will get you UINavigationBar, nil for toolbarClass gets UIToolbar.
   The arguments must otherwise be subclasses of the respective UIKit classes.
 */
- (instancetype)initWithNavigationBarClass:(Class)navigationBarClass toolbarClass:(Class)toolbarClass NS_AVAILABLE_IOS(5_0);

	public function initWithRootViewController (rootViewController:UIViewController) :UINavigationViewController; // Convenience method pushes the root view controller without animation.

	public function pushViewController (viewController:UIViewController, animated:Bool) :Void;

	public function popViewControllerAnimated (animated:Bool) :UIViewController; // Returns the popped controller.
	public function popToViewController (viewController:UIViewController, animated:Bool) :Array<UIViewController>;
	public function popToRootViewControllerAnimated (animated:Bool) :Array<UIViewController>; // Pops until there's only a single view controller left on the stack. Returns the popped controllers.

	public var topViewController (default, null) :UIViewController; // The top view controller on the stack.
	public var visibleViewController (default, null) :UIViewController; // Return modal view controller if it exists. Otherwise the top view controller.

	public var viewControllers :Array<UIViewController>; // The current view controller stack.
	public function setViewControllers (viewControllers:Array<UIViewController>, animated:Bool) :Void;
	// If animated is YES, then simulate a push or pop depending on whether the new top view controller was previously in the stack.

	public var navigationBarHidden :Bool;
	public function setNavigationBarHidden (hidden:Bool, animated:Bool) :Void;
	public var navigationBar (default, null) :UINavigationBar;

	public var toolbarHidden :Bool; // Defaults to YES, i.e. hidden.
	public function setToolbarHidden (hidden:Bool, animated:Bool) :Void;
	public var toolbar (default, null) :UIToolbar; // For use when presenting an action sheet.

	public var delegate :UINavigationControllerDelegate;
	
	// (UINavigationControllerItem)

	public var navigationItem (default, null) :UINavigationItem; // Created on-demand so that a view controller may customize its navigation appearance.
	public var hidesBottomBarWhenPushed :Bool; // If YES, then when this view controller is pushed into a controller hierarchy with a bottom bar (like a tab bar), the bottom bar will slide out. Default is NO.
	public var navigationController (default, null) :UINavigationController; // If this view controller has been pushed onto a navigation controller, return it.
}

@:framework("UIKit")
extern interface UINavigationControllerDelegate {

#if display
	public function navigationController (navigationController:UINavigationController, willShowViewController:UIViewController, animated:Bool) :Void;
	public function navigationController (navigationController:UINavigationController, didShowViewController:UIViewController, animated:Bool) :Void;
#end
}
