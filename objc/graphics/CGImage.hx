package objc.graphics;

typedef CGImageRef = CGImage;

extern enum CGImageAlphaInfo {
    kCGImageAlphaNone;               /* For example, RGB. */
    kCGImageAlphaPremultipliedLast;  /* For example, premultiplied RGBA */
    kCGImageAlphaPremultipliedFirst; /* For example, premultiplied ARGB */
    kCGImageAlphaLast;               /* For example, non-premultiplied RGBA */
    kCGImageAlphaFirst;              /* For example, non-premultiplied ARGB */
    kCGImageAlphaNoneSkipLast;       /* For example, RBGX. */
    kCGImageAlphaNoneSkipFirst;      /* For example, XRGB. */
    kCGImageAlphaOnly;                /* No color data, alpha data only */
}

extern enum CGBitmapInfo {
    kCGBitmapAlphaInfoMask;
    kCGBitmapFloatComponents;
    
    kCGBitmapByteOrderMask;
    kCGBitmapByteOrderDefault;
    kCGBitmapByteOrder16Little;
    kCGBitmapByteOrder32Little;
    kCGBitmapByteOrder16Big;
    kCGBitmapByteOrder32Big;
}


@:framework("CoreGraphics")
extern class CGImage {
/* Return the CFTypeID for CGImageRefs. */
#if dddddddd
	@:c public static function CGImageGetTypeID() :CFTypeID;

/* Create an image. */

	@:c public static function CGImageCreate(size_t width, size_t height,
    size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow,
    CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider,
    const Float decode[], bool shouldInterpolate,
    CGColorRenderingIntent intent) :CGImageRef;

/* Create an image mask. */

	@:c public static function CGImageMaskCreate(size_t width, size_t height,
    size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow,
    CGDataProviderRef provider, const Float decode[], bool shouldInterpolate) :CGImageRef;

/* Return a copy of `image'. Only the image structure itself is copied; the
   underlying data is not. */

	@:c public static function CGImageCreateCopy(image:CGImageRef) :CGImageRef;

/* Create an image from `source', a data provider of JPEG-encoded data. */

	@:c public static function CGImageCreateWithJPEGDataProvider(CGDataProviderRef
    source, const Float decode[], bool shouldInterpolate,
    CGColorRenderingIntent intent) :CGImageRef;

/* Create an image using `source', a data provider for PNG-encoded data. */

	@:c public static function CGImageCreateWithPNGDataProvider(source:CGDataProviderRef,
    const Float decode[], shouldInterpolate:Bool, intent:CGColorRenderingIntent) :CGImageRef;

/* Create an image using the data contained within the subrectangle `rect'
   of `image'.

   The new image is created by
     1) adjusting `rect' to integral bounds by calling "CGRectIntegral";
     2) intersecting the result with a rectangle with origin (0, 0) and size
        equal to the size of `image';
     3) referencing the pixels within the resulting rectangle, treating the
        first pixel of the image data as the origin of the image.
   If the resulting rectangle is the null rectangle, this function returns
   NULL.

   If W and H are the width and height of image, respectively, then the
   point (0,0) corresponds to the first pixel of the image data; the point
   (W-1, 0) is the last pixel of the first row of the image data; (0, H-1)
   is the first pixel of the last row of the image data; and (W-1, H-1) is
   the last pixel of the last row of the image data.

   The resulting image retains a reference to the original image, so you may
   release the original image after calling this function. */

	@:c public static function CGImageCreateWithImageInRect(image:CGImageRef, rect:CGRect) :CGImageRef;

/* Create a new image from `image' masked by `mask', which may be an image
   mask or an image.

   If `mask' is an image mask, then it indicates which parts of the context
   are to be painted with the image when drawn in a context, and which are
   to be masked out (left unchanged). The source samples of the image mask
   determine which areas are painted, acting as an "inverse alpha": if the
   value of a source sample in the image mask is S, then the corresponding
   region in `image' is blended with the destination using an alpha of
   (1-S). (For example, if S is 1, then the region is not painted, while if
   S is 0, the region is fully painted.)

   If `mask' is an image, then it serves as alpha mask for blending the
   image onto the destination. The source samples of `mask' determine which
   areas are painted: if the value of the source sample in mask is S, then
   the corresponding region in image is blended with the destination with an
   alpha of S. (For example, if S is 0, then the region is not painted,
   while if S is 1, the region is fully painted.)

   The parameter `image' may not be an image mask and may not have an image
   mask or masking color associated with it.
  
   If `mask' is an image, then it must be in the DeviceGray color space, may
   not have alpha, and may not itself be masked by an image mask or a
   masking color. */

	@:c public static function CGImageCreateWithMask(image:CGImageRef, mask:CGImageRef) :CGImageRef;

/* Create a new image from `image' masked by `components', an array of 2N
   values { min[1], max[1], ... min[N], max[N] } where N is the number of
   components in color space of `image'. Any image sample with color value
   {c[1], ... c[N]} where min[i] <= c[i] <= max[i] for 1 <= i <= N is masked
   out (that is, not painted).

   Each value in `components' must be a valid image sample value: if `image'
   has integral pixel components, then each value of must be in the range
   [0..2**bitsPerComponent - 1] (where `bitsPerComponent' is the number of
   bits/component of `image'); if `image' has floating-point pixel
   components, then each value may be any floating-point number which is a
   valid color component.

   The parameter `image' may not be an image mask, and may not already have
   an image mask or masking color associated with it. */

	@:c public static function CGImageCreateWithMaskingColors(image:CGImageRef, components:Array<Float>) :CGImageRef;

/* Create a copy of `image', replacing the image's color space with `space'.
   Returns NULL if `image' is an image mask, or if the number of components
   of `space' isn't the same as the number of components of the color space
   of `image'. */

	@:c public static function CGImageCreateCopyWithColorSpace(image:CGImageRef, space:CGColorSpaceRef) :CGImageRef;

/* Equivalent to `CFRetain(image)'. */

	@:c public static function CGImageRetain(image:CGImageRef) :CGImageRef;

/* Equivalent to `CFRelease(image)'. */

	@:c public static function CGImageRelease(image:CGImageRef) :Void;

/* Return true if `image' is an image mask, false otherwise. */

	@:c public static function CGImageIsMask(image:CGImageRef) :Bool;

/* Return the width of `image'. */

	@:c public static function CGImageGetWidth(image:CGImageRef) :size_t;

/* Return the height of `image'. */

	@:c public static function CGImageGetHeight(image:CGImageRef) :size_t;

/* Return the number of bits/component of `image'. */

	@:c public static function CGImageGetBitsPerComponent(image:CGImageRef) :size_t;

/* Return the number of bits/pixel of `image'. */

	@:c public static function CGImageGetBitsPerPixel(image:CGImageRef) :size_t;

/* Return the number of bytes/row of `image'. */

	@:c public static function CGImageGetBytesPerRow(image:CGImageRef) :size_t;

/* Return the color space of `image', or NULL if `image' is an image
   mask. */

	@:c public static function CGImageGetColorSpace(image:CGImageRef) :CGColorSpaceRef;

/* Return the alpha info of `image'. */

	@:c public static function CGImageGetAlphaInfo(image:CGImageRef) :CGImageAlphaInfo;

/* Return the data provider of `image'. */

	@:c public static function CGImageGetDataProvider(image:CGImageRef) :CGDataProviderRef;

/* Return the decode array of `image'. */

	@:c public static function CGImageGetDecode(image:CGImageRef) :Array<Float>;

/* Return the interpolation parameter of `image'. */

	@:c public static function CGImageGetShouldInterpolate(image:CGImageRef) :Bool;

/* Return the rendering intent of `image'. */

	@:c public static function CGImageGetRenderingIntent(image:CGImageRef) :CGColorRenderingIntent;

/* Return the bitmap info of `image'. */

	@:c public static function CGImageGetBitmapInfo(image:CGImageRef) :CGBitmapInfo;
	#end
}
