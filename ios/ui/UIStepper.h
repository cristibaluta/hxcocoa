package ios.ui;


@:require(ios_5_0) extern class UIStepper : UIControl 

	public var (nonatomic,getter=isContinuous) BOOL continuous; // if YES, value change events are sent any time the value changes during interaction. default = YES
	public var  BOOL autorepeat;                     // if YES, press & hold repeatedly alters value. default = YES
	public var  BOOL wraps;                          // if YES, value wraps from min <-> max. default = NO

	public var  double value;                        // default is 0. sends UIControlEventValueChanged. clamped to min/max
	public var  double minimumValue;                 // default 0. must be less than maximumValue
	public var  double maximumValue;                 // default 100. must be greater than minimumValue
	public var  double stepValue;                    // default 1. must be greater than 0

	public var (nonatomic,retain) UIColor *tintColor NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;

// a background image which will be 3-way stretched over the whole of the control. Each half of the stepper will paint the image appropriate for its state
	public function setBackgroundImage:(UIImage*)image forState:(UIControlState)state NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;
- (UIImage*)backgroundImageForState:(UIControlState)state NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;

// an image which will be painted in between the two stepper segments. The image is selected depending both segments' state
	public function setDividerImage:(UIImage*)image forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;
- (UIImage*)dividerImageForLeftSegmentState:(UIControlState)state rightSegmentState:(UIControlState)state NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;

// the glyph image for the plus/increase button
	public function setIncrementImage:(UIImage *)image forState:(UIControlState)state NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;
- (UIImage *)incrementImageForState:(UIControlState)state NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;

// the glyph image for the minus/decrease button
	public function setDecrementImage:(UIImage *)image forState:(UIControlState)state NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;
- (UIImage *)decrementImageForState:(UIControlState)state NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;

}
