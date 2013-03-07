package objc.graphics;

import objc.graphics.CGContext;

typedef CGPatternRef = CGPattern;

/* kCGPatternTilingNoDistortion: The pattern cell is not distorted when
   painted, however the spacing between pattern cells may vary by as much as
   1 device pixel.

   kCGPatternTilingConstantSpacingMinimalDistortion: Pattern cells are
   spaced consistently, however the pattern cell may be distorted by as much
   as 1 device pixel when the pattern is painted.

   kCGPatternTilingConstantSpacing: Pattern cells are spaced consistently as
   with kCGPatternTilingConstantSpacingMinimalDistortion, however the
   pattern cell may be distorted additionally to permit a more efficient
   implementation. */

enum CGPatternTiling {
  kCGPatternTilingNoDistortion;
  kCGPatternTilingConstantSpacingMinimalDistortion;
  kCGPatternTilingConstantSpacing;
}

/* The drawing of the pattern is delegated to the callbacks. The callbacks
   may be called one or many times to draw the pattern.
    `version' is the version number of the structure passed in as a
      parameter to the CGPattern creation functions. The structure defined
      below is version 0.
    `drawPattern' should draw the pattern in the context `c'. `info' is the
      parameter originally passed to the CGPattern creation functions.
    `releaseInfo' is called when the pattern is deallocated. */

typedef CGPatternCallbacks = {
	 var version :Int;
	 var drawPattern :CGPatternDrawPatternCallback;
	 var releaseInfo :CGPatternReleaseInfoCallback;
}
typedef CGPatternDrawPatternCallback = Void->CGContextRef;
typedef CGPatternReleaseInfoCallback = Void->Void;
/*typedef void (*CGPatternDrawPatternCallback)(void *info, CGContextRef c);*/
/*typedef void (*CGPatternReleaseInfoCallback)(void *info);*/


class CGPattern {
	#if ddddddddd
/* Return the CFTypeID for CGPatternRefs. */

	@:c public static function CFTypeID CGPatternGetTypeID(void)
  CG_AVAILABLE_STARTING(__MAC_10_2, __IPHONE_2_0);

/* Create a pattern. */

	@:c public static function CGPatternRef CGPatternCreate(void *info, CGRect bounds,
  CGAffineTransform matrix, Float xStep, Float yStep,
  CGPatternTiling tiling, bool isColored, const CGPatternCallbacks *callbacks)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Equivalent to `CFRetain(pattern)', except it doesn't crash (as CF does)
   if `pattern' is NULL. */

	@:c public static function CGPatternRef CGPatternRetain(CGPatternRef pattern)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Equivalent to `CFRelease(pattern)', except it doesn't crash (as CF does)
   if `pattern' is NULL. */

	@:c public static function void CGPatternRelease(CGPatternRef pattern)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

#end
}
