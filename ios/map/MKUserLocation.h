//
//  MKUserLocation.h
//  MapKit
//
//  Copyright (c) 2009-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>
#import <MapKit/MKFoundation.h>

@class CLLocation;
@class MKUserLocationInternal;

MK_CLASS_AVAILABLE(NA, 3_0)
extern class MKUserLocation extends NSObject <MKAnnotation> {
  @private
    MKUserLocationInternal *_internal;
}

// Returns YES if the user's location is being updated.
	public var  (readonly, nonatomic, getter=isUpdating) BOOL updating;

// Returns nil if the owning MKMapView's showsUserLocation is NO or the user's location has yet to be determined.
	public var  (readonly, retain, nonatomic) CLLocation *location;

// Returns nil if not in MKUserTrackingModeFollowWithHeading
	public var  (readonly, nonatomic, retain) CLHeading *heading NS_AVAILABLE(NA, 5_0);

// The title to be displayed for the user location annotation.
	public var NSString *title;

// The subtitle to be displayed for the user location annotation.
	public var NSString *subtitle;

}
