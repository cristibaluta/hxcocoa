package ios.ui;


@:framework("UIKit")
extern enum UITableViewStyle {
    UITableViewStylePlain;                  // regular table view
    UITableViewStyleGrouped;                 // preferences style table view
}

@:framework("UIKit")
extern enum UITableViewScrollPosition {
    UITableViewScrollPositionNone;
    UITableViewScrollPositionTop;
    UITableViewScrollPositionMiddle;
    UITableViewScrollPositionBottom;
}
// scroll so row of interest is completely visible at top/center/bottom of view

@:framework("UIKit")
extern enum UITableViewRowAnimation {
	UITableViewRowAnimationFade;
	UITableViewRowAnimationRight;           // slide in from right (or out to right)
	UITableViewRowAnimationLeft;
	UITableViewRowAnimationTop;
    UITableViewRowAnimationBottom;
    UITableViewRowAnimationNone;            // available in iOS 3.0
    UITableViewRowAnimationMiddle;          // available in iOS 3.2.  attempts to keep cell centered in the space it will/did occupy
    UITableViewRowAnimationAutomatic;  // available in iOS 5.0.  chooses an appropriate animation style for you
}


//_______________________________________________________________________________________________________________
// this represents the display and behaviour of the cells.
@:framework("UIKit")
extern interface UITableViewDelegate {

#if display

// Display customization

	public function tableView (tableView:UITableView, willDisplayCell:UITableViewCell, forRowAtIndexPath:Int) :Void;
	public function tableView (tableView:UITableView, willDisplayHeaderView:UIView, forSection:(Int)section NS_AVAILABLE_IOS(6_0);
	public function tableView (tableView:UITableView, willDisplayFooterView:UIView, forSection:(Int)section NS_AVAILABLE_IOS(6_0);
	public function tableView (tableView:UITableView, didEndDisplayingCell:UITableViewCell, forRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(6_0);
	public function tableView (tableView:UITableView, didEndDisplayingHeaderView:UIView, forSection:(Int)section NS_AVAILABLE_IOS(6_0);
	public function tableView (tableView:UITableView, didEndDisplayingFooterView:UIView, forSection:(Int)section NS_AVAILABLE_IOS(6_0);

// Variable height support

- (Float)tableView (tableView:UITableView, heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (Float)tableView (tableView:UITableView, heightForHeaderInSection:(Int)section;
- (Float)tableView (tableView:UITableView, heightForFooterInSection:(Int)section;

// Section header & footer information. Views are preferred over title should you decide to provide both

	public function tableView (tableView:UITableView, viewForHeaderInSection:(Int) :UIView;
	public function tableView (tableView:UITableView, viewForFooterInSection:(Int) :UIView;

// Accessories (disclosures). 

- (UITableViewCellAccessoryType)tableView (tableView:UITableView, accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath NS_DEPRECATED_IOS(2_0, 3_0);
	public function tableView (tableView:UITableView, accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;

// Selection

// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row. 
// Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
- (BOOL)tableView (tableView:UITableView, shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0);
	public function tableView (tableView:UITableView, didHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0);
	public function tableView (tableView:UITableView, didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0);

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
- (NSIndexPath *)tableView (tableView:UITableView, willSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSIndexPath *)tableView (tableView:UITableView, willDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0);
// Called after the user changes the selection.
	public function tableView (tableView:UITableView, didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
	public function tableView (tableView:UITableView, didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0);

// Editing

// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
- (UITableViewCellEditingStyle)tableView (tableView:UITableView, editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)tableView (tableView:UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0);

// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
- (BOOL)tableView (tableView:UITableView, shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath;

// The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
	public function tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath;
	public function tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath;

// Moving/reordering

// Allows customization of the target row for a particular row as it is being moved/reordered
- (NSIndexPath *)tableView (tableView:UITableView, targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath;               

// Indentation

- (Int)tableView (tableView:UITableView, indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath; // return 'depth' of row for hierarchies

// Copy/Paste.  All three methods must be implemented by the delegate.

- (BOOL)tableView (tableView:UITableView, shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(5_0);
- (BOOL)tableView (tableView:UITableView, canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender NS_AVAILABLE_IOS(5_0);
	public function tableView (tableView:UITableView, performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender NS_AVAILABLE_IOS(5_0);

#end
}


@:framework("UIKit")
extern class UITableView extends UIScrollView implements NSObject {

	public function initWithFrame (frame:CGRect, style:UITableViewStyle) :UITableView;

	public var style (default, null) :UITableViewStyle;
	public var dataSource :UITableViewDataSource;
	public var delegate :UITableViewDelegate;
	public var rowHeight :Float;             // will return the default value if unset
	public var sectionHeaderHeight :Float;   // will return the default value if unset
	public var sectionFooterHeight :Float;   // will return the default value if unset

	public var backgroundView :UIView;
// Data

	public function reloadData (); // reloads everything from scratch. redisplays visible rows. because we only keep info about visible rows, this is cheap. will adjust offset if table shrinks
	public function reloadSectionIndexTitles NS_AVAILABLE_IOS(3_0);   // reloads the index bar.

// Info

- (Int)numberOfSections;
- (Int)numberOfRowsInSection:(Int)section;

- (CGRect)rectForSection:(Int)section;                                    // includes header, footer and all rows
- (CGRect)rectForHeaderInSection:(Int)section;
- (CGRect)rectForFooterInSection:(Int)section;
- (CGRect)rectForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSIndexPath *)indexPathForRowAtPoint:(CGPoint)point;                         // returns nil if point is outside table
- (NSIndexPath *)indexPathForCell:(UITableViewCell *)cell;                      // returns nil if cell is not visible
- (NSArray *)indexPathsForRowsInRect:(CGRect)rect;                              // returns nil if rect not valid 

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;            // returns nil if cell is not visible or index path is out of range
- (NSArray *)visibleCells;
- (NSArray *)indexPathsForVisibleRows;
- (UITableViewHeaderFooterView *)headerViewForSection:(Int)section NS_AVAILABLE_IOS(6_0);
- (UITableViewHeaderFooterView *)footerViewForSection:(Int)section NS_AVAILABLE_IOS(6_0);

	public function scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;
	public function scrollToNearestSelectedRowAtScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

// Row insertion/deletion/reloading.

	public function beginUpdates;   // allow multiple insert/delete of rows and sections to be animated simultaneously. Nestable
	public function endUpdates;     // only call insert/delete/reload calls or change the editing state inside an update block.  otherwise things like row count, etc. may be invalid.

	public function insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
	public function deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation;
	public function reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation NS_AVAILABLE_IOS(3_0);
	public function moveSection:(Int)section toSection:(Int)newSection NS_AVAILABLE_IOS(5_0);

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

@:framework("UIKit")
extern interface UITableViewDataSource {

//@required

	public function tableView (tableView:UITableView, numberOfRowsInSection:Int) :Int;

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView (tableView:UITableView, cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (Int)numberOfSectionsInTableView (tableView:UITableView,;              // Default is 1 if not implemented

- (NSString *)tableView (tableView:UITableView, titleForHeaderInSection:(Int)section;
- (NSString *)tableView (tableView:UITableView, titleForFooterInSection:(Int)section;

// Editing

// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
- (BOOL)tableView (tableView:UITableView, canEditRowAtIndexPath:(NSIndexPath *)indexPath;

// Moving/reordering

// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
- (BOOL)tableView (tableView:UITableView, canMoveRowAtIndexPath:(NSIndexPath *)indexPath;

// Index

- (NSArray *)sectionIndexTitlesForTableView (tableView:UITableView,;                                                    // return list of section titles to display in section index view (e.g. "ABCD...Z#")
- (Int)tableView (tableView:UITableView, sectionForSectionIndexTitle:(NSString *)title atIndex:(Int)index;  // tell table which section corresponds to section title/index (e.g. "B",1))

// Data manipulation - insert and delete support

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
	public function tableView (tableView:UITableView, commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;

// Data manipulation - reorder / moving support

	public function tableView (tableView:UITableView, moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath;

}

