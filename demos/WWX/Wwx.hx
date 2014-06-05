import ios.ui.UIApplicationMain;
import ios.ui.UIApplicationDelegate;
import ios.ui.UIResponder;
import ios.ui.UIImageView;
import ios.ui.UIImage;
import ios.ui.UIWindow;
import ios.ui.UIScreen;
import ios.ui.UIView;
import ios.ui.UIControl;
import ios.ui.UIViewController;
import ios.ui.UIApplication;
import ios.ui.NSText;
import swift.foundation.NSDictionary;
import swift.graphics.CGGeometry;
import swift.graphics.CGAffineTransform;


class Wwx extends UIResponder implements UIApplicationDelegate {
	
	public var window :UIWindow;
	public var viewController :UIViewController;
	var session :FBSession;
	var str2 :String;
	var i :Int = 0;
	
	public function application (application:UIApplication, didFinishLaunchingWithOptions:NSDictionary) :Bool {
		
		trace("Start");
		
		application.statusBarStyle = UIStatusBarStyleBlackTranslucent;
		application.statusBarHidden = true;
		
		window = new UIWindow();
		var screen = UIScreen.mainScreen();
		window.frame = screen.bounds;
		
		viewController = new ViewController();
		window.rootViewController = viewController;
		window.makeKeyAndVisible();
		
		var str = "abc";
		str += "def";
		str += getGHI();
		
		str2 = "abc";
		str2 += "def";
		str2 += getGHI();
		
		i+=1;
		i++;
		
		return true;
	}
	function getGHI():String { return "GHI"; }
	
	public function applicationDidBecomeActive (application:UIApplication) :Void {
		//FBSession.activeSession().handleDidBecomeActive();
		//[(ViewController*)self.window.rootViewController resume];
	}
	public function applicationWillResignActive (application:UIApplication) :Void {}
	
	
	

	public static function main() {
		return new UIApplicationMain ( Wwx );
	}
}