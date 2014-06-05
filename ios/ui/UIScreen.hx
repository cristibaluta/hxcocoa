package ios.ui;
import swift.foundation.NSObject;
import swift.graphics.CGGeometry;

@:framework("UIKit")
extern class UIScreen extends NSObject {
	
	public static function screens () :Array<UIScreen>;
	public static function mainScreen () :UIScreen;
	
 	public var bounds :CGRect;
 	public var applicationFrame :CGRect;
 	public var scale :Float;
	
/*	public var availableModes :Array<UIScreenMode>;
	public var preferredMode :UIScreenMode;
	public var currentMode :UIScreenMode;
 	public var overscanCompensation :UIScreenOverscanCompensation;*/
		
	public var mirroredScreen :UIScreen;
	
 	public var brightness :Float;// 0 .. 1.0, where 1.0 is maximum brightness. Only supported by main screen.
 	public var wantsSoftwareDimming :Bool;
	
/*	public function displayLinkWithTarget (target:Dynamic, selector:Dynamic) :CADisplayLink;*/

}
