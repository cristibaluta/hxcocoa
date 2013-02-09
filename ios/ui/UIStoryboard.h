//
//  UIStoryboard.h
package ios.ui;
//
//  Copyright 2011-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>

@:require(ios5_0) extern class UIStoryboard extends NSObject {
}

+ (UIStoryboard *)storyboardWithName:(NSString *)name bundle:(NSBundle *)storyboardBundleOrNil;

- (id)instantiateInitialViewController;
- (id)instantiateViewControllerWithIdentifier:(NSString *)identifier;

}
