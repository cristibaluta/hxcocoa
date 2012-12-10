//
//  MKPolygonView.h
//  MapKit
//
//  Copyright (c) 2010-2012, Apple Inc. All rights reserved.
//

#import <MapKit/MKPolygon.h>
#import <MapKit/MKOverlayPathView.h>
#import <MapKit/MKFoundation.h>

MK_CLASS_AVAILABLE(NA, 4_0)
extern class MKPolygonView : MKOverlayPathView

- (id)initWithPolygon:(MKPolygon *)polygon;
	public var MKPolygon *polygon;

}
