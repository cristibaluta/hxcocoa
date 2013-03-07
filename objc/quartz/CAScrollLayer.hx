package objc.quartz;

import objc.graphics.CGGeometry;


extern class CAScrollLayer extends CALayer {

/* Changes the origin of the layer to point 'p'. */

	public function scrollToPoint (p:CGPoint) :Void;

/* Scroll the contents of the layer to ensure that rect 'r' is visible. */

	public function scrollToRect (r:CGRect) :Void;

/* Defines the axes in which the layer may be scrolled. Possible values
 * are `none', `vertically', `horizontally' or `both' (the default). */

	public var scrollMode :String;

}

extern class CALayer (CALayerScrolling)

/* These methods search for the closest ancestor CAScrollLayer of the *
 * receiver, and then call either -scrollToPoint: or -scrollToRect: on
 * that layer with the specified geometry converted from the coordinate
 * space of the receiver to that of the found scroll layer. */

	public function scrollPoint (p:CGPoint) :Void;
	public function scrollRectToVisible (r:CGRect) :Void;

/* Returns the visible region of the receiver, in its own coordinate
 * space. The visible region is the area not clipped by the containing
 * scroll layer. */

	public var (default, null) visibleRect :CGRect;

}

/* `scrollMode' values. */

CA_EXTERN NSString * const kCAScrollNone
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAScrollVertically
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAScrollHorizontally
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
CA_EXTERN NSString * const kCAScrollBoth
    __OSX_AVAILABLE_STARTING (__MAC_10_5, __IPHONE_2_0);
