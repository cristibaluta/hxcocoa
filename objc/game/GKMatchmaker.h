//
//  GKMatchmaker.h
//  GameKit
//
//  Copyright 2010 Apple Inc. All rights reserved.
//

#include <Foundation/Foundation.h>

@class GKPlayer;
@class GKMatch;

// GKMatchRequest represents the parameters needed to create the match.
NS_CLASS_AVAILABLE(10_8, 4_1)
extern class GKMatchRequest extends NSObject {
}

	public var  NSUInteger minPlayers;     // Minimum number of players for the match
	public var  NSUInteger maxPlayers;     // Maximum number of players for the match
	public var  NSUInteger playerGroup;    // The player group identifier. Matchmaking will only take place between players in the same group.
	public var  uint32_t playerAttributes; // optional flags such that when all player flags are OR'ed together in a match they evaluate to 0xFFFFFFFF
	public var  NSArray *playersToInvite;  // Array of player IDs to invite, or nil if none

// Message sent to invited players, may be modified if using GKMatchmakerViewController
	public var    NSString *inviteMessage __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_6_0);

// Default number of players to to use during matchmaking.  If not set we default to maxPlayers
	public var  NSUInteger defaultNumberOfPlayers __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_6_0);

// Possible invitee responses
enum {
    GKInviteeResponseAccepted           = 0,
    GKInviteeResponseDeclined           = 1,
    GKInviteeResponseFailed             = 2,
    GKInviteeResponseIncompatible       = 3,
    GKInviteeResponseUnableToConnect    = 4,
    GKInviteeResponseNoAnswer           = 5,
};
typedef NSInteger GKInviteeResponse;

// An inviteeResponseHandler can be set in order to receive responses from programmatically invited players.
	public var  void(^inviteeResponseHandler)(NSString *playerID, GKInviteeResponse response) __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);

enum {
    GKMatchTypePeerToPeer,
    GKMatchTypeHosted,
    GKMatchTypeTurnBased
};
typedef NSUInteger GKMatchType;

// To determine the maximum allowed players for each type of match supported.
+ (NSUInteger)maxPlayersAllowedForMatchOfType:(GKMatchType)matchType __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);

}

// GKInvite represents an accepted game invite, it is used to create a GKMatchmakerViewController
NS_CLASS_AVAILABLE(10_8, 4_1)
extern class GKInvite extends NSObject {
}

	public var (default, null) NSString *inviter;
	public var (nonatomic, readonly, getter=isHosted) BOOL hosted;
	public var (default, null) NSUInteger playerGroup __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);      // player group from inviter's match request
	public var (default, null) uint32_t playerAttributes __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);   // player attributes from inviter's match request

}


// GKMatchmaker is a singleton object to manage match creation from invites and auto-matching.
NS_CLASS_AVAILABLE(10_8, 4_1)
extern class GKMatchmaker extends NSObject {
}

// The shared matchmaker
+ (GKMatchmaker*)sharedMatchmaker;

// An inviteHandler must be set in order to receive game invites or respond toexternal requests to initiate an invite. The inviteHandler will be called when an invite or request is received. It may be called immediately if there is a pending invite or request when the application is launched. The inviteHandler may be called multiple times.
// Either acceptedInvite or playersToInvite will be present, but never both.
	public var  void(^inviteHandler)(GKInvite *acceptedInvite, NSArray *playersToInvite);


// Get a match for an accepted invite
// Possible reasons for error:
// 1. Communications failure
// 2. Invite cancelled
- (void)matchForInvite:(GKInvite *)invite completionHandler:(void(^)(GKMatch *match, NSError *error))completionHandler __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);

// Auto-matching or invites to find a peer-to-peer match for the specified request. Error will be nil on success:
// Possible reasons for error:
// 1. Communications failure
// 2. Unauthenticated player
// 3. Timeout
- (void)findMatchForRequest:(GKMatchRequest *)request withCompletionHandler:(void(^)(GKMatch *match, NSError *error))completionHandler;

// Auto-matching or invites for host-client match request. This returns a list of player identifiers to be included in the match. Determination and communication with the host is not part of this API.
// When inviting, no player identifiers will be returned. Player responses will be reported via the inviteeResponseHandler.
// Possible reasons for error:
// 1. Communications failure
// 2. Unauthenticated player
// 3. Timeout
- (void)findPlayersForHostedMatchRequest:(GKMatchRequest *)request withCompletionHandler:(void(^)(NSArray *playerIDs, NSError *error))completionHandler;

// Auto-matching or invites to add additional players to a peer-to-peer match for the specified request. Error will be nil on success:
// Possible reasons for error:
// 1. Communications failure
// 2. Timeout
- (void)addPlayersToMatch:(GKMatch *)match matchRequest:(GKMatchRequest *)matchRequest completionHandler:(void (^)(NSError *error))completionHandler;

// Cancel matchmaking and any pending invites
- (void)cancel;

// Cancel a pending invitation to a player
- (void)cancelInviteToPlayer:(NSString *)playerID __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_6_0);

// Call this when finished with all programmatic P2P invites/matchmaking, for compatability with connected players using GKMatchmakerViewController.
- (void)finishMatchmakingForMatch:(GKMatch *)match __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);

// Query the server for recent activity in the specified player group. A larger value indicates that a given group has seen more recent activity. Error will be nil on success.
// Possible reasons for error:
// 1. Communications failure
- (void)queryPlayerGroupActivity:(NSUInteger)playerGroup withCompletionHandler:(void(^)(Int activity, NSError *error))completionHandler;

// Query the server for recent activity for all the player groups of that game. Error will be nil on success.
// Possible reasons for error:
// 1. Communications failure
- (void)queryActivityWithCompletionHandler:(void(^)(Int activity, NSError *error))completionHandler;


// Start browsing for nearby players that can be invited to a match. The reachableHandler will be called for each player found with a compatible game. It may be called more than once for the same player if that player ever becomes unreachable (e.g. moves out of range). You should call stopBrowsingForNearbyPlayers when finished browsing.
- (void)startBrowsingForNearbyPlayersWithReachableHandler:(void(^)(NSString *playerID, BOOL reachable))reachableHandler
 __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);

// Stop browsing for nearby players.
- (void)stopBrowsingForNearbyPlayers __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);


}
