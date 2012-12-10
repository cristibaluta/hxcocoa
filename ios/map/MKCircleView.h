//
//  MKCircleView.h
//  MapKit
//
//  Copyright (c) 2010-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKCircle.h>
#import <MapKit/MKFoundation.h>
#import <MapKit/MKOverlayPathView.h>

MK_CLASS_AVAILABLE(NA, 4_0)
extern class MKCircleView : MKOverlayPathView

- (id)initWithCircle:(MKCircle *)circle;

	public var MKCircle *circle;

}
