package objc.graphics;


/* The callback for releasing the data supplied to
   `CGBitmapContextCreateWithData'. */

typedef void (*CGBitmapContextReleaseDataCallback)(void *releaseInfo,
  void *data);


@:framework("CoreGraphics")
extern class CGBitmapContext {
	  
/* Create a bitmap context. The context draws into a bitmap which is `width'
   pixels wide and `height' pixels high. The number of components for each
   pixel is specified by `space', which may also specify a destination color
   profile. The number of bits for each component of a pixel is specified by
   `bitsPerComponent'. The number of bytes per pixel is equal to
   `(bitsPerComponent * number of components + 7)/8'. Each row of the bitmap
   consists of `bytesPerRow' bytes, which must be at least `width * bytes
   per pixel' bytes; in addition, `bytesPerRow' must be an integer multiple
   of the number of bytes per pixel. `data', if non-NULL, points to a block
   of memory at least `bytesPerRow * height' bytes. If `data' is NULL, the
   context will allocate the data itself; this data will be freed when the
   context is deallocated. `bitmapInfo' specifies whether the bitmap should
   contain an alpha channel and how it's to be generated, along with whether
   the components are floating-point or integer. If `releaseCallback' is
   non-NULL, it is called when the context is freed with `releaseInfo' and
   `data' as arguments. */

	@:c public static function CGBitmapContextCreateWithData(void *data, size_t width,
  size_t height, size_t bitsPerComponent, size_t bytesPerRow,
  CGColorSpaceRef space, CGBitmapInfo bitmapInfo,
  CGBitmapContextReleaseDataCallback releaseCallback, void *releaseInfo) :CGContextRef;

/* Create a bitmap context. The context draws into a bitmap which is `width'
   pixels wide and `height' pixels high. The number of components for each
   pixel is specified by `space', which may also specify a destination color
   profile. The number of bits for each component of a pixel is specified by
   `bitsPerComponent'. The number of bytes per pixel is equal to
   `(bitsPerComponent * number of components + 7)/8'. Each row of the bitmap
   consists of `bytesPerRow' bytes, which must be at least `width * bytes
   per pixel' bytes; in addition, `bytesPerRow' must be an integer multiple
   of the number of bytes per pixel. `data', if non-NULL, points to a block
   of memory at least `bytesPerRow * height' bytes. If `data' is NULL, the
   data for context is allocated automatically and freed when the context is
   deallocated. `bitmapInfo' specifies whether the bitmap should contain an
   alpha channel and how it's to be generated, along with whether the
   components are floating-point or integer. */

	@:c public static function CGBitmapContextCreate(void *data, size_t width,
  size_t height, size_t bitsPerComponent, size_t bytesPerRow,
  CGColorSpaceRef space, CGBitmapInfo bitmapInfo)
  CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Return the data associated with the bitmap context `context', or NULL if
   `context' is not a bitmap context. */

	@:c public static function CGBitmapContextGetData(context:CGContextRef) :Void;

/* Return the width of the bitmap context `context', or 0 if `context' is
   not a bitmap context. */

	@:c public static function CGBitmapContextGetWidth(context:CGContextRef) :size_t;

/* Return the height of the bitmap context `context', or 0 if `context' is
   not a bitmap context. */

	@:c public static function CGBitmapContextGetHeight(context:CGContextRef) :size_t;

/* Return the bits per component of the bitmap context `context', or 0 if
   `context' is not a bitmap context. */

	@:c public static function CGBitmapContextGetBitsPerComponent(context:CGContextRef) :size_t;

/* Return the bits per pixel of the bitmap context `context', or 0 if
   `context' is not a bitmap context. */

	@:c public static function CGBitmapContextGetBitsPerPixel(context:CGContextRef) :size_t;

/* Return the bytes per row of the bitmap context `context', or 0 if
   `context' is not a bitmap context. */

	@:c public static function CGBitmapContextGetBytesPerRow(context:CGContextRef) :size_t;

/* Return the color space of the bitmap context `context', or NULL if
   `context' is not a bitmap context. */

	@:c public static function CGBitmapContextGetColorSpace(context:CGContextRef) :CGColorSpaceRef;

/* Return the alpha info of the bitmap context `context', or
   "kCGImageAlphaNone" if `context' is not a bitmap context. */

	@:c public static function CGBitmapContextGetAlphaInfo(context:CGContextRef) :CGImageAlphaInfo;

/* Return the bitmap info of the bitmap context `context', or 0 if `context'
   is not a bitmap context. */

	@:c public static function CGBitmapContextGetBitmapInfo(context:CGContextRef) :CGBitmapInfo;

/* Return an image containing a snapshot of the bitmap context `context'. If
   context is not a bitmap context, or if the image cannot be created for
   any reason, this function returns NULL. This is a "copy" operation ---
   subsequent changes to context will not affect the contents of the
   returned image.

   Note that in some cases the copy will actually follow "copy-on-write"
   semantics, so that the actual physical copy of the bits will only occur
   if the underlying data in the bitmap context is modified. As a
   consequence, you may wish to use the resulting image and release it
   before performing more drawing into the bitmap context; in this way, the
   actual physical copy of the data may be avoided. */

	@:c public static function CGBitmapContextCreateImage(context:CGContextRef) :CGImageRef;

}