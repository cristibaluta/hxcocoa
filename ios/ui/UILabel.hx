package ios.ui;

import objc.graphics.CGGeometry;
import ios.ui.NSText;


extern class UILabel extends UIView {
	
	public var text :String;
	public var font :UIFont;
	public var textColor :UIColor;
	public var shadowColor :UIColor;
	public var shadowOffset :CGSize;
	public var textAlignment :NSTextAlignment;
/*	public var lineBreakMode :NSLineBreakMode;*/
/*	public var attributedString :NSAttributedString;*/
	
	public var highlightedTextColor :UIColor;
	public var highlighted :Bool;
	//public var userInteractionEnabled :Bool;// already defined
	public var enabled :Bool;
	
	public var numberOfLines :Int;
	
	public var adjustsFontSizeToFitWidth :Bool;
	public var adjustsLetterSpacingToFitWidth :Bool;
/*	public var baselineAdjustment :UIBaselineAdjustment;*/
	public var minimumScaleFactor :Float;
	public var preferredMaxLayoutWidth :Float;
	
	public function textRectForBounds (bounds:CGRect, numberOfLines:Int) :CGRect;
	public function drawTextInRect (rect:CGRect) :Void;
}
