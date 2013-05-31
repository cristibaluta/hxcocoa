package ios.ui;

@:framework("UIKit")
@:require(ios5)
extern class UIStepper extends UIControl {

	public var continuous :Bool; // if YES, value change events are sent any time the value changes during interaction. default = YES
	public var autorepeat :Bool;                     // if YES, press & hold repeatedly alters value. default = YES
	public var wraps :Bool;                          // if YES, value wraps from min <-> max. default = NO

	public var value :Float;                        // default is 0. sends UIControlEventValueChanged. clamped to min/max
	public var minimumValue :Float;                 // default 0. must be less than maximumValue
	public var maximumValue :Float;                 // default 100. must be greater than minimumValue
	public var stepValue :Float;                    // default 1. must be greater than 0

	@:require(ios6) public var tintColor :UIColor;

// a background image which will be 3-way stretched over the whole of the control. Each half of the stepper will paint the image appropriate for its state
	@:require(ios5)public function setBackgroundImage (image:UIImage, forState:UIControlState) :Void;
	@:require(ios5)public function backgroundImageForState (state:UIControlState) :UIImage;

// an image which will be painted in between the two stepper segments. The image is selected depending both segments' state
	@:require(ios5)public function setDividerImage (image:UIImage, forLeftSegmentState:UIControlState, rightSegmentState:UIControlState) :Void;
	@:require(ios5)public function dividerImageForLeftSegmentState (state:UIControlState, rightSegmentState:UIControlState) :UIImage;

// the glyph image for the plus/increase button
	@:require(ios5)public function setIncrementImage (image:UIImage, forState:UIControlState) :Void;
	@:require(ios5)public function incrementImageForState (state:UIControlState) :UIImage;

// the glyph image for the minus/decrease button
	@:require(ios5)public function setDecrementImage (image:UIImage, forState:UIControlState) :Void;
	@:require(ios5)public function decrementImageForState (state:UIControlState) :UIImage;

}
