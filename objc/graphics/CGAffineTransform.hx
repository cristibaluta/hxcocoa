package objc.graphics;

@:framework("CoreGraphics")
extern class CGAffineTransform {
    
	public var a :Float;
    public var b :Float;
    public var c :Float;
    public var d :Float;
    public var tx :Float;
    public var ty :Float;
	
	public function new (a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float) :Void;
}


/*v
 The identity transform: [ 1 0 0 1 0 0 ]. 

	@:c public static function const CGAffineTransform CGAffineTransformIdentity
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

 Return the transform [ a b c d tx ty ]. 

	@:c public static function CGAffineTransform CGAffineTransformMake(Float a, Float b,
  Float c, Float d, Float tx, Float ty)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

 Return a transform which translates by `(tx, ty)':
     t' = [ 1 0 0 1 tx ty ] 

	@:c public static function CGAffineTransform CGAffineTransformMakeTranslation(Float tx,
  Float ty) CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

 Return a transform which scales by `(sx, sy)':
     t' = [ sx 0 0 sy 0 0 ] 

	@:c public static function CGAffineTransform CGAffineTransformMakeScale(Float sx, Float sy)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

 Return a transform which rotates by `angle' radians:
     t' = [ cos(angle) sin(angle) -sin(angle) cos(angle) 0 0 ] 

	@:c public static function CGAffineTransform CGAffineTransformMakeRotation(Float angle)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

 Return true if `t' is the identity transform, false otherwise. 

	@:c public static function bool CGAffineTransformIsIdentity(CGAffineTransform t)
  CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

 Translate `t' by `(tx, ty)' and return the result:
     t' = [ 1 0 0 1 tx ty ] * t 

	@:c public static function CGAffineTransform CGAffineTransformTranslate(CGAffineTransform t,
  Float tx, Float ty) CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

 Scale `t' by `(sx, sy)' and return the result:
     t' = [ sx 0 0 sy 0 0 ] * t 

	@:c public static function CGAffineTransform CGAffineTransformScale(CGAffineTransform t,
  Float sx, Float sy) CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

 Rotate `t' by `angle' radians and return the result:
     t' =  [ cos(angle) sin(angle) -sin(angle) cos(angle) 0 0 ] * t 

	@:c public static function CGAffineTransform CGAffineTransformRotate(CGAffineTransform t,
  Float angle) CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

 Invert `t' and return the result. If `t' has zero determinant, then `t'
   is returned unchanged. 

	@:c public static function CGAffineTransform CGAffineTransformInvert(CGAffineTransform t)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

 Concatenate `t2' to `t1' and return the result:
     t' = t1 * t2 

	@:c public static function CGAffineTransform CGAffineTransformConcat(CGAffineTransform t1,
  CGAffineTransform t2) CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

 Return true if `t1' and `t2' are equal, false otherwise. 

	@:c public static function bool CGAffineTransformEqualToTransform(CGAffineTransform t1,
  CGAffineTransform t2) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

 Transform `point' by `t' and return the result:
     p' = p * t
   where p = [ x y 1 ]. 

	@:c public static function CGPoint CGPointApplyAffineTransform(CGPoint point,
  CGAffineTransform t) CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

 Transform `size' by `t' and return the result:
     s' = s * t
   where s = [ width height 0 ]. 

	@:c public static function CGSize CGSizeApplyAffineTransform(CGSize size, CGAffineTransform t)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

 Transform `rect' by `t' and return the result. Since affine transforms do
   not preserve rectangles in general, this function returns the smallest
   rectangle which contains the transformed corner points of `rect'. If `t'
   consists solely of scales, flips and translations, then the returned
   rectangle coincides with the rectangle constructed from the four
   transformed corners. 

	@:c public static function CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform t)
  CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

** Definitions of inline functions. **

CG_INLINE CGAffineTransform
__CGAffineTransformMake(Float a, Float b, Float c, Float d,
  Float tx, Float ty)
{
  CGAffineTransform t;
  t.a = a; t.b = b; t.c = c; t.d = d; t.tx = tx; t.ty = ty;
  return t;
}
#define CGAffineTransformMake __CGAffineTransformMake

CG_INLINE CGPoint
__CGPointApplyAffineTransform(CGPoint point, CGAffineTransform t)
{
  CGPoint p;
  p.x = (Float)((double)t.a * point.x + (double)t.c * point.y + t.tx);
  p.y = (Float)((double)t.b * point.x + (double)t.d * point.y + t.ty);
  return p;
}
#define CGPointApplyAffineTransform __CGPointApplyAffineTransform

CG_INLINE CGSize
__CGSizeApplyAffineTransform(CGSize size, CGAffineTransform t)
{
  CGSize s;
  s.width = (Float)((double)t.a * size.width + (double)t.c * size.height);
  s.height = (Float)((double)t.b * size.width + (double)t.d * size.height);
  return s;
}
#define CGSizeApplyAffineTransform __CGSizeApplyAffineTransform

#endif  CGAFFINETRANSFORM_H_ 
*/