//
//  UIProgressView.h
package ios.ui;


@:framework("UIKit")
extern enum UIProgressViewStyle {
    UIProgressViewStyleDefault;     // normal progress bar
    UIProgressViewStyleBar;         // for use in a toolbar
}


@:framework("UIKit")
extern class UIProgressView extends UIView {

	public function initWithProgressViewStyle (style:UIProgressViewStyle) :UIProgressView;

	public var progressViewStyle :UIProgressViewStyle ; // default is UIProgressViewStyleDefault
	public var progress :Float;                        // 0.0 .. 1.0, default is 0.0. values outside are pinned.
	@:require(5_0)public var progressTintColor :UIColor;
	@:require(5_0)public var trackTintColor :UIColor;
	@:require(5_0)public var progressImage :UIImage;
	@:require(5_0)public var trackImage :UIImage;

	@:require(5_0)public function setProgress (progress:Float, animated:Bool) :Void;

}
