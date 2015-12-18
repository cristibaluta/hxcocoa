package objc.quartz;

import objc.graphics.CGColorRef;


/* The replicator layer creates a specified number of copies of its
 * sublayers, each copy potentially having geometric, temporal and
 * color transformations applied to it.
 *
 * Note: the CALayer -hitTest: method currently only tests the first
 * instance of z replicator layer's sublayers. This may change in the
 * future. */

extern class CAReplicatorLayer extends CALayer {

/* The number of copies to create, including the source object.
 * Default value is one (i.e. no extra copies). Animatable. */

	public var instanceCount :Int;

/* Defines whether this layer flattens its sublayers into its plane or
 * not (i.e. whether it's treated similarly to a transform layer or
 * not). Defaults to NO. If YES, the standard restrictions apply (see
 * CATransformLayer.h). */

	public var preservesDepth :Bool;

/* The temporal delay between replicated copies. Defaults to zero.
 * Animatable. */

	public var instanceDelay :Float;

/* The matrix applied to instance k-1 to produce instance k. The matrix
 * is applied relative to the center of the replicator layer, i.e. the
 * superlayer of each replicated sublayer. Defaults to the identity
 * matrix. Animatable. */

	public var instanceTransform :CATransform3D;

/* The color to multiply the first object by (the source object). Defaults
 * to opaque white. Animatable. */

	public var instanceColor :CGColorRef;

/* The color components added to the color of instance k-1 to produce
 * the modulation color of instance k. Defaults to the clear color (no
 * change). Animatable. */

	public var instanceRedOffset :Float;
	public var instanceGreenOffset :Float;
	public var instanceBlueOffset :Float;
	public var instanceAlphaOffset :Float;

}
