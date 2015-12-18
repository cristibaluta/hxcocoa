#if ios
package objc.location;

import objc.location.CLLocation;
import objc.foundation.NSObject;


// geocoding handler, CLPlacemarks are provided in order of most confident to least confident
typedef CLGeocodeCompletionHandler = Array<CLPlacemarks>->NSError->Void;// Objc block

@:framework("CoreLocation")
extern class CLGeocoder extends NSObject {
	
	public var geocoding :Bool;

	public function reverseGeocodeLocation (location:CLLocation, completionHandler:CLGeocodeCompletionHandler) :Void;
	public function geocodeAddressDictionary (addressDictionary:NSDictionary, completionHandler:CLGeocodeCompletionHandler) :Void;
	public function geocodeAddressString (addressString:String, completionHandler:CLGeocodeCompletionHandler) :Void;
	public function geocodeAddressString (addressString:String, inRegion:CLRegion, completionHandler:CLGeocodeCompletionHandler) :Void;
	public function cancelGeocode () :Void;

}
#end
