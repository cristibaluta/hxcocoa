//
//  UIPinchGestureRecognizer.h
package ios.ui;
//
//  Copyright (c) 2008-2012, Apple Inc. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIGestureRecognizer.h>

// Begins:  when two touches have moved enough to be considered a pinch
// Changes: when a finger moves while two fingers remain down
// Ends:    when both fingers have lifted

extern class UIPinchGestureRecognizer extends UIGestureRecognizer {
  @package
    Float           _initialTouchDistance;
    Float           _initialTouchScale;
    NSTimeInterval    _lastTouchTime;
    Float           _velocity;
    Float           _previousVelocity;
    Float           _scaleThreshold;
    CGAffineTransform _transform;
    CGPoint           _anchorPoint;
    UITouch          *_touches[2];
    Float           _hysteresis;
    id                _transformAnalyzer;
    unsigned int      _endsOnSingleTouch:1;
}

	public var          Float scale;               // scale relative to the touch points in screen coordinates
	public var  (nonatomic,readonly) Float velocity;            // velocity of the pinch in scale/second

}
