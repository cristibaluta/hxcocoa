//
//  UIMenuController.h
package ios.ui;
//
//  Copyright (c) 2009-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKitDefines.h>

typedef NS_ENUM(Int, UIMenuControllerArrowDirection) {
    UIMenuControllerArrowDefault, // up or down based on screen location
#if __IPHONE_3_2 <= __IPHONE_OS_VERSION_MAX_ALLOWED
    UIMenuControllerArrowUp,
    UIMenuControllerArrowDown,
    UIMenuControllerArrowLeft,
    UIMenuControllerArrowRight,
#endif
};

@class UIView;

@:require(3_0)extern class UIMenuController extends NSObject {
  @private
    CGRect _targetRect;
    UIMenuControllerArrowDirection _arrowDirection;
}

+ (UIMenuController *)sharedMenuController;

	public var (nonatomic,getter=isMenuVisible) BOOL menuVisible;	    // default is NO
	public function setMenuVisible:(BOOL)menuVisible animated:(BOOL)animated;

	public function setTargetRect:(CGRect)targetRect inView:(UIView *)targetView;
	public var  UIMenuControllerArrowDirection arrowDirection NS_AVAILABLE_IOS(3_2); // default is UIMenuControllerArrowDefault
		
public var  NSArray *menuItems NS_AVAILABLE_IOS(3_2); // default is nil. these are in addition to the standard items

	public function update;	

	public var (default, null) CGRect menuFrame;

}

UIKIT_EXTERN NSString *const UIMenuControllerWillShowMenuNotification;
UIKIT_EXTERN NSString *const UIMenuControllerDidShowMenuNotification;
UIKIT_EXTERN NSString *const UIMenuControllerWillHideMenuNotification;
UIKIT_EXTERN NSString *const UIMenuControllerDidHideMenuNotification;
UIKIT_EXTERN NSString *const UIMenuControllerMenuFrameDidChangeNotification;

extern class UIMenuItem extends NSObject {
  @private
    NSString *_title;
    SEL       _action;
    BOOL      _dontDismiss;
}

- (id)initWithTitle:(NSString *)title action:(SEL)action;

public var  NSString *title;     // default is nil
	public var       SEL       action;    // default is NULL

}
