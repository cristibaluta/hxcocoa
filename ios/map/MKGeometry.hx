package ios.map;

import swift.graphics.CGGeometry;
import swift.location.CLLocation;


typedef MKCoordinateSpan = {
    var latitudeDelta :CLLocationDegrees;
    var longitudeDelta :CLLocationDegrees;
}

typedef MKCoordinateRegion = {
	var center :CLLocationCoordinate2D;
	var span :MKCoordinateSpan;
}

// An MKMapPoint is a coordinate that has been projected for use on the
// two-dimensional map.  An MKMapPoint always refers to a place in the world
// and can be converted to a CLLocationCoordinate2D and back.
typedef MKMapPoint = {
    var x :Float;
    var y :Float;
}

typedef MKMapSize = {
    var width :Float;
    var height :Float;
}

typedef MKMapRect = {
    var origin :MKMapPoint;
    var size :MKMapSize;
}

// MKZoomScale provides a conversion factor between MKMapPoints and screen points.
// When MKZoomScale = 1, 1 screen point = 1 MKMapPoint.  When MKZoomScale is
// 0.5, 1 screen point = 2 MKMapPoints.
typedef MKZoomScale = Float;


extern class MKGeometry {

	@:c public static function MKCoordinateSpanMake(latitudeDelta:CLLocationDegrees, longitudeDelta:CLLocationDegrees) :MKCoordinateSpan;
	@:c public static function MKCoordinateRegionMake(centerCoordinate:CLLocationCoordinate2D, span:MKCoordinateSpan) :MKCoordinateRegion;
	@:c public static function MKCoordinateRegionMakeWithDistance (centerCoordinate:CLLocationCoordinate2D, latitudinalMeters:CLLocationDistance, longitudinalMeters:CLLocationDistance) :MKCoordinateRegion;


	@:c public static var MKMapSizeWorld :MKMapSize;
	// The rect that contains every map point in the world.
	@:c public static var MKMapRectWorld :MKMapRect;

	// Conversion between unprojected and projected coordinates
	@:c public static function MKMapPointForCoordinate(coordinate:CLLocationCoordinate2D) :MKMapPoint;
	@:c public static function MKCoordinateForMapPoint(mapPoint:MKMapPoint) :CLLocationCoordinate2D;

	// Conversion between distances and projected coordinates
	@:c public static function MKMetersPerMapPointAtLatitude(latitude:CLLocationDegrees) :CLLocationDistance;
	@:c public static function MKMapPointsPerMeterAtLatitude(latitude:CLLocationDegrees) :Float;

	@:c public static function MKMetersBetweenMapPoints(a:MKMapPoint, b:MKMapPoint) :CLLocationDistance;

	@:c public static var MKMapRectNull :MKMapRect;


	// Geometric operations on MKMapPoint/Size/Rect.  See CGGeometry.h for 
	// information on the Float versions of these functions.
	@:c public static function MKMapPointMake(x:Float, y:Float) :MKMapPoint;
	@:c public static function MKMapSizeMake(width:Float, height:Float) :MKMapSize;
	@:c public static function MKMapRectMake(x:Float, y:Float, width:Float, height:Float) :MKMapRect;
	@:c public static function MKMapRectGetMinX(rect:MKMapRect) :Float;
	@:c public static function MKMapRectGetMinY(rect:MKMapRect) :Float;
	@:c public static function MKMapRectGetMidX(rect:MKMapRect) :Float;
	@:c public static function MKMapRectGetMidY(rect:MKMapRect) :Float;
	@:c public static function MKMapRectGetMaxX(rect:MKMapRect) :Float;
	@:c public static function MKMapRectGetMaxY(rect:MKMapRect) :Float;
	@:c public static function MKMapRectGetWidth(rect:MKMapRect) :Float;
	@:c public static function MKMapRectGetHeight(rect:MKMapRect) :Float;
	@:c public static function MKMapPointEqualToPoint(point1:MKMapPoint, point2:MKMapPoint) :Bool;
	@:c public static function MKMapSizeEqualToSize(size1:MKMapSize, size2:MKMapSize) :Bool;
	@:c public static function MKMapRectEqualToRect(rect1:MKMapRect, rect2:MKMapRect) :Bool;
	@:c public static function MKMapRectIsNull(rect:MKMapRect) :Bool;
	@:c public static function MKMapRectIsEmpty(rect:MKMapRect) :Bool;
	@:c public static function MKStringFromMapPoint(point:MKMapPoint) :String;
	@:c public static function MKStringFromMapSize(size:MKMapSize) :String;
	@:c public static function MKStringFromMapRect(rect:MKMapRect) :String;

	@:c public static function MKMapRectUnion(rect1:MKMapRect, rect2:MKMapRect) :MKMapRect;
	@:c public static function MKMapRectIntersection(rect1:MKMapRect, rect2:MKMapRect) :MKMapRect;
	@:c public static function MKMapRectInset(rect:MKMapRect, dx:Float, dy:Float) :MKMapRect;
	@:c public static function MKMapRectOffset(rect:MKMapRect, dx:Float, dy:Float) :MKMapRect;
	@:c public static function MKMapRectDivide(rect:MKMapRect, slice:MKMapRect, remainder:MKMapRect, amount:Float, edge:CGRectEdge) :Void;

	@:c public static function MKMapRectContainsPoint(rect:MKMapRect, point:MKMapPoint) :Bool;
	@:c public static function MKMapRectContainsRect(rect1:MKMapRect, rect2:MKMapRect) :Bool;
	@:c public static function MKMapRectIntersectsRect(rect1:MKMapRect, rect2:MKMapRect) :Bool;

	@:c public static function MKCoordinateRegionForMapRect(rect:MKMapRect) :MKCoordinateRegion;

	@:c public static function MKMapRectSpans180thMeridian(rect:MKMapRect) :Bool;
	// For map rects that span the 180th meridian, this returns the portion of the rect
	// that lies outside of the world rect wrapped around to the other side of the
	// world.  The portion of the rect that lies inside the world rect can be 
	// determined with MKMapRectIntersection(rect, MKMapRectWorld).
	@:c public static function MKMapRectRemainder(rect:MKMapRect) :MKMapRect;
}

/*extern class NSValue (NSValueMapKitGeometryExtensions)

	public static function valueWithMKCoordinate (coordinate:CLLocationCoordinate2D) :NSValue;
	public static function valueWithMKCoordinateSpan (span:MKCoordinateSpan) :NSValue;

	public function MKCoordinateValue :CLLocationCoordinate2D;
	public function MKCoordinateSpanValue :MKCoordinateSpan;

}
*/