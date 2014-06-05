package ios.map;

import swift.location.CLLocation;
import ios.map.MKGeometry;


extern interface MKOverlay {

// From MKAnnotation, for areas this should return the centroid of the area.
	public var coordinate :CLLocationCoordinate2D;

// boundingMapRect should be the smallest rectangle that completely contains the overlay.
// For overlays that span the 180th meridian, boundingMapRect should have either a negative MinX or a MaxX that is greater than MKMapSizeWorld.width.
	public var boundingMapRect :MKMapRect;

#if display
// Implement intersectsMapRect to provide more precise control over when the view for the overlay should be shown.
// If omitted, MKMapRectIntersectsRect([overlay boundingRect], mapRect) will be used instead.
	public function intersectsMapRect (mapRect:MKMapRect) :Bool;
#end
}
