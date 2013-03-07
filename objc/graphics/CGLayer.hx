package objc.graphics;

typedef CGLayerRef = CGLayer;

@:framework("CoreGraphics")
extern class CGLayer {
/* Create a layer of size `size' relative to the context `context'. The
   value of `size' is specified in default user space (base space) units.
   The parameter `auxiliaryInfo' should be NULL; it is reserved for future
   expansion. */

	@:c public static function CGLayerCreateWithContext(context:CGContextRef, size:CGSize, auxiliaryInfo:CFDictionaryRef) :CGLayerRef;

/* Equivalent to `CFRetain(layer)', except it doesn't crash (as CFRetain
   does) if `layer' is NULL. */

	@:c public static function CGLayerRetain(layer:CGLayerRef) :CGLayerRef;

/* Equivalent to `CFRelease(layer)', except it doesn't crash (as CFRelease
   does) if `layer' is NULL. */

	@:c public static function CGLayerRelease(layer:CGLayerRef) :Void;

/* Return the size of the layer `layer'. */

	@:c public static function CGLayerGetSize(layer:CGLayerRef) :CGSize;

/* Return the context of `layer'. */

	@:c public static function CGLayerGetContext(layer:CGLayerRef) :CGContextRef;

/* Draw the contents of `layer' into `rect' of `context'. The contents are
   scaled, if necessary, to fit into `rect'; the rectangle `rect' is in user
   space. */

	@:c public static function CGContextDrawLayerInRect(CGContextRef context, CGRect rect, layer:CGLayerRef) :Void;

/* Draw the contents of `layer' at `point' in `context'. This is equivalent
   to calling "CGContextDrawLayerInRect" with a rectangle having origin at
   `point' and size equal to the size of `layer'. */

	@:c public static function CGContextDrawLayerAtPoint(CGContextRef context, CGPoint point, layer:CGLayerRef) :Void;

/* Return the CFTypeID for CGLayerRefs. */

	@:c public static function CGLayerGetTypeID() :CFTypeID;

}
