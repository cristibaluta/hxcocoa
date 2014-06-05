package swift.game;

import swift.game.GKLeaderboard;
import swift.game.GKGameCenterViewController;

// View controller that provides the standard user interface for leaderboards.  Present modally from the top view controller.

@:framework("GameKit")
extern class GKLeaderboardViewController extends GKGameCenterViewController

	public var timeScope :GKLeaderboardTimeScope;
	public var category :String;
	public var leaderboardDelegate :GKLeaderboardViewControllerDelegate;

}

@:framework("GameKit")
extern interface GKLeaderboardViewControllerDelegate {
// The leaderboard view has finished
	public function leaderboardViewControllerDidFinish (viewController:GKLeaderboardViewController) :Void;
}
