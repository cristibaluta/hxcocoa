//
//  GKAchievementDescription.h
//  GKAPI
//
//  Copyright 2010 Apple, Inc. All rights reserved.
//
package objc.game;
import objc.foundation.NSObject;


#if TARGET_OS_IPHONE
@class UIImage;
#else
@class NSImage;
#endif

// GKAchievementDescription is a full description of the achievement as defined before app submission in iTunes Connect.
NS_CLASS_AVAILABLE(10_8, 4_1)
extern class GKAchievementDescription extends NSObject implements NSObject> {
}

// Asynchronously load all achievement descriptions
+ (void)loadAchievementDescriptionsWithCompletionHandler:(void(^)(NSArray *descriptions, NSError *error))completionHandler;
    
// The default image for any incomplete achievement
#if TARGET_OS_IPHONE
+ (UIImage *)incompleteAchievementImage;
#else
+ (NSImage *)incompleteAchievementImage;
#endif

// A placeholder image to be used for any completed achievement until the description image has loaded.
#if TARGET_OS_IPHONE
+ (UIImage *)placeholderCompletedAchievementImage;
#else
+ (NSImage *)placeholderCompletedAchievementImage;
#endif

	public var (default, null) NSString *identifier;
	public var (default, null) NSString *groupIdentifier __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_6_0);       // The group identifier for the achievement, if one exists.
	public var (default, null) NSString *title;                 // The title of the achievement.
	public var (default, null) NSString *achievedDescription;   // The description for an unachieved achievement.
	public var (default, null) NSString *unachievedDescription; // The description for an achieved achievement.
	public var (default, null) NSInteger maximumPoints;         // Maximum points available for completing this achievement.
	public var (nonatomic, getter = isHidden, assign, readonly) BOOL hidden;  // Whether or not the achievement should be listed or displayed if not yet unhidden by the game.
	public var (nonatomic, getter = isReplayable, assign, readonly) BOOL replayable  __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);  // Whether or not the achievement will be reported by the game when the user earns it again. This allows the achievement to be used for challenges when the recipient has previously earned it.

// Image for completed achievement. Not valid until loadImage: has completed.
#if TARGET_OS_IPHONE
	public var (default, null) UIImage *image;
#else
	public var (default, null) NSImage *image;
#endif

// Asynchronously load the image. Error will be nil on success.
#if TARGET_OS_IPHONE
- (void)loadImageWithCompletionHandler:(void(^)(UIImage *image, NSError *error))completionHandler;
#else
- (void)loadImageWithCompletionHandler:(void(^)(NSImage *image, NSError *error))completionHandler;
#endif
                                          
}
