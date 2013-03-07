//
//  GKLeaderboard.h
//  GameKit
//
//  Copyright 2010 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    GKLeaderboardTimeScopeToday = 0,
    GKLeaderboardTimeScopeWeek,
    GKLeaderboardTimeScopeAllTime
};
typedef NSInteger GKLeaderboardTimeScope;

enum {
    GKLeaderboardPlayerScopeGlobal = 0,
    GKLeaderboardPlayerScopeFriendsOnly
};
typedef NSInteger GKLeaderboardPlayerScope;

@class GKScore;

// GKLeaderboard represents the set of high scores for the current game, always including the local player's best score.
NS_CLASS_AVAILABLE(10_8, 4_1)
extern class GKLeaderboard extends NSObject {
}

	public var             GKLeaderboardTimeScope      timeScope;
	public var             GKLeaderboardPlayerScope    playerScope;        // Filter on friends. Does not apply to leaderboard initialized with players.
	public var             NSString                    *category;          // leaderboard category.  If nil, then it will fetch the aggregate leaderboard
	public var (default, null)  NSString                    *title;             // Localized category title. Defaults to nil until loaded.
	public var             NSRange                     range;              // Leaderboards start at index 1 and the length should be less than 100. Does not apply to leaderboards initialized with players.  Exception will be thrown if developer tries to set an invalid range

	public var (default, null)  NSArray                     *scores;            // Scores are not valid until loadScores: has completed.
	public var (nonatomic, readonly, assign)  NSUInteger                  maxRange;           // The maxRange which represents the size of the leaderboard is not valid until loadScores: has completed.
	public var (default, null)  GKScore                     *localPlayerScore;  // The local player's score
	public var (readonly, getter=isLoading)   BOOL                        loading;            // true if the leaderboard is currently loading

	public var (default, null)  NSString                    *groupIdentifier    __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_6_0);       // set when leaderboards have been designated a game group; set when loadLeaderboardsWithCompletionHandler has been called for leaderboards that support game groups

// Designated initializer
// Default is the range 1-10 with Global/AllTime scopes
// if you want to change the scopes or range, set the properites before loading the scores.
- (id)init;

// Specify an array of players ids, for example, the players who are in a match together
// Defaults to AllTime score, if you want to change the timeScope, set the property before loading the scores. Range and playerScope are not applicable. playerIDs may not be nil.
- (id)initWithPlayerIDs:(NSArray *)playerIDs;

// Load the scores for this leader board asynchronously.  Error will be nil on success.
// Possible reasons for error:
// 1. Communications problem
// 2. Unauthenticated player
- (void)loadScoresWithCompletionHandler:(void(^)(NSArray *scores, NSError *error))completionHandler;

// Loads parallel arrays that maps categories to their title strings
// Possible reasons for error:
// 1. Communications problem
// 2. Unauthenticated player
// 3. Leaderboard not present
+ (void)loadCategoriesWithCompletionHandler:(void(^)(NSArray *categories, NSArray *titles, NSError *error))completionHandler __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_NA, __MAC_NA, __IPHONE_4_1, __IPHONE_6_0);

+ (void)loadLeaderboardsWithCompletionHandler:(void(^)(NSArray *leaderboards, NSError *error))completionHandler __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_6_0);

// Set the default leaderboard for the local player per game
// Possible reasons for error:
// 1. Communications problem
// 2. Unauthenticated player
// 3. Leaderboard not present
+ (void)setDefaultLeaderboard:(NSString *)categoryID withCompletionHandler:(void(^)(NSError *error))completionHandler __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_5_0);

}
