//
//  MKCircle.h
//  MapKit
//
//  Copyright (c) 2010-2012, Apple Inc. All rights reserved.
//

#import <MapKit/MKShape.h>
#import <MapKit/MKOverlay.h>
#import <MapKit/MKGeometry.h>
#import <MapKit/MKFoundation.h>

MK_CLASS_AVAILABLE(NA, 4_0)
extern class MKCircle : MKShape <MKOverlay> {
@package
    CLLocationCoordinate2D _coordinate;
    CLLocationDistance _radius;
    
    MKMapRect _boundingMapRect;
}

+ (MKCircle *)circleWithCenterCoordinate:(CLLocationCoordinate2D)coord
                                  radius:(CLLocationDistance)radius;

+ (MKCircle *)circleWithMapRect:(MKMapRect)mapRect; // radius will be determined from MAX(width, height)

	public var CLLocationCoordinate2D coordinate;
	public var CLLocationDistance radius;

	public var MKMapRect boundingMapRect; 

}
