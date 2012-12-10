//
//  MKOverlayPathView.h
//  MapKit
//
//  Copyright (c) 2010-2012, Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MKOverlayView.h>
#import <MapKit/MKFoundation.h>

MK_CLASS_AVAILABLE(NA, 4_0)
extern class MKOverlayPathView : MKOverlayView {
@package
    UIColor *_fillColor;
    UIColor *_strokeColor;
    Float _lineWidth;
    CGLineJoin _lineJoin;
    CGLineCap _lineCap;
    Float _miterLimit;
    Float _lineDashPhase;
    NSArray *_lineDashPattern;
    
    CGPathRef _path;
}

	public var  (retain) UIColor *fillColor;
	public var  (retain) UIColor *strokeColor;

	public var  Float lineWidth; // defaults to 0, which is MKRoadWidthAtZoomScale(currentZoomScale)
	public var  CGLineJoin lineJoin; // defaults to kCGLineJoinRound
	public var  CGLineCap lineCap; // defaults to kCGLineCapRound
	public var  Float miterLimit; // defaults to 10
	public var  Float lineDashPhase; // defaults to 0
	public var  (copy) NSArray *lineDashPattern; // an array of NSNumbers, defaults to nil

// subclassers should override this to create a path and then set it on
// themselves with self.path = newPath;
- (void)createPath;
// returns cached path or calls createPath if path has not yet been created
	public var  CGPathRef path; // path will be retained
- (void)invalidatePath;

// subclassers may override these
- (void)applyStrokePropertiesToContext:(CGContextRef)context
                           atZoomScale:(MKZoomScale)zoomScale;
- (void)applyFillPropertiesToContext:(CGContextRef)context
                         atZoomScale:(MKZoomScale)zoomScale;
- (void)strokePath:(CGPathRef)path inContext:(CGContextRef)context;
- (void)fillPath:(CGPathRef)path inContext:(CGContextRef)context;

}
