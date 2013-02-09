//
//  UIStoryboardPopoverSegue.h
package ios.ui;
//
//  Copyright 2011-2012, Apple Inc. All rights reserved.
//

#import <UIKit/UIStoryboardSegue.h>

@class UIPopoverController;

@:require(ios5_0) extern class UIStoryboardPopoverSegue extends UIStoryboardSegue {
}

	public var (default, null) UIPopoverController *popoverController;

}
