//
//  UINavigationBar.h
package ios.ui;
import objc.foundation.NSObject;

@:framework("UIKit")
extern class UINavigationBar extends UIView {
#if display
	public var  UIBarStyle barStyle;
	public var  id delegate;
	public var (nonatomic,assign,getter=isTranslucent) BOOL translucent NS_AVAILABLE_IOS(3_0); // Default is NO. Always YES if barStyle is set to UIBarStyleBlackTranslucent

// Pushing a navigation item displays the item's title in the center of the navigation bar.
// The previous top navigation item (if it exists) is displayed as a "back" button on the left.
	public function pushNavigationItem:(UINavigationItem *)item animated:(BOOL)animated;
- (UINavigationItem *)popNavigationItemAnimated:(BOOL)animated; // Returns the item that was popped.

	public var (default, null) UINavigationItem *topItem;
	public var (default, null) UINavigationItem *backItem;

public var  NSArray *items;
	public function setItems:(NSArray *)items animated:(BOOL)animated; // If animated is YES, then simulate a push or pop depending on whether the new top item was previously in the stack.

	public var (nonatomic,retain) UIColor *tintColor UI_APPEARANCE_SELECTOR;

/* In general, you should specify a value for the normal state to be used by other states which don't have a custom value set.
 
 Similarly, when a property is dependent on the bar metrics (on the iPhone in landscape orientation, bars have a different height from standard), be sure to specify a value for UIBarMetricsDefault.
 
 DISCUSSION: Interdependence of barStyle, tintColor, backgroundImage.
 When barStyle or tintColor is set as well as the bar's background image,
 the bar buttons (unless otherwise customized) will inherit the underlying
 barStyle or tintColor.
 */
	public function setBackgroundImage:(UIImage *)backgroundImage forBarMetrics:(UIBarMetrics)barMetrics NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
- (UIImage *)backgroundImageForBarMetrics:(UIBarMetrics)barMetrics NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

/* Default is nil. When non-nil, a custom shadow image to show instead of the default shadow image. For a custom shadow to be shown, a custom background image must also be set with -setBackgroundImage:forBarMetrics: (if the default background image is used, the default shadow image will be used).
 */
	public var (nonatomic,retain) UIImage *shadowImage NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;

/* You may specify the font, text color, text shadow color, and text shadow offset for the title in the text attributes dictionary, using the keys found in UIStringDrawing.h.
 */
public var  NSDictionary *titleTextAttributes NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

	public function setTitleVerticalPositionAdjustment:(Float)adjustment forBarMetrics:(UIBarMetrics)barMetrics NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
- (Float)titleVerticalPositionAdjustmentForBarMetrics:(UIBarMetrics)barMetrics NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
#end
}

extern interface UINavigationBarDelegate {
#if display
@optional

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item; // called to push. return NO not to.
	public function navigationBar:(UINavigationBar *)navigationBar didPushItem:(UINavigationItem *)item;    // called at end of animation of push or immediately if not animated
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item;  // same as push methods
	public function navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item;
#end
}

@:framework("UIKit")
extern class UINavigationItem extends NSObject {
	#if display
- (id)initWithTitle:(String *)title;

	public var    String        *title;             // Title when topmost on the stack. default is nil
	public var (nonatomic,retain) UIBarButtonItem *backBarButtonItem; // Bar button item to use for the back button in the child navigation item.
	public var (nonatomic,retain) UIView          *titleView;         // Custom view to use in lieu of a title. May be sized horizontally. Only used when item is topmost on the stack.

	public var    String *prompt;     // Explanatory text to display above the navigation bar buttons.

	public var  BOOL hidesBackButton; // If YES, this navigation item will hide the back button when it's on top of the stack.
	public function setHidesBackButton:(BOOL)hidesBackButton animated:(BOOL)animated;

/* Use these properties to set multiple items in a navigation bar.
 The older single properties (leftBarButtonItem and rightBarButtonItem) now refer to 
 the first item in the respective array of items.
 
 NOTE: You'll achieve the best results if you use either the singular properties or
 the plural properties consistently and don't try to mix them.
 
   leftBarButtonItems are placed in the navigation bar left to right with the first
 item in the list at the left outside edge and left aligned.
   rightBarButtonItems are placed right to left with the first item in the list at
 the right outside edge and right aligned.
 */
	public var  NSArray *leftBarButtonItems NS_AVAILABLE_IOS(5_0);
	public var  NSArray *rightBarButtonItems NS_AVAILABLE_IOS(5_0);
	public function setLeftBarButtonItems:(NSArray *)items animated:(BOOL)animated NS_AVAILABLE_IOS(5_0); 
	public function setRightBarButtonItems:(NSArray *)items animated:(BOOL)animated NS_AVAILABLE_IOS(5_0);

/* By default, the leftItemsSupplementBackButton property is NO. In this case, 
 the back button is not drawn and the left item or items replace it. If you
 would like the left items to appear in addition to the back button (as opposed to instead of it)
 set leftItemsSupplementBackButton to YES.
 */
	public var  BOOL leftItemsSupplementBackButton NS_AVAILABLE_IOS(5_0);


// Some navigation items want to display a custom left or right item when they're on top of the stack.
// A custom left item replaces the regular back button unless you set leftItemsSupplementBackButton to YES
	public var (nonatomic,retain) UIBarButtonItem *leftBarButtonItem;
	public var (nonatomic,retain) UIBarButtonItem *rightBarButtonItem;
	public function setLeftBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;
	public function setRightBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated;
#end
}
