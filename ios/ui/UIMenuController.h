//
//  UIMenuController.h
package ios.ui;

@:framework("UIKit")
extern enum UIMenuControllerArrowDirection {
    UIMenuControllerArrowDefault;
    UIMenuControllerArrowUp;
    UIMenuControllerArrowDown;
    UIMenuControllerArrowLeft;
    UIMenuControllerArrowRight;
}


@:framework("UIKit")
extern class UIMenuController extends NSObject {

+ (UIMenuController *)sharedMenuController;

	public var (nonatomic,getter=isMenuVisible) BOOL menuVisible;	    // default is NO
	public function setMenuVisible:(BOOL)menuVisible animated:(BOOL)animated;

	public function setTargetRect:(CGRect)targetRect inView:(UIView *)targetView;
	public var  UIMenuControllerArrowDirection arrowDirection NS_AVAILABLE_IOS(3_2); // default is UIMenuControllerArrowDefault
		
public var  NSArray *menuItems NS_AVAILABLE_IOS(3_2); // default is nil. these are in addition to the standard items

	public function update;	

	public var (default, null) CGRect menuFrame;

}

UIKIT_EXTERN String *const UIMenuControllerWillShowMenuNotification;
UIKIT_EXTERN String *const UIMenuControllerDidShowMenuNotification;
UIKIT_EXTERN String *const UIMenuControllerWillHideMenuNotification;
UIKIT_EXTERN String *const UIMenuControllerDidHideMenuNotification;
UIKIT_EXTERN String *const UIMenuControllerMenuFrameDidChangeNotification;

@:framework("UIKit")
extern class UIMenuItem extends NSObject {

- (id)initWithTitle:(String *)title action:(SEL)action;

	public var title :String;     // default is nil
	public var action :SEL;    // default is NULL

}
