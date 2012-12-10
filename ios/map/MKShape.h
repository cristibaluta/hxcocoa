//
//  MKShape.h
//  MapKit
//
//  Copyright (c) 2010-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>
#import <MapKit/MKFoundation.h>

MK_CLASS_AVAILABLE(NA, 4_0)
extern class MKShape extends NSObject <MKAnnotation> {
@package
    NSString *_title;
    NSString *_subtitle;
}

	public var NSString *title;
	public var NSString *subtitle;

}
