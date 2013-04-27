/*
    NSLevelIndicatorCell.h
    Application Kit
    Copyright (c) 2004-2011, Apple Inc.
    All rights reserved.
*/

#import <AppKit/NSControl.h>
#import <AppKit/NSLevelIndicatorCell.h>


extern class NSLevelIndicator extends NSControl {
}

- (double)minValue;
- (void)setMinValue:(double)minValue;

- (double)maxValue;
- (void)setMaxValue:(double)maxValue;

- (double)warningValue;
- (void)setWarningValue:(double)warningValue;

- (double)criticalValue;
- (void)setCriticalValue:(double)criticalValue;

- (NSTickMarkPosition)tickMarkPosition;
- (void)setTickMarkPosition:(NSTickMarkPosition)position;

- (Int)numberOfTickMarks;
- (void)setNumberOfTickMarks:(Int)count;

- (Int)numberOfMajorTickMarks;
- (void)setNumberOfMajorTickMarks:(Int)count;

- (double)tickMarkValueAtIndex:(Int)index;
- (NSRect)rectOfTickMarkAtIndex:(Int)index;

}

