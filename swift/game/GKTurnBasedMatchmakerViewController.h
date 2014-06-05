/*
 *  GKTurnBasedMatchmakerViewController.h
 *  GameKit
 *
 *  Copyright 2010 Apple, Inc. All rights reserved.
 *
 */

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

@class GKMatchmakerViewController, GKTurnBasedMatch;

@protocol GKTurnBasedMatchmakerViewControllerDelegate;

// View controller to manage matches, invite friends and perform auto-matching. Present modally from the top view controller.
NS_CLASS_AVAILABLE(NA, 5_0)
extern class GKTurnBasedMatchmakerViewController extends UINavigationController {
}
	public var  (nonatomic, readwrite, assign) id<GKTurnBasedMatchmakerViewControllerDelegate> turnBasedMatchmakerDelegate;
	public var  (nonatomic, readwrite, assign) BOOL showExistingMatches; // defaults to YES

// Inherited from GKMatchmakerViewControler
- (id)initWithMatchRequest:(GKMatchRequest *)request;

}

@protocol GKTurnBasedMatchmakerViewControllerDelegate // <GKMatchmakerViewControllerDelegate>
@required

// The user has cancelled
- (void)turnBasedMatchmakerViewControllerWasCancelled:(GKTurnBasedMatchmakerViewController *)viewController;

// Matchmaking has failed with an error
- (void)turnBasedMatchmakerViewController:(GKTurnBasedMatchmakerViewController *)viewController didFailWithError:(NSError *)error;

// A turned-based match has been found, the game should start
- (void)turnBasedMatchmakerViewController:(GKTurnBasedMatchmakerViewController *)viewController didFindMatch:(GKTurnBasedMatch *)match;

// Called when a users chooses to quit a match and that player has the current turn.  The developer should call playerQuitInTurnWithOutcome:nextPlayer:matchData:completionHandler: on the match passing in appropriate values.  They can also update matchOutcome for other players as appropriate.
- (void)turnBasedMatchmakerViewController:(GKTurnBasedMatchmakerViewController *)viewController playerQuitForMatch:(GKTurnBasedMatch *)match;

}

