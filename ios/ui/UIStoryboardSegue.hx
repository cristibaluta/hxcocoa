//
//  UIStoryboardSegue.h
package ios.ui;


@:framework("UIKit")
@:require(ios5_0)
extern class UIStoryboardSegue extends NSObject {

// Convenience constructor for returning a segue that performs a handler block in its -perform method.
	@:require(ios6_0)public static function segueWithIdentifier (identifier:String, source:UIViewController, destination:UIViewController, performHandler:Void->Void) :UIStoryboardSegue;

	public function initWithIdentifier (identifier:String, source:UIViewController, destination:UIViewController) :UIStoryboardSegue; // Designated initializer

	public var identifier :String;
	public var sourceViewController :Dynamic;
	public var destinationViewController :Dynamic;

	public function perform () :Void;

}
