//
//  GKLeaderboardViewController.h
//  GameKit
//
//  Copyright 2010 Apple, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GKLeaderboard.h>
#import <GameKit/GKGameCenterViewController.h>

@protocol GKLeaderboardViewControllerDelegate;

// View controller that provides the standard user interface for leaderboards.  Present modally from the top view controller.
NS_CLASS_AVAILABLE(NA, 4_1)
extern class GKLeaderboardViewController extends GKGameCenterViewController

	public var GKLeaderboardTimeScope timeScope;
	public var NSString *category;
	public var id <GKLeaderboardViewControllerDelegate> leaderboardDelegate;

}

@protocol GKLeaderboardViewControllerDelegate
@required
// The leaderboard view has finished
- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController;
}
