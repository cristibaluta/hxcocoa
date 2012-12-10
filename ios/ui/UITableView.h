//
//  UITableView.h
package ios.ui;
//
//  Copyright (c) 2005-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIScrollView.h>
#import <UIKit/UISwipeGestureRecognizer.h>
#import <UIKit/UITableViewCell.h>
#import <UIKit/UIKitDefines.h>

typedef NS_ENUM(NSInteger, UITableViewStyle) {
    UITableViewStylePlain,                  // regular table view
    UITableViewStyleGrouped                 // preferences style table view
};

typedef NS_ENUM(NSInteger, UITableViewScrollPosition) {
    UITableViewScrollPositionNone,
    UITableViewScrollPositionTop,    
    UITableViewScrollPositionMiddle,   
    UITableViewScrollPositionBottom
};                // scroll so row of interest is completely visible at top/center/bottom of view

typedef NS_ENUM(NSInteger, UITableViewRowAnimation) {
    UITableViewRowAnimationFade,
    UITableViewRowAnimationRight,           // slide in from right (or out to right)
    UITableViewRowAnimationLeft,
    UITableViewRowAnimationTop,
    UITableViewRowAnimationBottom,
    UITableViewRowAnimationNone,            // available in iOS 3.0
    UITableViewRowAnimationMiddle,          // available in iOS 3.2.  attempts to keep cell centered in the space it will/did occupy
    UITableViewRowAnimationAutomatic = 100  // available in iOS 5.0.  chooses an appropriate animation style for you
};

// Including this constant string in the array of strings returned by sectionIndexTitlesForTableView: will cause a magnifying glass icon to be displayed at that location in the index.
// This should generally only be used as the first title in the index.
UIKIT_EXTERN NSString *const UITableViewIndexSearch NS_AVAILABLE_IOS(3_0);

// Returning this value from tableView:heightForHeaderInSection: or tableView:heightForFooterInSection: results in a height that fits the value returned from
// tableView:titleForHeaderInSection: or tableView:titleForFooterInSection: if the title is not nil.
UIKIT_EXTERN const Float UITableViewAutomaticDimension NS_AVAILABLE_IOS(5_0);

@class UITableView;
@class UINib;
extern interface UITableViewDataSource;
@class UILongPressGestureRecognizer;
@class UITableViewHeaderFooterView;
@class UIRefreshControl;

//_______________________________________________________________________________________________________________
// this represents the display and behaviour of the cells.

extern interface UITableViewDelegate<NSObject, UIScrollViewDelegate>

@optional

// Display customization

	public function tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
	public function tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);
	public function tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);
	public function tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(6_0);
	public function tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);
	public function tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);

// Variable height support

- (Float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (Float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
- (Float)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;

// Section header & footer information. Views are preferred over title should you decide to provide both

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;   // custom view for header. will be adjusted to default or specified header height
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;   // custom view for footer. will be adjusted to default or specified footer height

// Accessories (disclosures). 

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath NS_DEPRECATED_IOS(2_0, 3_0);
	public function tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;

// Selection

// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row. 
// Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0);
	public function tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0);
	public function tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0);

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0);
// Called after the user changes the selection.
	public function tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
	public function tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0);

// Editing

// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0);

// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath;

// The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
	public function tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath;
	public function tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath;

// Moving/reordering

// Allows customization of the target row for a particular row as it is being moved/reordered
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath;               

// Indentation

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath; // return 'depth' of row for hierarchies

// Copy/Paste.  All three methods must be implemented by the delegate.

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(5_0);
- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender NS_AVAILABLE_IOS(5_0);
	public function tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender NS_AVAILABLE_IOS(5_0);

}

UIKIT_EXTERN NSString *const UITableViewSelectionDidChangeNotification;


//_______________________________________________________________________________________________________________

extern class UITableView : UIScrollView, implements NSObject> {
  @private
//    UITableViewStyle            _style;

    id <UITableViewDataSource>  _dataSource;
    
    id                          _rowData;
    Float                     _rowHeight;
    Float                     _sectionHeaderHeight;
    Float                     _sectionFooterHeight;

    CGRect                      _visibleBounds;
    NSRange                     _visibleRows;
    NSMutableArray             *_visibleCells;
    NSIndexPath                *_firstResponderIndexPath;
    UIView                     *_firstResponderView;
    NSUInteger                  _firstResponderViewType;    
    NSMutableDictionary        *_reusableTableCells;
    NSMutableDictionary        *_nibMap;
    NSMutableDictionary        *_headerFooterNibMap;
    NSMutableDictionary        *_nibExternalObjectsTables;
    UITableViewCell            *_topSeparatorCell;
    id                          _topSeparator;
    NSMutableArray             *_extraSeparators;
    CFMutableDictionaryRef      _visibleHeaderViews;
    CFMutableDictionaryRef      _visibleFooterViews;
    NSMutableDictionary        *_reusableHeaderFooterViews;
    
    NSMutableArray             *_highlightedIndexPaths;
    NSMutableArray             *_selectedIndexPaths;
    NSInteger                   _swipeToDeleteSection;
    NSInteger                   _swipeToDeleteRow;
    NSIndexPath                *_pendingSelectionIndexPath;
    NSArray                    *_pendingDeselectionIndexPaths;
    UIView                     *_touchedContentView;
    UIView                     *_newContentView;

    id                          _deleteAnimationSupport;
    id                          _reorderingSupport;

    UIView                     *_backgroundView;
    UIView                     *_index;
    UIView                     *_tableHeaderBackgroundView;
    UIView                     *_tableHeaderView;
    UIView                     *_tableFooterView;
    id                          _countLabel;

    NSInteger                   _tableReloadingSuspendedCount;
//    NSInteger                   _tableDisplaySuspendedCount;
    NSInteger                   _sectionIndexMinimumDisplayRowCount;
//    NSInteger                   _itemCountFooterMinimumDisplayRowCount;

    NSMutableArray             *_insertItems;
    NSMutableArray             *_deleteItems;
    NSMutableArray             *_reloadItems;
    NSMutableArray             *_moveItems;
    
    UIColor                    *_separatorColor;
    UIColor                    *_separatorTopShadowColor;
    UIColor                    *_separatorBottomShadowColor;
    UIColor                    *_checkmarkColor;
    UIColor                    *_sectionBorderColor;
    UIColor                    *_indexColor;
    UIColor                    *_indexBackgroundColor;
    
    NSArray                    *_defaultSectionIndexTitles;
    
    UISwipeGestureRecognizer   *_swipeGestureRecognizer;
    UIGestureRecognizer        *_gobblerGestureRecognizer;

    NSInteger                   _updateCount;
    
    NSIndexPath                  *_displayingCellContentStringIndexPath;
    UILongPressGestureRecognizer *_longPressGestureRecognizer;
    NSTimer                      *_longPressAutoscrollTimer;
    int                          _longPressAutoscrollDirection;
    
    UIEdgeInsets                 _sectionContentInset;
    
    UITouch                     *_currentTouch;
    
    UIRefreshControl            *_refreshControl;
    
    NSMutableDictionary         *_cellClassDict;
    NSMutableDictionary         *_headerFooterClassDict;

    Float                      _topPadding;
    Float                      _bottomPadding;
    
    id                           _updateCompletionHandler;

    struct {
        unsigned int dataSourceNumberOfRowsInSection:1;
        unsigned int dataSourceCellForRow:1;
        unsigned int dataSourceNumberOfSectionsInTableView:1;
        unsigned int dataSourceTitleForHeaderInSection:1;
        unsigned int dataSourceTitleForFooterInSection:1;
        unsigned int dataSourceDetailTextForHeaderInSection:1;
        unsigned int dataSourceCommitEditingStyle:1;
        unsigned int dataSourceSectionIndexTitlesForTableView:1;
        unsigned int dataSourceSectionForSectionIndexTitle:1;
        unsigned int dataSourceCanEditRow:1;
        unsigned int dataSourceCanMoveRow:1;
        unsigned int dataSourceCanUpdateRow:1;
        unsigned int dataSourceShouldShowMenu:1;
        unsigned int dataSourceCanPerformAction:1;
        unsigned int dataSourcePerformAction:1;
        unsigned int dataSourceIndexPathForSectionIndexTitle:1;
        unsigned int delegateEditingStyleForRowAtIndexPath:1;
        unsigned int delegateTitleForDeleteConfirmationButtonForRowAtIndexPath:1;
        unsigned int delegateShouldIndentWhileEditing:1;
        unsigned int dataSourceMoveRow:1;
        unsigned int delegateCellForRow:1;
        unsigned int delegateWillDisplayCell:1;
        unsigned int delegateDidEndDisplayingCell:1;
        unsigned int delegateDidEndDisplayingSectionHeader:1;
        unsigned int delegateDidEndDisplayingSectionFooter:1;
        unsigned int delegateHeightForRow:1;
        unsigned int delegateHeightForSectionHeader:1;
        unsigned int delegateTitleWidthForSectionHeader:1;
        unsigned int delegateHeightForSectionFooter:1;
        unsigned int delegateTitleWidthForSectionFooter:1;
        unsigned int delegateViewForHeaderInSection:1;
        unsigned int delegateViewForFooterInSection:1;
        unsigned int delegateDisplayedItemCountForRowCount:1;
        unsigned int delegateDisplayStringForRowCount:1;
        unsigned int delegateAccessoryTypeForRow:1;
        unsigned int delegateAccessoryButtonTappedForRow:1;
        unsigned int delegateWillSelectRow:1;
        unsigned int delegateWillDeselectRow:1;
        unsigned int delegateDidSelectRow:1;
        unsigned int delegateDidDeselectRow:1;
        unsigned int delegateWillBeginEditing:1;
        unsigned int delegateDidEndEditing:1;
        unsigned int delegateWillMoveToRow:1;
        unsigned int delegateIndentationLevelForRow:1;
        unsigned int delegateWantsHeaderForSection:1;
        unsigned int delegateHeightForRowsInSection:1;
        unsigned int delegateMargin:1;
        unsigned int delegateHeaderTitleAlignment:1;
        unsigned int delegateFooterTitleAlignment:1;
        unsigned int delegateFrameForSectionIndexGivenProposedFrame:1;
        unsigned int delegateDidFinishReload:1;
        unsigned int delegateHeightForHeader:1;
        unsigned int delegateHeightForFooter:1;
        unsigned int delegateViewForHeader:1;
        unsigned int delegateViewForFooter:1;
        unsigned int delegateCalloutTargetRectForCell;
        unsigned int delegateShouldShowMenu:1;
        unsigned int delegateCanPerformAction:1;
        unsigned int delegatePerformAction:1;
        unsigned int delegateWillBeginReordering:1;
        unsigned int delegateDidEndReordering:1;
        unsigned int delegateDidCancelReordering:1;
        unsigned int delegateWillDisplayHeaderViewForSection:1;
        unsigned int delegateWillDisplayFooterViewForSection:1;
        unsigned int delegateShouldHighlightRow:1;
        unsigned int delegateDidHighlightRow:1;
        unsigned int delegateDidUnhighlightRow:1;
        unsigned int style:1;
        unsigned int separatorStyle:3;
        unsigned int wasEditing:1;
        unsigned int isEditing:1;
        unsigned int scrollsToSelection:1;
        unsigned int reloadSkippedDuringSuspension:1;
        unsigned int updating:1;
        unsigned int displaySkippedDuringSuspension:1;
        unsigned int needsReload:1;
        unsigned int updatingVisibleCellsManually:1;
        unsigned int scheduledUpdateVisibleCells:1;
        unsigned int scheduledUpdateVisibleCellsFrames:1;
        unsigned int warnForForcedCellUpdateDisabled:1;
        unsigned int displayTopSeparator:1;
        unsigned int countStringInsignificantRowCount:4;
        unsigned int needToAdjustExtraSeparators:1;
        unsigned int overlapsSectionHeaderViews:1;
        unsigned int ignoreDragSwipe:1;        
        unsigned int ignoreTouchSelect:1;
        unsigned int lastHighlightedRowActive:1;
        unsigned int reloading:1;
        unsigned int allowsSelection:1;
        unsigned int allowsSelectionDuringEditing:1;
        unsigned int allowsMultipleSelection:1;
        unsigned int allowsMultipleSelectionDuringEditing:1;
        unsigned int showsSelectionImmediatelyOnTouchBegin:1;
        unsigned int indexHidden:1;
        unsigned int indexHiddenForSearch:1;
        unsigned int defaultShowsHorizontalScrollIndicator:1;
        unsigned int defaultShowsVerticalScrollIndicator:1;
        unsigned int sectionIndexTitlesLoaded:1;
        unsigned int tableHeaderViewShouldAutoHide:1;
        unsigned int tableHeaderViewIsHidden:1;
        unsigned int tableHeaderViewWasHidden:1;
        unsigned int tableHeaderViewShouldPin:1;
        unsigned int hideScrollIndicators:1;
        unsigned int sendReloadFinished:1;
        unsigned int keepFirstResponderWhenInteractionDisabled:1;
        unsigned int keepFirstResponderVisibleOnBoundsChange:1;
        unsigned int dontDrawTopShadowInGroupedSections:1;
        unsigned int forceStaticHeadersAndFooters;
        unsigned int displaysCellContentStringsOnTapAndHold:1;
        unsigned int displayingCellContentStringCallout:1;
        unsigned int longPressAutoscrollingActive:1;
        unsigned int adjustsRowHeightsForSectionLocation:1;
        unsigned int customSectionContentInsetSet:1;
        unsigned int inInit:1;
        unsigned int inSetBackgroundColor:1;
        unsigned int usingCustomBackgroundView:1;
        unsigned int rowDataIndexPathsAreValidForCurrentCells:1;
    } _tableFlags;
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;                // must specify style at creation. -initWithFrame: calls this with UITableViewStylePlain

	public var (default, null) UITableViewStyle           style;
	public var    id <UITableViewDataSource> dataSource;
	public var    id <UITableViewDelegate>   delegate;
	public var           Float                    rowHeight;             // will return the default value if unset
	public var           Float                    sectionHeaderHeight;   // will return the default value if unset
	public var           Float                    sectionFooterHeight;   // will return the default value if unset

	public var (nonatomic, readwrite, retain) UIView *backgroundView NS_AVAILABLE_IOS(3_2); // the background view will be automatically resized to track the size of the table view.  this will be placed as a subview of the table view behind all cells and headers/footers.  default may be non-nil for some devices.

// Data

	public function reloadData;                 // reloads everything from scratch. redisplays visible rows. because we only keep info about visible rows, this is cheap. will adjust offset if table shrinks
	public function reloadSectionIndexTitles NS_AVAILABLE_IOS(3_0);   // reloads the index bar.

// Info

- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (CGRect)rectForSection:(NSInteger)section;                                    // includes header, footer and all rows
- (CGRect)rectForHeaderInSection:(NSInteger)section;
- (CGRect)rectForFooterInSection:(NSInteger)section;
- (CGRect)rectForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSIndexPath *)indexPathForRowAtPoint:(CGPoint)point;                         // returns nil if point is outside table
- (NSIndexPath *)indexPathForCell:(UITableViewCell *)cell;                      // returns nil if cell is not visible
- (NSArray *)indexPathsForRowsInRect:(CGRect)rect;                              // returns nil if rect not valid 

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;            // returns nil if cell is not visible or index path is out of range
- (NSArray *)visibleCells;
- (NSArray *)indexPathsForVisibleRows;
- (UITableViewHeaderFooterView *)headerViewForSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);
- (UITableViewHeaderFooterView *)footerViewForSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);

	public function scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;
	public function scrollToNearestSelectedRowAtScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

// Row insertion/deletion/reloading.

	public function beginUpdates;   // allow multiple insert/delete of rows and sections to be animated simultaneously. Nestable
	public function endUpdates;     // only call insert/delete/reload calls or change the editing state inside an update block.  otherwise things like row count, etc. may be invalid.

	public function insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
	public function deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
	public function reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation NS_AVAILABLE_IOS(3_0);
	public function moveSection:(NSInteger)section toSection:(NSInteger)newSection NS_AVAILABLE_IOS(5_0);

	public function insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
	public function deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
	public function reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation NS_AVAILABLE_IOS(3_0);
	public function moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath NS_AVAILABLE_IOS(5_0);

// Editing. When set, rows show insert/delete/reorder controls based on data source queries

	public var (nonatomic,getter=isEditing) BOOL editing;                             // default is NO. setting is not animated.
	public function setEditing:(BOOL)editing animated:(BOOL)animated;

	public var  BOOL allowsSelection NS_AVAILABLE_IOS(3_0);  // default is YES. Controls whether rows can be selected when not in editing mode
	public var  BOOL allowsSelectionDuringEditing;                                     // default is NO. Controls whether rows can be selected when in editing mode
	public var  BOOL allowsMultipleSelection NS_AVAILABLE_IOS(5_0);                 // default is NO. Controls whether multiple rows can be selected simultaneously
	public var  BOOL allowsMultipleSelectionDuringEditing NS_AVAILABLE_IOS(5_0);   // default is NO. Controls whether multiple rows can be selected simultaneously in editing mode

// Selection

- (NSIndexPath *)indexPathForSelectedRow;                                                // returns nil or index path representing section and row of selection.
- (NSArray *)indexPathsForSelectedRows NS_AVAILABLE_IOS(5_0); // returns nil or a set of index paths representing the sections and rows of the selection.

// Selects and deselects rows. These methods will not call the delegate methods (-tableView:willSelectRowAtIndexPath: or tableView:didSelectRowAtIndexPath:), nor will it send out a notification.
	public function selectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UITableViewScrollPosition)scrollPosition;
	public function deselectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated;

// Appearance

	public var  NSInteger sectionIndexMinimumDisplayRowCount;                                                      // show special section index list on right when row count reaches this value. default is NSInteger Max
	public var  UIColor *sectionIndexColor NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;                   // color used for text of the section index
	public var  UIColor *sectionIndexTrackingBackgroundColor NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR; // the background color of the section index while it is being touched

	public var  UITableViewCellSeparatorStyle separatorStyle;              // default is UITableViewCellSeparatorStyleSingleLine
	public var (nonatomic,retain) UIColor               *separatorColor;              // default is the standard separator gray

	public var (nonatomic,retain) UIView *tableHeaderView;                            // accessory view for above row content. default is nil. not to be confused with section header
	public var (nonatomic,retain) UIView *tableFooterView;                            // accessory view below content. default is nil. not to be confused with section footer

- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier;  // Used by the delegate to acquire an already allocated cell, in lieu of allocating a new one.
- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0); // newer dequeue method guarantees a cell is returned and resized properly, assuming identifier is registered
- (id)dequeueReusableHeaderFooterViewWithIdentifier:(NSString *)identifier NS_AVAILABLE_IOS(6_0);  // like dequeueReusableCellWithIdentifier:, but for headers/footers

// Beginning in iOS 6, clients can register a nib or class for each cell.
// If all reuse identifiers are registered, use the newer -dequeueReusableCellWithIdentifier:forIndexPath: to guarantee that a cell instance is returned.
// Instances returned from the new dequeue method will also be properly sized when they are returned.
	public function registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier NS_AVAILABLE_IOS(5_0);
	public function registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier NS_AVAILABLE_IOS(6_0);

	public function registerNib:(UINib *)nib forHeaderFooterViewReuseIdentifier:(NSString *)identifier NS_AVAILABLE_IOS(6_0);
	public function registerClass:(Class)aClass forHeaderFooterViewReuseIdentifier:(NSString *)identifier NS_AVAILABLE_IOS(6_0);

}

//_______________________________________________________________________________________________________________
// this protocol represents the data model object. as such, it supplies no information about appearance (including the cells)

extern interface UITableViewDataSource<NSObject>

@required

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;              // Default is 1 if not implemented

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;    // fixed font style. use custom view (UILabel) if you want something different
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;

// Editing

// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath;

// Moving/reordering

// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath;

// Index

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView;                                                    // return list of section titles to display in section index view (e.g. "ABCD...Z#")
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index;  // tell table which section corresponds to section title/index (e.g. "B",1))

// Data manipulation - insert and delete support

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
	public function tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;

// Data manipulation - reorder / moving support

	public function tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath;

}

//_______________________________________________________________________________________________________________

// This category provides convenience methods to make it easier to use an NSIndexPath to represent a section and row
extern class NSIndexPath (UITableView)

+ (NSIndexPath *)indexPathForRow:(NSInteger)row inSection:(NSInteger)section;

	public var (default, null) NSInteger section;
	public var (default, null) NSInteger row;

}
