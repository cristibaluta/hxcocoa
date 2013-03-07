package objc.graphics;
import objc.graphics.CGGeometry;

typedef CGShadingRef = CGShading;

extern class CGShading {
/* Return the CFTypeID for CGShadingRefs. */

	@:c public static function CGShadingGetTypeID () :CFTypeID;

/* Create a shading defining a color blend which varies along a linear axis
   between two endpoints and extends indefinitely perpendicular to that
   axis. The shading may optionally extend beyond either endpoint by
   continuing the boundary colors indefinitely. The color values are
   specified in the color space `space'. The starting point of the axis is
   `start' and the ending point of the axis is `end', both specified in the
   shading's target coordinate space. The shading function, specified by
   `function', is a 1-in, N-out function, where N is one more (for alpha)
   than the number of color components in the shading's color space. The
   input value 0 corresponds to the color at the starting point of the
   shading; the input value 1 corresponds to the color at the ending point
   of the shading. If `extendStart' is true, then the shading will extend
   beyond the starting point of the axis. If `extendEnd' is true, then the
   shading will extend beyond the ending point of the axis. */

	@:c public static function CGShadingCreateAxial(space:CGColorSpaceRef, start:CGPoint, end:CGPoint, function:CGFunctionRef, extendStart:Bool, extendEnd:Bool) :CGShadingRef;

/* Create a shading defining a color blend which varies between two circles.
   The shading may optionally extend beyond either circle by continuing the
   boundary colors. The color values are specified in the color space
   `space'. The starting circle has radius `startRadius' and is centered at
   `start', specified in the shading's target coordinate space. The ending
   circle has radius `endRadius' and is centered at `end', specified in the
   shading's target coordinate space. The shading function, specified by
   `function', is a 1-in, N-out function, where N is one more (for alpha)
   than the number of color components in the shading's color space. The
   input value 0 corresponds to the color of the starting circle; the input
   value 1 corresponds to the color of the ending circle. If `extendStart'
   is true, then the shading will extend beyond the starting circle. If
   `extendEnd' is true, then the shading will extend beyond the ending
   circle. */

	@:c public static function CGShadingCreateRadial(space:CGColorSpaceRef, start:CGPoint, startRadius:Float, end:CGPoint, endRadius:Float, function:CGFunctionRef, extendStart:Bool, extendEnd:Bool) :CGShadingRef;

/* Equivalent to `CFRetain(shading)', except it doesn't crash (as CFRetain
   does) if `shading' is NULL. */

	@:c public static function CGShadingRetain(shading:CGShadingRef) :CGShadingRef;

/* Equivalent to `CFRelease(shading)', except it doesn't crash (as CFRelease
   does) if `shading' is NULL. */

	@:c public static function CGShadingRelease(shading:CGShadingRef) :Void;

}
