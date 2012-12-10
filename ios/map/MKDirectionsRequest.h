//
//  MKDirectionsRequest.h
//  MapKit
//
//  Copyright (c) 2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKMapItem.h>

MK_CLASS_AVAILABLE(NA, 6_0)
extern class MKDirectionsRequest extends NSObject

	public var (default, null) MKMapItem *source;
	public var (default, null) MKMapItem *destination;

- (id)initWithContentsOfURL:(NSURL *)url;
+ (BOOL)isDirectionsRequestURL:(NSURL *)url;

}
