package objc.quartz;

import objc.foundation.NSObject;


/* Homogeneous three-dimensional transforms. */

typedef CATransform3D = {
	public var m11 :Float;
	public var m12 :Float;
	public var m13 :Float;
	public var m14 :Float;
	public var m21 :Float;
	public var m22 :Float;
	public var m23 :Float;
	public var m24 :Float;
	public var m31 :Float;
	public var m32 :Float;
	public var m33 :Float;
	public var m34 :Float;
	public var m41 :Float;
	public var m42 :Float;
	public var m43 :Float;
	public var m44 :Float;
}


/* The identity transform: [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]. */

/*CA_EXTERN const CATransform3D CATransform3DIdentity
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/
/* Returns true if 't' is the identity transform. */

/*CA_EXTERN bool CATransform3DIsIdentity (CATransform3D t)
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/
/* Returns true if 'a' is exactly equal to 'b'. */

/*CA_EXTERN bool CATransform3DEqualToTransform (CATransform3D a,
    CATransform3D b)
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/
/* Returns a transform that translates by '(tx, ty, tz)':
 * t' =  [1 0 0 0; 0 1 0 0; 0 0 1 0; tx ty tz 1]. */

/*CA_EXTERN CATransform3D CATransform3DMakeTranslation (Float tx,
    Float ty, Float tz)
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/
/* Returns a transform that scales by `(sx, sy, sz)':
 * t' = [sx 0 0 0; 0 sy 0 0; 0 0 sz 0; 0 0 0 1]. */

/*CA_EXTERN CATransform3D CATransform3DMakeScale (Float sx, Float sy,
    Float sz)
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/
/* Returns a transform that rotates by 'angle' radians about the vector
 * '(x, y, z)'. If the vector has length zero the identity transform is
 * returned. */

/*CA_EXTERN CATransform3D CATransform3DMakeRotation (Float angle, Float x,
    Float y, Float z)
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/
/* Translate 't' by '(tx, ty, tz)' and return the result:
 * t' = translate(tx, ty, tz) * t. */

/*CA_EXTERN CATransform3D CATransform3DTranslate (CATransform3D t, Float tx,
    Float ty, Float tz)
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/
/* Scale 't' by '(sx, sy, sz)' and return the result:
 * t' = scale(sx, sy, sz) * t. */

/*CA_EXTERN CATransform3D CATransform3DScale (CATransform3D t, Float sx,
    Float sy, Float sz)
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/
/* Rotate 't' by 'angle' radians about the vector '(x, y, z)' and return
 * the result. If the vector has zero length the behavior is undefined:
 * t' = rotation(angle, x, y, z) * t. */

/*CA_EXTERN CATransform3D CATransform3DRotate (CATransform3D t, Float angle,
    Float x, Float y, Float z)
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/
/* Concatenate 'b' to 'a' and return the result: t' = a * b. */

/*CA_EXTERN CATransform3D CATransform3DConcat (CATransform3D a, CATransform3D b)
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/
/* Invert 't' and return the result. Returns the original matrix if 't'
 * has no inverse. */

/*CA_EXTERN CATransform3D CATransform3DInvert (CATransform3D t)
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/
/* Return a transform with the same effect as affine transform 'm'. */

/*CA_EXTERN CATransform3D CATransform3DMakeAffineTransform (CGAffineTransform m)
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/
/* Returns true if 't' can be represented exactly by an affine transform. */

/*CA_EXTERN bool CATransform3DIsAffine (CATransform3D t)
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/
/* Returns the affine transform represented by 't'. If 't' can not be
 * represented exactly by an affine transform the returned value is
 * undefined. */

/*CA_EXTERN CGAffineTransform CATransform3DGetAffineTransform (CATransform3D t)
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
*/

/*extern class NSValue (CATransform3DAdditions)

+ (NSValue *)valueWithCATransform3D:(CATransform3D)t;

- (CATransform3D)CATransform3DValue;

}*/
