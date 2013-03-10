package objc.graphics;

import objc.graphics.CGGeometry;

@:framework("CoreGraphics")
extern class CGAffineTransform {
    
	public var a :Float;
    public var b :Float;
    public var c :Float;
    public var d :Float;
    public var tx :Float;
    public var ty :Float;
	
	// This instance will be converted by the compiler to a struct, it's hardcoded, this method does not exists in objc
	public function new (a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float) :Void;

// The identity transform: [ 1 0 0 1 0 0 ]. 

	@:c @:struct public static function CGAffineTransformIdentity () :CGAffineTransform;

// Return the transform [ a b c d tx ty ]. 

	@:c @:struct public static function CGAffineTransformMake(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float) :CGAffineTransform;

// Return a transform which translates by `(tx, ty)':
//     t' = [ 1 0 0 1 tx ty ] 

	@:c @:struct public static function CGAffineTransformMakeTranslation(tx:Float, ty:Float) :CGAffineTransform;

// Return a transform which scales by `(sx, sy)':
//     t' = [ sx 0 0 sy 0 0 ] 

	@:c @:struct public static function CGAffineTransformMakeScale(sx:Float, sy:Float) :CGAffineTransform;

// Return a transform which rotates by `angle' radians:
//     t' = [ cos(angle) sin(angle) -sin(angle) cos(angle) 0 0 ] 

	@:c @:struct public static function CGAffineTransformMakeRotation(angle:Float) :CGAffineTransform;

// Return true if `t' is the identity transform, false otherwise. 

	@:c public static function CGAffineTransformIsIdentity(t:CGAffineTransform) :Bool;

// Translate `t' by `(tx, ty)' and return the result:
//     t' = [ 1 0 0 1 tx ty ] * t 

	@:c @:struct public static function CGAffineTransformTranslate(t:CGAffineTransform, tx:Float, ty:Float) :CGAffineTransform;

// Scale `t' by `(sx, sy)' and return the result:
//     t' = [ sx 0 0 sy 0 0 ] * t 

	@:c @:struct public static function CGAffineTransformScale(t:CGAffineTransform, sx:Float, sy:Float) :CGAffineTransform;

// Rotate `t' by `angle' radians and return the result:
//     t' =  [ cos(angle) sin(angle) -sin(angle) cos(angle) 0 0 ] * t 

	@:c @:struct public static function CGAffineTransformRotate(t:CGAffineTransform, angle:Float) :CGAffineTransform;

// Invert `t' and return the result. If `t' has zero determinant, then `t'
//   is returned unchanged. 

	@:c @:struct public static function CGAffineTransformInvert(t:CGAffineTransform) :CGAffineTransform;

// Concatenate `t2' to `t1' and return the result:
//     t' = t1 * t2 

	@:c @:struct public static function CGAffineTransformConcat(t1:CGAffineTransform, t2:CGAffineTransform) :CGAffineTransform;

// Return true if `t1' and `t2' are equal, false otherwise. 

	@:c public static function CGAffineTransformEqualToTransform(t1:CGAffineTransform, t2:CGAffineTransform) :Bool;

// Transform `point' by `t' and return the result:
//     p' = p * t
//   where p = [ x y 1 ]. 

	@:c @:struct public static function CGPointApplyAffineTransform(point:CGPoint, t:CGAffineTransform) :CGPoint;

// Transform `size' by `t' and return the result:
//     s' = s * t
//   where s = [ width height 0 ]. 

	@:c @:struct public static function CGSizeApplyAffineTransform(size:CGSize, t:CGAffineTransform) :CGSize;

/* Transform `rect' by `t' and return the result. Since affine transforms do
   not preserve rectangles in general, this function returns the smallest
   rectangle which contains the transformed corner points of `rect'. If `t'
   consists solely of scales, flips and translations, then the returned
   rectangle coincides with the rectangle constructed from the four
   transformed corners. */

	@:c @:struct public static function CGRectApplyAffineTransform(rect:CGRect, t:CGAffineTransform) :CGRect;

}

/** Definitions of inline functions. **

CG_INLINE CGAffineTransform
__CGAffineTransformMake(a:Float, b:Float, c:Float, d:Float,
  tx:Float, ty:Float)
{
  t:CGAffineTransform;
  t.a = a; t.b = b; t.c = c; t.d = d; t.tx = tx; t.ty = ty;
  return t;
}
#define CGAffineTransformMake __CGAffineTransformMake

CG_INLINE CGPoint
__CGPointApplyAffineTransform(CGPoint point, t:CGAffineTransform)
{
  CGPoint p;
  p.x = (Float)((double)t.a * point.x + (double)t.c * point.y + t.tx);
  p.y = (Float)((double)t.b * point.x + (double)t.d * point.y + t.ty);
  return p;
}
#define CGPointApplyAffineTransform __CGPointApplyAffineTransform

CG_INLINE CGSize
__CGSizeApplyAffineTransform(CGSize size, t:CGAffineTransform)
{
  CGSize s;
  s.width = (Float)((double)t.a * size.width + (double)t.c * size.height);
  s.height = (Float)((double)t.b * size.width + (double)t.d * size.height);
  return s;
}
#define CGSizeApplyAffineTransform __CGSizeApplyAffineTransform

#endif  CGAFFINETRANSFORM_H_ 
*/