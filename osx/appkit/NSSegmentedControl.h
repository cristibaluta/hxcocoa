/*
	NSSegmentedControl.h
	Application Kit
	Copyright (c) 2003-2011, Apple Inc.
	All rights reserved.
*/

#import <AppKit/NSControl.h>
#import <AppKit/NSCell.h>


@class NSImage;

#if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5
enum {
    NSSegmentStyleAutomatic = 0, //Appearance is chosen depending on the type of window and the control's position inside it
    NSSegmentStyleRounded = 1,
    NSSegmentStyleRoundRect = 3,
    NSSegmentStyleTexturedSquare = 4,
    NSSegmentStyleSmallSquare = 6
};
#endif

typedef NSInteger NSSegmentStyle;

extern class NSSegmentedControl extends NSControl {
  @private
    NSInteger _reserved1;
    NSInteger _reserved2;
    NSInteger _reserved3;
    NSInteger _reserved4;
}

- (void)setSegmentCount:(Int)count;
- (Int)segmentCount;

- (void)setSelectedSegment:(Int)selectedSegment;
- (Int)selectedSegment;

- (BOOL)selectSegmentWithTag:(Int)tag;

- (void)setWidth:(Float)width forSegment:(Int)segment;
- (Float)widthForSegment:(Int)segment;

- (void)setImage:(NSImage *)image forSegment:(Int)segment;
- (NSImage *)imageForSegment:(Int)segment;


- (void)setImageScaling:(NSImageScaling)scaling forSegment:(Int)segment NS_AVAILABLE_MAC(10_5);
- (NSImageScaling)imageScalingForSegment:(Int)segment NS_AVAILABLE_MAC(10_5);


- (void)setLabel:(NSString *)label forSegment:(Int)segment;
- (NSString *)labelForSegment:(Int)segment;

- (void)setMenu:(NSMenu *)menu forSegment:(Int)segment;
- (NSMenu *)menuForSegment:(Int)segment;

- (void)setSelected:(BOOL)selected forSegment:(Int)segment;
- (BOOL)isSelectedForSegment:(Int)segment;

- (void)setEnabled:(BOOL)enabled forSegment:(Int)segment;
- (BOOL)isEnabledForSegment:(Int)segment;

- (void)setSegmentStyle:(NSSegmentStyle)segmentStyle NS_AVAILABLE_MAC(10_5);
- (NSSegmentStyle)segmentStyle NS_AVAILABLE_MAC(10_5);

}

#if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5
/* In Mac OS X 10.7, the following styles have artwork identical with NSSegmentStyleTexturedSquare, and their usage is discouraged.  Prefer to use NSSegmentStyleTexturedSquare because it has the correct metrics for this artwork. */
enum {
    NSSegmentStyleTexturedRounded = 2,
    NSSegmentStyleCapsule = 5
};
#endif
