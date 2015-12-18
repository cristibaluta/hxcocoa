
import ios.ui.UIApplicationDelegate;
import ios.ui.UIResponder;
import ios.ui.UIWebView;
import ios.ui.UILabel;
import ios.ui.UIWindow;
import ios.ui.UIScreen;
import ios.ui.UIView;
import ios.ui.UIButton;
import ios.ui.UIControl;
import ios.ui.UIViewController;
import ios.ui.UIApplication;
import ios.ui.UIColor;
import ios.ui.UIFont;
import ios.ui.NSText;
import objc.foundation.NSDictionary;
import objc.graphics.CGGeometry;


class AppDelegate extends UIResponder implements UIApplicationDelegate {
	
	public var window :UIWindow;
	public var viewController :UIViewController;
	public var view :UIView;
	public var label :UILabel;
	var map :CustomMapView;
	var but :UIButton;
	
	
	public function application (application:UIApplication, didFinishLaunchingWithOptions:NSDictionary) :Bool {
		
		window = new UIWindow();
		var screen = UIScreen.mainScreen();
		window.frame = screen.bounds;
		
		view = new UIView();
		view.frame = new CGRect(0, 0, window.frame.size.width, window.frame.size.height);
		view.autoresizesSubviews = true;
		view.autoresizingMask = untyped UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		view.backgroundColor = UIColor.darkGrayColor();

		label = new UILabel();
		label.frame = new CGRect (0, 350, view.frame.size.width, 50);
		label.textColor = UIColor.yellowColor();
		label.backgroundColor = UIColor.clearColor();
		label.textAlignment = NSTextAlignmentCenter;
		label.font = UIFont.boldSystemFontOfSize(30);
		label.text = "Hello world!";
		view.addSubview(label);

		map = new CustomMapView();
		map.frame = new CGRect(10, 10, 300, 300);
		view.addSubview(map);
		map.locateLondon();
		
		but = new UIButton();
		but.frame = CGGeometry.CGRectMake(0, 430, 320, 30);
		but.setTitle("Locate London", UIControlStateNormal);
		but.setTitle("...Locate London...", UIControlStateHighlighted);
		view.addSubview ( but );

		viewController = new UIViewController();
		viewController.view = view;
		window.rootViewController = viewController;
		window.makeKeyAndVisible();
		
		trace("Great, it works!");
		
		var o = ["1","2","3"];
		trace(o[1]);
		
		return true;
	}
	function locateLondon () {
		map.locateLondon();
	}
	public function applicationDidBecomeActive (application:UIApplication) :Void {}
	public function applicationWillResignActive (application:UIApplication) :Void {}
}
