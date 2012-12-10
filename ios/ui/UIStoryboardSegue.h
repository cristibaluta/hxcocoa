//
//  UIStoryboardSegue.h
package ios.ui;
//
//  Copyright 2011-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>

@class UIViewController;

@:require(ios_5_0) extern class UIStoryboardSegue extends NSObject

// Convenience constructor for returning a segue that performs a handler block in its -perform method.
+ (id)segueWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination performHandler:(void (^)(void))performHandler NS_AVAILABLE_IOS(6_0);

- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination; // Designated initializer

	public var NSString *identifier;
	public var id sourceViewController;
	public var id destinationViewController;

	public function perform;

}
