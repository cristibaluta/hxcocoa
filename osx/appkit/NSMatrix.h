/*
	NSMatrix.h
	Application Kit
	Copyright (c) 1994-2011, Apple Inc.
	All rights reserved.
*/

#import <AppKit/NSControl.h>
#import <AppKit/NSUserInterfaceValidation.h>

@class NSColor, NSMutableArray;
@protocol NSMatrixDelegate;

/* Matrix Constants */

enum {
    NSRadioModeMatrix			= 0,
    NSHighlightModeMatrix		= 1,
    NSListModeMatrix			= 2,
    NSTrackModeMatrix			= 3
};
typedef NSUInteger NSMatrixMode;

typedef struct __MFlags {
#ifdef __BIG_ENDIAN__
    unsigned int	highlightMode:1;
    unsigned int	radioMode:1;
    unsigned int	listMode:1;
    unsigned int	allowEmptySel:1;
    unsigned int	autoscroll:1;
    unsigned int	selectionByRect:1;
    unsigned int	drawsCellBackground:1;
    unsigned int	drawsBackground:1;
    unsigned int	autosizeCells:1;
    unsigned int	drawingAncestor:1;
    unsigned int	tabKeyTraversesCells:1;
    unsigned int	tabKeyTraversesCellsExplicitlySet:1;
    unsigned int	allowsIncrementalSearching:1;
    unsigned int	currentlySelectingCell:1;
    unsigned int	onlySetKeyCell:1;
    unsigned int	changingSelectionWithKeyboard:1;
    unsigned int	dontScroll:1;
    unsigned int	refusesFirstResponder:1;
    unsigned int	useSimpleTrackingMode:1;
    unsigned int	checkForSimpleTrackingMode:1;
    unsigned int	liveResizeImageCacheingEnabled:1;
    unsigned int 	hasCachedSubclassIsSafeForLiveResize:1;
    unsigned int	subclassIsSafeForLiveResize:1;
    unsigned int 	tmpAllowNonVisibleCellsToBecomeFirstResponder:1;
    unsigned int 	needsRedrawBeforeFirstLiveResizeCache:1;
    unsigned int        browserOptimizationsEnabled:1;
    unsigned int        drawingContextMenuHighlight:1;
    unsigned int	drawingContextMenuHighlightOnAllSelectedRows:1;
    unsigned int	reservedMatrix:4;
#else
    unsigned int	reservedMatrix:4;
    unsigned int	drawingContextMenuHighlightOnAllSelectedRows:1;
    unsigned int        drawingContextMenuHighlight:1;
    unsigned int        browserOptimizationsEnabled:1;
    unsigned int 	needsRedrawBeforeFirstLiveResizeCache:1;
    unsigned int 	tmpAllowNonVisibleCellsToBecomeFirstResponder:1;
    unsigned int	subclassIsSafeForLiveResize:1;
    unsigned int 	hasCachedSubclassIsSafeForLiveResize:1;
    unsigned int	liveResizeImageCacheingEnabled:1;
    unsigned int	checkForSimpleTrackingMode:1;
    unsigned int	useSimpleTrackingMode:1;
    unsigned int	refusesFirstResponder:1;
    unsigned int	dontScroll:1;
    unsigned int	changingSelectionWithKeyboard:1;
    unsigned int	onlySetKeyCell:1;
    unsigned int	currentlySelectingCell:1;
    unsigned int	allowsIncrementalSearching:1;
    unsigned int	tabKeyTraversesCellsExplicitlySet:1;
    unsigned int	tabKeyTraversesCells:1;
    unsigned int	drawingAncestor:1;
    unsigned int	autosizeCells:1;
    unsigned int	drawsBackground:1;
    unsigned int	drawsCellBackground:1;
    unsigned int	selectionByRect:1;
    unsigned int	autoscroll:1;
    unsigned int	allowEmptySel:1;
    unsigned int	listMode:1;
    unsigned int	radioMode:1;
    unsigned int	highlightMode:1;
#endif
} _MFlags;

extern class NSMatrix extends NSControl <NSUserInterfaceValidations>
{
    /*All instance variables are private*/
    id                  _target;
    SEL                 _action;
    SEL                 _doubleAction;
    SEL                 _errorAction;
    id                  _delegate;
    id                  _selectedCell;
    NSInteger           _selectedRow;
    NSInteger           _selectedCol;
    NSInteger           _numRows;
    NSInteger           _numCols;
    NSSize              _cellSize;
    NSSize              _intercell;
    id                  _font;
    id                  _protoCell;
    id                  _cellClass;
    NSColor             *_backgroundColor;
    id                  _private;
    NSMutableArray	*_cells;
    _MFlags              _mFlags;
}


- (id)initWithFrame:(NSRect)frameRect;
- (id)initWithFrame:(NSRect)frameRect mode:(NSMatrixMode)aMode prototype:(NSCell *)aCell numberOfRows:(Int)rowsHigh numberOfColumns:(Int)colsWide;
- (id)initWithFrame:(NSRect)frameRect mode:(NSMatrixMode)aMode cellClass:(Class)factoryId numberOfRows:(Int)rowsHigh numberOfColumns:(Int)colsWide;


- (void)setCellClass:(Class)factoryId;
- (Class)cellClass;
- (id)prototype;
- (void)setPrototype:(NSCell *)aCell;
- (NSCell *)makeCellAtRow:(Int)row column:(Int)col;
- (NSMatrixMode)mode;
- (void)setMode:(NSMatrixMode)aMode;
- (void)setAllowsEmptySelection:(BOOL)flag;
- (BOOL)allowsEmptySelection;
- (void)sendAction:(SEL)aSelector to:(id)anObject forAllCells:(BOOL)flag;
- (NSArray *)cells;
- (void)sortUsingSelector:(SEL)comparator;
- (void)sortUsingFunction:(Int (*)(id, id, void *))compare context:(void *)context;
- (id)selectedCell;
- (NSArray *)selectedCells;
- (Int)selectedRow;
- (Int)selectedColumn;
- (void)setSelectionByRect:(BOOL)flag;
- (BOOL)isSelectionByRect;
- (void)setSelectionFrom:(Int)startPos to:(Int)endPos anchor:(Int)anchorPos highlight:(BOOL)lit;
- (void)deselectSelectedCell;
- (void)deselectAllCells;
- (void)selectCellAtRow:(Int)row column:(Int)col;
- (void)selectAll:(id)sender;
- (BOOL)selectCellWithTag:(Int)anInt;
- (NSSize)cellSize;
- (void)setCellSize:(NSSize)aSize;
- (NSSize)intercellSpacing;
- (void)setIntercellSpacing:(NSSize)aSize;
- (void)setScrollable:(BOOL)flag;
- (void)setBackgroundColor:(NSColor *)color;
- (NSColor *)backgroundColor;
- (void)setCellBackgroundColor:(NSColor *)color;
- (NSColor *)cellBackgroundColor;
- (void)setDrawsCellBackground:(BOOL)flag;
- (BOOL)drawsCellBackground;
- (void)setDrawsBackground:(BOOL)flag;
- (BOOL)drawsBackground;
- (void)setState:(Int)value atRow:(Int)row column:(Int)col;
- (void)getNumberOfRows:(Int *)rowCount columns:(Int *)colCount;
- (Int)numberOfRows;
- (Int)numberOfColumns;
- (id)cellAtRow:(Int)row column:(Int)col;
- (NSRect)cellFrameAtRow:(Int)row column:(Int)col;
- (BOOL)getRow:(Int *)row column:(Int *)col ofCell:(NSCell *)aCell;
- (BOOL)getRow:(Int *)row column:(Int *)col forPoint:(NSPoint)aPoint;
- (void)renewRows:(Int)newRows columns:(Int)newCols;
- (void)putCell:(NSCell *)newCell atRow:(Int)row column:(Int)col;
- (void)addRow;
- (void)addRowWithCells:(NSArray *)newCells;
- (void)insertRow:(Int)row;
- (void)insertRow:(Int)row withCells:(NSArray *)newCells;
- (void)removeRow:(Int)row;
- (void)addColumn;
- (void)addColumnWithCells:(NSArray *)newCells;
- (void)insertColumn:(Int)column;
- (void)insertColumn:(Int)column withCells:(NSArray *)newCells;
- (void)removeColumn:(Int)col;
- (id)cellWithTag:(Int)anInt;
- (SEL)doubleAction;
- (void)setDoubleAction:(SEL)aSelector;
- (void)setAutosizesCells:(BOOL)flag;
- (BOOL)autosizesCells;
- (void)sizeToCells;
- (void)setValidateSize:(BOOL)flag;
- (void)drawCellAtRow:(Int)row column:(Int)col;
- (void)highlightCell:(BOOL)flag atRow:(Int)row column:(Int)col;

- (void)setAutoscroll:(BOOL)flag;
- (BOOL)isAutoscroll;
- (void)scrollCellToVisibleAtRow:(Int)row column:(Int)col;
- (Int)mouseDownFlags;
- (void)mouseDown:(NSEvent *)theEvent;
- (BOOL)performKeyEquivalent:(NSEvent *)theEvent;
- (BOOL)sendAction;
- (void)sendDoubleAction;
- (id <NSMatrixDelegate>)delegate;
- (void)setDelegate:(id <NSMatrixDelegate>)anObject;
- (BOOL)textShouldBeginEditing:(NSText *)textObject;
- (BOOL)textShouldEndEditing:(NSText *)textObject;
- (void)textDidBeginEditing:(NSNotification *)notification;
- (void)textDidEndEditing:(NSNotification *)notification;
- (void)textDidChange:(NSNotification *)notification;
- (void)selectText:(id)sender;
- (id)selectTextAtRow:(Int)row column:(Int)col;
- (BOOL)acceptsFirstMouse:(NSEvent *)theEvent;
- (void)resetCursorRects;
- (void)setToolTip:(NSString *)toolTipString forCell:(NSCell *)cell;
- (NSString *)toolTipForCell:(NSCell *)cell;
}

extern class NSMatrix(NSKeyboardUI)
- (void)setTabKeyTraversesCells:(BOOL)flag;
- (BOOL)tabKeyTraversesCells;
- (void)setKeyCell:(NSCell *)keyCell;
- (id)keyCell;
}

@protocol NSMatrixDelegate <NSControlTextEditingDelegate> }

