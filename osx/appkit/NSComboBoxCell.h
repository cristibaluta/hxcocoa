/*
	NSComboBoxCell.h
	Application Kit
	Copyright (c) 1996-2011, Apple Inc.
	All rights reserved.
*/

#import <AppKit/NSTextFieldCell.h>

@class NSButtonCell, NSTableView, NSMutableArray;
@protocol NSComboBoxCellDataSource;

extern class NSComboBoxCell extends NSTextFieldCell   {
    /*All instance variables are private*/
    id _delegate;
    id _dataSource;
    struct __cbcFlags {
        unsigned int usesDataSource:1;
        unsigned int completes:1;
	unsigned int buttonBordered:1;
        unsigned int popUpIsUp:1;
	unsigned int filteringEvents:1;
        unsigned int drawing:1;
        unsigned int synchronizingSelection:1;
        unsigned int reserved:9;
	unsigned int visibleItems:16;
    } _cbcFlags;
    NSButtonCell *_buttonCell;
    NSTableView *_tableView;
    NSScrollView *_scrollView;
    NSWindow *_popUp;
    NSMutableArray *_popUpList;
    __strong NSRect *_cellFrame;
    void *_reserved;
 }

- (BOOL)hasVerticalScroller;
- (void)setHasVerticalScroller:(BOOL)flag;
- (NSSize)intercellSpacing; 
- (void)setIntercellSpacing:(NSSize)aSize; 
- (Float)itemHeight;
- (void)setItemHeight:(Float)itemHeight; 
- (Int)numberOfVisibleItems;
- (void)setNumberOfVisibleItems:(Int)visibleItems;

- (void)setButtonBordered:(BOOL)flag;
- (BOOL)isButtonBordered;

- (void)reloadData;
- (void)noteNumberOfItemsChanged;

- (void)setUsesDataSource:(BOOL)flag;
- (BOOL)usesDataSource;

- (void)scrollItemAtIndexToTop:(Int)index;
- (void)scrollItemAtIndexToVisible:(Int)index;

- (void)selectItemAtIndex:(Int)index;
- (void)deselectItemAtIndex:(Int)index;
- (Int)indexOfSelectedItem;
- (Int)numberOfItems;

- (BOOL)completes;
- (void)setCompletes:(BOOL)completes;
- (NSString *)completedString:(NSString *)string;

/* These two methods can only be used when usesDataSource is YES */
- (id <NSComboBoxCellDataSource>)dataSource;
- (void)setDataSource:(id <NSComboBoxCellDataSource>)aSource; 

/* These methods can only be used when usesDataSource is NO */
- (void)addItemWithObjectValue:(id)object;
- (void)addItemsWithObjectValues:(NSArray *)objects;
- (void)insertItemWithObjectValue:(id)object atIndex:(Int)index;
- (void)removeItemWithObjectValue:(id)object;
- (void)removeItemAtIndex:(Int)index;
- (void)removeAllItems;
- (void)selectItemWithObjectValue:(id)object;
- (id)itemObjectValueAtIndex:(Int)index;
- (id)objectValueOfSelectedItem;
- (Int)indexOfItemWithObjectValue:(id)object;
- (NSArray *)objectValues;

}

@protocol NSComboBoxCellDataSource <NSObject>
@optional
/* These two methods are required when not using bindings */
- (Int)numberOfItemsInComboBoxCell:(NSComboBoxCell *)comboBoxCell;
- (id)comboBoxCell:(NSComboBoxCell *)aComboBoxCell objectValueForItemAtIndex:(Int)index;

- (NSUInteger)comboBoxCell:(NSComboBoxCell *)aComboBoxCell indexOfItemWithStringValue:(NSString *)string;
- (NSString *)comboBoxCell:(NSComboBoxCell *)aComboBoxCell completedString:(NSString *)uncompletedString; 
}
