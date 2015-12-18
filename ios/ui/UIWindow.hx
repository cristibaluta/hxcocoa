package ios.ui;
import objc.graphics.CGGeometry;

typedef UIWindowLevel = Float;

@:framework("UIKit")
extern class UIWindow extends UIView {

	public var screen :UIScreen;
	public var windowLevel :UIWindowLevel;
	public var keyWindow :Bool;

	public function becomeKeyWindow () :Void;
	public function resignKeyWindow () :Void;
	public function makeKeyWindow () :Void;
	public function makeKeyAndVisible () :Void;
	// convenience. most apps call this to show the main window and also make it key. otherwise use view hidden property

	public var rootViewController :UIViewController;

	public function sendEvent (event:UIEvent) :Void;

	public function convertPointToWindow (point:CGPoint, toWindow:UIWindow) :CGPoint;
	public function convertPointFromWindow (point:CGPoint, fromWindow:UIWindow) :CGPoint;
	public function convertRectToWindow (rect:CGRect, toWindow:UIWindow) :CGRect;
	public function convertRectFromWindow (rect:CGRect, fromWindow:UIWindow) :CGRect;

}
