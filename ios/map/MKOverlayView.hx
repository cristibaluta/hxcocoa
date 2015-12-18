package ios.map;

import objc.foundation.NSObject;
import objc.location.CLLocation;
import objc.graphics.CGGeometry;
import objc.graphics.CGContext;
import ios.map.MKGeometry;
import ios.ui.UIView;


extern class MKOverlayView extends UIView {

	public function initWithOverlay (overlay:MKOverlay) :Void;

	public var overlay :MKOverlay;

// Convert screen points relative to this view to absolute MKMapPoints
	public function pointForMapPoint (mapPoint:MKMapPoint) :CGPoint;
	public function mapPointForPoint (point:CGPoint) :MKMapPoint;

	public function rectForMapRect (mapRect:MKMapRect) :CGRect;
	public function mapRectForRect (rect:CGRect) :MKMapRect;

// Return YES if the view is currently ready to draw in the specified rect.
// Return NO if the view will not draw in the specified rect or if the
// data necessary to draw in the specified rect is not available.  In the 
// case where the view may want to draw in the specified rect but the data is
// not available, use setNeedsDisplayInMapRect:zoomLevel: to signal when the
// data does become available.
	public function canDrawMapRect (mapRect:MKMapRect, zoomScale:MKZoomScale) :Bool;

	public function drawMapRect (mapRect:MKMapRect, zoomScale:MKZoomScale, inContext:CGContextRef) :Void;

	@:overload(function (mapRect:MKMapRect) :Void{})
	public function setNeedsDisplayInMapRect (mapRect:MKMapRect, zoomScale:MKZoomScale) :Void;
	
	// Road widths are typically not drawn to scale on the map.  This function
	// returns the approximate width in points of roads at the specified zoomScale.
	// The result of this function is suitable for use with CGContextSetLineWidth.
	public static function MKRoadWidthAtZoomScale (zoomScale:MKZoomScale) :Float;
}
