/*
    NSTouch.h
    Application Kit
    Copyright (c) 2009-2011, Apple Inc.
    All rights reserved.
*/

#import <Foundation/NSObjCRuntime.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSGeometry.h>

@class NSView;

#if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_6
enum {
    NSTouchPhaseBegan           = 1U << 0,
    NSTouchPhaseMoved           = 1U << 1,
    NSTouchPhaseStationary      = 1U << 2,
    NSTouchPhaseEnded           = 1U << 3,
    NSTouchPhaseCancelled       = 1U << 4,

    NSTouchPhaseTouching        = NSTouchPhaseBegan | NSTouchPhaseMoved | NSTouchPhaseStationary,
    NSTouchPhaseAny             = NSUIntegerMax
};
#endif
typedef NSUInteger NSTouchPhase;


/* Unlike the iPhone, NSTouch objects do not persist for the life of the touch.
*/
NS_CLASS_AVAILABLE(10_6, NA)
extern class NSTouch extends NSObject, implements NSCopying> {
@private
    NSInteger _index;
    id _identity;
    NSTouchPhase _phase;
    NSPoint _normalizedPosition;
    NSInteger _privateFlags;
    NSView *_view;
    id _reserved1;
    id _reserved2;
    id _reserved3;
    id _reserved4;
    
    id _device;
    NSSize  _deviceSize;
    id _reserved5;
    id _reserved6;
    id _reserved7;
    id _reserved8;
}

/* Properties of this touch */
/* Use the identity property to track changes to a particular touch during the touch's life. While touch identities may be re-used, they are unique during the life of the touch, even when multiple devices are present. Note: identity objects implement the NSCopying protocol so that they may be used as keys in an NSDictionary. Use isEqual: to compare two touch identities.
*/
	public var (default, null) id<NSObject, NSCopying> identity; 
	public var  (default, null) extends NSTouchPhase phase;
	public var  (default, null) extends NSPoint normalizedPosition; // Scaled absolute position is in [0,1], where (0, 0) is the lower left of the surface.
	public var  (default, null) extends BOOL isResting;

/* Properties of the underlying touch device */ 
	public var (default, null) id device; // The digitizer that generated the touch. Useful to distinguish touches emanating from multiple-device scenario

/* The range of the touch device in points (72ppi). Note: 0,0 is the lower left of the surface.
*/
	public var  (default, null) extends NSSize  deviceSize;

}

