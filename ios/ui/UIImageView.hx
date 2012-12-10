package ios.ui;

extern class UIImageView extends UIView {

	public function initWithImage (image:UIImage) :UIImageView;
	//public function initWithImage (image:UIImage, highlightedImage:UIImage) :UIImageView;

	public var image :UIImage;
	public var highlightedImage :UIImage;
	//public var userInteractionEnabled :Bool;

	public var highlighted :Bool;

	public var animationImages :Array<UIImage>;
	public var highlightedAnimationImages :Array<UIImage>;
	public var animationDuration :Float;
	public var animationRepeatCount :Int;

	public function startAnimating () :Void;
	public function stopAnimating () :Void;
	public function isAnimating () :Bool;

}
