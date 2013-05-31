//
//  UIActivityIndicator.h
package ios.ui;

@:framework("UIKit")
extern enum UIActivityIndicatorViewStyle {
    UIActivityIndicatorViewStyleWhiteLarge;
    UIActivityIndicatorViewStyleWhite;
    UIActivityIndicatorViewStyleGray;
}

@:framework("UIKit")
extern class UIActivityIndicatorView extends UIView {

	public function initWithActivityIndicatorStyle (style:UIActivityIndicatorViewStyle) :UIActivityIndicatorView;

	public var activityIndicatorViewStyle :UIActivityIndicatorViewStyle;
	public var hidesWhenStopped :Bool;

	@:require(ios5) public var color :UIColor;

	public function startAnimating () :Void;
	public function stopAnimating () :Void;
	public function isAnimating () :Bool;
	
}
