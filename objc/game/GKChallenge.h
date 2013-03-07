//
//  GKChallenge.h
//  GameKit
//
//  Copyright 2012 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GKScore.h>
#import <GameKit/GKAchievement.h>

typedef NS_ENUM(NSInteger, GKChallengeState) {
    GKChallengeStateInvalid = 0,
    GKChallengeStatePending = 1, // The challenge has been issued, but neither completed nor declined
    GKChallengeStateCompleted = 2, // The challenge has been completed by the receiving player
    GKChallengeStateDeclined = 3, // The challenge has been declined by the receiving player
};

NS_CLASS_AVAILABLE(NA, 6_0)
@:framework("GameKit")
extern class GKChallenge extends NSObject {

// Query challenges for the current game issued to the local player -- equivalent GKChallenge objects are not guaranteed to be pointer equivalent across calls, but equal GKChallenge objects will have equal hashes
+ (void)loadReceivedChallengesWithCompletionHandler:(void(^)(NSArray *challenges, NSError *error))completionHandler;

// Any GKChallenge object to be declined must be in a state of GKChallengeStatePending in order to be successfully cancelled
- (void)decline;

	public var (default, null) NSString *issuingPlayerID; // The GKPlayer who issued the challenge
	public var (default, null) NSString *receivingPlayerID; // The GKPlayer who has received the challenge
	public var (default, null) GKChallengeState state; // Current state of the challenge
	public var (default, null) NSDate *issueDate; // Date the challenge was issued
	public var (default, null) NSDate *completionDate; // Date the challenge was completed or aborted
	public var (default, null) NSString *message; // The message sent to receivers of this challenge

}

NS_CLASS_AVAILABLE(NA, 6_0)
extern class GKScoreChallenge extends GKChallenge
	public var (default, null) GKScore *score; // The score to meet to satisfy this challenge
}

NS_CLASS_AVAILABLE(NA, 6_0)
extern class GKAchievementChallenge extends GKChallenge
	public var (default, null) GKAchievement *achievement; // The achievement to achieve to satisfy this challenge
}


// Use the following category methods to issue GKScoreChallenges and GKAchievementChallenges to an array of playerIDs. Players may not issue challenges to themselves nor to non-friends. Please see the GameKit reference documentation for further details on these methods.
extern class GKScore (GKChallenge)
- (void)issueChallengeToPlayers:(NSArray *)playerIDs message:(NSString *)message __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);
}

extern class GKAchievement (GKChallenge)

// If an achievement has already been earned by the receiving player, and that achievement is not marked as replayable in iTunes connect, then the challenge will not be issued to the player. If an achievement is hidden, then it will not be issued.
- (void)issueChallengeToPlayers:(NSArray *)playerIDs message:(NSString *)message __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);

// Given a list of playerIDs, return a subset of that list containing only playerIDs that are eligible to receive a challenge for the achievement.
- (void)selectChallengeablePlayerIDs:(NSArray *)playerIDs withCompletionHandler:(void(^)(NSArray *challengeablePlayerIDs, NSError *error))completionHandler __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);

}
