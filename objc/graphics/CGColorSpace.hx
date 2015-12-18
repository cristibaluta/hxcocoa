package objc.graphics;


/* Color rendering intents. */

@:framework("CoreGraphics")
extern enum CGColorRenderingIntent {
  kCGRenderingIntentDefault;
  kCGRenderingIntentAbsoluteColorimetric;
  kCGRenderingIntentRelativeColorimetric;
  kCGRenderingIntentPerceptual;
  kCGRenderingIntentSaturation;
}

/* The model of a color space. */

@:framework("CoreGraphics")
extern enum CGColorSpaceModel {
  kCGColorSpaceModelUnknown;
  kCGColorSpaceModelMonochrome;
  kCGColorSpaceModelRGB;
  kCGColorSpaceModelCMYK;
  kCGColorSpaceModelLab;
  kCGColorSpaceModelDeviceN;
  kCGColorSpaceModelIndexed;
  kCGColorSpaceModelPattern;
}

@:framework("CoreGraphics")
extern enum CGColorSpaceGeneric {
  kCGColorSpaceGenericGray;
  kCGColorSpaceGenericRGB;
  kCGColorSpaceGenericCMYK;
  kCGColorSpaceGenericRGBLinear;
  kCGColorSpaceAdobeRGB1998;
  kCGColorSpaceSRGB;
  kCGColorSpaceGenericGrayGamma2_2;
}


@:framework("CoreGraphics")
extern class CGColorSpaceRef {
#if display

/* Create a DeviceGray color space. */

	@:c public static function CGColorSpaceCreateDeviceGray() :CGColorSpaceRef;

/* Create a DeviceRGB color space. */

	@:c public static function CGColorSpaceCreateDeviceRGB() :CGColorSpaceRef;

/* Create a DeviceCMYK color space. */

	@:c public static function CGColorSpaceCreateDeviceCMYK(void) :CGColorSpaceRef;

/* Create a calibrated gray color space. `whitePoint' is an array of 3
   numbers specifying the tristimulus value, in the CIE 1931 XYZ-space, of
   the diffuse white point. `blackPoint' is an array of 3 numbers specifying
   the tristimulus value, in CIE 1931 XYZ-space, of the diffuse black point.
   `gamma' defines the gamma for the gray component. */

	@:c public static function CGColorSpaceCreateCalibratedGray(const:Float
  whitePoint[3], const Float blackPoint[3], gamma:Float) :CGColorSpaceRef;

/* Create a calibrated RGB color space. `whitePoint' is an array of 3
   numbers specifying the tristimulus value, in the CIE 1931 XYZ-space, of
   the diffuse white point. `blackPoint' is an array of 3 numbers specifying
   the tristimulus value, in CIE 1931 XYZ-space, of the diffuse black point.
   `gamma' is an array of 3 numbers specifying the gamma for the red, green,
   and blue components of the color space. `matrix' is an array of 9 numbers
   specifying the linear interpretation of the gamma-modified RGB values of
   the color space with respect to the final XYZ representation. */

	@:c public static function CGColorSpaceRef CGColorSpaceCreateCalibratedRGB(const Float
  whitePoint[3], const Float blackPoint[3], const Float gamma[3],
  const Float matrix[9]) CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);
    
/* Create an L*a*b* color space. `whitePoint' is an array of 3 numbers
   specifying the tristimulus value, in the CIE 1931 XYZ-space, of the
   diffuse white point. `blackPoint' is an array of 3 numbers specifying the
   tristimulus value, in CIE 1931 XYZ-space, of the diffuse black point.
   `range' is an array of four numbers specifying the range of valid values
   for the a* and b* components of the color space. */

	@:c public static function CGColorSpaceRef CGColorSpaceCreateLab(const Float whitePoint[3],
  const Float blackPoint[3], const Float range[4])
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Create an ICC-based color space using the ICC profile specified by
   `data'. */

	@:c public static function CGColorSpaceRef CGColorSpaceCreateWithICCProfile(CFDataRef data)
  CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_2_0);

/* Create an ICC-based color space. `nComponents' specifies the number of
   color components in the color space defined by the ICC profile data. This
   must match the number of components actually in the ICC profile, and must
   be 1, 3, or 4. `range' is an array of 2*nComponents numbers specifying
   the minimum and maximum valid values of the corresponding color
   components, so that for color component k, range[2*k] <= c[k] <=
   range[2*k+1], where c[k] is the k'th color component. `profile' is a data
   provider specifying the ICC profile. `alternate' specifies an alternate
   color space to be used in case the ICC profile is not supported. It must
   have `nComponents' color components. If `alternate' is NULL, then the
   color space used will be DeviceGray, DeviceRGB, or DeviceCMYK, depending
   on whether `nComponents' is 1, 3, or 4, respectively. */

	@:c public static function CGColorSpaceRef CGColorSpaceCreateICCBased(size_t nComponents,
  const Float *range, CGDataProviderRef profile, CGColorSpaceRef alternate)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Create an indexed color space. A sample value in an indexed color space
   is treated as an index into the color table of the color space. `base'
   specifies the base color space in which the values in the color table are
   to be interpreted. `lastIndex' is an integer which specifies the maximum
   valid index value; it must be less than or equal to 255. `colorTable' is
   an array of m * (lastIndex + 1) bytes, where m is the number of color
   components in the base color space. Each byte is an unsigned integer in
   the range 0 to 255 that is scaled to the range of the corresponding color
   component in the base color space. */

	@:c public static function CGColorSpaceRef CGColorSpaceCreateIndexed(CGColorSpaceRef baseSpace,
  size_t lastIndex, const unsigned char *colorTable)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Create a pattern color space. `baseSpace' is the underlying color space
   of the pattern color space. For colored patterns, `baseSpace' should be
   NULL; for uncolored patterns, `baseSpace' specifies the color space of
   colors which will be painted through the pattern. */

	@:c public static function CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Create a color space using `ref', a platform-specific color space
   reference. For MacOS X, `ref' should be a CMProfileRef. */

	@:c public static function CGColorSpaceRef
  CGColorSpaceCreateWithPlatformColorSpace(const void *ref)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_NA);

/* Create a color space using `name' as the identifier for the color
   space. */

	@:c public static function CGColorSpaceCreateWithName(CFStringRef name) :CGColorSpaceRef;

/* Equivalent to `CFRetain(space)', except it doesn't crash (as CFRetain
   does) if `space' is NULL. */

	@:c public static function CGColorSpaceRetain(space:CGColorSpaceRef) :CGColorSpaceRef;

/* Equivalent to `CFRelease(space)', except it doesn't crash (as CFRelease
   does) if `space' is NULL. */

	@:c public static function CGColorSpaceRelease(space:CGColorSpaceRef) :Void;

/* Return the name used to create the color space `space', or NULL if the
   color space was not created using `CGColorSpaceCreateWithName'. */

	@:c public static function CGColorSpaceCopyName(space:CGColorSpaceRef) :CFStringRef;

/* Return the CFTypeID for CGColorSpaces. */

	@:c public static function CGColorSpaceGetTypeID() :CFTypeID;

/* Return the number of color components in the color space `space'. */

	@:c public static function CGColorSpaceGetNumberOfComponents(space:CGColorSpaceRef) :Int;

/* Return the color space model of `space'. */

	@:c public static function CGColorSpaceGetModel (space:CGColorSpaceRef) :CGColorSpaceModel;

/* Return the base color space of `space' if `space' is a pattern or indexed
   color space; otherwise, return NULL. To determine whether a color space
   is an indexed or pattern color space, use `CGColorSpaceGetModel'. */

	@:c public static function CGColorSpaceGetBaseColorSpace (space:CGColorSpaceRef) :CGColorSpaceRef;

/* Return the number of entries in the color table of `space' if `space' is
   an indexed color space; otherwise, return 0. To determine whether a color
   space is an indexed color space, use `CGColorSpaceGetModel'. */

	@:c public static function CGColorSpaceGetColorTableCount(space:CGColorSpaceRef) :Int;

/* Copy the entries in the color table of `space' to `table' if `space' is
   an indexed color space; otherwise, do nothing. The array pointed to by
   `table' should be at least as large as the number of entries in the color
   table; the returned data is in the same format as that passed to
   `CGColorSpaceCreateIndexed'. To determine whether a color space is an
   indexed color space, use `CGColorSpaceGetModel'. */

	@:c public static function CGColorSpaceGetColorTable(space:CGColorSpaceRef, uint8_t *table) :Void;

/* Return a copy of the ICC profile of `space', or NULL if the color space
   doesn't have an ICC profile. */

	@:c public static function CGColorSpaceCopyICCProfile(space:CGColorSpaceRef) :CFDataRef;

#end
}
