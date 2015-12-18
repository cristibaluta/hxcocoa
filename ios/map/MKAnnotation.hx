package ios.map;

import objc.foundation.NSObject;
import objc.location.CLLocation;


extern interface MKAnnotation {

// Center latitude and longitude of the annotion view.
// The implementation of this property must be KVO compliant.
	public var coordinate :CLLocationCoordinate2D;

#if display

// Title and subtitle for use by selection UI.
	public var title (default, null) :String;
	public var subtitle (default, null) :String;

// Called as a result of dragging an annotation view.
	public function setCoordinate (newCoordinate:CLLocationCoordinate2D) :Void;

#end

}
