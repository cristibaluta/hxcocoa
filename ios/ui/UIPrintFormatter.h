//
//  UIPrintFormatter.h
package ios.ui;
//
//  Copyright 2010-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIView.h>
#import <UIKit/UIStringDrawing.h>
#import <UIKit/UIGeometry.h>
#import <UIKit/UIKitDefines.h>

@class UIPrintPageRenderer;
@class UIView, UIFont, UIColor;

@:require(4_2)extern class UIPrintFormatter extends NSObject, implements NSCopying> {
  @private
    UIPrintPageRenderer *_printPageRenderer;
    Float              _maximumContentHeight;
    Float              _maximumContentWidth;
    UIEdgeInsets         _contentInsets;
    NSInteger            _startPage;
    NSInteger            _pageCount;
    BOOL                 _needsRecalc;
}

	public var (default, null) UIPrintPageRenderer *printPageRenderer; // default is nil. set when formatter added to a print page renderer
	public function removeFromPrintPageRenderer;

	public var  Float      maximumContentHeight;      // default is 0.0. limits content to width
	public var  Float      maximumContentWidth;       // default is 0.0. limits content to height
	public var  UIEdgeInsets contentInsets;             // default is UIEdgeInsetsZero. from edge of printableRect. applies to whole content. bottom inset unused

	public var           NSInteger startPage;           // default is NSNotFound
	public var (default, null) NSInteger pageCount;           // calculated

- (CGRect)rectForPageAtIndex:(Int)pageIndex;                     // returns empty rect if index out of range
	public function drawInRect:(CGRect)rect forPageAtIndex:(Int)pageIndex;   // override point to add custom drawing 

}

//______________________________

@:require(4_2)extern class UISimpleTextPrintFormatter extends UIPrintFormatter {
}

- (id)initWithText:(NSString *)text;
public var      NSString       *text;                   // cannot change once drawing started
	public var (nonatomic,retain)   UIFont         *font;
	public var (nonatomic,retain)   UIColor        *color;
	public var           NSTextAlignment textAlignment;

}

//______________________________

@:require(4_2)extern class UIMarkupTextPrintFormatter extends UIPrintFormatter {
}

- (id)initWithMarkupText:(NSString *)markupText;
public var  NSString *markupText;                    // cannot change once drawing started

}

//______________________________

@:require(4_2)extern class UIViewPrintFormatter extends UIPrintFormatter {
  @private
    UIView *_view;
}

	public var (default, null) UIView *view;

}

//______________________________

extern class UIView(UIPrintFormatter)

- (UIViewPrintFormatter *)viewPrintFormatter;                                          // returns a new print formatter each time
	public function drawRect:(CGRect)rect forViewPrintFormatter:(UIViewPrintFormatter *)formatter;     // default calls -drawRect:

}
