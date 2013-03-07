package objc.location;

import objc.foundation.NSObject;
import objc.location.CLLocation;

@:framework("CoreLocation")
extern class CLRegion extends NSObject implements NSCopying implements NSCoding {

/*
 *  initCircularRegionWithCenter:radius:identifier:
 *  
 *  Discussion:
 *    Initialize a region.  center gives the coordinates of center of the region, while radius gives
 *    the distance in meters between the center and the region's boundary. identifier is a description
 *    for the region that could be displayed to the user, and ideally should be chosen by the user.
 */
	public function initCircularRegionWithCenter (center:CLLocationCoordinate2D, radius:CLLocationDistance, identifier:String) :CLRegion;

/*
 *  center
 *  
 *  Discussion:
 *    Returns the coordinate of the center of the region.
 */
	public var (default, null) center :CLLocationCoordinate2D;

/*
 *  radius
 *  
 *  Discussion:
 *    Returns the radius of the region.
 */
	public var (default, null) radius :CLLocationDistance;

/*
 *  identifier
 *  
 *  Discussion:
 *    Returns the region's identifier.
 */
	public var (default, null) identifier :String;

/*
 *  containsCoordinate:
 *
 *  Discussion:
 *    Returns YES if the coordinate lies inside the region, and NO otherwise.
 */
	public function containsCoordinate (coordinate:CLLocationCoordinate2D) :Bool;

}
