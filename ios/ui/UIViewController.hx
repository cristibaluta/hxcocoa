package ios.ui;

extern class UIViewController extends UIResponder {
	
	public function loadView () :Void;
	public function viewDidLoad () :Void;
	public function isViewLoaded () :Bool;
	
	public var view :UIView;
}
/*

@class UIView;
@class UINavigationItem, UIBarButtonItem, UITabBarItem;
@class UISearchDisplayController;
@class UIPopoverController;
@class UIStoryboard, UIStoryboardSegue;

typedef NS_ENUM(NSInteger, UIModalTransitionStyle) {
    UIModalTransitionStyleCoverVertical = 0,
    UIModalTransitionStyleFlipHorizontal,
    UIModalTransitionStyleCrossDissolve,
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_3_2
    UIModalTransitionStylePartialCurl,
#endif
};

typedef NS_ENUM(NSInteger, UIModalPresentationStyle) {
    UIModalPresentationFullScreen = 0,
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_3_2
    UIModalPresentationPageSheet,
    UIModalPresentationFormSheet,
    UIModalPresentationCurrentContext,
#endif

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

	public var (nonatomic,retain) UIView *view; // The getter first invokes [self loadView] if the view hasn't been set yet. Subclasses must call super if they override the setter or getter.
	public function ; // This is where subclasses should create their custom view hierarchy if they aren't using a nib. Should never be called directly.

	public function ; // Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
- (BOOL) NS_AVAILABLE_IOS(3_0);

	public var (default, null) NSString *nibName;     // The name of the nib to be loaded to instantiate the view.
	public var (default, null) NSBundle *nibBundle; // The bundle from which to load the nib.
	public var (default, null) UIStoryboard *storyboard NS_AVAILABLE_IOS(5_0);

	public function performSegueWithIdentifier:(NSString *)identifier sender:(id)sender NS_AVAILABLE_IOS(5_0);
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender NS_AVAILABLE_IOS(6_0); // Invoked immediately prior to initiating a segue. Return NO to prevent the segue from firing. The default implementation returns YES. This method is not invoked when -performSegueWithIdentifier:sender: is used.
	public function prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender NS_AVAILABLE_IOS(5_0);

// View controllers will receive this message during segue unwinding. The default implementation returns the result of -respondsToSelector: - controllers can override this to perform any ancillary checks, if necessary.
- (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender NS_AVAILABLE_IOS(6_0);

// Custom containers should override this method and search their children for an action handler (using -canPerformUnwindSegueAction:fromViewController:sender:). If a handler is found, the controller should return it. Otherwise, the result of invoking super's implementation should be returned.
- (UIViewController *)viewControllerForUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender NS_AVAILABLE_IOS(6_0);

// Custom container view controllers should override this method and return segue instances that will perform the navigation portion of segue unwinding.
- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier NS_AVAILABLE_IOS(6_0);

	public function viewWillAppear:(BOOL)animated;    // Called when the view is about to made visible. Default does nothing
	public function viewDidAppear:(BOOL)animated;     // Called when the view has been fully transitioned onto the screen. Default does nothing
	public function viewWillDisappear:(BOOL)animated; // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
	public function viewDidDisappear:(BOOL)animated;  // Called after the view was dismissed, covered or otherwise hidden. Default does nothing

// Called just before the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
	public function viewWillLayoutSubviews NS_AVAILABLE_IOS(5_0);
// Called just after the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
	public function viewDidLayoutSubviews NS_AVAILABLE_IOS(5_0);

public var  NSString *title;  // Localized title for use by a parent controller.

	public function didReceiveMemoryWarning; // Called when the parent application receives a memory warning. On iOS 6.0 it will no longer clear the view by default.


	public var (default, null) UIViewController *parentViewController;

// This property has been replaced by presentedViewController.
	public var (default, null) UIViewController *modalViewController NS_DEPRECATED_IOS(2_0, 6_0);

// The view controller that was presented by this view controller or its nearest ancestor.
	public var (default, null) UIViewController *presentedViewController  NS_AVAILABLE_IOS(5_0);

// The view controller that presented this view controller (or its farthest ancestor.)
	public var (default, null) UIViewController *presentingViewController NS_AVAILABLE_IOS(5_0);

	public var  BOOL definesPresentationContext NS_AVAILABLE_IOS(5_0);

// A controller that defines the presentation context can also specify the modal transition style if this property is true.
	public var  BOOL providesPresentationContextTransitionStyle NS_AVAILABLE_IOS(5_0);


- (BOOL)isBeingPresented NS_AVAILABLE_IOS(5_0);
- (BOOL)isBeingDismissed NS_AVAILABLE_IOS(5_0);

- (BOOL)isMovingToParentViewController NS_AVAILABLE_IOS(5_0);
- (BOOL)isMovingFromParentViewController NS_AVAILABLE_IOS(5_0);


	public function presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^)(void))completion NS_AVAILABLE_IOS(5_0);
// The completion handler, if provided, will be invoked after the dismissed controller's viewDidDisappear: callback is invoked.
	public function dismissViewControllerAnimated: (BOOL)flag completion: (void (^)(void))completion NS_AVAILABLE_IOS(5_0);

// Display another view controller as a modal child. Uses a vertical sheet transition if animated.This method has been replaced by presentViewController:animated:completion:
	public function presentModalViewController:(UIViewController *)modalViewController animated:(BOOL)animated NS_DEPRECATED_IOS(2_0, 6_0);

// Dismiss the current modal child. Uses a vertical sheet transition if animated. This method has been replaced by dismissViewControllerAnimated:completion:
	public function dismissModalViewControllerAnimated:(BOOL)animated NS_DEPRECATED_IOS(2_0, 6_0);


	public var  UIModalTransitionStyle modalTransitionStyle NS_AVAILABLE_IOS(3_0);
	public var  UIModalPresentationStyle modalPresentationStyle NS_AVAILABLE_IOS(3_2);

// Presentation modes may keep the keyboard visible when not required. Default implementation affects UIModalPresentationFormSheet visibility.
- (BOOL)disablesAutomaticKeyboardDismissal NS_AVAILABLE_IOS(4_3);

	public var  BOOL wantsFullScreenLayout NS_AVAILABLE_IOS(3_0);

}

// To make it more convenient for applications to adopt rotation, a view controller may implement the below methods. Your UIWindow's frame should use [UIScreen mainScreen].bounds as its frame.
extern class UIViewController (UIViewControllerRotation)

// call this method when your return value from shouldAutorotateToInterfaceOrientation: changes
// if the current interface orientation does not match the current device orientation, a rotation may occur provided all relevant view controllers now return YES from shouldAutorotateToInterfaceOrientation:
+ (void)attemptRotationToDeviceOrientation NS_AVAILABLE_IOS(5_0);

// Applications should use supportedInterfaceOrientations and/or shouldAutorotate..
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation NS_DEPRECATED_IOS(2_0, 6_0);

// New Autorotation support.
- (BOOL)shouldAutorotate NS_AVAILABLE_IOS(6_0);
- (NSUInteger)supportedInterfaceOrientations NS_AVAILABLE_IOS(6_0);
// Returns interface orientation masks.
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation NS_AVAILABLE_IOS(6_0);

// The rotating header and footer views will slide out during the rotation and back in once it has completed.
- (UIView *)rotatingHeaderView;     // Must be in the view hierarchy. Default returns nil.
- (UIView *)rotatingFooterView;     // Must be in the view hierarchy. Default returns nil.

	public var (default, null) UIInterfaceOrientation interfaceOrientation;

// Notifies when rotation begins, reaches halfway point and ends.
	public function willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration;
	public function didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation;

// Faster one-part variant, called from within a rotating animation block, for additional animations during rotation.
// A subclass may override this method, or the two-part variants below, but not both.
	public function willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration NS_AVAILABLE_IOS(3_0);

// Slower two-part variant, called from within a rotating animation block, for additional animations during rotation.
// A subclass may override these methods, or the one-part variant above, but not both.
	public function willAnimateFirstHalfOfRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration NS_DEPRECATED_IOS(2_0, 5_0);
	public function didAnimateFirstHalfOfRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation NS_DEPRECATED_IOS(2_0, 5_0); // The rotating header and footer views are offscreen.
	public function willAnimateSecondHalfOfRotationFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation duration:(NSTimeInterval)duration NS_DEPRECATED_IOS(2_0, 5_0); // A this point, our view orientation is set to the new orientation.

}

// Many view controllers have a view that may be in an editing state or not- for example, a UITableView.  These view
// controllers can track the editing state, and generate an Edit|Done button to be used in a navigation bar.
extern class UIViewController (UIViewControllerEditing)

	public var (nonatomic,getter=isEditing) BOOL editing;
	public function setEditing:(BOOL)editing animated:(BOOL)animated; // Updates the appearance of the Edit|Done button item as necessary. Clients who override it must call super first.

- (UIBarButtonItem *)editButtonItem; // Return an Edit|Done button that can be used as a navigation item's custom view. Default action toggles the editing state with animation.

}

extern class UIViewController (UISearchDisplayControllerSupport)

	public var (default, null) UISearchDisplayController *searchDisplayController;

}


UIKIT_EXTERN NSString *const UIViewControllerHierarchyInconsistencyException NS_AVAILABLE_IOS(5_0);


extern class UIViewController (UIContainerViewControllerProtectedMethods)

// An array of children view controllers. This array does not include any presented view controllers.
	public var (default, null) NSArray *childViewControllers NS_AVAILABLE_IOS(5_0);


	public function addChildViewController:(UIViewController *)childController NS_AVAILABLE_IOS(5_0);


	public function  removeFromParentViewController NS_AVAILABLE_IOS(5_0);


	public function transitionFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(5_0);

// If a custom container controller manually forwards its appearance callbacks, then rather than calling
// viewWillAppear:, viewDidAppear: viewWillDisappear:, or viewDidDisappear: on the children these methods
// should be used instead. This will ensure that descendent child controllers appearance methods will be
// invoked. It also enables more complex custom transitions to be implemented since the appearance callbacks are
// now tied to the final matching invocation of endAppearanceTransition.
	public function beginAppearanceTransition:(BOOL)isAppearing animated:(BOOL)animated __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0);
	public function endAppearanceTransition __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0);

}

extern class UIViewController (UIContainerViewControllerCallbacks)


// This soon to be deprecated method
- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers NS_DEPRECATED_IOS(5_0,6_0);
// is being replaced by these two methods.
- (BOOL)shouldAutomaticallyForwardRotationMethods NS_AVAILABLE_IOS(6_0);
- (BOOL)shouldAutomaticallyForwardAppearanceMethods NS_AVAILABLE_IOS(6_0);



	public function willMoveToParentViewController:(UIViewController *)parent NS_AVAILABLE_IOS(5_0);
	public function didMoveToParentViewController:(UIViewController *)parent NS_AVAILABLE_IOS(5_0);

}

extern class UIViewController (UIStateRestoration)
	public var NSString *restorationIdentifier NS_AVAILABLE_IOS(6_0);
	public var  (nonatomic, readwrite, assign) Class<UIViewControllerRestoration> restorationClass NS_AVAILABLE_IOS(6_0);
	public function  encodeRestorableStateWithCoder:(NSCoder *)coder NS_AVAILABLE_IOS(6_0);
	public function  decodeRestorableStateWithCoder:(NSCoder *)coder NS_AVAILABLE_IOS(6_0);
}

extern class UIViewController (UIConstraintBasedLayoutCoreMethods)

	public function updateViewConstraints NS_AVAILABLE_IOS(6_0);
}
*/
