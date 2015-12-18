package ios.ui;
import objc.foundation.NSObject;
import objc.graphics.CGGeometry;

@:framework("UIKit")
extern class UIScreenMode extends NSObject {

	 public var size (default, null) :CGSize;
	 public var pixelAspectRatio (default, null) :Float;

}
