package ios.map;

import objc.foundation.NSObject;
import objc.location.CLLocation;
import objc.location.CLHeading;

extern class MKUserLocation extends NSObject /*implements MKAnnotation*/ {

// Returns YES if the user's location is being updated.
	public var updating (default, null) :Bool;

// Returns nil if the owning MKMapView's showsUserLocation is NO or the user's location has yet to be determined.
	public var location (default, null) :CLLocation;

// Returns nil if not in MKUserTrackingModeFollowWithHeading
	@:require(ios5_0) public var heading (default, null) :CLHeading;

// The title to be displayed for the user location annotation.
	public var title :String;

// The subtitle to be displayed for the user location annotation.
	public var subtitle :String;

}
