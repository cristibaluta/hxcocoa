package objc.graphics;

import objc.graphics.CGPath;
import objc.graphics.CGGeometry;
import objc.graphics.CGImage;
import objc.graphics.CGColor;
import objc.graphics.CGColorSpace;
import objc.graphics.CGPattern;

typedef CGContextRef = CGContext;


/* Drawing modes for paths. */

extern enum CGPathDrawingMode {
    kCGPathFill;
    kCGPathEOFill;
    kCGPathStroke;
    kCGPathFillStroke;
    kCGPathEOFillStroke;
}

/* Drawing modes for text. */

extern enum CGTextDrawingMode {
    kCGTextFill;
    kCGTextStroke;
    kCGTextFillStroke;
    kCGTextInvisible;
    kCGTextFillClip;
    kCGTextStrokeClip;
    kCGTextFillStrokeClip;
    kCGTextClip;
}

/* Text encodings. */

extern enum CGTextEncoding {
    kCGEncodingFontSpecific;
    kCGEncodingMacRoman;
}

/* Interpolation quality. */

extern enum CGInterpolationQuality {
    kCGInterpolationDefault;	/* Let the context decide. */
    kCGInterpolationNone;		/* Never interpolate. */
    kCGInterpolationLow;		/* Low quality, fast interpolation. */
    kCGInterpolationMedium;		/* Medium quality, slower than kCGInterpolationLow. */
    kCGInterpolationHigh;		/* Highest quality, slower than kCGInterpolationMedium. */
}

/* Blend modes.

   The blend modes from kCGBlendModeNormal to kCGBlendModeLuminosity are
   supported in Mac OS X 10.4 and later. The Porter-Duff blend modes (from
   kCGBlendModeClear to kCGBlendModePlusLighter) are supported in Mac OS X
   10.5 and later. The names of the Porter-Duff blend modes are historical.

   Note that the Porter-Duff blend modes are not necessarily supported in
   every context. In particular, they are only guaranteed to work in
   bitmap-based contexts, such as those created by CGBitmapContextCreate. It
   is your responsibility to make sure that they do what you want when you
   use them in a CGContext. */

extern enum CGBlendMode {
    /* Available in Mac OS X 10.4 & later. */
    kCGBlendModeNormal;
    kCGBlendModeMultiply;
    kCGBlendModeScreen;
    kCGBlendModeOverlay;
    kCGBlendModeDarken;
    kCGBlendModeLighten;
    kCGBlendModeColorDodge;
    kCGBlendModeColorBurn;
    kCGBlendModeSoftLight;
    kCGBlendModeHardLight;
    kCGBlendModeDifference;
    kCGBlendModeExclusion;
    kCGBlendModeHue;
    kCGBlendModeSaturation;
    kCGBlendModeColor;
    kCGBlendModeLuminosity;

    /* Available in Mac OS X 10.5 & later. R, S, and D are, respectively,
       premultiplied result, source, and destination colors with alpha; Ra,
       Sa, and Da are the alpha components of these colors.

       The Porter-Duff "source over" mode is called `kCGBlendModeNormal':
         R = S + D*(1 - Sa)

       Note that the Porter-Duff "XOR" mode is only titularly related to the
       classical bitmap XOR operation (which is unsupported by
       CoreGraphics). */

    kCGBlendModeClear;			/* R = 0 */
    kCGBlendModeCopy;			/* R = S */
    kCGBlendModeSourceIn;		/* R = S*Da */
    kCGBlendModeSourceOut;		/* R = S*(1 - Da) */
    kCGBlendModeSourceAtop;		/* R = S*Da + D*(1 - Sa) */
    kCGBlendModeDestinationOver;	/* R = S*(1 - Da) + D */
    kCGBlendModeDestinationIn;		/* R = D*Sa */
    kCGBlendModeDestinationOut;		/* R = D*(1 - Sa) */
    kCGBlendModeDestinationAtop;	/* R = S*(1 - Da) + D*Sa */
    kCGBlendModeXOR;			/* R = S*(1 - Da) + D*(1 - Sa) */
    kCGBlendModePlusDarker;		/* R = MAX(0, (1 - D) + (1 - S)) */
    kCGBlendModePlusLighter;		/* R = MIN(1, S + D) */
}

extern class CGContext {
/* Return the CFTypeID for CGContextRefs. */

	//@:c public static function GetTypeID () :CFTypeID;
    
/** Graphics state functions. **/

/* Push a copy of the current graphics state onto the graphics state stack.
   Note that the path is not considered part of the graphics state, and is
   not saved. */

	@:c public static function CGContextSaveGState (c:CGContextRef) :Void;

/* Restore the current graphics state from the one on the top of the
   graphics state stack, popping the graphics state stack in the process. */

	@:c public static function CGContextRestoreGState(c:CGContextRef) :Void;

/** Coordinate space transformations. **/

/* Scale the current graphics state's transformation matrix (the CTM) by
   `(sx, sy)'. */

	@:c public static function CGContextScaleCTM(c:CGContextRef, sx:Float, sy:Float) :Void;

/* Translate the current graphics state's transformation matrix (the CTM) by
   `(tx, ty)'. */

	@:c public static function CGContextTranslateCTM(c:CGContextRef, tx:Float, ty:Float) :Void;

/* Rotate the current graphics state's transformation matrix (the CTM) by
   `angle' radians. */

	@:c public static function CGContextRotateCTM(c:CGContextRef, angle:Float) :Void;

/* Concatenate the current graphics state's transformation matrix (the CTM)
   with the affine transform `transform'. */

	@:c public static function CGContextConcatCTM(c:CGContextRef, transform:CGAffineTransform) :Void;

/* Return the current graphics state's transformation matrix. */

	@:c public static function CGContextGetCTM(c:CGContextRef) :CGAffineTransform;

/** Drawing attribute functions. **/

/* Set the line width in the current graphics state to `width'. */

	@:c public static function CGContextSetLineWidth(c:CGContextRef, width:Float) :Void;

/* Set the line cap in the current graphics state to `cap'. */

	@:c public static function CGContextSetLineCap(c:CGContextRef, cap:CGLineCap) :Void;

/* Set the line join in the current graphics state to `join'. */

	@:c public static function CGContextSetLineJoin(c:CGContextRef, join:CGLineJoin) :Void;

/* Set the miter limit in the current graphics state to `limit'. */

	@:c public static function CGContextSetMiterLimit(c:CGContextRef, limit:Float) :Void;

/* Set the line dash patttern in the current graphics state of `c'. */

	@:c public static function CGContextSetLineDash(c:CGContextRef, phase:Float, lengths:Array<Float>, count:Int) :Void;

/* Set the path flatness parameter in the current graphics state of `c' to
   `flatness'. */

	@:c public static function CGContextSetFlatness(c:CGContextRef, flatness:Float) :Void;

/* Set the alpha value in the current graphics state of `c' to `alpha'. */

	@:c public static function CGContextSetAlpha(c:CGContextRef, alpha:Float) :Void;

/* Set the blend mode of `context' to `mode'. */

	@:c public static function CGContextSetBlendMode(c:CGContextRef, mode:CGBlendMode) :Void;

/** Path construction functions. **/

/* Note that a context has a single path in use at any time: a path is not
   part of the graphics state. */

/* Begin a new path. The old path is discarded. */

	@:c public static function CGContextBeginPath(c:CGContextRef) :Void;

/* Start a new subpath at point `(x, y)' in the context's path. */

	@:c public static function CGContextMoveToPoint(c:CGContextRef, x:Float, y:Float) :Void;

/* Append a straight line segment from the current point to `(x, y)'. */

	@:c public static function CGContextAddLineToPoint(c:CGContextRef, x:Float, y:Float) :Void;

/* Append a cubic Bezier curve from the current point to `(x,y)', with
   control points `(cp1x, cp1y)' and `(cp2x, cp2y)'. */

	@:c public static function CGContextAddCurveToPoint(c:CGContextRef, cp1x:Float, cp1y:Float, cp2x:Float, cp2y:Float, x:Float, y:Float) :Void;

/* Append a quadratic curve from the current point to `(x, y)', with control
   point `(cpx, cpy)'. */

	@:c public static function CGContextAddQuadCurveToPoint(c:CGContextRef, cpx:Float, cpy:Float, x:Float, y:Float) :Void;

/* Close the current subpath of the context's path. */

	@:c public static function CGContextClosePath(c:CGContextRef) :Void;

/** Path construction convenience functions. **/

/* Add a single rect to the context's path. */

	@:c public static function CGContextAddRect(c:CGContextRef, rect:CGRect) :Void;

/* Add a set of rects to the context's path. */

	@:c public static function CGContextAddRects(c:CGContextRef, rects:Array<CGRect>, count:Int) :Void;

/* Add a set of lines to the context's path. */

	@:c public static function CGContextAddLines(c:CGContextRef, points:Array<CGRect>, count:Int) :Void;

/* Add an ellipse inside `rect' to the current path of `context'. See the
   function `CGPathAddEllipseInRect' for more information on how the path
   for the ellipse is constructed. */

	@:c public static function CGContextAddEllipseInRect(c:CGContextRef, rect:CGRect) :Void;

/* Add an arc of a circle to the context's path, possibly preceded by a
   straight line segment. `(x, y)' is the center of the arc; `radius' is its
   radius; `startAngle' is the angle to the first endpoint of the arc;
   `endAngle' is the angle to the second endpoint of the arc; and
   `clockwise' is 1 if the arc is to be drawn clockwise, 0 otherwise.
   `startAngle' and `endAngle' are measured in radians. */

	@:c public static function CGContextAddArc(c:CGContextRef, x:Float, y:Float, radius:Float, startAngle:Float, endAngle:Float, clockwise:Int) :Void;

/* Add an arc of a circle to the context's path, possibly preceded by a
   straight line segment. `radius' is the radius of the arc. The arc is
   tangent to the line from the current point to `(x1, y1)', and the line
   from `(x1, y1)' to `(x2, y2)'. */

	@:c public static function CGContextAddArcToPoint(c:CGContextRef, x1:Float, y1:Float, x2:Float, y2:Float, radius:Float) :Void;

/* Add `path' to the path of context. The points in `path' are transformed
   by the CTM of context before they are added. */

	@:c public static function CGContextAddPath(c:CGContextRef, path:CGPathRef) :Void;

/** Path stroking. **/

/* Replace the path in `context' with the stroked version of the path, using
   the parameters of `context' to calculate the stroked path. The resulting
   path is created such that filling it with the appropriate color will
   produce the same results as stroking the original path. You can use this
   path in the same way you can use the path of any context; for example,
   you can clip to the stroked version of a path by calling this function
   followed by a call to "CGContextClip". */

	@:c public static function CGContextReplacePathWithStrokedPath(c:CGContextRef) :Void;

/** Path information functions. **/

/* Return true if the path of `context' contains no elements, false
   otherwise. */

	@:c public static function CGContextIsPathEmpty(c:CGContextRef) :Bool;

/* Return the current point of the current subpath of the path of
   `context'. */

	@:c public static function CGContextGetPathCurrentPoint(c:CGContextRef) :CGPoint;

/* Return the bounding box of the path of `context'. The bounding box is the
   smallest rectangle completely enclosing all points in the path, including
   control points for Bezier and quadratic curves. */

	@:c public static function CGContextGetPathBoundingBox(c:CGContextRef) :CGRect;

/* Return a copy of the path of `context'. The returned path is specified in
   the current user space of `context'. */

	@:c public static function CGContextCopyPath(c:CGContextRef) :CGPathRef;

/* Return true if `point' is contained in the current path of `context'. A
   point is contained within a context's path if it is inside the painted
   region when the path is stroked or filled with opaque colors using the
   path drawing mode `mode'. `point' is specified is user space. */

	@:c public static function CGContextPathContainsPoint(c:CGContextRef, point:CGPoint, mode:CGPathDrawingMode) :Bool;

/** Path drawing functions. **/

/* Draw the context's path using drawing mode `mode'. */

	@:c public static function CGContextDrawPath(c:CGContextRef, mode:CGPathDrawingMode) :Void;

/** Path drawing convenience functions. **/

/* Fill the context's path using the winding-number fill rule. Any open
   subpath of the path is implicitly closed. */

	@:c public static function CGContextFillPath(c:CGContextRef) :Void;

/* Fill the context's path using the even-odd fill rule. Any open subpath of
   the path is implicitly closed. */

	@:c public static function CGContextEOFillPath(c:CGContextRef) :Void;

/* Stroke the context's path. */

	@:c public static function CGContextStrokePath(c:CGContextRef) :Void;

/* Fill `rect' with the current fill color. */

	@:c public static function CGContextFillRect(c:CGContextRef, rect:CGRect) :Void;

/* Fill `rects', an array of `count' CGRects, with the current fill
   color. */

	@:c public static function CGContextFillRects(c:CGContextRef, rect:Array<CGRect>, count:Int) :Void;

/* Stroke `rect' with the current stroke color and the current linewidth. */

	@:c public static function CGContextStrokeRect(c:CGContextRef, rect:CGRect) :Void;

/* Stroke `rect' with the current stroke color, using `width' as the the
   line width. */

	@:c public static function CGContextStrokeRectWithWidth(c:CGContextRef, rect:CGRect, width:Float) :Void;

/* Clear `rect' (that is, set the region within the rect to transparent). */

	@:c public static function CGContextClearRect(c:CGContextRef, rect:CGRect) :Void;

/* Fill an ellipse (an oval) inside `rect'. */

	@:c public static function CGContextFillEllipseInRect(c:CGContextRef, rect:CGRect) :Void;

/* Stroke an ellipse (an oval) inside `rect'. */

	@:c public static function CGContextStrokeEllipseInRect(c:CGContextRef, rect:CGRect) :Void;

/* Stroke a sequence of line segments one after another in `context'. The
   line segments are specified by `points', an array of `count' CGPoints.
   This function is equivalent to

     CGContextBeginPath(context);
     for (k = 0; k < count; k += 2) {
       CGContextMoveToPoint(context, s[k].x, s[k].y);
       CGContextAddLineToPoint(context, s[k+1].x, s[k+1].y);
     }
     CGContextStrokePath(context); */

	@:c public static function CGContextStrokeLineSegments(c:CGContextRef, points:Array<CGPoint>, count:Int) :Void;

/** Clipping functions. **/

/* Intersect the context's path with the current clip path and use the
   resulting path as the clip path for subsequent rendering operations. Use
   the winding-number fill rule for deciding what's inside the path. */

	@:c public static function CGContextClip(c:CGContextRef) :Void;

/* Intersect the context's path with the current clip path and use the
   resulting path as the clip path for subsequent rendering operations. Use
   the even-odd fill rule for deciding what's inside the path. */

	@:c public static function CGContextEOClip(c:CGContextRef) :Void;

/* Add `mask' transformed to `rect' to the clipping area of `context'. The
   mask, which may be either an image mask or an image, is mapped into the
   specified rectangle and intersected with the current clipping area of the
   context.

   If `mask' is an image mask, then it clips in a manner identical to the
   behavior if it were used with "CGContextDrawImage": it indicates an area
   to be masked out (left unchanged) when drawing. The source samples of the
   image mask determine which points of the clipping area are changed,
   acting as an "inverse alpha": if the value of a source sample in the
   image mask is S, then the corresponding point in the current clipping
   area will be multiplied by an alpha of (1-S). (For example, if S is 1,
   then the point in the clipping area becomes clear, while if S is 0, the
   point in the clipping area is unchanged.

   If `mask' is an image, then it serves as alpha mask and is blended with
   the current clipping area. The source samples of mask determine which
   points of the clipping area are changed: if the value of the source
   sample in mask is S, then the corresponding point in the current clipping
   area will be multiplied by an alpha of S. (For example, if S is 0, then
   the point in the clipping area becomes clear, while if S is 1, the point
   in the clipping area is unchanged.

   If `mask' is an image, then it must be in the DeviceGray color space, may
   not have alpha, and may not be masked by an image mask or masking
   color. */

	@:c public static function CGContextClipToMask(c:CGContextRef, rect:CGRect, mask:CGImageRef) :Void;

/* Return the bounding box of the clip path of `c' in user space. The
   bounding box is the smallest rectangle completely enclosing all points in
   the clip. */

	@:c public static function CGContextGetClipBoundingBox(c:CGContextRef) :CGRect;

/** Clipping convenience functions. **/

/* Intersect the current clipping path with `rect'. Note that this function
   resets the context's path to the empty path. */

	@:c public static function CGContextClipToRect(c:CGContextRef, rect:CGRect) :Void;

/* Intersect the current clipping path with the clipping region formed by
   creating a path consisting of all rects in `rects'. Note that this
   function resets the context's path to the empty path. */

	@:c public static function CGContextClipToRects(c:CGContextRef, rect:Array<CGRect>, count:Int) :Void;

/** Primitive color functions. **/

/* Set the current fill color in the context `c' to `color'. */

	@:c public static function CGContextSetFillColorWithColor(c:CGContextRef, color:CGColorRef) :Void;

/* Set the current stroke color in the context `c' to `color'. */

	@:c public static function CGContextSetStrokeColorWithColor(c:CGContextRef, color:CGColorRef) :Void;

/** Color space functions. **/

/* Set the current fill color space in `context' to `space'. As a
   side-effect, set the fill color to a default value appropriate for the
   color space. */

	@:c public static function CGContextSetFillColorSpace(c:CGContextRef, space:CGColorSpaceRef) :Void;

/* Set the current stroke color space in `context' to `space'. As a
   side-effect, set the stroke color to a default value appropriate for the
   color space. */

	@:c public static function CGContextSetStrokeColorSpace(c:CGContextRef, space:CGColorSpaceRef) :Void;

/** Color functions. **/

/* Set the components of the current fill color in `context' to the values
   specifed by `components'. The number of elements in `components' must be
   one greater than the number of components in the current fill color space
   (N color components + 1 alpha component). The current fill color space
   must not be a pattern color space. */

	@:c public static function CGContextSetFillColor(c:CGContextRef, components:Array<Float>) :Void;

/* Set the components of the current stroke color in `context' to the values
   specifed by `components'. The number of elements in `components' must be
   one greater than the number of components in the current stroke color
   space (N color components + 1 alpha component). The current stroke color
   space must not be a pattern color space. */

	@:c public static function CGContextSetStrokeColor(c:CGContextRef, components:Array<Float>) :Void;

/** Pattern functions. **/

/* Set the components of the current fill color in `context' to the values
   specifed by `components', and set the current fill pattern to `pattern'.
   The number of elements in `components' must be one greater than the
   number of components in the current fill color space (N color components
   + 1 alpha component). The current fill color space must be a pattern
   color space. */

	@:c public static function CGContextSetFillPattern(c:CGContextRef, pattern:CGPatternRef, components:Array<Float>) :Void;

/* Set the components of the current stroke color in `context' to the values
   specifed by `components', and set the current stroke pattern to
   `pattern'. The number of elements in `components' must be one greater
   than the number of components in the current stroke color space (N color
   components + 1 alpha component). The current stroke color space must be a
   pattern color space. */

	@:c public static function CGContextSetStrokePattern(c:CGContextRef, pattern:CGPatternRef, components:Array<Float>) :Void;

/* Set the pattern phase in the current graphics state of `context' to
   `phase'. */

	@:c public static function CGContextSetPatternPhase(c:CGContextRef, phase:CGSize) :Void;

/** Color convenience functions. **/

/* Set the current fill color space in `context' to `DeviceGray' and set the
   components of the current fill color to `(gray, alpha)'. */

	@:c public static function CGContextSetGrayFillColor(c:CGContextRef, gray:Float, alpha:Float) :Void;

/* Set the current stroke color space in `context' to `DeviceGray' and set
   the components of the current stroke color to `(gray, alpha)'. */

	@:c public static function CGContextSetGrayStrokeColor(c:CGContextRef, gray:Float, alpha:Float) :Void;

/* Set the current fill color space in `context' to `DeviceRGB' and set the
   components of the current fill color to `(red, green, blue, alpha)'. */

	@:c public static function CGContextSetRGBFillColor(c:CGContextRef, red:Float, green:Float, blue:Float, alpha:Float) :Void;

/* Set the current stroke color space in `context' to `DeviceRGB' and set
   the components of the current stroke color to `(red, green, blue,
   alpha)'. */

	@:c public static function CGContextSetRGBStrokeColor(c:CGContextRef, red:Float, green:Float, blue:Float, alpha:Float) :Void;

/* Set the current fill color space in `context' to `DeviceCMYK' and set the
   components of the current fill color to `(cyan, magenta, yellow, black,
   alpha)'. */

	@:c public static function CGContextSetCMYKFillColor(c:CGContextRef, cyan:Float, magenta:Float, yellow:Float, black:Float, alpha:Float) :Void;

/* Set the current stroke color space in `context' to `DeviceCMYK' and set
   the components of the current stroke color to `(cyan, magenta, yellow,
   black, alpha)'. */

	@:c public static function CGContextSetCMYKStrokeColor(c:CGContextRef, cyan:Float, magenta:Float, yellow:Float, black:Float, alpha:Float) :Void;

/** Rendering intent. **/

/* Set the rendering intent in the current graphics state of `context' to
   `intent'. */

	@:c public static function CGContextSetRenderingIntent(c:CGContextRef, intent:CGColorRenderingIntent) :Void;

/** Image functions. **/

/* Draw `image' in the rectangular area specified by `rect' in the context
   `c'. The image is scaled, if necessary, to fit into `rect'. */

	@:c public static function CGContextDrawImage(c:CGContextRef, rect:CGRect, image:CGImageRef) :Void;

/* Draw `image' tiled in the context `c'. The image is scaled to the size
   specified by `rect' in user space, positioned at the origin of `rect' in
   user space, then replicated, stepping the width of `rect' horizontally
   and the height of `rect' vertically, to fill the current clip region.
   Unlike patterns, the image is tiled in user space, so transformations
   applied to the CTM affect the final result. */

	@:c public static function CGContextDrawTiledImage(c:CGContextRef, rect:CGRect, image:CGImageRef) :Void;

/* Return the interpolation quality for image rendering of `context'. The
   interpolation quality is a gstate parameter which controls the level of
   interpolation performed when an image is interpolated (for example, when
   scaling the image). Note that it is merely a hint to the context: not all
   contexts support all interpolation quality levels. */

	@:c public static function  CGContextGetInterpolationQuality(context:CGContextRef) :CGInterpolationQuality;

/* Set the interpolation quality of `context' to `quality'. */

	@:c public static function CGContextSetInterpolationQuality(c:CGContextRef, quality:CGInterpolationQuality) :Void;

/** Shadow support. **/
#if nnnnnn
/* Set the shadow parameters in `context'. `offset' specifies a translation
   in base-space; `blur' is a non-negative number specifying the amount of
   blur; `color' specifies the color of the shadow, which may contain a
   non-opaque alpha value. If `color' is NULL, it's equivalent to specifying
   a fully transparent color. The shadow is a gstate parameter. After a
   shadow is specified, all objects drawn subsequently will be shadowed. To
   turn off shadowing, set the shadow color to a fully transparent color (or
   pass NULL as the color), or use the standard gsave/grestore mechanism. */

	@:c public static function CGContextSetShadowWithColor(c:CGContextRef, CGSize offset,
    Float blur, CGColorRef color) :Void;

/* Equivalent to calling
     CGContextSetShadowWithColor(context, offset, blur, color)
   where color is black with 1/3 alpha (i.e., RGBA = {0, 0, 0, 1.0/3.0}) in
   the DeviceRGB color space. */

	@:c public static function CGContextSetShadow(c:CGContextRef, CGSize offset,
    Float blur) :Void;

/** Gradient and shading functions. **/

/* Fill the current clipping region of `context' with a linear gradient from
   `startPoint' to `endPoint'. The location 0 of `gradient' corresponds to
   `startPoint'; the location 1 of `gradient' corresponds to `endPoint';
   colors are linearly interpolated between these two points based on the
   values of the gradient's locations. The option flags control whether the
   gradient is drawn before the start point or after the end point. */

	@:c public static function CGContextDrawLinearGradient(c:CGContextRef,
    CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint,
    CGGradientDrawingOptions options) :Void;

/* Fill the current clipping region of `context' with a radial gradient
   between two circles defined by the center point and radius of each
   circle. The location 0 of `gradient' corresponds to a circle centered at
   `startCenter' with radius `startRadius'; the location 1 of `gradient'
   corresponds to a circle centered at `endCenter' with radius `endRadius';
   colors are linearly interpolated between these two circles based on the
   values of the gradient's locations. The option flags control whether the
   gradient is drawn before the start circle or after the end circle. */

	@:c public static function CGContextDrawRadialGradient(c:CGContextRef,
    CGGradientRef gradient, CGPoint startCenter, Float startRadius,
    CGPoint endCenter, Float endRadius, CGGradientDrawingOptions options) :Void;

/* Fill the current clipping region of `context' with `shading'. */

	@:c public static function CGContextDrawShading(c:CGContextRef, CGShadingRef shading) :Void;

/** Text functions. **/

/* Set the current character spacing in `context' to `spacing'. The
   character spacing is added to the displacement between the origin of one
   character and the origin of the next. */

	@:c public static function CGContextSetCharacterSpacing(c:CGContextRef, spacing:Float) :Void;

/* Set the user-space point at which text will be drawn in the context `c'
   to `(x, y)'. */

	@:c public static function CGContextSetTextPosition(c:CGContextRef, x:Float, y:Float) :Void;

/* Return the user-space point at which text will be drawn in `context'. */

	@:c public static function CGPoint CGContextGetTextPosition(c:CGContextRef)
    CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Set the text matrix in the context `c' to `t'. */

	@:c public static function CGContextSetTextMatrix(c:CGContextRef, CGAffineTransform t) :Void;

/* Return the text matrix in the context `c'. */

	@:c public static function CGAffineTransform CGContextGetTextMatrix(c:CGContextRef)
    CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Set the text drawing mode in the current graphics state of the context
   `c' to `mode'. */

	@:c public static function CGContextSetTextDrawingMode(c:CGContextRef,
    CGTextDrawingMode mode) :Void;

/* Set the font in the current graphics state of the context `c' to
   `font'. */

	@:c public static function CGContextSetFont(c:CGContextRef, CGFontRef font) :Void;

/* Set the font size in the current graphics state of the context `c' to
   `size'. */

	@:c public static function CGContextSetFontSize(c:CGContextRef, Float size) :Void;

/* Attempts to find the font named `name' and, if successful, sets it as the
   font in the current graphics state of `c' and sets the font size in the
   current graphics state to `size'. `textEncoding' specifies how to
   translate from bytes to glyphs when displaying text. */

	@:c public static function CGContextSelectFont(c:CGContextRef, const char *name,
    Float size, CGTextEncoding textEncoding) :Void;

/* Draw `glyphs', an array of `count' CGGlyphs, at the points specified by
   `positions'. Each element of `positions' specifies the position from the
   associated glyph; the positions are specified in user space. */

	@:c public static function CGContextShowGlyphsAtPositions(c:CGContextRef,
    const CGGlyph glyphs[], const CGPoint positions[], size_t count) :Void;

/** Text convenience functions. **/

/* Draw `string', a string of `length' bytes, at the point specified by the
   text matrix in the context `c'. Each byte of the string is mapped through
   the encoding vector of the current font to obtain the glyph to
   display. */

	@:c public static function CGContextShowText(c:CGContextRef, const char *string,
    size_t length) :Void;

/* Draw `string', a string of `length' bytes, at the point `(x, y)',
   specified in user space, in the context `c'. Each byte of the string is
   mapped through the encoding vector of the current font to obtain the
   glyph to display. */

	@:c public static function CGContextShowTextAtPoint(c:CGContextRef, x:Float, y:Float,
    const char *string, size_t length) :Void;

/* Draw the glyphs pointed to by `g', an array of `count' glyphs, at the
   point specified by the text matrix in the context `c'. */

	@:c public static function CGContextShowGlyphs(c:CGContextRef, const CGGlyph g[],
    size_t count) :Void;

/* Display the glyphs pointed to by `glyphs', an array of `count' glyphs, at
   the point `(x, y)', specified in user space, in `context'. */

	@:c public static function CGContextShowGlyphsAtPoint(c:CGContextRef, x:Float,
    y:Float, const CGGlyph glyphs[], size_t count) :Void;

/* Draw `glyphs', an array of `count' CGGlyphs, at the current point
   specified by the text matrix. Each element of `advances' specifies the
   offset from the previous glyph's origin to the origin of the associated
   glyph; the advances are specified in user space. */

	@:c public static function CGContextShowGlyphsWithAdvances(c:CGContextRef,
    const CGGlyph glyphs[], const CGSize advances[], size_t count) :Void;

/** PDF functions. **/

/* Draw `page' in the current user space of the context `c'. */

	@:c public static function CGContextDrawPDFPage(c:CGContextRef, CGPDFPageRef page) :Void;

/** Output page functions. **/

/* Begin a new page. */

	@:c public static function CGContextBeginPage(c:CGContextRef, const CGRect *mediaBox) :Void;

/* End the current page. */

	@:c public static function CGContextEndPage(c:CGContextRef) :Void;

/** Context functions. **/

/* Equivalent to `CFRetain(c)'. */

	@:c public static function CGContextRef CGContextRetain(c:CGContextRef)
    CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

/* Equivalent to `CFRelease(c)'. */

	@:c public static function CGContextRelease(c:CGContextRef) :Void;

/* Flush all drawing to the destination. */

	@:c public static function CGContextFlush(c:CGContextRef) :Void;

/* Synchronized drawing. */

	@:c public static function CGContextSynchronize(c:CGContextRef) :Void;

/** Antialiasing functions. **/

/* Turn on antialiasing if `shouldAntialias' is true; turn it off otherwise.
   This parameter is part of the graphics state. */

	@:c public static function CGContextSetShouldAntialias(c:CGContextRef,
    bool shouldAntialias) :Void;

/* Allow antialiasing in `context' if `allowsAntialiasing' is true; don't
   allow it otherwise. This parameter is not part of the graphics state. A
   context will perform antialiasing if both `allowsAntialiasing' and the
   graphics state parameter `shouldAntialias' are true. */

	@:c public static function CGContextSetAllowsAntialiasing(c:CGContextRef,
    bool allowsAntialiasing) :Void;

/** Font display functions. **/

/* Turn on font smoothing if `shouldSmoothFonts' is true; turn it off
   otherwise. This parameter is part of the graphics state. Note that this
   doesn't guarantee that font smoothing will occur: not all destination
   contexts support font smoothing. */

	@:c public static function CGContextSetShouldSmoothFonts(c:CGContextRef,
    bool shouldSmoothFonts) :Void;

/* If `allowsFontSmoothing' is true, then allow font smoothing when
   displaying text in `context'; otherwise, don't allow font smoothing. This
   parameter is not part of the graphics state. Fonts will be smoothed if
   they are antialiased when drawn and if both `allowsFontSmoothing' and the
   graphics state parameter `shouldSmoothFonts' are true. */
 
	@:c public static function CGContextSetAllowsFontSmoothing(c:CGContextRef,
    bool allowsFontSmoothing) :Void;

/* If `shouldSubpixelPositionFonts' is true, then glyphs may be placed at
   subpixel positions (if allowed) when displaying text in `context';
   otherwise, glyphs will be forced to integer pixel boundaries. This
   parameter is part of the graphics state. */

	@:c public static function CGContextSetShouldSubpixelPositionFonts(c:CGContextRef,
    bool shouldSubpixelPositionFonts) :Void;

/* If `allowsFontSubpixelPositioning' is true, then allow font subpixel
   positioning when displaying text in `context'; otherwise, don't allow
   subpixel positioning. This parameter is not part of the graphics state. A
   context will place glyphs at subpixel positions if fonts will be
   antialiased when drawn and if both `allowsFontSubpixelPositioning' and
   the graphics state parameter `shouldSubpixelPositionFonts' are true. */

	@:c public static function CGContextSetAllowsFontSubpixelPositioning(c:CGContextRef,
    bool allowsFontSubpixelPositioning) :Void;

/* If `shouldSubpixelQuantizeFonts' is true, then quantize the subpixel
   positions of glyphs when displaying text in `context'; otherwise, don't
   quantize the subpixel positions. This parameter is part of the graphics
   state. */

	@:c public static function CGContextSetShouldSubpixelQuantizeFonts(c:CGContextRef,
    bool shouldSubpixelQuantizeFonts) :Void;

/* If `allowsFontSubpixelQuantization' is true, then allow font subpixel
   quantization when displaying text in `context'; otherwise, don't allow
   subpixel quantization. This parameter is not part of the graphics state.
   A context quantizes subpixel positions if glyphs will be drawn at
   subpixel positions and `allowsFontSubpixelQuantization' and the graphics
   state parameter `shouldSubpixelQuantizeFonts' are both true. */

	@:c public static function CGContextSetAllowsFontSubpixelQuantization(c:CGContextRef,
    bool allowsFontSubpixelQuantization) :Void;

/** Transparency layer support. **/

/* Begin a transparency layer in `context'. All subsequent drawing
   operations until a corresponding `CGContextEndTransparencyLayer' are
   composited into a fully transparent backdrop (which is treated as a
   separate destination buffer from the context). After the transparency
   layer is ended, the result is composited into the context using the
   global alpha and shadow state of the context. This operation respects the
   clipping region of the context. After a call to this function, all of the
   parameters in the graphics state remain unchanged with the exception of
   the following:
     - The global alpha is set to 1.
     - The shadow is turned off.
     - The blend mode is set to `kCGBlendModeNormal'.
   Ending the transparency layer restores these parameters to the values
   they had before `CGContextBeginTransparencyLayer' was called.
   Transparency layers may be nested. */

	@:c public static function CGContextBeginTransparencyLayer(c:CGContextRef,
    CFDictionaryRef auxiliaryInfo) :Void;

/* Begin a transparency layer in `context'. This function is identical to
  `CGContextBeginTransparencyLayer' except that the content of the
  transparency layer will be bounded by `rect' (specified in user space). */

	@:c public static function CGContextBeginTransparencyLayerWithRect(c:CGContextRef,
    rect:CGRect, CFDictionaryRef auxiliaryInfo) :Void;

/* End a tranparency layer. */

	@:c public static function CGContextEndTransparencyLayer(c:CGContextRef) :Void;

/** User space to device space tranformations. **/

/* Return the affine transform mapping the user space (abstract coordinates)
   of `context' to device space (pixels). */

	@:c public static function CGAffineTransform
    CGContextGetUserSpaceToDeviceSpaceTransform(c:CGContextRef)
    CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Transform `point' from the user space of `context' to device space. */

	@:c public static function CGPoint CGContextConvertPointToDeviceSpace(c:CGContextRef,
    CGPoint point) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Transform `point' from device space to the user space of `context'. */

	@:c public static function CGPoint CGContextConvertPointToUserSpace(c:CGContextRef,
    CGPoint point) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Transform `size' from the user space of `context' to device space. */

	@:c public static function CGSize CGContextConvertSizeToDeviceSpace(c:CGContextRef,
    CGSize size) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Transform `size' from device space to the user space of `context'. */

	@:c public static function CGSize CGContextConvertSizeToUserSpace(c:CGContextRef,
    CGSize size) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Transform `rect' from the user space of `context' to device space. Since
   affine transforms do not preserve rectangles in general, this function
   returns the smallest rectangle which contains the transformed corner
   points of `rect'. */

	@:c public static function CGRect CGContextConvertRectToDeviceSpace(c:CGContextRef,
    rect:CGRect) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

/* Transform `rect' from device space to the user space of `context'. Since
   affine transforms do not preserve rectangles in general, this function
   returns the smallest rectangle which contains the transformed corner
   points of `rect'. */

	@:c public static function CGRect CGContextConvertRectToUserSpace(c:CGContextRef,
    rect:CGRect) CG_AVAILABLE_STARTING(__MAC_10_4, __IPHONE_2_0);

#end
	
}
