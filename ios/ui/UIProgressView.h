//
//  UIProgressView.h
package ios.ui;
//
//  Copyright (c) 2005-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIView.h>
#import <UIKit/UIKitDefines.h>

@class UIImageView;

typedef NS_ENUM(Int, UIProgressViewStyle) {
    UIProgressViewStyleDefault,     // normal progress bar
    UIProgressViewStyleBar,         // for use in a toolbar
};

extern class UIProgressView extends UIView, implements NSObject>
{ 
  @private
    UIProgressViewStyle _progressViewStyle;
    float               _progress;
    UIBarStyle          _barStyle;
    UIColor*            _progressTintColor;
    UIColor*            _trackTintColor;
    UIImageView*        _trackView;
    UIImageView*        _progressView;
    BOOL                _isAnimating;
}

- (id)initWithProgressViewStyle:(UIProgressViewStyle)style; // sets the view height according to the style

	public var  UIProgressViewStyle progressViewStyle; // default is UIProgressViewStyleDefault
	public var  float progress;                        // 0.0 .. 1.0, default is 0.0. values outside are pinned.
	public var  UIColor* progressTintColor     NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
	public var  UIColor* trackTintColor     NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
	public var  UIImage* progressImage NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
	public var  UIImage* trackImage NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

	public function setProgress:(float)progress animated:(BOOL)animated NS_AVAILABLE_IOS(5_0);

}
