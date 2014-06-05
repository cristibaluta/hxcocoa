package swift.game;

import swift.game.GKLeaderboard;


@:framework("GameKit")
extern enum GKGameCenterViewControllerState {
    GKGameCenterViewControllerStateDefault;
    GKGameCenterViewControllerStateLeaderboards;
    GKGameCenterViewControllerStateAchievements;
    GKGameCenterViewControllerStateChallenges;
}

NS_CLASS_AVAILABLE(NA, 6_0)
#if ios
@:framework("GameKit")
extern class GKGameCenterViewController extends UINavigationController

	public var gameCenterDelegate :GKGameCenterControllerDelegate;
	public var viewState :GKGameCenterViewControllerState;

}

@:framework("GameKit")
extern class GKGameCenterViewController (Leaderboards)

	public var leaderboardTimeScope :GKLeaderboardTimeScope;   // Implies showing leaderboards
	public var leaderboardCategory :String;   // Implies showing leaderboards

}

@:framework("GameKit")
@protocol GKGameCenterControllerDelegate <NSObject>

- (void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController;

}


