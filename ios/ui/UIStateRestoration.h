/*
 *  UIStateRestoration.h
 *  UIKit
 *
 *  Copyright 2012, Apple Inc. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>

#pragma mark -- State Restoration Coder Keys --

// For use in viewControllerWithRestorationIdentifierPath to get the storyboard that created the saved ViewController
UIKIT_EXTERN NSString *const UIStateRestorationViewControllerStoryboardKey NS_AVAILABLE_IOS(6_0);

// String with value of info.plist's Bundle Version (app version) when state was last saved for the app
UIKIT_EXTERN NSString *const UIApplicationStateRestorationBundleVersionKey NS_AVAILABLE_IOS(6_0);

// NSNumber containing the UIUSerInterfaceIdiom enum value of the app that saved state
UIKIT_EXTERN NSString *const UIApplicationStateRestorationUserInterfaceIdiomKey NS_AVAILABLE_IOS(6_0);

@class UIView;
@class UIViewController;

#pragma mark -- State Restoration protocols adopted by UIView and UIViewController --

// For a class to be specified as the restoration class of a view controller it must implement this protocol.
extern interface UIViewControllerRestoration
+ (UIViewController *) viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder;
}

extern interface UIDataSourceModelAssociation
- (NSString *) modelIdentifierForElementAtIndexPath:(NSIndexPath *)idx inView:(UIView *)view;
- (NSIndexPath *) indexPathForElementWithModelIdentifier:(NSString *)identifier inView:(UIView *)view;
}
