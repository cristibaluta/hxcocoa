//
//  UIPickerView.h
package ios.ui;
//
//  Copyright (c) 2006-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIView.h>
#import <UIKit/UITableView.h>
#import <UIKit/UIKitDefines.h>

extern interface UIPickerViewDataSource, UIPickerViewDelegate;

extern class UIPickerView extends UIView, implements NSObject, UITableViewDataSource>
{ 
  @private
    NSMutableArray            *_tables;
    UIView                    *_topFrame;
    NSMutableArray            *_dividers;
    NSMutableArray            *_selectionBars;
    id<UIPickerViewDataSource> _dataSource;
    id<UIPickerViewDelegate>   _delegate;
    UIView                    *_backgroundView;
    NSInteger                  _numberOfComponents;
  @package
    struct {
        unsigned int needsLayout:1;
        unsigned int delegateRespondsToNumberOfComponentsInPickerView:1;
        unsigned int delegateRespondsToNumberOfRowsInComponent:1;
        unsigned int delegateRespondsToDidSelectRow:1;
        unsigned int delegateRespondsToViewForRow:1;
        unsigned int delegateRespondsToTitleForRow:1;
        unsigned int delegateRespondsToAttributedTitleForRow:1;
        unsigned int delegateRespondsToWidthForComponent:1;
        unsigned int delegateRespondsToRowHeightForComponent:1;
        unsigned int delegateRespondsToCheckableForRow:1;
        unsigned int showsSelectionBar:1;
        unsigned int allowsMultipleSelection:1;
        unsigned int allowSelectingCells:1;
        unsigned int soundsDisabled:1;
        unsigned int usesCheckedSelection:1;
        unsigned int skipsBackground:1;
    } _pickerViewFlags;
}

	public var  id<UIPickerViewDataSource> dataSource;                // default is nil. weak reference
	public var  id<UIPickerViewDelegate>   delegate;                  // default is nil. weak reference
	public var         BOOL                       showsSelectionIndicator;   // default is NO

// info that was fetched and cached from the data source and delegate
	public var (default, null) NSInteger numberOfComponents;
- (Int)numberOfRowsInComponent:(Int)component;
- (CGSize)rowSizeForComponent:(Int)component;

// returns the view provided by the delegate via pickerView:viewForRow:forComponent:reusingView:
// or nil if the row/component is not visible or the delegate does not implement 
// pickerView:viewForRow:forComponent:reusingView:
- (UIView *)viewForRow:(Int)row forComponent:(Int)component;

// Reloading whole view or single component
	public function reloadAllComponents;
	public function reloadComponent:(Int)component;

// selection. in this case, it means showing the appropriate row in the middle
	public function selectRow:(Int)row inComponent:(Int)component animated:(BOOL)animated;  // scrolls the specified row to center.

- (Int)selectedRowInComponent:(Int)component;                                   // returns selected row. -1 if nothing selected

}


extern interface UIPickerViewDataSource<NSObject>
@required

// returns the number of 'columns' to display.
- (Int)numberOfComponentsInPickerView:(UIPickerView *)pickerView;

// returns the # of rows in each component..
- (Int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(Int)component;
}


extern interface UIPickerViewDelegate<NSObject>
@optional

// returns width of column and height of row for each component. 
- (Float)pickerView:(UIPickerView *)pickerView widthForComponent:(Int)component;
- (Float)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(Int)component;

// these methods return either a plain String, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
// for the view versions, we cache any hidden and thus unused views and pass them back for reuse. 
// If you return back a different object, the old one will be released. the view will be centered in the row rect  
- (String *)pickerView:(UIPickerView *)pickerView titleForRow:(Int)row forComponent:(Int)component;
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(Int)row forComponent:(Int)component NS_AVAILABLE_IOS(6_0); // attributed title is favored if both methods are implemented
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(Int)row forComponent:(Int)component reusingView:(UIView *)view;

	public function pickerView:(UIPickerView *)pickerView didSelectRow:(Int)row inComponent:(Int)component;

}
