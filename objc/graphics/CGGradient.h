package objc.graphics;


typedef struct CGGradient *CGGradientRef;

#include <stdint.h>

enum {
  kCGGradientDrawsBeforeStartLocation = (1 << 0),
  kCGGradientDrawsAfterEndLocation = (1 << 1)
};
typedef uint32_t CGGradientDrawingOptions;

#include <CoreGraphics/CGBase.h>
#include <CoreGraphics/CGColorSpace.h>
#include <CoreGraphics/CGContext.h>

/* A CGGradient defines a transition between colors. The transition is
   defined over a range from 0 to 1 inclusive. A gradient specifies a color
   at location 0, one at location 1, and possibly additional colors assigned
   to locations between 0 and 1.

   A CGGradient has a color space. When a gradient is created, all colors
   specified are converted to that color space, and interpolation of colors
   occurs using the components of that color space. See the documentation of
   each creation function for more details. */

/* Return the CFTypeID for CGGradients. */

	@:c public static function CFTypeID CGGradientGetTypeID(void)
  CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);

/* Creates a gradient by pairing the color components provided in
   `components' with locations provided in `locations'. If `locations' is
   NULL, the first color in `colors' will be at location 0, the last color
   in `colors' will be at location 1, and intervening colors will be at
   equal intervals in between. Otherwise, each location in `locations'
   should be a Float between 0 and 1. Each set of color components should
   specify a color in the color space `space' (which may not be a pattern or
   indexed color space). The number of locations is specified by `count';
   the number of color components is the product of `count' and the number
   of color components of `space'. If no color is provided for 0 or 1, the
   gradient will use the color provided at the locations closest to 0 and 1
   for those values. */

	@:c public static function CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef
  space, const Float components[], const Float locations[], size_t count)
  CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);

/* Creates a gradient by pairing the colors provided in `colors' with the
   locations provided in `locations'. `colors' should be a non-empty array
   of CGColor objects. The colors may be in any color space other than a
   pattern or indexed color space. If `space' is non-NULL, each color will
   be converted to that color space and the gradient will drawn in that
   space; otherwise, each color will be converted to and drawn in the
   "Generic" RGB color space. If `space' is specified, it may not be a
   pattern or indexed color space. If `locations' is NULL, the first color
   in `colors' will be at location 0, the last color in `colors' will be at
   location 1, and intervening colors will be at equal intervals in between.
   Otherwise, each location in `locations' should be a Float between 0 and
   1; the array of locations should should contain the same number of items
   as `colors'. If no color is provided for 0 or 1, the gradient will use
   the color provided at the locations closest to 0 and 1 for those
   values. */

	@:c public static function CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space,
  CFArrayRef colors, const Float locations[])
  CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);

/* Equivalent to `CFRetain' except that it doesn't crash (as `CFRetain'
   does) if `gradient' is NULL. */

	@:c public static function CGGradientRef CGGradientRetain(CGGradientRef gradient)
  CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);

/* Equivalent to `CFRelease' except that it doesn't crash (as `CFRelease'
   does) if `gradient' is NULL. */

	@:c public static function void CGGradientRelease(CGGradientRef gradient)
  CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);

#endif /* CGGRADIENT_H_ */
