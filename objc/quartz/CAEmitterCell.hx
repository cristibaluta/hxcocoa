package objc.quartz;
import objc.foundation.NSObject;
import objc.foundation.NSDictionary;

extern class CAEmitterCell extends NSObject implements CAMediaTiming {

	public static function emitterCell () :CAEmitterCell;

/* Emitter cells implement the same property model as defined by CALayer.
 * See CALayer.h for more details. */

	public static function defaultValueForKey (key:String) :CAEmitterCell;
	public function shouldArchiveValueForKey (key:String) :Bool;

/* The name of the cell. Used to construct key paths. Defaults to nil. */

	public var name :String;

/* Controls whether or not cells from this emitter are rendered. */

	public var enabled :Bool;

/* The number of emitted objects created every second. Default value is
 * zero. Animatable. */

	public var birthRate :Float;

/* The lifetime of each emitted object in seconds, specified as a mean
 * value and a range about the mean. Both values default to zero.
 * Animatable. */

	public var lifetime :Float;
	public var lifetimeRange :Float;

/* The orientation of the emission angle in radians, relative to the
 * natural orientation angle of the emission shape. Note that latitude
 * here is what is typically called colatitude, the zenith or phi, the
 * angle from the z-axis. Similarly longitude is the angle in the
 * xy-plane from the x-axis, often referred to as the azimuth or
 * theta. Both values default to zero, which translates to no change
 * relative to the emission shape's direction. Both values are
 * animatable. */

	public var emissionLatitude :Float;
	public var emissionLongitude :Float;

/* An angle (in radians) defining a cone around the emission angle.
 * Emitted objects are uniformly distributed across this cone. Defaults
 * to zero.  Animatable. */

	public var emissionRange :Float;

/* The initial mean velocity of each emitted object, and its range. Both
 * values default to zero. Animatable. */

	public var velocity :Float;
	public var velocityRange :Float;

/* The acceleration vector applied to emitted objects. Defaults to
 * (0, 0, 0). Animatable. */

	public var xAcceleration :Float;
	public var yAcceleration :Float;
	public var zAcceleration :Float;

/* The scale factor applied to each emitted object, defined as mean and
 * range about the mean. Scale defaults to one, range to zero.
 * Animatable. */

	public var scale :Float;
	public var scaleRange :Float;
	public var scaleSpeed :Float;

/* The rotation speed applied to each emitted object, defined as mean
 * and range about the mean. Defaults to zero. Animatable. */

	public var spin :Float;
	public var spinRange :Float;

/* The mean color of each emitted object, and the range from that mean
 * color. `color' defaults to opaque white, `colorRange' to (0, 0, 0,
 * 0). Animatable. */

	public var color :CGColorRef;

	public var redRange :Float;
	public var greenRange :Float;
	public var blueRange :Float;
	public var alphaRange :Float;

/* The speed at which color components of emitted objects change over
 * their lifetime, defined as the rate of change per second. Defaults
 * to (0, 0, 0, 0). Animatable. */

	public var redSpeed :Float;
	public var greenSpeed :Float;
	public var blueSpeed :Float;
	public var alphaSpeed :Float;

/* The cell contents, typically a CGImageRef. Defaults to nil.
 * Animatable. */

	public var contents :Dynamic;

/* The sub-rectangle of the contents image that will be drawn. See
 * CALayer.h for more details. Defaults to the unit rectangle [0 0 1 1].
 * Animatable. */

	public var contentsRect :CGRect;

/* The filter parameters used when rendering the `contents' image. See
 * CALayer.h for more details. */

	public var minificationFilter :String;
	public var magnificationFilter :String;
	public var minificationFilterBias :Float;

/* An array containing the sub-cells of this cell, or nil (the default
 * value). When non-nil each particle emitted by the cell will act as
 * an emitter for each of the cell's sub-cells. The emission point is
 * the current particle position and the emission angle is relative to
 * the current direction of the particle. Animatable. */

	public var emitterCells :Array<CAEmitterCell>;

/* Inherited attributes similar to in layers. */

	public var style :NSDictionary;

}
