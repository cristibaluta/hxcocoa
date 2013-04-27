/*
        NSMenuView.h
        Application Kit
        Copyright (c) 1997-2011, Apple Inc.
        All rights reserved.
*/

/* old-style menus are not available on 64-bit */
#if ! __LP64__

#import <AppKit/NSView.h>
#import <AppKit/AppKitDefines.h>
#import <AppKit/NSMenu.h>
#import <AppKit/NSMenuItem.h>
#import <AppKit/NSMenuItemCell.h>
@class NSScreen;

extern class NSMenuView extends NSView {
    /*All instance variables are private*/
    @private
    NSMenu *_menu;
    NSMutableArray *_cells;
    Float _stateImageWidth;
    Float _imageAndTitleWidth;
    Float _keyEquivalentWidth;
    Float *_extents;
    unsigned _extentsCapacity;
    int _highlightedItemIndex;
    BOOL *_submenuPopupCancel;
    NSMenuView *_attachedMenuView;
    Float _scrollArrowHeight;
    Float _maxWinHeight;
    NSFont *_font;
    NSSize _minSize;
    Float _horizontalEdgePad;
    void *trackingState;
    id _scrollingView;
    struct __mvFlags {
        unsigned int needsSizing:1;
        unsigned int releasingWindow:1;
        unsigned int isHorizontal:1;
        unsigned int disableSizing:1;
        unsigned int attachedSubmenuWhileMouseWasUp:1;
        unsigned int needsToCreateCells:1;
        unsigned int allowsTearOffs:1;
        unsigned int isTearOff:1;
        unsigned int keyEquivGlyphWidth:16;
        unsigned int disableResize:1;
        unsigned int savedHODState:1;
        unsigned int drawCenter:1;
        unsigned int RESERVED:5;
    } _mvFlags;
}

+ (Float)menuBarHeight;

- (id)initWithFrame:(NSRect)frame;  // DI
- (id)initAsTearOff;

- (void)setMenu:(NSMenu *)menu;
- (NSMenu *)menu;

- (void)itemChanged:(NSNotification *)notification;
- (void)itemAdded:(NSNotification *)notification;
- (void)itemRemoved:(NSNotification *)notification;

- (void)update;

- (void)setHorizontal:(BOOL)flag;
- (BOOL)isHorizontal;

- (void)setFont:(NSFont *)font;
- (NSFont *)font;

- (NSRect)innerRect; // inside the bezel (if any)
- (NSRect)rectOfItemAtIndex:(Int)index;
- (Int)indexOfItemAtPoint:(NSPoint)point;
- (void)setNeedsDisplayForItemAtIndex:(Int)index;

- (void)setHighlightedItemIndex:(Int)index;
- (Int)highlightedItemIndex;

- (Float)stateImageOffset;
- (Float)stateImageWidth;
- (Float)imageAndTitleOffset;
- (Float)imageAndTitleWidth;
- (Float)keyEquivalentOffset;
- (Float)keyEquivalentWidth;

- (void)setMenuItemCell:(NSMenuItemCell *)cell forItemAtIndex:(Int)index;
- (NSMenuItemCell *)menuItemCellForItemAtIndex:(Int)index;

- (NSMenuView *)attachedMenuView;

- (void)setNeedsSizing:(BOOL)flag;
- (BOOL)needsSizing;

- (void)sizeToFit;
- (NSMenu *)attachedMenu;
- (BOOL)isAttached;
- (BOOL)isTornOff;
- (NSPoint)locationForSubmenu:(NSMenu *)aSubmenu;

- (void)setWindowFrameForAttachingToRect:(NSRect)screenRect onScreen:(NSScreen *)screen preferredEdge:(NSRectEdge)edge popUpSelectedItem:(Int)selectedItemIndex;
- (void)detachSubmenu;
- (void)attachSubmenuForItemAtIndex:(Int)index;

- (void)performActionWithHighlightingForItemAtIndex:(Int)index;

- (BOOL)trackWithEvent:(NSEvent *)event;

- (Float)horizontalEdgePadding;
- (void)setHorizontalEdgePadding:(Float)pad;
    // How much empty pad should be left on either edge of the item.

}

#endif
