//
//  UISegmentedControl.h
package ios.ui;
//
//  Copyright (c) 2005-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIControl.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UIApplication.h>
#import <UIKit/UIGeometry.h>
#import <UIKit/UIBarButtonItem.h>

typedef NS_ENUM(Int, UISegmentedControlStyle) {
    UISegmentedControlStylePlain,     // large plain
    UISegmentedControlStyleBordered,  // large bordered
    UISegmentedControlStyleBar,       // small button/nav bar style. tintable
    UISegmentedControlStyleBezeled,   // DEPRECATED. Do not use this style.
};

enum {
    UISegmentedControlNoSegment = -1   // segment index for no selected segment
};

typedef NS_ENUM(Int, UISegmentedControlSegment) {
    UISegmentedControlSegmentAny = 0,
    UISegmentedControlSegmentLeft = 1,   // The capped, leftmost segment. Only applies when numSegments > 1.
    UISegmentedControlSegmentCenter = 2, // Any segment between the left and rightmost segments. Only applies when numSegments > 2.
    UISegmentedControlSegmentRight = 3,  // The capped,rightmost segment. Only applies when numSegments > 1.
    UISegmentedControlSegmentAlone = 4,  // The standalone segment, capped on both ends. Only applies when numSegments = 1.
};

@class UIImage, UIColor;

extern class UISegmentedControl extends UIControl, implements NSObject>
{
  @private
  // Note: all instance variables will become private in the future. Do not access directly.
    NSMutableArray *_segments;
    NSInteger       _selectedSegment;
    NSInteger       _highlightedSegment;
    UIView*         _removedSegment;
    id              _delegate;
    UIColor        *_tintColor;
    UIBarStyle      _barStyle;
    id              _appearanceStorage;
    UIView         *_backgroundBarView;
    Float         _enabledAlpha;
    struct {
        unsigned int style:3;
        unsigned int size:2;
        unsigned int showsDisclosure:1;
        unsigned int delegateSelectedSegmentChanged:1;
        unsigned int delegateDisclosureButtonClicked:1;
        unsigned int delegateAlwaysNotifiesDelegateOfSegmentClicks:1;
        unsigned int momentaryClick:1;
        unsigned int dontAlwaysToggleForTwoSegments:1;
        unsigned int tracking:1;
        unsigned int mouseInside:1;
        unsigned int autosizeToFitSegments:1;
        unsigned int isSizingToFit:1;
        unsigned int autosizeText:1;
        unsigned int transparentBackground:1;
        unsigned int useProportionalWidthSegments:1;
        unsigned int translucentBackground:1;
        unsigned int appearanceNeedsUpdate:1;
    } _segmentedControlFlags;
}

- (id)initWithItems:(NSArray *)items; // items can be Strings or UIImages. control is automatically sized to fit content

	public var  UISegmentedControlStyle segmentedControlStyle; // default is UISegmentedControlStylePlain
	public var (nonatomic,getter=isMomentary) BOOL momentary;             // if set, then we don't keep showing selected state after tracking ends. default is NO
	public var (default, null) NSUInteger numberOfSegments;

// For segments whose width value is 0, setting this property to YES attempts to adjust segment widths based on their content widths. Default is NO.
	public var  BOOL apportionsSegmentWidthsByContent NS_AVAILABLE_IOS(5_0);

	public function insertSegmentWithTitle:(String *)title atIndex:(NSUInteger)segment animated:(BOOL)animated; // insert before segment number. 0..#segments. value pinned
	public function insertSegmentWithImage:(UIImage *)image  atIndex:(NSUInteger)segment animated:(BOOL)animated;
	public function removeSegmentAtIndex:(NSUInteger)segment animated:(BOOL)animated;
	public function removeAllSegments;

	public function setTitle:(String *)title forSegmentAtIndex:(NSUInteger)segment;      // can only have image or title, not both. must be 0..#segments - 1 (or ignored). default is nil
- (String *)titleForSegmentAtIndex:(NSUInteger)segment;

	public function setImage:(UIImage *)image forSegmentAtIndex:(NSUInteger)segment;       // can only have image or title, not both. must be 0..#segments - 1 (or ignored). default is nil
- (UIImage *)imageForSegmentAtIndex:(NSUInteger)segment;

	public function setWidth:(Float)width forSegmentAtIndex:(NSUInteger)segment;         // set to 0.0 width to autosize. default is 0.0
- (Float)widthForSegmentAtIndex:(NSUInteger)segment;

	public function setContentOffset:(CGSize)offset forSegmentAtIndex:(NSUInteger)segment; // adjust offset of image or text inside the segment. default is (0,0)
- (CGSize)contentOffsetForSegmentAtIndex:(NSUInteger)segment;

	public function setEnabled:(BOOL)enabled forSegmentAtIndex:(NSUInteger)segment;        // default is YES
- (BOOL)isEnabledForSegmentAtIndex:(NSUInteger)segment;

// ignored in momentary mode. returns last segment pressed. default is UISegmentedControlNoSegment until a segment is pressed
// the UIControlEventValueChanged action is invoked when the segment changes via a user event. set to UISegmentedControlNoSegment to turn off selection
	public var  NSInteger selectedSegmentIndex;

/* Default tintColor is nil. Only used if style is UISegmentedControlStyleBar or UISegmentedControlStyleBezeled
 */
	public var (nonatomic,retain) UIColor *tintColor UI_APPEARANCE_SELECTOR;

/* If backgroundImage is an image returned from -[UIImage resizableImageWithCapInsets:] the cap widths will be calculated from that information, otherwise, the cap width will be calculated by subtracting one from the image's width then dividing by 2. The cap widths will also be used as the margins for text placement. To adjust the margin use the margin adjustment methods.
 
 In general, you should specify a value for the normal state to be used by other states which don't have a custom value set.
 
 Similarly, when a property is dependent on the bar metrics (on the iPhone in landscape orientation, bars have a different height from standard), be sure to specify a value for UIBarMetricsDefault.
 In the case of the segmented control, appearance properties for UIBarMetricsLandscapePhone are only respected for segmented controls in the smaller navigation and toolbars that are used in landscape orientation on the iPhone.
 */
	public function setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR; 
- (UIImage *)backgroundImageForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

/* To customize the segmented control appearance you will need to provide divider images to go between two unselected segments (leftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal), selected on the left and unselected on the right (leftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal), and unselected on the left and selected on the right (leftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected).
 */
	public function setDividerImage:(UIImage *)dividerImage forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState barMetrics:(UIBarMetrics)barMetrics NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
- (UIImage *)dividerImageForLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState barMetrics:(UIBarMetrics)barMetrics  NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

/* You may specify the font, text color, text shadow color, and text shadow offset for the title in the text attributes dictionary, using the keys found in UIStringDrawing.h.
 */
	public function setTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
- (NSDictionary *)titleTextAttributesForState:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

/* For adjusting the position of a title or image within the given segment of a segmented control.
 */
	public function setContentPositionAdjustment:(UIOffset)adjustment forSegmentType:(UISegmentedControlSegment)leftCenterRightOrAlone barMetrics:(UIBarMetrics)barMetrics NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR; 
- (UIOffset)contentPositionAdjustmentForSegmentType:(UISegmentedControlSegment)leftCenterRightOrAlone barMetrics:(UIBarMetrics)barMetrics NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

}

