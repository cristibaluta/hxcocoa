package objc.location;


enum CLError {
    kCLErrorLocationUnknown;         // location is currently unknown, but CL will keep trying
    kCLErrorDenied;                       // CL access has been denied (eg, user declined location use)
    kCLErrorNetwork;                      // general, network-related error
    kCLErrorHeadingFailure;               // heading could not be determined
    kCLErrorRegionMonitoringDenied;       // Location region monitoring has been denied by the user
    kCLErrorRegionMonitoringFailure;      // A registered region cannot be monitored
    kCLErrorRegionMonitoringSetupDelayed; // CL could not immediately initialize region monitoring
    kCLErrorRegionMonitoringResponseDelayed; // While events for this fence will be delivered, delivery will not occur immediately
    kCLErrorGeocodeFoundNoResult;         // A geocode request yielded no result
    kCLErrorGeocodeFoundPartialResult;    // A geocode request yielded a partial result
    kCLErrorGeocodeCanceled;              // A geocode request was cancelled
    kCLErrorDeferredFailed;               // Deferred mode failed
    kCLErrorDeferredNotUpdatingLocation;  // Deferred mode failed because location updates disabled or paused
    kCLErrorDeferredAccuracyTooLow;       // Deferred mode not supported for the requested accuracy
    kCLErrorDeferredDistanceFiltered;     // Deferred mode does not support distance filters
    kCLErrorDeferredCanceled;             // Deferred mode request canceled a previous request
}

//extern public static var kCLErrorUserInfoAlternateRegionKey :String;
