package objc.game;

// View controller that provides the standard user interface for achievements. Present modally from the top view controller.

@:framework("GameKit")
extern class GKAchievementViewController extends GKGameCenterViewController {

// Optional delegate
#if display
	public var achievementDelegate :GKAchievementViewControllerDelegate;
#end
}

// Optional delegate
extern interface GKAchievementViewControllerDelegate {
//@required
// The achievement view has finished
	public function achievementViewControllerDidFinish (viewController:GKAchievementViewController) :Void;
}
