package objc.game;

import objc.foundation.NSObject;
import objc.foundation.NSRange;
import objc.foundation.NSError;


@:framework("GameKit")
extern enum GKLeaderboardTimeScope {
    GKLeaderboardTimeScopeToday;
    GKLeaderboardTimeScopeWeek;
    GKLeaderboardTimeScopeAllTime;
}

@:framework("GameKit")
extern enum GKLeaderboardPlayerScope {
    GKLeaderboardPlayerScopeGlobal;
    GKLeaderboardPlayerScopeFriendsOnly;
}

// GKLeaderboard represents the set of high scores for the current game, always including the local player's best score.
/*NS_CLASS_AVAILABLE(10_8, 4_1)*/

@:framework("GameKit")
extern class GKLeaderboard extends NSObject {

	public var timeScope :GKLeaderboardTimeScope;
	public var playerScope :GKLeaderboardPlayerScope;// Filter on friends. Does not apply to leaderboard initialized with players.
	public var category :String;// leaderboard category.  If nil, then it will fetch the aggregate leaderboard
	public var (default, null) title :String;// Localized category title. Defaults to nil until loaded.
	public var range :NSRange;// Leaderboards start at index 1 and the length should be less than 100. Does not apply to leaderboards initialized with players.  Exception will be thrown if developer tries to set an invalid range

	public var (default, null) scores :Array<GKScore>;// Scores are not valid until loadScores: has completed.
	public var (default, null) maxRange :Int;// The maxRange which represents the size of the leaderboard is not valid until loadScores: has completed.
	public var (default, null) localPlayerScore :GKScore;  // The local player's score
	public var (default, null) loading :Bool;// true if the leaderboard is currently loading

	// set when leaderboards have been designated a game group; set when loadLeaderboardsWithCompletionHandler has been called for leaderboards that support game groups
	@:require(ios6_0) @:require(osx10_8) public var (default, null) groupIdentifier :String;
	

// Designated initializer
// Default is the range 1-10 with Global/AllTime scopes
// if you want to change the scopes or range, set the properites before loading the scores.
	public function init () :GKLeaderboard;

// Specify an array of players ids, for example, the players who are in a match together
// Defaults to AllTime score, if you want to change the timeScope, set the property before loading the scores. Range and playerScope are not applicable. playerIDs may not be nil.
	public function initWithPlayerIDs (playerIDs:Array<GKPlayer>) :GKLeaderboard;

// Load the scores for this leader board asynchronously.  Error will be nil on success.
// Possible reasons for error:
// 1. Communications problem
// 2. Unauthenticated player
	public function loadScoresWithCompletionHandler (completionHandler:Array<GCScore>->NSError->Void) :Void;

// Loads parallel arrays that maps categories to their title strings
// Possible reasons for error:
// 1. Communications problem
// 2. Unauthenticated player
// 3. Leaderboard not present
#if ios
	@:require(ios6_0) public static function loadCategoriesWithCompletionHandler (completionHandler:Array<String>->Array<String>->NSError->Void) :Void;
#end
	@:require(ios6_0) @:require(osx10_8) public static function loadLeaderboardsWithCompletionHandler (completionHandler:Array<GKLeaderboard>->NSError->Void) :Void;

// Set the default leaderboard for the local player per game
// Possible reasons for error:
// 1. Communications problem
// 2. Unauthenticated player
// 3. Leaderboard not present
	@:require(ios5_0) @:require(osx10_8) public static function setDefaultLeaderboard (categoryID:String, withCompletionHandler:NSError->Void) :Void;

}
