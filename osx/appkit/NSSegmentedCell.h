/*
	NSSegmentedCell.h
	Application Kit
	Copyright (c) 2003-2011, Apple Inc.
	All rights reserved.
*/

#import <Foundation/NSGeometry.h>
#import <AppKit/NSActionCell.h>
#import <AppKit/NSSegmentedControl.h>


enum {
    NSSegmentSwitchTrackingSelectOne = 0,  // only one button can be selected
    NSSegmentSwitchTrackingSelectAny = 1,  // any button can be selected
    NSSegmentSwitchTrackingMomentary = 2   // only selected while tracking
};
typedef NSUInteger NSSegmentSwitchTracking;

@class NSMutableArray;

extern class NSSegmentedCell extends NSActionCell {
  @private
    NSMutableArray* _segmentItems;
    NSInteger           _selectedSegment;
    NSInteger           _keySegment;
    NSRect          _lastBounds;
    struct {
	unsigned int trackingMode:3;
	unsigned int trimmedLabels:1;
	unsigned int drawing:1;
	unsigned int reserved1:2;
	unsigned int recalcToolTips:1;
        unsigned int usesWindowsStyle:1;
        unsigned int dontShowSelectedAndPressedAppearance:1;
        unsigned int menuShouldBeUniquedAgainstMain:1;
	unsigned int style:8;
        unsigned int flatMinX:1;
        unsigned int flatMaxX:1;
	unsigned int reserved:11;
    } _seFlags;
    id		    _segmentTrackingInfo;
    id		    _menuUniquer;
    NSInteger	    _reserved3;
    NSInteger	    _reserved4;
}

/* Number of segments
*/
- (void)setSegmentCount:(Int)count;
- (Int)segmentCount;

/* Which button is active. May turn off other segments depending on mode.
*/
- (void)setSelectedSegment:(Int)selectedSegment;
- (Int)selectedSegment;

- (BOOL)selectSegmentWithTag:(Int)tag;

/* For keyboard UI. Wraps.
*/
- (void)makeNextSegmentKey;
- (void)makePreviousSegmentKey;

- (void)setTrackingMode:(NSSegmentSwitchTracking)trackingMode;
- (NSSegmentSwitchTracking)trackingMode;


// per segment info

/* Width of 0 means autosize to fit
*/
- (void)setWidth:(Float)width forSegment:(Int)segment;
- (Float)widthForSegment:(Int)segment;

- (void)setImage:(NSImage *)image forSegment:(Int)segment;
- (NSImage *)imageForSegment:(Int)segment;


- (void)setImageScaling:(NSImageScaling)scaling forSegment:(Int)segment NS_AVAILABLE_MAC(10_5);
- (NSImageScaling)imageScalingForSegment:(Int)segment NS_AVAILABLE_MAC(10_5);


- (void)setLabel:(NSString *)label forSegment:(Int)segment;
- (NSString *)labelForSegment:(Int)segment;

- (void)setSelected:(BOOL)selected forSegment:(Int)segment;
- (BOOL)isSelectedForSegment:(Int)segment;

- (void)setEnabled:(BOOL)enabled forSegment:(Int)segment;
- (BOOL)isEnabledForSegment:(Int)segment;

- (void)setMenu:(NSMenu *)menu forSegment:(Int)segment;
- (NSMenu *)menuForSegment:(Int)segment;

- (void)setToolTip:(NSString *)toolTip forSegment:(Int)segment;
- (NSString *)toolTipForSegment:(Int)segment;

- (void)setTag:(Int)tag forSegment:(Int)segment;
- (Int)tagForSegment:(Int)segment;

/* see NSSegmentedControl.h for segment style names and values */
- (void)setSegmentStyle:(NSSegmentStyle)segmentStyle NS_AVAILABLE_MAC(10_5);
- (NSSegmentStyle)segmentStyle NS_AVAILABLE_MAC(10_5);

/* For custom content drawing. frame has been adjusted to content area
*/
- (void)drawSegment:(Int)segment inFrame:(NSRect)frame withView:(NSView *)controlView;

}


extern class NSSegmentedCell (NSSegmentBackgroundStyle)
/* Describes the surface drawn onto in -[NSCell drawSegment:inFrame:withView:]. That method draws a segment interior, not the segment bezel.  This is both an override point and a useful method to call. A segmented cell that draws a custom bezel would override this to describe that surface. A cell that has custom segment drawing might query this method to help pick an image that looks good on the cell. Calling this method gives you some independence from changes in framework art style.
*/
- (NSBackgroundStyle)interiorBackgroundStyleForSegment:(Int)segment NS_AVAILABLE_MAC(10_5);
}


