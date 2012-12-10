//
//  UIActivity.h
package ios.ui;
//
//  Copyright 2012 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>

@class UIImage, UIViewController;

UIKIT_EXTERN NSString *const UIActivityTypePostToFacebook   NS_AVAILABLE_IOS(6_0); // text, images, URLs
UIKIT_EXTERN NSString *const UIActivityTypePostToTwitter    NS_AVAILABLE_IOS(6_0); // text, images, URLs
UIKIT_EXTERN NSString *const UIActivityTypePostToWeibo      NS_AVAILABLE_IOS(6_0); // text, images, URLs
UIKIT_EXTERN NSString *const UIActivityTypeMessage          NS_AVAILABLE_IOS(6_0); // text
UIKIT_EXTERN NSString *const UIActivityTypeMail             NS_AVAILABLE_IOS(6_0); // text, image, file:// URLs
UIKIT_EXTERN NSString *const UIActivityTypePrint            NS_AVAILABLE_IOS(6_0); // image, NSData, file:// URL, UIPrintPageRenderer, UIPrintFormatter, UIPrintInfo
UIKIT_EXTERN NSString *const UIActivityTypeCopyToPasteboard NS_AVAILABLE_IOS(6_0); // text, image, NSURL, UIColor, NSDictionary
UIKIT_EXTERN NSString *const UIActivityTypeAssignToContact  NS_AVAILABLE_IOS(6_0); // image
UIKIT_EXTERN NSString *const UIActivityTypeSaveToCameraRoll NS_AVAILABLE_IOS(6_0); // image, video

NS_CLASS_AVAILABLE_IOS(6_0)extern class UIActivity extends NSObject

// override methods

- (NSString *)activityType;       // default returns nil. subclass may override to return custom activity type that is reported to completion handler
- (NSString *)activityTitle;      // default returns nil. subclass must override and must return non-nil value
- (UIImage *)activityImage;       // default returns nil. subclass must override and must return non-nil value

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems;   // override this to return availability of activity based on items. default returns NO
	public function prepareWithActivityItems:(NSArray *)activityItems;      // override to extract items and set up your HI. default does nothing

- (UIViewController *)activityViewController;   // return non-nil to have vC presented modally. call activityDidFinish at end. default returns nil
	public function performActivity;                        // if no view controller, this method is called. call activityDidFinish when done. default calls [self activityDidFinish:NO]

// state method

	public function activityDidFinish:(BOOL)completed;   // activity must call this when activity is finished. can be called on any thread

}
