//
//  UINavigationController.h
package ios.ui;
//
//  Copyright (c) 2007-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIViewController.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UIInterface.h>
#import <UIKit/UIGeometry.h>

/*!
 UINavigationController manages a stack of view controllers and a navigation bar.
 It performs horizontal view transitions for pushed and popped views while keeping the navigation bar in sync.
 
 Most clients will not need to subclass UINavigationController.
 
 If a navigation controller is nested in a tabbar controller, it uses the title and toolbar attributes of the bottom view controller on the stack.
 
 UINavigationController is rotatable if its top view controller is rotatable.
 Navigation between controllers with non-uniform rotatability is currently not supported.
*/

UIKIT_EXTERN const Float UINavigationControllerHideShowBarDuration;

@class UIView, UINavigationBar, UINavigationItem, UIToolbar, UILayoutContainerView;
extern interface UINavigationControllerDelegate;

extern class UINavigationController extends UIViewController {
  @package
    UIView           *_containerView;
    UINavigationBar  *_navigationBar;
    Class             _navigationBarClass;
    UIToolbar 	     *_toolbar;
    UIView           *_navigationTransitionView;

    UIEdgeInsets      _currentScrollContentInsetDelta;
    UIEdgeInsets      _previousScrollContentInsetDelta;
    Float           _previousScrollContentOffsetDelta;
    Float			  _bottomInsetDelta;
    
    UIViewController *_disappearingViewController;
    
    id <UINavigationControllerDelegate> _delegate;

    UIBarStyle _savedNavBarStyleBeforeSheet;
    UIBarStyle _savedToolBarStyleBeforeSheet;

    struct {
        unsigned int isAppearingAnimated:1;
        unsigned int isAlreadyPoppingNavigationItem:1;
        unsigned int isNavigationBarHidden:1;
        unsigned int isToolbarShown:1;
        unsigned int needsDeferredTransition:1;
        unsigned int isTransitioning:1;
        unsigned int lastOperation:4;
        unsigned int lastOperationAnimated:1;
        unsigned int deferredTransition:8;
        unsigned int didPreloadKeyboardAnimation:1;
        unsigned int didHideBottomBar:1;
        unsigned int isChangingOrientationForPop:1;
        unsigned int pretendNavBarHidden:1;
        unsigned int avoidMovingNavBarOffscreenBeforeUnhiding:1;
        unsigned int searchBarHidNavBar:1; 
        unsigned int useSystemPopoverBarAppearance:1;
        unsigned int isCustomTransition:1;        
    } _navigationControllerFlags;
}

/* Use this initializer to make the navigation controller use your custom bar class. 
   Passing nil for navigationBarClass will get you UINavigationBar, nil for toolbarClass gets UIToolbar.
   The arguments must otherwise be subclasses of the respective UIKit classes.
 */
- (instancetype)initWithNavigationBarClass:(Class)navigationBarClass toolbarClass:(Class)toolbarClass NS_AVAILABLE_IOS(5_0);

- (id)initWithRootViewController:(UIViewController *)rootViewController; // Convenience method pushes the root view controller without animation.

	public function pushViewController:(UIViewController *)viewController animated:(BOOL)animated; // Uses a horizontal slide transition. Has no effect if the view controller is already in the stack.

- (UIViewController *)popViewControllerAnimated:(BOOL)animated; // Returns the popped controller.
- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated; // Pops view controllers until the one specified is on top. Returns the popped controllers.
- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated; // Pops until there's only a single view controller left on the stack. Returns the popped controllers.

	public var (default, null) UIViewController *topViewController; // The top view controller on the stack.
	public var (default, null) UIViewController *visibleViewController; // Return modal view controller if it exists. Otherwise the top view controller.

public var  NSArray *viewControllers; // The current view controller stack.
	public function setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated NS_AVAILABLE_IOS(3_0); // If animated is YES, then simulate a push or pop depending on whether the new top view controller was previously in the stack.

	public var (nonatomic,getter=isNavigationBarHidden) BOOL navigationBarHidden;
	public function setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated; // Hide or show the navigation bar. If animated, it will transition vertically using UINavigationControllerHideShowBarDuration.
	public var (default, null) UINavigationBar *navigationBar; // The navigation bar managed by the controller. Pushing, popping or setting navigation items on a managed navigation bar is not supported.

	public var (nonatomic,getter=isToolbarHidden) BOOL toolbarHidden NS_AVAILABLE_IOS(3_0); // Defaults to YES, i.e. hidden.
	public function setToolbarHidden:(BOOL)hidden animated:(BOOL)animated NS_AVAILABLE_IOS(3_0); // Hide or show the toolbar at the bottom of the screen. If animated, it will transition vertically using UINavigationControllerHideShowBarDuration.
	public var (default, null) UIToolbar *toolbar NS_AVAILABLE_IOS(3_0); // For use when presenting an action sheet.

	public var  id<UINavigationControllerDelegate> delegate;

}

extern interface UINavigationControllerDelegate <NSObject>

@optional

// Called when the navigation controller shows a new top view controller via a push, pop or setting of the view controller stack.
	public function navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
	public function navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated;

}

extern class UIViewController (UINavigationControllerItem)

	public var (default, null) UINavigationItem *navigationItem; // Created on-demand so that a view controller may customize its navigation appearance.
	public var  BOOL hidesBottomBarWhenPushed; // If YES, then when this view controller is pushed into a controller hierarchy with a bottom bar (like a tab bar), the bottom bar will slide out. Default is NO.
	public var (default, null) UINavigationController *navigationController; // If this view controller has been pushed onto a navigation controller, return it.

}

extern class UIViewController (UINavigationControllerContextualToolbarItems)

	public var NSArray *toolbarItems NS_AVAILABLE_IOS(3_0);
	public function setToolbarItems:(NSArray *)toolbarItems animated:(BOOL)animated NS_AVAILABLE_IOS(3_0);

}
