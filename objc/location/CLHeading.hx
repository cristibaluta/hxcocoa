package objc.location;
import objc.foundation.NSObject;
import objc.location.CLLocation;

typedef CLHeadingComponentValue = Float;
//extern const CLLocationDegrees kCLHeadingFilterNone;

@:framework("CoreLocation")
extern class CLHeading extends NSObject implements NSCopying implements NSCoding {

	public var magneticHeading :CLLocationDirection;
	public var trueHeading :CLLocationDirection;
	public var headingAccuracy :CLLocationDirection;
	public var x :CLHeadingComponentValue;
	public var y :CLHeadingComponentValue;
	public var z :CLHeadingComponentValue;
	public var timestamp :Date;
	public var description :String;

}
