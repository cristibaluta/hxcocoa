//
//  UIStoryboardSegue.h
package ios.ui;
import swift.foundation.NSObject;


@:framework("UIKit")
@:require(ios5)
extern class UIStoryboardSegue extends NSObject {

// Convenience constructor for returning a segue that performs a handler block in its -perform method.
	@:require(ios6)public static function segueWithIdentifier (identifier:String, source:UIViewController, destination:UIViewController, performHandler:Void->Void) :UIStoryboardSegue;

	public function initWithIdentifier (identifier:String, source:UIViewController, destination:UIViewController) :UIStoryboardSegue; // Designated initializer

	public var identifier :String;
	public var sourceViewController :Dynamic;
	public var destinationViewController :Dynamic;

	public function perform () :Void;

}
