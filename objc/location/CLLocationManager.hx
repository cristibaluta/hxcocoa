
/*
 *  CLLocationManager.h
 *  CoreLocation
 *
 *  Copyright (c) 2008-2010 Apple Inc. All rights reserved.
 *
 */
package objc.location;

import objc.foundation.NSObject;
import objc.foundation.NSSet;
import objc.location.CLLocation;

/*
 *  CLDeviceOrientation
 *  
 *  Discussion:
 *      Specifies a physical device orientation, equivalent to UIDeviceOrientation.
 *      
 */
extern enum CLDeviceOrientation {
	CLDeviceOrientationUnknown;
	CLDeviceOrientationPortrait;
	CLDeviceOrientationPortraitUpsideDown;
	CLDeviceOrientationLandscapeLeft;
	CLDeviceOrientationLandscapeRight;
	CLDeviceOrientationFaceUp;
	CLDeviceOrientationFaceDown;
}

/*
 *  CLAuthorizationStatus
 *  
 *  Discussion:
 *      Represents the current authorization state of the application.
 *      
 */
extern enum CLAuthorizationStatus {
    kCLAuthorizationStatusNotDetermined; // User has not yet made a choice with regards to this application
    kCLAuthorizationStatusRestricted;        // This application is not authorized to use location services.  Due
                                             // to active restrictions on location services, the user cannot change
                                             // this status, and may not have personally denied authorization
    kCLAuthorizationStatusDenied;            // User has explicitly denied authorization for this application, or
                                             // location services are disabled in Settings
    kCLAuthorizationStatusAuthorized;         // User has authorized this application to use location services
}

/*
 *	CLActivityType
 *
 *  Discussion:
 *		Enumerates the different possible activity types. This currently
 *		affects behavior such as the determination of when location updates
 *		may be automatically paused.
 */
extern enum CLActivityType {
    CLActivityTypeOther;
    CLActivityTypeAutomotiveNavigation;	// for automotive navigation
    CLActivityTypeFitness;				// includes any pedestrian activities
    CLActivityTypeOtherNavigation; 		// for other navigation cases (excluding pedestrian navigation), e.g. navigation for boats, trains, or planes
}

/*
 *  CLLocationManager
 *  
 *  Discussion:
 *    The CLLocationManager object is your entry point to the location service.
 */
@:framework("CoreLocation")
extern class CLLocationManager extends NSObject {

/*
 *  locationServicesEnabled
 *
 *  Discussion:
 *      Determines whether the user has location services enabled.
 *      If NO, and you proceed to call other CoreLocation API, user will be prompted with the warning
 *      dialog. You may want to check this property and use location services only when explicitly requested by the user.
 */
	public static function locationServicesEnabled () :Bool;

/*
 *  headingAvailable
 *
 *  Discussion:
 *      Returns YES if the device supports the heading service, otherwise NO.
 */
	public static function headingAvailable () :Bool;

/*
 *  significantLocationChangeMonitoringAvailable
 *  
 *  Discussion:
 *      Returns YES if the device supports significant location change monitoring, otherwise NO.
 */
	public static function significantLocationChangeMonitoringAvailable () :Bool;

/*
 *  regionMonitoringAvailable
 *  
 *  Discussion:
 *      Determines whether the device supports region monitoring.
 *      If NO, all attempts to monitor regions will fail.
 */
	public static function regionMonitoringAvailable () :Bool;

/*
 *  regionMonitoringEnabled
 *  
 *  Discussion:
 *      Deprecated. Use +regionMonitoringAvailable and +authorizationStatus instead.
 */
	//public static function regionMonitoringEnabled () :Bool;

/*
 *  authorizationStatus
 *  
 *  Discussion:
 *      Returns the current authorization status of the calling application.
 */
	public static function authorizationStatus () :CLAuthorizationStatus;

	public var delegate :CLLocationManagerDelegate;

/*
 *	activityType
 *
 *  Discussion:
 *		Specifies the type of user activity. Currently affects behavior such as
 *		the determination of when location updates may be automatically paused.
 *		By default, CLActivityTypeOther is used.
 */
	@:require(ios6_0) public var activityType :CLActivityType;

/*
 *  distanceFilter
 *  
 *  Discussion:
 *      Specifies the minimum update distance in meters. Client will not be notified of movements of less 
 *      than the stated value, unless the accuracy has improved. Pass in kCLDistanceFilterNone to be 
 *      notified of all movements. By default, kCLDistanceFilterNone is used.
 */
	public var distanceFilter :CLLocationDistance;

/*
 *  desiredAccuracy
 *  
 *  Discussion:
 *      The desired location accuracy. The location service will try its best to achieve
 *      your desired accuracy. However, it is not guaranteed. To optimize
 *      power performance, be sure to specify an appropriate accuracy for your usage scenario (eg,
 *      use a large accuracy value when only a coarse location is needed). Use kCLLocationAccuracyBest to
 *      achieve the best possible accuracy. Use kCLLocationAccuracyBestForNavigation for navigation.
 *      By default, kCLLocationAccuracyBest is used.
 */
	public var desiredAccuracy :CLLocationAccuracy;

/*
 *	pausesLocationUpdatesAutomatically
 *
 *  Discussion:
 *		Specifies that location updates may automatically be paused when possible.
 *		By default, this is YES for applications linked against iOS 6.0 or later.
 */
	@:require(ios6_0) public var pausesLocationUpdatesAutomatically :Bool;

/*
 *  location
 *  
 *  Discussion:
 *      The last location received. Will be nil until a location has been received.
 */
	public var (default, null) location :CLLocation;

/*
 *  headingFilter
 *  
 *  Discussion:
 *      Specifies the minimum amount of change in degrees needed for a heading service update. Client will not
 *      be notified of updates less than the stated filter value. Pass in kCLHeadingFilterNone to be
 *      notified of all updates. By default, 1 degree is used.
 */
	public var headingFilter :CLLocationDegrees;

/*
 *  headingOrientation
 *  
 *  Discussion:
 *      Specifies a physical device orientation from which heading calculation should be referenced. By default,
 *      CLDeviceOrientationPortrait is used. CLDeviceOrientationUnknown, CLDeviceOrientationFaceUp, and
 *      CLDeviceOrientationFaceDown are ignored.
 *      
 */
	public var headingOrientation :CLDeviceOrientation;

/*
 *  heading
 *  
 *  Discussion:
 *      Returns the latest heading update received, or nil if none is available.
 */
	public var heading :CLHeading;

/*
 *  maximumRegionMonitoringDistance
 *  
 *  Discussion:
 *       the maximum region size, in terms of a distance from a central point, that the framework can support.
 *       Attempts to register a region larger than this will generate a kCLErrorRegionMonitoringFailure.
 *       This value may vary based on the hardware features of the device, as well as on dynamically changing resource constraints.
 */
	public var maximumRegionMonitoringDistance :CLLocationDistance;

/*
 *  monitoredRegions
 *  
 *  Discussion:
 *       Retrieve a set of objects for the regions that are currently being monitored.  If any location manager
 *       has been instructed to monitor a region, during this or previous launches of your application, it will
 *       be present in this set.
 */
	public var (default, null) monitoredRegions :NSSet;

/*
 *  startUpdatingLocation
 *  
 *  Discussion:
 *      Start updating locations.
 */
	public function startUpdatingLocation () :Void;

/*
 *  stopUpdatingLocation
 *  
 *  Discussion:
 *      Stop updating locations.
 */
	public function stopUpdatingLocation () :Void;

/*
 *  startUpdatingHeading
 *
 *  Discussion:
 *      Start updating heading.
 */
	public function startUpdatingHeading () :Void;

/*
 *  stopUpdatingHeading
 *
 *  Discussion:
 *      Stop updating heading.
 */
	public function stopUpdatingHeading () :Void;

/*
 *  dismissHeadingCalibrationDisplay
 *  
 *  Discussion:
 *      Dismiss the heading calibration immediately.
 */
	public function dismissHeadingCalibrationDisplay () :Void;

/*
 *  startMonitoringSignificantLocationChanges
 *
 *  Discussion:
 *      Start monitoring significant location changes.  The behavior of this service is not affected by the desiredAccuracy
 *      or distanceFilter properties.  Locations will be delivered through the same delegate callback as the standard
 *      location service.
 *
 */
	public function startMonitoringSignificantLocationChanges () :Void;

/*
 *  stopMonitoringSignificantLocationChanges
 *
 *  Discussion:
 *      Stop monitoring significant location changes.
 *
 */
	public function stopMonitoringSignificantLocationChanges () :Void;

/*
 *  startMonitoringForRegion:desiredAccuracy:
 *
 *  Discussion:
 *      Start monitoring the specified region.  desiredAccuracy represents the distance past the border of the region at
 *      which the application would like to be notified that the region border has been crossed.  This is useful to prevent
 *      repeated notifications when the user is on the border of the region.  This value will be honored on a best-effort basis,
 *      and may not be respected if desiredAccuracy is large with respect to the size of the region, or if the device is not
 *      capable of providing the precision desired.
 *
 *      If a region with the same identifier is already being monitored for this application, it will be removed from monitoring.
 *
 *      This is done asynchronously and may not be immediately reflected in monitoredRegions.
 */
	public function startMonitoringForRegion (region:CLRegion, desiredAccuracy:CLLocationAccuracy) :Void;
	
/*
 *  stopMonitoringForRegion:
 *
 *  Discussion:
 *      Stop monitoring the specified region.  It is valid to call stopMonitoringForRegion: for a region that was registered
 *      for monitoring with a different location manager object, during this or previous launches of your application.
 *
 *      This is done asynchronously and may not be immediately reflected in monitoredRegions.
 */
	public function stopMonitoringForRegion (region:CLRegion) :Void;

/*
 *  startMonitoringForRegion:
 *
 *  Discussion:
 *      Start monitoring the specified region.
 *
 *      If a region with the same identifier is already being monitored for this application, it will be removed from monitoring.
 *      The region monitoring service will prioritize regions by their sizes, favoring smaller regions over larger regions.
 *
 *      This is done asynchronously and may not be immediately reflected in monitoredRegions.
 */
	@:require(ios5_0) public function startMonitoringForRegion (region:CLRegion) :Void;

/*
 *	allowDeferredLocationUpdatesUntilTraveled:timeout:
 *
 *	Discussion:
 *		Indicate that the application will allow the location manager to defer
 *		location updates until an exit criterion is met. This may allow the
 *		device to enter a low-power state in which updates are held for later
 *		delivery. Once an exit condition is met, the location manager will
 *		continue normal updates until this method is invoked again.
 *
 *		Exit conditions, distance and timeout, can be specified using the constants
 *		CLLocationDistanceMax and CLTimeIntervalMax, respectively, if you are
 *		trying to achieve an unlimited distance or timeout.
 *
 *		The CLLocationManagerDelegate will continue to receive normal updates as
 *		long as the application remains in the foreground. While the process is
 *		in the background, the device may be able to enter a low-power state for
 *		portions of the specified distance and time interval. While in this
 *		state, locations will be coalesced for later delivery.
 *
 *		Location updates will be deferred as much as is reasonable to save
 *		power. If another process is using location, the device may not enter a
 *		low-power state and instead updates will continue normally. Deferred
 *		updates may be interspersed with normal updates if the device exits and
 *		re-enters a low-power state.
 *
 *		All location updates, including deferred updates, will be delivered via
 *		the delegate callback locationManager:didUpdateLocations:
 *
 *		When deferred updates have ended, the manager will invoke the delegate
 *		callback locationManagerDidFinishDeferredUpdates:withError:. An error
 *		will be returned if the manager will not defer updates and the exit
 *		criteria have not been met.
 */
	@:require(ios6_0) public function allowDeferredLocationUpdatesUntilTraveled (distance:CLLocationDistance, timeout:Float) :Void;

/*
 *	disallowDeferredLocationUpdates
 *
 *	Discussion:
 *		Disallow deferred location updates if previously enabled. Any outstanding
 *		updates will be sent and regular location updates will resume.
 */
	@:require(ios6_0) public function disallowDeferredLocationUpdates () :Void;

/*
 *  deferredLocationUpdatesAvailable
 *
 *  Discussion:
 *      Returns YES if the device supports deferred location updates, otherwise NO.
 */
	@:require(ios6_0) public static function deferredLocationUpdatesAvailable () :Bool;

}
