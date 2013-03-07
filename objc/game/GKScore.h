//
//  GKScore.h
//  GameKit
//
//  Copyright 2010 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <GameKit/GKLeaderboard.h>


// GKScore represents a score in the leaderboards.
NS_CLASS_AVAILABLE(10_8, 4_1)
extern class GKScore extends NSObject implements NSObject> {
}

// Designated initializer. Will initialize the score with the local player and current date. 
- (id)initWithCategory:(NSString *)category;

	public var             int64_t     value;              // The score value as a 64bit integer.
	public var (default, null)  NSString    *formattedValue;    // The score formatted as a string, localized with a label

	public var             NSString    *category;          // leaderboard category (required)

// optional additional context that allows a game to store and retrieve additional data associated with the store.  Default value of zero is returned if no value is set.
	public var             uint64_t    context              __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_5_0);

	public var (default, null)  NSDate      *date;              // The date the score was recorded, defaults to [NSDate date].
	public var (default, null)  NSString    *playerID;          // The identifier of the player that recorded the score.
	public var (nonatomic, readonly, assign)  NSInteger   rank;               // The rank of the player within the leaderboard, only valid when returned from GKLeaderboard

// Convenience property to make the leaderboard associated with this GKScore, the default leaderboard for this player. Default value is false.
// If true, reporting that score will make the category this score belongs to, the default leaderboard for this user
	public var             BOOL        shouldSetDefaultLeaderboard     __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_5_0);


+ (void)reportScores:(NSArray *)scores withCompletionHandler:(void(^)(NSError *error))completionHandler __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);

// Report this score to the server. The value must be set, and date may be changed.
// Possible reasons for error:
// 1. Value not set
// 2. Local player not authenticated
// 3. Communications problem
- (void)reportScoreWithCompletionHandler:(void(^)(NSError *error))completionHandler;

}
