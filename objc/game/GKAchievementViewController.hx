package objc.game;
import objc.foundation.NSObject;

// View controller that provides the standard user interface for achievements. Present modally from the top view controller.
NS_CLASS_AVAILABLE(NA, 4_1)
@:framework("GameKit")
extern class GKAchievementViewController extends GKGameCenterViewController {

// Optional delegate
	public var achievementDelegate :GKAchievementViewControllerDelegate;

}

// Optional delegate
extern interface GKAchievementViewControllerDelegate {
//@required
// The achievement view has finished
	public function achievementViewControllerDidFinish (viewController:GKAchievementViewController) :Void;
}
