//
//  UIPrintPageRenderer.h
package ios.ui;
//
//  Copyright 2010-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKitDefines.h>

@class UIPrintFormatter;

@:require(4_2)extern class UIPrintPageRenderer extends NSObject {
  @private
    Float         _headerHeight;
    Float         _footerHeight;
    CGRect          _paperRect;
    CGRect          _printableRect;
    NSMutableArray *_printFormatters;
    CGContextRef    _printContext;
}

	public var  Float   headerHeight;   // top of contentRect from printableRect
	public var  Float   footerHeight;   // bottom of contentRect from printableRect

	public var (default, null) CGRect paperRect;      // complete paper rect. origin is (0,0)
	public var (default, null) CGRect printableRect;  // imageable area inside paper rect

public var  NSArray *printFormatters;
- (NSArray *)printFormattersForPageAtIndex:(Int)pageIndex;
	public function addPrintFormatter:(UIPrintFormatter *)formatter startingAtPageAtIndex:(Int)pageIndex;

- (Int)numberOfPages;                        // override point. called to get page count. default returns maximum page count needed for all formatters or 0
	public function prepareForDrawingPages:(NSRange)range;     // override point. default does nothing. called before requesting a set of pages to draw

	public function drawPageAtIndex:(Int)pageIndex inRect:(CGRect)printableRect;                         // override point. calls the various draw methods below
	public function drawPrintFormatter:(UIPrintFormatter *)printFormatter forPageAtIndex:(Int)pageIndex; // override point. calls each formatter to draw for that page.
	public function drawHeaderForPageAtIndex:(Int)pageIndex  inRect:(CGRect)headerRect;                  // override point. default does nothing
	public function drawContentForPageAtIndex:(Int)pageIndex inRect:(CGRect)contentRect;                 // override point. default does nothing
	public function drawFooterForPageAtIndex:(Int)pageIndex  inRect:(CGRect)footerRect;                  // override point. default does nothing

}
