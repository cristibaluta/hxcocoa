//
//  MKPoint.h
//  MapKit
//
//  Copyright (c) 2010-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKShape.h>
#import <MapKit/MKFoundation.h>
#import <CoreLocation/CLLocation.h>

MK_CLASS_AVAILABLE(NA, 4_0)
extern class MKPointAnnotation : MKShape {
@package
    CLLocationCoordinate2D _coordinate;
}

	public var CLLocationCoordinate2D coordinate;

}
