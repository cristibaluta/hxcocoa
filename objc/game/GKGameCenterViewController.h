//
//  GKGameCenterViewController.h
//  GameKit
//
//  Copyright 2012 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GKLeaderboard.h>

@class GKMatch, GKMatchRequest, GKInvite;
@protocol GKGameCenterControllerDelegate;

typedef enum /*: NSInteger */ {
    GKGameCenterViewControllerStateDefault = -1,
    GKGameCenterViewControllerStateLeaderboards ,
    GKGameCenterViewControllerStateAchievements,
    GKGameCenterViewControllerStateChallenges,
} GKGameCenterViewControllerState;

NS_CLASS_AVAILABLE(NA, 6_0)
extern class GKGameCenterViewController extends UINavigationController

	public var   id<GKGameCenterControllerDelegate>      gameCenterDelegate;
	public var   GKGameCenterViewControllerState         viewState;

}

extern class GKGameCenterViewController (Leaderboards)

	public var   GKLeaderboardTimeScope                  leaderboardTimeScope;   // Implies showing leaderboards
	public var   NSString                                *leaderboardCategory;   // Implies showing leaderboards

}

@protocol GKGameCenterControllerDelegate <NSObject>

- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController;

}


