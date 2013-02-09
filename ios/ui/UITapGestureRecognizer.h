//
//  UITapGestureRecognizer.h
package ios.ui;
//
//  Copyright (c) 2008-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIGestureRecognizer.h>

// Recognizes: when numberOfTouchesRequired have tapped numberOfTapsRequired times

// Touch Location Behaviors:
//     locationInView:         location of the tap, from the first tap in the sequence if numberOfTapsRequired > 1. this is the centroid if numberOfTouchesRequired > 1
//     locationOfTouch:inView: location of a particular touch, from the first tap in the sequence if numberOfTapsRequired > 1

extern class UITapGestureRecognizer extends UIGestureRecognizer {
  @package
    CGPoint      _locationInView;
    id           _imp;
    unsigned int _delaysRecognitionForGreaterTapCounts;
}

	public var NSUInteger  numberOfTapsRequired;       // Default is 1. The number of taps required to match
	public var NSUInteger  numberOfTouchesRequired;    // Default is 1. The number of fingers required to match

}
