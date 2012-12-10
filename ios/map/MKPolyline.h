//
//  MKPolyline.h
//  MapKit
//
//  Copyright (c) 2010-2012, Apple Inc. All rights reserved.
//

#import <MapKit/MKMultiPoint.h>
#import <MapKit/MKOverlay.h>
#import <MapKit/MKFoundation.h>

MK_CLASS_AVAILABLE(NA, 4_0)
extern class MKPolyline : MKMultiPoint <MKOverlay>

+ (MKPolyline *)polylineWithPoints:(MKMapPoint *)points count:(NSUInteger)count;
+ (MKPolyline *)polylineWithCoordinates:(CLLocationCoordinate2D *)coords count:(NSUInteger)count;

}
