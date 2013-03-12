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
import ios.ui.UIColor;
import ios.ui.NSText;
import objc.foundation.NSDictionary;
import objc.graphics.CGGeometry;
import objc.graphics.CGAffineTransform;


class PiratePig extends UIResponder implements UIApplicationDelegate {
	
	public var window :UIWindow;
	public var viewController :UIViewController;
	public var view :UIView;
	
	var background :UIImageView;
	var footer :UIImageView;
	var game :PiratePigGame;
	
	public function application (application:UIApplication, didFinishLaunchingWithOptions:NSDictionary) :Bool {
		
		trace("Start");
		
		//var n = objc.foundation.NSNull.__null();
		//var c = objc.foundation.NSNull.__class();
		
		window = new UIWindow();
		var screen = UIScreen.mainScreen();
		window.frame = screen.bounds;
		
		view = new UIView();
		
		viewController = new UIViewController();
		viewController.view = view;
		window.rootViewController = viewController;
		window.makeKeyAndVisible();
		
		
		view.frame = new CGRect(0, 20, window.frame.size.width*2, window.frame.size.height*2);
		view.autoresizesSubviews = true;
		view.autoresizingMask = untyped UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		view.backgroundColor = UIColor.grayColor();
		view.clipsToBounds = true;
		
		background = new UIImageView().initWithImage ( UIImage.imageNamed("background_tile.png") );
		var bs = background.frame;
		bs.size.width = view.frame.size.width;
		background.frame = bs;
		view.addSubview (background);
		
		footer = new UIImageView().initWithImage ( UIImage.imageNamed("center_bottom.png"));
		var bs = footer.frame;
		bs.origin.x = view.frame.size.width/2 - bs.size.width/2;
		bs.origin.y = view.frame.size.height - bs.size.height;
		footer.frame = bs;
		footer.alpha = 0.5;
		view.addSubview (footer);
		
		game = new PiratePigGame();
		game.frame = view.frame;
		//game.resize (320, 480);
		view.addSubview (game);
		
		view.transform = CGAffineTransform.CGAffineTransformScale (view.transform, 0.5, 0.5);
		view.transform = CGAffineTransform.CGAffineTransformTranslate(view.transform, -window.frame.size.width,-window.frame.size.height);
		
		return true;
	}
	private function initialize ():Void {
		
	}
	private function construct ():Void {
		
	}
	
	public function applicationDidBecomeActive (application:UIApplication) :Void {}
	public function applicationWillResignActive (application:UIApplication) :Void {}
	
	
	

	public static function main() {
		return new UIApplicationMain ( PiratePig );
	}
}