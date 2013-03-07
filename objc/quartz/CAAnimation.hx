package objc.quartz;

import objc.foundation.NSObject;
private typedef CGPathRef = Dynamic;

extern class CAAnimation extends NSObject implements NSCopying/*, CAMediaTiming, CAAction>*/{

	public static function animation () :CAAnimation;
	public static function defaultValueForKey(key:String) :CAAnimation;
	public function shouldArchiveValueForKey (key:String) :Bool;

	public var timingFunction :CAMediaTimingFunction;
	public var delegate :Dynamic;
	public var removedOnCompletion :Bool;

}

/* Delegate methods for CAAnimation. */

extern interface CAAnimationDelegate {

	public function animationDidStart (anim:CAAnimation) :Void;
	public function animationDidStop (anim:CAAnimation, finished:Bool) :Void;

}


/** Subclass for property-based animations. **/

extern class CAPropertyAnimation extends CAAnimation {

	public static function animationWithKeyPath (path:String) :CAPropertyAnimation;

	public var keyPath (default, null) :String;
	public var additive (default, null) :Bool;
	public var cumulative (default, null) :Bool;
	public var valueFunction :CAValueFunction;

}


/** Subclass for basic (single-keyframe) animations. **/

extern class CABasicAnimation extends CAPropertyAnimation {

	public var fromValue :Dynamic;
	public var toValue :Dynamic;
	public var byValue :Dynamic;

}


/** General keyframe animation class. **/

extern class CAKeyframeAnimation extends CAPropertyAnimation {

	public var values :Array<Dynamic>;
	public var path :CGPathRef;
	public var keyTimes :Array<Dynamic>;
	public var timingFunctions :Array<Dynamic>;
	public var calculationMode :String;
	public var tensionValues :Array<Dynamic>;
	public var continuityValues :Array<Dynamic>;
	public var biasValues :Array<Dynamic>;
	public var rotationMode :String;

}

/* `calculationMode' strings. */

/*CA_EXTERN NSString * const kCAAnimationLinear
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAAnimationDiscrete
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAAnimationPaced
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAAnimationCubic
    __OSX_AVAILABLE_STARTING (__MAC_10_7, __IPHONE_4_0);
CA_EXTERN NSString * const kCAAnimationCubicPaced
    __OSX_AVAILABLE_STARTING (__MAC_10_7, __IPHONE_4_0);


CA_EXTERN NSString * const kCAAnimationRotateAuto
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAAnimationRotateAutoReverse
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/
/** Transition animation subclass. **/

extern class CATransition extends CAAnimation {

	public var type :String;
	public var subtype :String;
	public var startProgress :Float;
	public var endProgress :Float;
	public var filter :Dynamic;
}

/* Common transition types. */

/*CA_EXTERN NSString * const kCATransitionFade
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCATransitionMoveIn
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCATransitionPush
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCATransitionReveal
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);


CA_EXTERN NSString * const kCATransitionFromRight
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCATransitionFromLeft
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCATransitionFromTop
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCATransitionFromBottom
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);*/


extern class CAAnimationGroup extends CAAnimation {

	public var animations :Array<CAAnimation>;

}
