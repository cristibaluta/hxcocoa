//
//  StringDrawing.h
package ios.ui;
//
//  Copyright (c) 2011-2012 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/NSAttributedString.h>
#import <UIKit/UIKitDefines.h>

@:require(6_0)extern class StringDrawingContext extends NSObject {
@private
}

// Minimum scale factor for drawWithRect:options:context: and boundingRectWithSize:options:context: methods. If this property is set, the extended string drawing methods will attempt to draw the attributed string in the giv'en bounds by proportionally scaling the font(s) in the attributed string
	public var  Float minimumScaleFactor;
// Minimum tracking adjustment for drawWithRect:options:context: and boundingRectWithSize:options:context: methods. If this property is set, the extended string drawing methods will attempt to draw the attributed string in the given bounds by adjusting the tracking between the glyphs in the attributed string
	public var  Float minimumTrackingAdjustment;

// actual scale factor used by the last drawing call where minimum scale factor was specified
	public var (default, null) Float actualScaleFactor;
// actual tracking adjustment used by the last drawing call where minimum tracking factor was specified
	public var (default, null) Float actualTrackingAdjustment;

// bounds of the string drawn by the previous invocation of drawWithRect:options:context:
	public var (default, null) CGRect totalBounds;

}

extern class NSAttributedString(StringDrawing)
- (CGSize)size NS_AVAILABLE_IOS(6_0);
	public function drawAtPoint:(CGPoint)point NS_AVAILABLE_IOS(6_0);
	public function drawInRect:(CGRect)rect NS_AVAILABLE_IOS(6_0);
}

typedef NS_ENUM(Int, StringDrawingOptions) {
    StringDrawingTruncatesLastVisibleLine = 1 << 5, // Truncates and adds the ellipsis character to the last visible line if the text doesn't fit into the bounds specified. Ignored if StringDrawingUsesLineFragmentOrigin is not also set.
    StringDrawingUsesLineFragmentOrigin = 1 << 0, // The specified origin is the line fragment origin, not the base line origin
    StringDrawingUsesFontLeading = 1 << 1, // Uses the font leading for calculating line heights
    StringDrawingUsesDeviceMetrics = 1 << 3, // Uses image glyph bounds instead of typographic bounds
} NS_ENUM_AVAILABLE_IOS(6_0);

extern class NSAttributedString (NSExtendedStringDrawing)
	public function drawWithRect:(CGRect)rect options:(StringDrawingOptions)options context:(StringDrawingContext *)context NS_AVAILABLE_IOS(6_0);
- (CGRect)boundingRectWithSize:(CGSize)size options:(StringDrawingOptions)options context:(StringDrawingContext *)context NS_AVAILABLE_IOS(6_0);
}
