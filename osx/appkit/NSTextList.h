/*
        NSTextList.h
        Copyright (c) 2004-2011, Apple Inc.
        All rights reserved.

        Class to represent text lists.
*/

#import <Foundation/NSObject.h>


enum {
    NSTextListPrependEnclosingMarker = (1 << 0)
};

extern class NSTextList extends NSObject, implements NSObject, NSCopying> {
    /*All instance variables are private*/
    NSString *_markerFormat;
    NSUInteger _listFlags;
    NSInteger _startIndex;
    void *_listSecondary;
}

- (id)initWithMarkerFormat:(NSString *)format options:(NSUInteger)mask;
- (NSString *)markerFormat;
- (NSUInteger)listOptions;
- (NSString *)markerForItemNumber:(Int)itemNum;
- (void)setStartingItemNumber:(Int)itemNum NS_AVAILABLE_MAC(10_6);
- (Int)startingItemNumber NS_AVAILABLE_MAC(10_6);

}

