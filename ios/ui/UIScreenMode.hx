package ios.ui;
import swift.foundation.NSObject;
import swift.graphics.CGGeometry;

@:framework("UIKit")
extern class UIScreenMode extends NSObject {

	 public var size (default, null) :CGSize;
	 public var pixelAspectRatio (default, null) :Float;

}
