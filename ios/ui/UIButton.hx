
package ios.ui;

import objc.foundation.NSObject;
import ios.ui.UIGeometry;


typedef UIButtonType = Int;


extern class UIButton extends UIControl, implements NSObject {

	inline public static var UIButtonTypeCustom = 0;
	inline public static var UIButtonTypeRoundedRect = 1;
	inline public static var UIButtonTypeDetailDisclosure = 2;
	inline public static var UIButtonTypeInfoLight = 3;
	inline public static var UIButtonTypeInfoDark = 4;
	inline public static var UIButtonTypeContactAdd = 5;
	
	public static function buttonWithType (buttonType:UIButtonType) :UIButton;

	public var contentEdgeInsets :UIEdgeInsets;
	public var titleEdgeInsets :UIEdgeInsets;
	public var reversesTitleShadowWhenHighlighted :Bool;
	public var imageEdgeInsets :UIEdgeInsets;
	public var adjustsImageWhenHighlighted :Bool;
	public var adjustsImageWhenDisabled :Bool;
	public var showsTouchWhenHighlighted :Bool;
	@:require(ios_5_0) public var tintColor :UIColor;
	public var (default, null) buttonType :UIButtonType;
	
	public function setTitle (title:String, forState:UIControlState) :Void;
	public function setTitleColor (color:UIColor, forState:UIControlState) :Void;
	public function setTitleShadowColor (color:UIColor, forState:UIControlState) :Void;
	public function setImage (image:UIImage, forState:UIControlState) :Void;
	public function setBackgroundImage (image:UIImage, forState:UIControlState) :Void;
	@:require(ios_6_0) public function setAttributedTitle (title:NSAttributedString, forState:UIControlState) :Void;

	public function titleForState (state:UIControlState) :String;
	public function titleColorForState (state:UIControlState) :UIColor;
	public function titleShadowColorForState (state:UIControlState) :UIColor;
	public function imageForState (state:UIControlState) :UIImage;
	public function backgroundImageForState (state:UIControlState) :UIImage;
	public function attributedTitleForState (state:UIControlState) :NSAttributedString;


	public var currentTitle (default, null) :String;
	public var currentTitleColor (default, null) :UIColor;
	public var currentTitleShadowColor (default, null) :UIColor;
	public var currentImage (default, null) :UIImage;
	public var currentBackgroundImage (default, null) :UIImage;
	@:require(ios_6_0) public var currentAttributedTitle (default, null) :NSAttributedString;
	
	public var titleLabel (default, null) :UILabel;
	public var imageView (default, null) :UIImageView;


	public function backgroundRectForBounds (bounds:CGRect) :CGRect;
	public function contentRectForBounds (bounds:CGRect) :CGRect;
	public function titleRectForContentRect (contentRect:CGRect) :CGRect;
	public function imageRectForContentRect (contentRect:CGRect) :CGRect;

}
