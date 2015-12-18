package objc.quartz;

import objc.foundation.NSObject;


/* Represents one segment of a function describing a timing curve. The
 * function maps an input time normalized to the range [0,1] to an
 * output time also in the range [0,1]. E.g. these functions are used
 * to define the pacing of an animation over its duration (or over the
 * duration of one keyframe). */

extern class CAMediaTimingFunction extends NSObject {

/* A convenience method for creating common timing functions. The
 * currently supported names are `linear', `easeIn', `easeOut' and
 * `easeInEaseOut' and `default' (the curve used by implicit animations
 * created by Core Animation). */

	public static function functionWithName (name:String) :CAMediaTimingFunction;

/* Creates a timing function modelled on a cubic Bezier curve. The end
 * points of the curve are at (0,0) and (1,1), the two points 'c1' and
 * 'c2' defined by the class instance are the control points. Thus the
 * points defining the Bezier curve are: '[(0,0), c1, c2, (1,1)]' */

/*	TODO: support for functions without argument names*/
	public static function functionWithControlPoints (c1x:Float, __c1y__:Float, __c2x__:Float, __c2y__:Float) :CAMediaTimingFunction;
	public function initWithControlPoints (c1x:Float, __c1y__:Float, __c2x__:Float, __c2y__:Float) :CAMediaTimingFunction;

/* 'idx' is a value from 0 to 3 inclusive. */

	public function getControlPointAtIndex (idx:Int, values:Array<Float>) :Void;

}

/** Timing function names. **/

/*CA_EXTERN NSString * const kCAMediaTimingFunctionLinear
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAMediaTimingFunctionEaseIn
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAMediaTimingFunctionEaseOut
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAMediaTimingFunctionEaseInEaseOut
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAMediaTimingFunctionDefault
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_3_0);
*/