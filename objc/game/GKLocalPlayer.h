//
//  GKLocalPlayer.h
//  GameKit
//
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GKPlayer.h>
#import <GameKit/GKDefines.h>

@class UIViewController;

NS_CLASS_AVAILABLE(10_8, 4_1)
GK_EXTERN_CLASSextern class GKLocalPlayer extends GKPlayer {
}

// Obtain the GKLocalPlayer object.
// The player is only available for offline play until logged in.
// A temporary player is created if no account is set up.
+ (GKLocalPlayer *)localPlayer;

	public var (nonatomic, readonly, getter=isAuthenticated)  BOOL authenticated; // Authentication state
	public var (nonatomic, readonly, getter=isUnderage)       BOOL underage;      // Underage state


// The authenticate handler will be called whenever the authentication process finishes or needs to show UI. The handler may be called multiple times. Authentication will happen automatically when the handler is first set and whenever the app returns to the foreground.
// If the authentication process needs to display UI the viewController property will be non-nil. Your application should present this view controller and continue to wait for another call of the authenticateHandler.  The view controller will be dismissed automatically.
// Possible reasons for error:
// 1. Communications problem
// 2. User credentials invalid
// 3. User cancelled
	public var  void(^authenticateHandler)(UIViewController *viewController, NSError *error) __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);


	public var (default, null) NSArray *friends;  // Array of player identifiers of friends for the local player. Not valid until loadFriendsWithCompletionHandler: has completed.

// Asynchronously load the friends list as an array of player identifiers. Calls completionHandler when finished. Error will be nil on success.
// Possible reasons for error:
// 1. Communications problem
// 2. Unauthenticated player
- (void)loadFriendsWithCompletionHandler:(void(^)(NSArray *friends, NSError *error))completionHandler;

// Set the default leaderboard for the current game
// Possible reasons for error:
// 1. Communications problem
// 2. Unauthenticated player
// 3. Leaderboard not present
- (void)setDefaultLeaderboardCategoryID:(NSString *)categoryID completionHandler:(void(^)(NSError *error))completionHandler __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);

// Load the default leaderboard categoryID for the self player per game
// Possible reasons for error:
// 1. Communications problem
// 2. Unauthenticated player
// 3. Leaderboard not present
- (void)loadDefaultLeaderboardCategoryIDWithCompletionHandler:(void(^)(NSString *categoryID, NSError *error))completionHandler __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);


// Deprecated, set the authenticateHandler instead. Authentication happens automatically when the handler is set and when the app returns to foreground.
- (void)authenticateWithCompletionHandler:(void(^)(NSError *error))completionHandler __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_NA, __MAC_NA, __IPHONE_4_1, __IPHONE_6_0);

}

// Notification will be posted whenever authentication status changes.
GK_EXTERN NSString *GKPlayerAuthenticationDidChangeNotificationName __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_4_1);

