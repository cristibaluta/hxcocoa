//
//  UIAccelerometer.h
package ios.ui;
//
//  Copyright (c) 2007-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>

/* UIAcceleration and UIAccelerometer are deprecated as of iOS 5.0. These classes have been replaced by the Core Motion framework. These classes will be marked with formal deprecation attributes in a future release of iOS.
 */

typedef double UIAccelerationValue;

extern interface UIAccelerometerDelegate;

@:require(2_0)
extern class UIAcceleration : NSObject {
  @private
    NSTimeInterval timestamp;
    UIAccelerationValue x, y, z;
}

	public var (default, null) NSTimeInterval timestamp;
	public var (default, null) UIAccelerationValue x;
	public var (default, null) UIAccelerationValue y;
	public var (default, null) UIAccelerationValue z;

}

@:require(2_0)
extern class UIAccelerometer : NSObject {
  @private
    NSTimeInterval               _updateInterval;
    id <UIAccelerometerDelegate> _delegate;
    struct {
        unsigned int delegateDidAccelerate:1;
        unsigned int reserved:31;
    } _accelerometerFlags;
}

+ (UIAccelerometer *)sharedAccelerometer;

	public var  NSTimeInterval updateInterval; //May be capped at a minimum interval
	public var  id<UIAccelerometerDelegate> delegate;

}

extern interface UIAccelerometerDelegate<NSObject>
@optional

	public function accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration NS_DEPRECATED_IOS(2_0, 5_0);

}
