package objc.location;

import objc.foundation.NSObject;

@:framework("CoreLocation")
external interface CLLocationManagerDelegate {

//@optional

/*
 *  locationManager:didUpdateToLocation:fromLocation:
 *  
 *  Discussion:
 *    Invoked when a new location is available. oldLocation may be nil if there is no previous location
 *    available.
 *
 *    This method is deprecated. If locationManager:didUpdateLocations: is
 *    implemented, this method will not be called.
 */
	@:require(ios6_0) public function locationManager (manager:CLLocationManager, didUpdateToLocation:CLLocation, fromLocation:CLLocation) :Void;

/*
 *  locationManager:didUpdateLocations:
 *
 *  Discussion:
 *    Invoked when new locations are available.  Required for delivery of
 *    deferred locations.  If implemented, updates will
 *    not be delivered to locationManager:didUpdateToLocation:fromLocation:
 *
 *    locations is an array of CLLocation objects in chronological order.
 */
	@:require(ios6_0) public function locationManager (manager:CLLocationManager, didUpdateLocations:Array<CLLocation>) :Void;

/*
 *  locationManager:didUpdateHeading:
 *  
 *  Discussion:
 *    Invoked when a new heading is available.
 */
	public function locationManager (manager:CLLocationManager, didUpdateHeading:CLHeading) :Void;

/*
 *  locationManagerShouldDisplayHeadingCalibration:
 *
 *  Discussion:
 *    Invoked when a new heading is available. Return YES to display heading calibration info. The display 
 *    will remain until heading is calibrated, unless dismissed early via dismissHeadingCalibrationDisplay.
 */
	public function locationManagerShouldDisplayHeadingCalibration (manager:CLLocationManager) :Bool;

/*
 *  locationManager:didEnterRegion:
 *
 *  Discussion:
 *    Invoked when the user enters a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
	public function locationManager (manager:CLLocationManager, didEnterRegion:CLRegion) :Void;

/*
 *  locationManager:didExitRegion:
 *
 *  Discussion:
 *    Invoked when the user exits a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
	public function locationManager (manager:CLLocationManager, didExitRegion:CLRegion) :Void;

/*
 *  locationManager:didFailWithError:
 *  
 *  Discussion:
 *    Invoked when an error has occurred. Error types are defined in "CLError.h".
 */
	public function locationManager (manager:CLLocationManager, didFailWithError:NSError) :Void;

/*
 *  locationManager:monitoringDidFailForRegion:withError:
 *  
 *  Discussion:
 *    Invoked when a region monitoring error has occurred. Error types are defined in "CLError.h".
 */
	public function locationManager (manager:CLLocationManager,	monitoringDidFailForRegion:CLRegion, withError:NSError) :Void;

/*
 *  locationManager:didChangeAuthorizationStatus:
 *  
 *  Discussion:
 *    Invoked when the authorization status changes for this application.
 */
	@:require(ios4_2) public function locationManager (manager:CLLocationManager, didChangeAuthorizationStatus:CLAuthorizationStatus) :Void;

/*
 *  locationManager:didStartMonitoringForRegion:
 *  
 *  Discussion:
 *    Invoked when a monitoring for a region started successfully.
 */
	@:require(ios5_0) public function locationManager (manager:CLLocationManager, didStartMonitoringForRegion:CLRegion) :Void;

/*
 *  Discussion:
 *    Invoked when location updates are automatically paused.
 */
	@:require(ios6_0) public function locationManagerDidPauseLocationUpdates (manager:CLLocationManager) :Void;

/*
 *  Discussion:
 *    Invoked when location updates are automatically resumed.
 *
 *    In the event that your application is terminated while suspended, you will
 *	  not receive this notification.
 */
	@:require(ios6_0) public function locationManagerDidResumeLocationUpdates (manager:CLLocationManager) :Void;

/*
 *  locationManager:didFinishDeferredUpdatesWithError:
 *
 *  Discussion:
 *    Invoked when deferred updates will no longer be delivered. Stopping
 *    location, disallowing deferred updates, and meeting a specified criterion
 *    are all possible reasons for finishing deferred updates.
 *
 *    An error will be returned if deferred updates end before the specified
 *    criteria are met (see CLError).
 */
	@:require(ios6_0) public function locationManager (manager:CLLocationManager, didFinishDeferredUpdatesWithError:NSError) :Void;

}
