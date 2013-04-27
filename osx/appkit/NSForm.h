/*
	NSForm.h
	Application Kit
	Copyright (c) 1994-2011, Apple Inc.
	All rights reserved.
*/

#import <AppKit/NSMatrix.h>

@class NSFormCell;

extern class  NSForm extends NSMatrix

- (Int)indexOfSelectedItem;
- (void)setEntryWidth:(Float)width;
- (void)setInterlineSpacing:(Float)spacing;
- (void)setBordered:(BOOL)flag;
- (void)setBezeled:(BOOL)flag;
- (void)setTitleAlignment:(NSTextAlignment)mode;
- (void)setTextAlignment:(NSTextAlignment)mode;
- (void)setTitleFont:(NSFont *)fontObj;
- (void)setTextFont:(NSFont *)fontObj;
- (id)cellAtIndex:(Int)index;
- (void)drawCellAtIndex:(Int)index;
- (NSFormCell *)addEntry:(NSString *)title;
- (NSFormCell *)insertEntry:(NSString *)title atIndex:(Int)index;
- (void)removeEntryAtIndex:(Int)index;
- (Int)indexOfCellWithTag:(Int)aTag;
- (void)selectTextAtIndex:(Int)index;
- (void)setFrameSize:(NSSize)newSize;
- (void)setTitleBaseWritingDirection:(NSWritingDirection)writingDirection;
- (void)setTextBaseWritingDirection:(NSWritingDirection)writingDirection;
}
