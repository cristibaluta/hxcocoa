//
//  UIActivityIndicator.h
package ios.ui;
//
//  Copyright (c) 2005-2012, Apple Inc. All rights reserved.
//

#import <UIKit/UIView.h>
#import <UIKit/UIKitDefines.h>

typedef NS_ENUM(NSInteger, UIActivityIndicatorViewStyle) {
    UIActivityIndicatorViewStyleWhiteLarge,
    UIActivityIndicatorViewStyleWhite,
    UIActivityIndicatorViewStyleGray,
};

extern class UIActivityIndicatorView extends UIView, implements NSObject>
{ 
  @package
    CFTimeInterval               _duration;
    BOOL                         _animating;
    UIActivityIndicatorViewStyle _activityIndicatorViewStyle;
    UIActivityIndicatorViewStyle _actualActivityIndicatorViewStyle;
    BOOL                         _hidesWhenStopped;
}

- (id)initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style;     // sizes the view according to the style

	public var  UIActivityIndicatorViewStyle activityIndicatorViewStyle; // default is UIActivityIndicatorViewStyleWhite
	public var  BOOL                         hidesWhenStopped;           // default is YES. calls -setHidden when animating gets set to NO

	public var  (readwrite, nonatomic, retain) UIColor *color NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

	public function startAnimating;
	public function stopAnimating;
- (BOOL)isAnimating;
}
