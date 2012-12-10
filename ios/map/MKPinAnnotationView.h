//
//  MKPinAnnotationView.h
//  MapKit
//
//  Copyright (c) 2009-2012, Apple Inc. All rights reserved.
//

#import <MapKit/MKAnnotationView.h>

enum {
    MKPinAnnotationColorRed = 0,
    MKPinAnnotationColorGreen,
    MKPinAnnotationColorPurple
};
typedef NSUInteger MKPinAnnotationColor;

@class MKPinAnnotationViewInternal;

MK_CLASS_AVAILABLE(NA, 3_0)
extern class MKPinAnnotationView : MKAnnotationView
{
@private
    MKPinAnnotationViewInternal *_pinInternal;
}

	public var MKPinAnnotationColor pinColor;

	public var BOOL animatesDrop;

}
