package objc.graphics;


/* Points. */

@:framework("CoreGraphics")
extern class CGPoint {
	public var x :Float;
	public var y :Float;
	public function new (x:Float=0.0, y:Float=0.0) :Void;
}


/* Sizes. */

@:framework("CoreGraphics")
extern class CGSize {
	public var width :Float;
	public var height :Float;
	public function new (w:Float, h:Float) :Void;
}


/* Rectangles. */

@:framework("CoreGraphics")
extern class CGRect {
	public var origin :CGPoint;
	public var size :CGSize;
	public function new (x:Float, y:Float, w:Float, h:Float) :Void;
}


/* Rectangle edges. */

extern enum CGRectEdge {
	CGRectMinXEdge; CGRectMinYEdge; CGRectMaxXEdge; CGRectMaxYEdge;
}

@:framework("CoreGraphics")
extern class CGGeometry {

/* The "zero" point -- equivalent to CGPointMake(0, 0). */ 

	public static var CGPointZero :CGPoint;

/* The "zero" size -- equivalent to CGSizeMake(0, 0). */ 

	public static var CGSizeZero :CGSize;

/* The "zero" rectangle -- equivalent to CGRectMake(0, 0, 0, 0). */ 

	public static var CGRectZero :CGRect;

/* The "empty" rect. This is the rectangle returned when, for example, we
   intersect two disjoint rectangles. Note that the null rect is not the
   same as the zero rect. */

	public static var CGRectNull :CGRect;

/* The infinite rectangle. */

	public static var CGRectInfinite :CGRect;

/* Make a point from `(x, y)'. */

	@:c public static function CGPointMake(x:Float, y:Float) :CGPoint;

/* Make a size from `(width, height)'. */

	@:c public static function CGSizeMake(width:Float, height:Float) :CGSize;

/* Make a rect from `(x, y; width, height)'. */

	@:c public static function CGRectMake(x:Float, y:Float, width:Float, height:Float) :CGRect;

/* Return the leftmost x-value of `rect'. */

	@:c public static function CGRectGetMinX(rect:CGRect) :Float;

/* Return the midpoint x-value of `rect'. */

	@:c public static function CGRectGetMidX(rect:CGRect) :Float;

/* Return the rightmost x-value of `rect'. */

	@:c public static function CGRectGetMaxX(rect:CGRect) :Float;

/* Return the bottommost y-value of `rect'. */

	@:c public static function CGRectGetMinY(rect:CGRect) :Float;

/* Return the midpoint y-value of `rect'. */

	@:c public static function CGRectGetMidY(rect:CGRect) :Float;

/* Return the topmost y-value of `rect'. */

	@:c public static function CGRectGetMaxY(rect:CGRect) :Float;

/* Return the width of `rect'. */

	@:c public static function CGRectGetWidth(rect:CGRect) :Float;

/* Return the height of `rect'. */

	@:c public static function CGRectGetHeight(rect:CGRect) :Float;

/* Return true if `point1' and `point2' are the same, false otherwise. */

	@:c public static function CGPointEqualToPoint(point1:CGPoint, point2:CGPoint) :Bool;

/* Return true if `size1' and `size2' are the same, false otherwise. */

	@:c public static function CGSizeEqualToSize(size1:CGSize, size2:CGSize) :Bool;

/* Return true if `rect1' and `rect2' are the same, false otherwise. */

	@:c public static function CGRectEqualToRect(rect1:CGRect, rect2:CGRect) :Bool;

/* Standardize `rect' -- i.e., convert it to an equivalent rect which has
   positive width and height. */

	@:c public static function CGRectStandardize(rect:CGRect) :CGRect;

/* Return true if `rect' is empty (that is, if it has zero width or height),
   false otherwise. A null rect is defined to be empty. */

	@:c public static function CGRectIsEmpty(rect:CGRect) :Bool;

/* Return true if `rect' is the null rectangle, false otherwise. */

	@:c public static function CGRectIsNull(rect:CGRect) :Bool;

/* Return true if `rect' is the infinite rectangle, false otherwise. */

	@:c public static function CGRectIsInfinite(rect:CGRect) :Bool;

/* Inset `rect' by `(dx, dy)' -- i.e., offset its origin by `(dx, dy)', and
   decrease its size by `(2*dx, 2*dy)'. */

	@:c public static function CGRectInset(rect:CGRect, dx:Float, dy:Float) :CGRect;

/* Expand `rect' to the smallest rect containing it with integral origin and
   size. */

	@:c public static function CGRectIntegral(rect:CGRect) :CGRect;

/* Return the union of `r1' and `r2'. */

	@:c public static function CGRectUnion(r1:CGRect, r2:CGRect) :CGRect;

/* Return the intersection of `r1' and `r2'. This may return a null rect. */

	@:c public static function CGRectIntersection(r1:CGRect, r2:CGRect) :CGRect;

/* Offset `rect' by `(dx, dy)'. */

	@:c public static function CGRectOffset(rect:CGRect, dx:Float, dy:Float) :CGRect;

/* Make two new rectangles, `slice' and `remainder', by dividing `rect' with
   a line that's parallel to one of its sides, specified by `edge' -- either
   `CGRectMinXEdge', `CGRectMinYEdge', `CGRectMaxXEdge', or
   `CGRectMaxYEdge'. The size of `slice' is determined by `amount', which
   measures the distance from the specified edge. */

/*	   	@:c public static function void CGRectDivide(rect:CGRect, CGRect *slice, CGRect *remainder, Float amount, CGRectEdge edge)*/

/* Return true if `point' is contained in `rect', false otherwise. */

	@:c public static function CGRectContainsPoint(rect:CGRect, point:CGPoint) :Bool;

/* Return true if `rect2' is contained in `rect1', false otherwise. `rect2'
   is contained in `rect1' if the union of `rect1' and `rect2' is equal to
   `rect1'. */

	@:c public static function CGRectContainsRect(rect1:CGRect, rect2:CGRect) :Bool;

/* Return true if `rect1' intersects `rect2', false otherwise. `rect1'
   intersects `rect2' if the intersection of `rect1' and `rect2' is not the
   null rect. */

	@:c public static function CGRectIntersectsRect(rect1:CGRect, rect2:CGRect) :Bool;

/*** Persistent representations. ***/

/* Return a dictionary representation of `point'. */

/*	@:c public static function CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)*/

/* Make a CGPoint from the contents of `dict' (presumably returned earlier
   from `CGPointCreateDictionaryRepresentation') and store the value in
   `point'. Returns true on success; false otherwise. */

	//@:c public static function CGPointMakeWithDictionaryRepresentation(dict:CFDictionaryRef, point:CGPoint) :Bool;

/* Return a dictionary representation of `size'. */

/*	@:c public static function CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)*/

/* Make a CGSize from the contents of `dict' (presumably returned earlier
   from `CGSizeCreateDictionaryRepresentation') and store the value in
   `size'. Returns true on success; false otherwise. */

	//@:c public static function CGSizeMakeWithDictionaryRepresentation(dict:CFDictionaryRef, size:CGSize) :Bool;

/* Return a dictionary representation of `rect'. */

/*	@:c public static function CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect)*/

/* Make a CGRect from the contents of `dict' (presumably returned earlier
   from `CGRectCreateDictionaryRepresentation') and store the value in
   `rect'. Returns true on success; false otherwise. */

	//@:c public static function CGRectMakeWithDictionaryRepresentation(dict:CFDictionaryRef, rect:CGRect) :Bool;

/*** Definitions of inline functions. ***/

/*CG_INLINE CGPoint
CGPointMake(Float x, Float y)
{
  CGPoint p; p.x = x; p.y = y; return p;
}

CG_INLINE CGSize
CGSizeMake(Float width, Float height)
{
  CGSize size; size.width = width; size.height = height; return size;
}

CG_INLINE CGRect
CGRectMake(Float x, Float y, Float width, Float height)
{
  rect:CGRect;
  rect.origin.x = x; rect.origin.y = y;
  rect.size.width = width; rect.size.height = height;
  return rect;
}

CG_INLINE bool
__CGPointEqualToPoint(CGPoint point1, CGPoint point2)
{
  return point1.x == point2.x && point1.y == point2.y;
}
#define CGPointEqualToPoint __CGPointEqualToPoint

CG_INLINE bool
__CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return size1.width == size2.width && size1.height == size2.height;
}
#define CGSizeEqualToSize __CGSizeEqualToSize*/

}
