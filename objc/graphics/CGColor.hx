package objc.graphics;


typedef CGColorRef = CGColor;

@:framework("CoreGraphics")
class CGColor {
#if dddddddd
/* Create a color in the color space `space' with color components
   (including alpha) specified by `components'. `space' may be any color
   space except a pattern color space. */

	@:c public static function CGColorRef CGColorCreate(CGColorSpaceRef space,
  const Float components[]) CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Create a color in the "Generic" gray color space. */

	@:c public static function CGColorRef CGColorCreateGenericGray(Float gray, Float alpha)
  CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/* Create a color in the "Generic" RGB color space. */

	@:c public static function CGColorRef CGColorCreateGenericRGB(Float red, Float green,
  Float blue, Float alpha) CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/* Create a color in the "Generic" CMYK color space. */

	@:c public static function CGColorRef CGColorCreateGenericCMYK(Float cyan, Float magenta,
  Float yellow, Float black, Float alpha)
  CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/* Return a constant color. As `CGColorGetConstantColor' is not a "Copy" or
   "Create" function, it does not necessarily return a new reference each
   time it's called. As a consequence, you should not release the returned
   value. However, colors returned from `CGColorGetConstantColor' can be
   retained and released in a properly nested fashion, just like any other
   CF type. */

	@:c public static function CGColorRef CGColorGetConstantColor(CFStringRef colorName)
  CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/* Create a color in color space `space' with pattern `pattern' and
   components `components'. `space' must be a pattern color space. */

	@:c public static function CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space,
  CGPatternRef pattern, const Float components[])
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Create a copy of `color'. */

	@:c public static function CGColorRef CGColorCreateCopy(CGColorRef color)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Create a copy of `color' with alpha set to `alpha'. */

	@:c public static function CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color,
  Float alpha) CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Equivalent to `CFRetain(color)', except it doesn't crash (as CFRetain
   does) if `color' is NULL. */

	@:c public static function CGColorRef CGColorRetain(CGColorRef color)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Equivalent to `CFRelease(color)', except it doesn't crash (as CFRelease
   does) if `color' is NULL. */

	@:c public static function void CGColorRelease(CGColorRef color)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return true if `color1' is equal to `color2'; false otherwise. */

	@:c public static function bool CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the number of color components (including alpha) associated with
   `color'. */

	@:c public static function size_t CGColorGetNumberOfComponents(CGColorRef color)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the color components (including alpha) associated with `color'. */

	@:c public static function const Float *CGColorGetComponents(CGColorRef color)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the alpha component associated with `color'. */

	@:c public static function Float CGColorGetAlpha(CGColorRef color)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the color space associated with `color'. */

	@:c public static function CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the pattern associated with `color', if it's a color in a pattern
   color space; NULL otherwise. */

	@:c public static function CGPatternRef CGColorGetPattern(CGColorRef color)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the CFTypeID for CGColors. */

	@:c public static function CFTypeID CGColorGetTypeID(void)
  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/*** Names of colors for use with `CGColorGetConstantColor'. ***/

/* Colors in the "Generic" gray color space. */

	@:c public static function const CFStringRef kCGColorWhite
  CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

	@:c public static function const CFStringRef kCGColorBlack
  CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

	@:c public static function const CFStringRef kCGColorClear
  CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

#end
}
