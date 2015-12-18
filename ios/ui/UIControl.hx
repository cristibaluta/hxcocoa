package ios.ui;

import objc.foundation.NSSet;
import ios.ui.UIEvent;

@:framework("UIKit")
@:fakeEnum(Int) extern enum UIControlEvent {
	UIControlEventTouchDown;
	UIControlEventTouchDownRepeat;
	UIControlEventTouchDragInside;
	UIControlEventTouchDragOutside;
	UIControlEventTouchDragEnter;
	UIControlEventTouchDragExit;
	UIControlEventTouchUpInside;
	UIControlEventTouchUpOutside;
	UIControlEventTouchCancel;
	UIControlEventValueChanged;
	UIControlEventEditingDidBegin;
	UIControlEventEditingChanged;
	UIControlEventEditingDidEnd;
	UIControlEventEditingDidEndOnExit;
	UIControlEventAllTouchEvents;
	UIControlEventAllEditingEvents;
	UIControlEventApplicationReserved;
	UIControlEventSystemReserved;
	UIControlEventAllEvents;
}

@:framework("UIKit")
@:fakeEnum(Int) extern enum UIControlContentVerticalAlignment {
	UIControlContentVerticalAlignmentCenter;
	UIControlContentVerticalAlignmentTop;
	UIControlContentVerticalAlignmentBottom;
	UIControlContentVerticalAlignmentFill;
}

@:framework("UIKit")
@:fakeEnum(Int) extern enum UIControlContentHorizontalAlignment {
	UIControlContentHorizontalAlignmentCenter;
	UIControlContentHorizontalAlignmentLeft;
	UIControlContentHorizontalAlignmentRight;
	UIControlContentHorizontalAlignmentFill;
}

@:framework("UIKit")
@:fakeEnum(Int) extern enum UIControlState {
	UIControlStateNormal;
	UIControlStateHighlighted;
	UIControlStateDisabled;
	UIControlStateSelected;
	UIControlStateApplication;
	UIControlStateReserved;
}
	

@:framework("UIKit")
extern class UIControl extends UIView {
	
	public var enabled :Bool;
	public var selected :Bool;
	public var highlighted :Bool;
	public var contentVerticalAlignment :UIControlContentVerticalAlignment;
	public var contentHorizontalAlignment :UIControlContentHorizontalAlignment;
	
	public var state (default, null) :UIControlState;
	public var tracking (default, null) :Bool;
	public var touchInside (default, null) :Bool;

	public function beginTrackingWithTouch (touch:UITouch, withEvent:UIEvent) :Bool;
	public function continueTrackingWithTouch (touch:UITouch, withEvent:UIEvent) :Bool;
	public function endTrackingWithTouch (touch:UITouch, withEvent:UIEvent) :Void;
	public function cancelTrackingWithEvent (event:UIEvent) :Void;
	
	public function addTarget (target:Dynamic, action:SEL, forControlEvents:UIControlEvent) :Void;
	public function removeTarget (target:Dynamic, action:SEL, forControlEvents:UIControlEvent) :Void;
	public function allTargets () :NSSet;
	public function allControlEvents () :UIControlEvent;
	public function actionsForTarget (target:Dynamic, forControlEvent:UIControlEvent) :Array<SEL>;
	public function sendAction (action:SEL, to:Dynamic, forEvent:UIEvent) :Void;
	public function sendActionsForControlEvents (controlEvents:UIControlEvent) :Void;
}
