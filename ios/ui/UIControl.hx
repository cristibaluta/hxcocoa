package ios.ui;

typedef UIControlEvents = Int;
typedef UIControlContentVerticalAlignment = Int;
typedef UIControlContentHorizontalAlignment = Int;
typedef UIControlState = Int;
	

extern class UIControl extends UIView {


	inline static var UIControlEventTouchDown           = 1 <<  0;
	inline static var UIControlEventTouchDownRepeat     = 1 <<  1;
	inline static var UIControlEventTouchDragInside     = 1 <<  2;
	inline static var UIControlEventTouchDragOutside    = 1 <<  3;
	inline static var UIControlEventTouchDragEnter      = 1 <<  4;
	inline static var UIControlEventTouchDragExit       = 1 <<  5;
	inline static var UIControlEventTouchUpInside       = 1 <<  6;
	inline static var UIControlEventTouchUpOutside      = 1 <<  7;
	inline static var UIControlEventTouchCancel         = 1 <<  8;
	inline static var UIControlEventValueChanged        = 1 << 12;
	inline static var UIControlEventEditingDidBegin     = 1 << 16;
	inline static var UIControlEventEditingChanged      = 1 << 17;
	inline static var UIControlEventEditingDidEnd       = 1 << 18;
	inline static var UIControlEventEditingDidEndOnExit = 1 << 19;
	inline static var UIControlEventAllTouchEvents      = 0x00000FFF;
	inline static var UIControlEventAllEditingEvents    = 0x000F0000;
	inline static var UIControlEventApplicationReserved = 0x0F000000;
	inline static var UIControlEventSystemReserved      = 0xF0000000;
	inline static var UIControlEventAllEvents           = 0xFFFFFFFF;

	inline static var UIControlContentVerticalAlignmentCenter  = 0;
	inline static var UIControlContentVerticalAlignmentTop     = 1;
	inline static var UIControlContentVerticalAlignmentBottom  = 2;
	inline static var UIControlContentVerticalAlignmentFill    = 3;

	inline static var UIControlContentHorizontalAlignmentCenter = 0;
	inline static var UIControlContentHorizontalAlignmentLeft   = 1;
	inline static var UIControlContentHorizontalAlignmentRight  = 2;
	inline static var UIControlContentHorizontalAlignmentFill   = 3;

	inline static var UIControlStateNormal = 0;
	inline static var UIControlStateHighlighted = 1 << 0;
	inline static var UIControlStateDisabled = 1 << 1;
	inline static var UIControlStateSelected = 1 << 2;
	inline static var UIControlStateApplication = 0x00FF0000;
	inline static var UIControlStateReserved = 0xFF000000;
	
	
	
	public var enabled :Bool;
	public var selected :Bool;
	public var highlighted :Bool;
	public var contentVerticalAlignment :UIControlContentVerticalAlignment
	public var contentHorizontalAlignment :UIControlContentHorizontalAlignment;

	public var state (default, null) :UIControlState;
	public var tracking (default, null) :Bool;
	public var touchInside (default, null) :Bool;

	public function beginTrackingWithTouch (touch:UITouch, withEvent:UIEvent) :Bool;
	public function continueTrackingWithTouch (touch:UITouch, withEvent:UIEvent) :Bool;
	public function endTrackingWithTouch (touch:UITouch, withEvent:UIEvent) :Void;
	public function cancelTrackingWithEvent (event:UIEvent) :Void;
	
	public function addTarget (target:Dynamic, action:SEL, forControlEvents:UIControlEvents) :Void;
	public function removeTarget (target:Dynamic, action:SEL, forControlEvents:UIControlEvents) :Void;
	public function allTargets () :NSSet;
	public function allControlEvents () :UIControlEvents;
	public function actionsForTarget (target:Dynamic, forControlEvent:UIControlEvents) :Array<SEL>;
	public function sendAction (action:SEL, to:Dynamic, forEvent:UIEvent) :Void;
	public function sendActionsForControlEvents (controlEvents:UIControlEvents) :Void;
}
