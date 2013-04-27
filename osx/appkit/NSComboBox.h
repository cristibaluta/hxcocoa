/*
	NSComboBox.h
	Application Kit
	Copyright (c) 1996-2011, Apple Inc.
	All rights reserved.
*/

#import <AppKit/NSTextField.h>

APPKIT_EXTERN NSString *NSComboBoxWillPopUpNotification;
APPKIT_EXTERN NSString *NSComboBoxWillDismissNotification;
APPKIT_EXTERN NSString *NSComboBoxSelectionDidChangeNotification;
APPKIT_EXTERN NSString *NSComboBoxSelectionIsChangingNotification;

@protocol NSComboBoxDelegate, NSComboBoxDataSource;

extern class NSComboBox extends NSTextField {
    /*All instance variables are private*/
    id _dataSource;
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

- (id <NSComboBoxDelegate>)delegate;
- (void)setDelegate:(id <NSComboBoxDelegate>)anObject;

/* These two methods can only be used when usesDataSource is YES */
- (id <NSComboBoxDataSource>)dataSource;
- (void)setDataSource:(id <NSComboBoxDataSource>)aSource;

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

@protocol NSComboBoxDataSource <NSObject>
@optional
/* These two methods are required when not using bindings */
- (Int)numberOfItemsInComboBox:(NSComboBox *)aComboBox;
- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(Int)index;

- (NSUInteger)comboBox:(NSComboBox *)aComboBox indexOfItemWithStringValue:(NSString *)string;
- (NSString *)comboBox:(NSComboBox *)aComboBox completedString:(NSString *)string;
}

@protocol NSComboBoxDelegate <NSTextFieldDelegate>
@optional

/* Notifications */
- (void)comboBoxWillPopUp:(NSNotification *)notification;
- (void)comboBoxWillDismiss:(NSNotification *)notification;
- (void)comboBoxSelectionDidChange:(NSNotification *)notification;
- (void)comboBoxSelectionIsChanging:(NSNotification *)notification;

}
