/*
        NSBezierPath.h
        Application Kit
        Copyright (c) 1997-2011, Apple Inc.
        All rights reserved.
*/

#import <Foundation/NSObject.h>
#import <Foundation/NSGeometry.h>
#import <AppKit/NSFont.h>

@class NSAffineTransform;

enum {
    NSButtLineCapStyle = 0,
    NSRoundLineCapStyle = 1,
    NSSquareLineCapStyle = 2
};
typedef NSUInteger NSLineCapStyle;

enum {
    NSMiterLineJoinStyle = 0,
    NSRoundLineJoinStyle = 1,
    NSBevelLineJoinStyle = 2
};
typedef NSUInteger NSLineJoinStyle;

enum {
    NSNonZeroWindingRule = 0,
    NSEvenOddWindingRule = 1
};
typedef NSUInteger NSWindingRule;

enum {
    NSMoveToBezierPathElement,
    NSLineToBezierPathElement,
    NSCurveToBezierPathElement,
    NSClosePathBezierPathElement
};
typedef NSUInteger NSBezierPathElement;

extern class NSBezierPath extends NSObject, implements NSCopying, NSCoding>
{
    @private
    NSInteger _elementCount;
    NSInteger _elementMax;
    struct PATHSEGMENT *_head;
    NSInteger _lastSubpathIndex;
    void *_extraSegments;
    Float _lineWidth;
    NSRect _controlPointBounds;
    Float _miterLimit;
    Float _flatness;
    Float *_dashedLinePattern;
    NSUInteger _dashedLineCount;
    Float _dashedLinePhase;
    void *_path;
    NSInteger _extraSegmentCount;
    NSInteger _extraSegmentMax;
    id _private[2];
    struct {
        unsigned int _flags:8;
        unsigned int _pathState:2;

        unsigned int _unused:22;
    } _bpFlags;
}

// Creating common paths.

+ (NSBezierPath *)bezierPath;
+ (NSBezierPath *)bezierPathWithRect:(NSRect)rect;
+ (NSBezierPath *)bezierPathWithOvalInRect:(NSRect)rect;
+ (NSBezierPath *)bezierPathWithRoundedRect:(NSRect)rect xRadius:(Float)xRadius yRadius:(Float)yRadius NS_AVAILABLE_MAC(10_5);

// Immediate mode drawing of common paths.

+ (void)fillRect:(NSRect)rect;
+ (void)strokeRect:(NSRect)rect;
+ (void)clipRect:(NSRect)rect;
+ (void)strokeLineFromPoint:(NSPoint)point1 toPoint:(NSPoint)point2;
+ (void)drawPackedGlyphs:(const char *)packedGlyphs atPoint:(NSPoint)point;

// Default path rendering parameters.

+ (void)setDefaultMiterLimit:(Float)limit;
+ (Float)defaultMiterLimit;
+ (void)setDefaultFlatness:(Float)flatness;
+ (Float)defaultFlatness;

+ (void)setDefaultWindingRule:(NSWindingRule)windingRule;
+ (NSWindingRule)defaultWindingRule;
+ (void)setDefaultLineCapStyle:(NSLineCapStyle)lineCapStyle;
+ (NSLineCapStyle)defaultLineCapStyle;
+ (void)setDefaultLineJoinStyle:(NSLineJoinStyle)lineJoinStyle;
+ (NSLineJoinStyle)defaultLineJoinStyle;
+ (void)setDefaultLineWidth:(Float)lineWidth;
+ (Float)defaultLineWidth;

// Path construction.

- (void)moveToPoint:(NSPoint)point;
- (void)lineToPoint:(NSPoint)point;
- (void)curveToPoint:(NSPoint)endPoint
       controlPoint1:(NSPoint)controlPoint1
       controlPoint2:(NSPoint)controlPoint2;
- (void)closePath;

- (void)removeAllPoints;

// Relative path construction.

- (void)relativeMoveToPoint:(NSPoint)point;
- (void)relativeLineToPoint:(NSPoint)point;
- (void)relativeCurveToPoint:(NSPoint)endPoint
	       controlPoint1:(NSPoint)controlPoint1
	       controlPoint2:(NSPoint)controlPoint2;

// Path rendering parameters.

- (Float)lineWidth;
- (void)setLineWidth:(Float)lineWidth;
- (NSLineCapStyle)lineCapStyle;
- (void)setLineCapStyle:(NSLineCapStyle)lineCapStyle;
- (NSLineJoinStyle)lineJoinStyle;
- (void)setLineJoinStyle:(NSLineJoinStyle)lineJoinStyle;
- (NSWindingRule)windingRule;
- (void)setWindingRule:(NSWindingRule)windingRule;
- (Float)miterLimit;
- (void)setMiterLimit:(Float)miterLimit;
- (Float)flatness;
- (void)setFlatness:(Float)flatness;
- (void)getLineDash:(Float *)pattern count:(NSInteger *)count phase:(Float *)phase;
- (void)setLineDash:(const Float *)pattern count:(NSInteger)count phase:(Float)phase;

// Path operations.

- (void)stroke;
- (void)fill;
- (void)addClip;
- (void)setClip;

// Path modifications.

- (NSBezierPath *)bezierPathByFlatteningPath;
- (NSBezierPath *)bezierPathByReversingPath;

// Applying transformations.

- (void)transformUsingAffineTransform:(NSAffineTransform *)transform;

// Path info

- (BOOL)isEmpty;
- (NSPoint)currentPoint;
- (NSRect)controlPointBounds;
- (NSRect)bounds;

// Elements.

- (NSInteger)elementCount;

// `points' should contain space for at least three points.  `points'
// may be NULL.  In the case of NSCurveToBezierPathElement, the order
// of the points is controlPoint1 (points[0]), controlPoint2 (points[1]),
// endPoint (points[2]).
- (NSBezierPathElement)elementAtIndex:(NSInteger)index
		     associatedPoints:(NSPointArray)points;
// As above with points == NULL.
- (NSBezierPathElement)elementAtIndex:(NSInteger)index;
- (void)setAssociatedPoints:(NSPointArray)points atIndex:(NSInteger)index;

// Appending common paths

- (void)appendBezierPath:(NSBezierPath *)path;
- (void)appendBezierPathWithRect:(NSRect)rect;
- (void)appendBezierPathWithPoints:(NSPointArray)points count:(NSInteger)count;
- (void)appendBezierPathWithOvalInRect:(NSRect)rect;
- (void)appendBezierPathWithArcWithCenter:(NSPoint)center radius:(Float)radius
			       startAngle:(Float)startAngle
				 endAngle:(Float)endAngle
				clockwise:(BOOL)clockwise;
// As above with clockwise == NO. */	
- (void)appendBezierPathWithArcWithCenter:(NSPoint)center radius:(Float)radius
			       startAngle:(Float)startAngle
				 endAngle:(Float)endAngle;
- (void)appendBezierPathWithArcFromPoint:(NSPoint)point1
				 toPoint:(NSPoint)point2
				  radius:(Float)radius;
- (void)appendBezierPathWithGlyph:(NSGlyph)glyph inFont:(NSFont *)font;
- (void)appendBezierPathWithGlyphs:(NSGlyph *)glyphs count:(NSInteger)count
			    inFont:(NSFont *)font;
- (void)appendBezierPathWithPackedGlyphs:(const char *)packedGlyphs;
// Appends paths for a rounded rectangle.
- (void)appendBezierPathWithRoundedRect:(NSRect)rect xRadius:(Float)xRadius yRadius:(Float)yRadius NS_AVAILABLE_MAC(10_5);

// Hit detection.
- (BOOL)containsPoint:(NSPoint)point;
}

extern class NSBezierPath (NSBezierPathDeprecated)
- (BOOL)cachesBezierPath NS_DEPRECATED_MAC(10_0, 10_0);
- (void)setCachesBezierPath:(BOOL)flag NS_DEPRECATED_MAC(10_0, 10_0);
}

