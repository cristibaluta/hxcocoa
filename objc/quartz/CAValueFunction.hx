package objc.quartz;

import objc.foundation.NSObject;

extern class CAValueFunction extends NSObject {

	public static function functionWithName (name:String) :CAValueFunction;

	public var name (default, null) :String;

}

/** Value function names. **/

/* The `rotateX', `rotateY', `rotateZ' functions take a single input
 * value in radians, and construct a 4x4 matrix representing the
 * corresponding rotation matrix. */

/*CA_EXTERN NSString * const kCAValueFunctionRotateX
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_3_0);
CA_EXTERN NSString * const kCAValueFunctionRotateY
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_3_0);
CA_EXTERN NSString * const kCAValueFunctionRotateZ
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_3_0);
*/
/* The `scale' function takes three input values and constructs a
 * 4x4 matrix representing the corresponding scale matrix. */

/*CA_EXTERN NSString * const kCAValueFunctionScale
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_3_0);
*/
/* The `scaleX', `scaleY', `scaleZ' functions take a single input value
 * and construct a 4x4 matrix representing the corresponding scaling
 * matrix. */

/*CA_EXTERN NSString * const kCAValueFunctionScaleX
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_3_0);
CA_EXTERN NSString * const kCAValueFunctionScaleY
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_3_0);
CA_EXTERN NSString * const kCAValueFunctionScaleZ
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_3_0);
*/
/* The `translate' function takes three input values and constructs a
 * 4x4 matrix representing the corresponding scale matrix. */

/*CA_EXTERN NSString * const kCAValueFunctionTranslate
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_3_0);
*/
/* The `translateX', `translateY', `translateZ' functions take a single
 * input value and construct a 4x4 matrix representing the corresponding
 * translation matrix. */

/*CA_EXTERN NSString * const kCAValueFunctionTranslateX
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_3_0);
CA_EXTERN NSString * const kCAValueFunctionTranslateY
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_3_0);
CA_EXTERN NSString * const kCAValueFunctionTranslateZ
    __OSX_AVAILABLE_STARTING (__MAC_10_6, __IPHONE_3_0);
*/
