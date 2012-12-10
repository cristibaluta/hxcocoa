//
//  UITableViewCell.h
package ios.ui;
//
//  Copyright (c) 2005-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIView.h>
#import <UIKit/UIStringDrawing.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UIGestureRecognizer.h>

@class UIImage, UIColor, UILabel, UIImageView, UIButton, UITextField, UITableView, UILongPressGestureRecognizer;

typedef NS_ENUM(NSInteger, UITableViewCellStyle) {
    UITableViewCellStyleDefault,	// Simple cell with text label and optional image view (behavior of UITableViewCell in iPhoneOS 2.x)
    UITableViewCellStyleValue1,		// Left aligned label on left and right aligned label on right with blue text (Used in Settings)
    UITableViewCellStyleValue2,		// Right aligned label on left with blue text and left aligned label on right (Used in Phone/Contacts)
    UITableViewCellStyleSubtitle	// Left aligned label on top and left aligned label on bottom with gray text (Used in iPod).
};             // available in iPhone OS 3.0

typedef NS_ENUM(NSInteger, UITableViewCellSeparatorStyle) {
    UITableViewCellSeparatorStyleNone,
    UITableViewCellSeparatorStyleSingleLine,
    UITableViewCellSeparatorStyleSingleLineEtched   // This separator style is only supported for grouped style table views currently
};

typedef NS_ENUM(NSInteger, UITableViewCellSelectionStyle) {
    UITableViewCellSelectionStyleNone,
    UITableViewCellSelectionStyleBlue,
    UITableViewCellSelectionStyleGray
};

typedef NS_ENUM(NSInteger, UITableViewCellEditingStyle) {
    UITableViewCellEditingStyleNone,
    UITableViewCellEditingStyleDelete,
    UITableViewCellEditingStyleInsert
};

typedef NS_ENUM(NSInteger, UITableViewCellAccessoryType) {
    UITableViewCellAccessoryNone,                   // don't show any accessory view
    UITableViewCellAccessoryDisclosureIndicator,    // regular chevron. doesn't track
    UITableViewCellAccessoryDetailDisclosureButton, // blue button w/ chevron. tracks
    UITableViewCellAccessoryCheckmark               // checkmark. doesn't track
};

typedef NS_OPTIONS(NSUInteger, UITableViewCellStateMask) {
    UITableViewCellStateDefaultMask                     = 0,
    UITableViewCellStateShowingEditControlMask          = 1 << 0,
    UITableViewCellStateShowingDeleteConfirmationMask   = 1 << 1
};

#define UITableViewCellStateEditingMask UITableViewCellStateShowingEditControlMask

extern class UITableViewCell extends UIView, implements NSObject, UIGestureRecognizerDelegate> {
  @private
    UITableView *_tableView;
    id           _layoutManager;
    id           _target;
    SEL          _editAction;
    SEL          _accessoryAction;
    id           _oldEditingData;
    id           _editingData;
    Float      _rightMargin;
    NSInteger    _indentationLevel;
    Float      _indentationWidth;
    NSString    *_reuseIdentifier;
    UIView      *_contentView;
    UIImageView *_imageView;
    UILabel     *_textLabel;
    UILabel     *_detailTextLabel;
    UIView      *_backgroundView;
    UIView      *_selectedBackgroundView;
    UIView      *_multipleSelectionBackgroundView;
    UIView      *_selectedOverlayView;
    Float      _selectionFadeDuration;
    UIColor     *_backgroundColor;
    UIColor     *_separatorColor;
    UIColor     *_topShadowColor;
    UIColor     *_bottomShadowColor;
    UIColor     *_sectionBorderColor;
    UIView      *_floatingSeparatorView;
    UIView      *_topShadowAnimationView;
    UIView      *_bottomShadowAnimationView;
    id          _badge;
    CFMutableDictionaryRef _unhighlightedStates;
    id           _selectionSegueTemplate;
    id           _accessoryActionSegueTemplate;
    struct {
        unsigned int showingDeleteConfirmation:1;
        unsigned int separatorStyle:3;
        unsigned int selectionStyle:3;
        unsigned int selectionFadeFraction:11;	// used to indicate selection
        unsigned int editing:1;
        unsigned int editingStyle:3;
        unsigned int accessoryType:3;
        unsigned int editingAccessoryType:3;
        unsigned int showsAccessoryWhenEditing:1;
        unsigned int showsReorderControl:1;
        unsigned int showDisclosure:1;
        unsigned int showTopSeparator:1;
        unsigned int hideTopSeparatorDuringReordering:1;
        unsigned int disclosureClickable:1;
        unsigned int disclosureStyle:1;
        unsigned int showingRemoveControl:1;
        unsigned int sectionLocation:3;
        unsigned int tableViewStyle:1;
        unsigned int shouldIndentWhileEditing:1;
        unsigned int fontSet:1;
        unsigned int usingDefaultSelectedBackgroundView:1;
        unsigned int wasSwiped:1;
        unsigned int highlighted:1;
        unsigned int separatorDirty:1;
        unsigned int drawn:1;
        unsigned int drawingDisabled:1;
        unsigned int style:12;
        unsigned int showingMenu:1;
        unsigned int clipsContents:1;
        unsigned int animatingSelection:1;
        unsigned int backgroundColorSet:1;
        unsigned int needsSetup:1;
        unsigned int dontDrawTopShadow:1;
        unsigned int usingMultiselectbackgroundView:1;
        unsigned int layoutLoopCounter:2;
    } _tableCellFlags;
    
    UIButton *_accessoryView;
    UIButton *_editingAccessoryView;
    UIView *_customAccessoryView;
    UIView *_customEditingAccessoryView;
    UIView *_separatorView;
    UIView *_topSeparatorView;
    UIView *_topShadowView;
    UITextField *_editableTextField;
    CFAbsoluteTime _lastSelectionTime;
    NSTimer *_deselectTimer;
    Float _textFieldOffset;
    SEL _returnAction;
    UIColor *_selectionTintColor;
    UIColor *_accessoryTintColor;
    UIImage *_reorderControlImage;
    UILongPressGestureRecognizer* _menuGesture;
    id _highlightingSupport;
    NSIndexPath* _representedIndexPath;
}

// Designated initializer.  If the cell can be reused, you must pass in a reuse identifier.  You should use the same reuse identifier for all cells of the same form.  
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier NS_AVAILABLE_IOS(3_0);

// Content.  These properties provide direct access to the internal label and image views used by the table view cell.  These should be used instead of the content properties below.
	public var (default, null) UIImageView  *imageView NS_AVAILABLE_IOS(3_0);   // default is nil.  image view will be created if necessary.

	public var (default, null) UILabel      *textLabel NS_AVAILABLE_IOS(3_0);   // default is nil.  label will be created if necessary.
	public var (default, null) UILabel      *detailTextLabel NS_AVAILABLE_IOS(3_0); // default is nil.  label will be created if necessary (and the current style supports a detail label).

// If you want to customize cells by simply adding additional views, you should add them to the content view so they will be positioned appropriately as the cell transitions into and out of editing mode.
	public var (default, null) UIView       *contentView;

// Default is nil for cells in UITableViewStylePlain, and non-nil for UITableViewStyleGrouped. The 'backgroundView' will be added as a subview behind all other views.
	public var (nonatomic,retain) UIView                *backgroundView;

// Default is nil for cells in UITableViewStylePlain, and non-nil for UITableViewStyleGrouped. The 'selectedBackgroundView' will be added as a subview directly above the backgroundView if not nil, or behind all other views. It is added as a subview only when the cell is selected. Calling -setSelected:animated: will cause the 'selectedBackgroundView' to animate in and out with an alpha fade.
	public var (nonatomic,retain) UIView                *selectedBackgroundView;

// If not nil, takes the place of the selectedBackgroundView when using multiple selection.
	public var (nonatomic,retain) UIView                *multipleSelectionBackgroundView NS_AVAILABLE_IOS(5_0);

	public var (nonatomic,readonly,copy) NSString       *reuseIdentifier;
	public function prepareForReuse;                                                        // if the cell is reusable (has a reuse identifier), this is called just before the cell is returned from the table view method dequeueReusableCellWithIdentifier:.  If you override, you MUST call super.

	public var  UITableViewCellSelectionStyle  selectionStyle;             // default is UITableViewCellSelectionStyleBlue.
	public var (nonatomic,getter=isSelected) BOOL         selected;                   // set selected state (title, image, background). default is NO. animated is NO
	public var (nonatomic,getter=isHighlighted) BOOL      highlighted;                // set highlighted state (title, image, background). default is NO. animated is NO
	public function setSelected:(BOOL)selected animated:(BOOL)animated;                     // animate between regular and selected state
	public function setHighlighted:(BOOL)highlighted animated:(BOOL)animated;               // animate between regular and highlighted state

	public var (default, null) UITableViewCellEditingStyle editingStyle;         // default is UITableViewCellEditingStyleNone. This is set by UITableView using the delegate's value for cells who customize their appearance accordingly.
	public var  BOOL                           showsReorderControl;        // default is NO
	public var  BOOL                           shouldIndentWhileEditing;   // default is YES.  This is unrelated to the indentation level below.

	public var  UITableViewCellAccessoryType   accessoryType;              // default is UITableViewCellAccessoryNone. use to set standard type
	public var (nonatomic,retain) UIView                 *accessoryView;              // if set, use custom view. ignore accessoryType. tracks if enabled can calls accessory action
	public var  UITableViewCellAccessoryType   editingAccessoryType;       // default is UITableViewCellAccessoryNone. use to set standard type
	public var (nonatomic,retain) UIView                 *editingAccessoryView;       // if set, use custom view. ignore editingAccessoryType. tracks if enabled can calls accessory action

	public var  NSInteger                      indentationLevel;           // adjust content indent. default is 0
	public var  Float                        indentationWidth;           // width for each level. default is 10.0

	public var (nonatomic,getter=isEditing) BOOL          editing;                    // show appropriate edit controls (+/- & reorder). By default -setEditing: calls setEditing:animated: with NO for animated.
	public function setEditing:(BOOL)editing animated:(BOOL)animated;

	public var (default, null) BOOL                  showingDeleteConfirmation;  // currently showing "Delete" button

// These methods can be used by subclasses to animate additional changes to the cell when the cell is changing state
// Note that when the cell is swiped, the cell will be transitioned into the UITableViewCellStateShowingDeleteConfirmationMask state,
// but the UITableViewCellStateShowingEditControlMask will not be set.
	public function willTransitionToState:(UITableViewCellStateMask)state NS_AVAILABLE_IOS(3_0);
	public function didTransitionToState:(UITableViewCellStateMask)state NS_AVAILABLE_IOS(3_0);

}

extern class UITableViewCell (UIDeprecated)

// Frame is ignored.  The size will be specified by the table view width and row height.
- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier NS_DEPRECATED_IOS(2_0, 3_0);

// Content properties.  These properties were deprecated in iPhone OS 3.0.  The textLabel and imageView properties above should be used instead.
// For selected attributes, set the highlighted attributes on the textLabel and imageView.
public var    NSString *text NS_DEPRECATED_IOS(2_0, 3_0);                        // default is nil
	public var (nonatomic,retain) UIFont   *font NS_DEPRECATED_IOS(2_0, 3_0);                        // default is nil (Use default font)
	public var  NSTextAlignment  textAlignment NS_DEPRECATED_IOS(2_0, 3_0);               // default is UITextAlignmentLeft
	public var  NSLineBreakMode  lineBreakMode NS_DEPRECATED_IOS(2_0, 3_0);               // default is UILineBreakModeTailTruncation
	public var (nonatomic,retain) UIColor  *textColor NS_DEPRECATED_IOS(2_0, 3_0);                   // default is nil (text draws black)
	public var (nonatomic,retain) UIColor  *selectedTextColor NS_DEPRECATED_IOS(2_0, 3_0);           // default is nil (text draws white)

	public var (nonatomic,retain) UIImage  *image NS_DEPRECATED_IOS(2_0, 3_0);                       // default is nil. appears on left next to title.
	public var (nonatomic,retain) UIImage  *selectedImage NS_DEPRECATED_IOS(2_0, 3_0);               // default is nil

// Use the new editingAccessoryType and editingAccessoryView instead
	public var  BOOL             hidesAccessoryWhenEditing NS_DEPRECATED_IOS(2_0, 3_0);   // default is YES

// Use the table view data source method -tableView:commitEditingStyle:forRowAtIndexPath: or the table view delegate method -tableView:accessoryButtonTappedForRowWithIndexPath: instead
	public var  id        target NS_DEPRECATED_IOS(2_0, 3_0);                      // target for insert/delete/accessory clicks. default is nil (i.e. go up responder chain). weak reference
	public var  SEL              editAction NS_DEPRECATED_IOS(2_0, 3_0);                  // action to call on insert/delete call. set by UITableView
	public var  SEL              accessoryAction NS_DEPRECATED_IOS(2_0, 3_0);             // action to call on accessory view clicked. set by UITableView

}
