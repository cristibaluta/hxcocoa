package ios.ui;

import objc.foundation.NSBundle;
import objc.foundation.NSCoder;
import ios.ui.UIResponder;
import ios.ui.UIStoryboard;
import ios.ui.UIStoryboardSegue;
import ios.ui.UIApplication;
import ios.ui.UIBarButtonItem;
import ios.ui.UIView;

@:framework("UIKit")
extern enum UIModalTransitionStyle {
    UIModalTransitionStyleCoverVertical;
    UIModalTransitionStyleFlipHorizontal;
    UIModalTransitionStyleCrossDissolve;
    UIModalTransitionStylePartialCurl;
}

@:framework("UIKit")
extern enum UIModalPresentationStyle {
    UIModalPresentationFullScreen;
    UIModalPresentationPageSheet;
    UIModalPresentationFormSheet;
    UIModalPresentationCurrentContext;
}


@:framework("UIKit")
extern class UIViewController extends UIResponder {
	
	public function loadView () :Void;
	public function viewDidLoad () :Void;
	public function isViewLoaded () :Bool;
	
	public var view :UIView;



	public function initWithNibName (nibNameOrNil:String, bundle:NSBundle) :UIViewController;

	public var nibName (default, null) :String;// The name of the nib to be loaded to instantiate the view.
	public var nibBundle (default, null) :NSBundle; // The bundle from which to load the nib.
	@:require(ios5_0)public var storyboard (default, null) :UIStoryboard;

	@:require(ios5_0)public function performSegueWithIdentifier (identifier:String, sender:Dynamic) :Void;
	@:require(ios6_0)public function shouldPerformSegueWithIdentifier (identifier:String, sender:Dynamic) :Bool;
	@:require(ios5_0)public function prepareForSegue (segue:UIStoryboardSegue, sender:Dynamic) :Void;

// View controllers will receive this message during segue unwinding. The default implementation returns the result of -respondsToSelector: - controllers can override this to perform any ancillary checks, if necessary.
	@:require(ios6_0)public function canPerformUnwindSegueAction (action:SEL, fromViewController:UIViewController, withSender:Dynamic) :Bool;

// Custom containers should override this method and search their children for an action handler (using -canPerformUnwindSegueAction:fromViewController:sender:). If a handler is found, the controller should return it. Otherwise, the result of invoking super's implementation should be returned.
	@:require(ios6_0)public function viewControllerForUnwindSegueAction (action:SEL, fromViewController:UIViewController, withSender:Dynamic) :UIViewController;

// Custom container view controllers should override this method and return segue instances that will perform the navigation portion of segue unwinding.
	@:require(ios6_0)public function segueForUnwindingToViewController (toViewController:UIViewController, fromViewController:UIViewController, identifier:String) :UIStoryboardSegue;

	public function viewWillAppear (animated:Bool) :Void;    // Called when the view is about to made visible. Default does nothing
	public function viewDidAppear (animated:Bool) :Void;     // Called when the view has been fully transitioned onto the screen. Default does nothing
	public function viewWillDisappear (animated:Bool) :Void; // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
	public function viewDidDisappear (animated:Bool) :Void;  // Called after the view was dismissed, covered or otherwise hidden. Default does nothing

// Called just before the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
	@:require(ios5_0)public function viewWillLayoutSubviews () :Void;
// Called just after the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
	@:require(ios5_0)public function viewDidLayoutSubviews () :Void;

	public var title :String;  // Localized title for use by a parent controller.

	public function didReceiveMemoryWarning () :Void; // Called when the parent application receives a memory warning. On iOS 6.0 it will no longer clear the view by default.


	public var parentViewController (default, null) :UIViewController;

// The view controller that was presented by this view controller or its nearest ancestor.
	@:require(ios5_0)public var presentedViewController (default, null) :UIViewController;

// The view controller that presented this view controller (or its farthest ancestor.)
	@:require(ios5_0)public var presentingViewController (default, null) :UIViewController;

	@:require(ios5_0)public var definesPresentationContext :Bool;

// A controller that defines the presentation context can also specify the modal transition style if this property is true.
	@:require(ios5_0)public var providesPresentationContextTransitionStyle :Bool;


	@:require(ios5_0)public function isBeingPresented () :Bool;
	@:require(ios5_0)public function isBeingDismissed () :Bool;

	@:require(ios5_0)public function isMovingToParentViewController () :Bool;
	@:require(ios5_0)public function isMovingFromParentViewController () :Bool;


	@:require(ios5_0)public function presentViewController (viewControllerToPresent:UIViewController, animated:Bool, completion:Void->Void) :Void;
// The completion handler, if provided, will be invoked after the dismissed controller's viewDidDisappear: callback is invoked.
	@:require(ios5_0)public function dismissViewControllerAnimated (flag:Bool, completion:Void->Void) :Void;


	public var modalTransitionStyle :UIModalTransitionStyle;
	public var modalPresentationStyle :UIModalPresentationStyle;

// Presentation modes may keep the keyboard visible when not required. Default implementation affects UIModalPresentationFormSheet visibility.
	public function disablesAutomaticKeyboardDismissal () :Bool;

	public var wantsFullScreenLayout :Bool;

// (UIViewControllerRotation)

// call this method when your return value from shouldAutorotateToInterfaceOrientation: changes
// if the current interface orientation does not match the current device orientation, a rotation may occur provided all relevant view controllers now return YES from shouldAutorotateToInterfaceOrientation:
	@:require(ios5_0)public static function attemptRotationToDeviceOrientation () :Void;

// New Autorotation support.
	@:require(ios6_0)public function shouldAutorotate () :Bool;
	@:require(ios6_0)public function supportedInterfaceOrientations () :Int;
// Returns interface orientation masks.
	@:require(ios6_0)public function preferredInterfaceOrientationForPresentation () :UIInterfaceOrientation;

// The rotating header and footer views will slide out during the rotation and back in once it has completed.
	public function rotatingHeaderView () :UIView;     // Must be in the view hierarchy. Default returns nil.
	public function rotatingFooterView () :UIView;     // Must be in the view hierarchy. Default returns nil.

	public var interfaceOrientation (default, null) :UIInterfaceOrientation;

// Notifies when rotation begins, reaches halfway point and ends.
	public function willRotateToInterfaceOrientation (toInterfaceOrientation:UIInterfaceOrientation, duration:Int) :Void;
	public function didRotateFromInterfaceOrientation (fromInterfaceOrientation:UIInterfaceOrientation) :Void;

// Faster one-part variant, called from within a rotating animation block, for additional animations during rotation.
// A subclass may override this method, or the two-part variants below, but not both.
	public function willAnimateRotationToInterfaceOrientation (toInterfaceOrientation:UIInterfaceOrientation, duration:Float) :Void;

// Many view controllers have a view that may be in an editing state or not- for example, a UITableView.  These view
// controllers can track the editing state, and generate an Edit|Done button to be used in a navigation bar.
// (UIViewControllerEditing)

	public var editing :Bool;
	public function setEditing (editing:Bool, animated:Bool) :Void; // Updates the appearance of the Edit|Done button item as necessary. Clients who override it must call super first.

	public var editButtonItem :UIBarButtonItem; // Return an Edit|Done button that can be used as a navigation item's custom view. Default action toggles the editing state with animation.


// (UISearchDisplayControllerSupport)

	//public var searchDisplayController (default, null) :UISearchDisplayController;


// (UIContainerViewControllerProtectedMethods)

// An array of children view controllers. This array does not include any presented view controllers.
	@:require(ios5_0)public var childViewControllers (default, null) :Array<UIViewController>;
	@:require(ios5_0)public function addChildViewController (childController:UIViewController) :Void;
	@:require(ios5_0)public function removeFromParentViewController () :Void;
	@:require(ios5_0)public function transitionFromViewController (fromViewController:UIViewController, toViewController:UIViewController, duration:Float, options:UIViewAnimationOptions, animations:Void->Void, completion:Bool->Void) :Void;

// If a custom container controller manually forwards its appearance callbacks, then rather than calling
// viewWillAppear:, viewDidAppear: viewWillDisappear:, or viewDidDisappear: on the children these methods
// should be used instead. This will ensure that descendent child controllers appearance methods will be
// invoked. It also enables more complex custom transitions to be implemented since the appearance callbacks are
// now tied to the final matching invocation of endAppearanceTransition.
	@:require(ios5_0)public function beginAppearanceTransition (isAppearing:Bool, animated:Bool) :Void;
	@:require(ios5_0)public function endAppearanceTransition () :Void;

// (UIContainerViewControllerCallbacks)


	@:require(ios6_0)public function shouldAutomaticallyForwardRotationMethods () :Bool;
	@:require(ios6_0)public function shouldAutomaticallyForwardAppearanceMethods () :Bool;



	@:require(ios5_0)public function willMoveToParentViewController (parent:UIViewController) :Void;
	@:require(ios5_0)public function didMoveToParentViewController (parent:UIViewController) :Void;


// (UIStateRestoration)
	@:require(ios6_0)public var restorationIdentifier :String;
	//@:require(ios6_0)public var restorationClass :Class<UIViewControllerRestoration>;
	@:require(ios6_0)public function encodeRestorableStateWithCoder (coder:NSCoder) :Void;
	@:require(ios6_0)public function decodeRestorableStateWithCoder (coder:NSCoder) :Void;

//UIConstraintBasedLayoutCoreMethods)

	@:require(ios6_0)public function updateViewConstraints () :Void;


//UINavigationControllerContextualToolbarItems)

	//public var toolbarItems :Array<>;
	//public function setToolbarItems (toolbarItems:Array<>, animated:Bool) :Void;
	
}