//
//  MKUserTrackingBarButtonItem.h
//  MapKit
//
//  Copyright (c) 2010-2012, Apple Inc. All rights reserved.
//

#import <UIKit/UIBarButtonItem.h>
#import <MapKit/MKFoundation.h>

@class MKMapView;

MK_CLASS_AVAILABLE(NA, 5_0)
extern class MKUserTrackingBarButtonItem : UIBarButtonItem {

}

- (id)initWithMapView:(MKMapView *)mapView;
	public var MKMapView *mapView;

}
