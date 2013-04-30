package ios.ui;
import ios.ui.UIGestureRecognizer;

@:framework("UIKit")
extern enum UITableViewCellStyle {
    UITableViewCellStyleDefault;	// Simple cell with text label and optional image view (behavior of UITableViewCell in iPhoneOS 2.x)
    UITableViewCellStyleValue1;		// Left aligned label on left and right aligned label on right with blue text (Used in Settings)
    UITableViewCellStyleValue2;		// Right aligned label on left with blue text and left aligned label on right (Used in Phone/Contacts)
    UITableViewCellStyleSubtitle;	// Left aligned label on top and left aligned label on bottom with gray text (Used in iPod).
}

@:framework("UIKit")
extern enum UITableViewCellSeparatorStyle {
    UITableViewCellSeparatorStyleNone;
    UITableViewCellSeparatorStyleSingleLine;
    UITableViewCellSeparatorStyleSingleLineEtched;   // This separator style is only supported for grouped style table views currently
}

@:framework("UIKit")
extern enum UITableViewCellSelectionStyle {
    UITableViewCellSelectionStyleNone;
    UITableViewCellSelectionStyleBlue;
    UITableViewCellSelectionStyleGray;
}

@:framework("UIKit")
extern enum UITableViewCellEditingStyle {
    UITableViewCellEditingStyleNone;
    UITableViewCellEditingStyleDelete;
    UITableViewCellEditingStyleInsert;
}

@:framework("UIKit")
extern enum UITableViewCellAccessoryType {
    UITableViewCellAccessoryNone;
    UITableViewCellAccessoryDisclosureIndicator;
    UITableViewCellAccessoryDetailDisclosureButton;
    UITableViewCellAccessoryCheckmark;
}

@:framework("UIKit")
extern enum UITableViewCellStateMask {
    UITableViewCellStateDefaultMask;
    UITableViewCellStateShowingEditControlMask;
    UITableViewCellStateShowingDeleteConfirmationMask;
}

@:framework("UIKit")
extern class UITableViewCell extends UIView implements UIGestureRecognizerDelegate {
	#if ddd
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

	public var reuseIdentifier (default, null) :String;
	public function prepareForReuse () :Void;

	public var selectionStyle :UITableViewCellSelectionStyle;
	public var selected :Bool;
	public var highlighted :Bool;
	public function setSelected (selected:Bool, animated:Bool) :Void;
	public function setHighlighted (highlighted:Bool, animated:Bool) :Void;

	public var editingStyle (default, null) :UITableViewCellEditingStyle;
	public var showsReorderControl :Bool;
	public var shouldIndentWhileEditing :Bool;

	public var accessoryType :UITableViewCellAccessoryType;
	public var accessoryView :UIView;// if set, use custom view. ignore accessoryType. tracks if enabled can calls accessory action
	public var editingAccessoryType :UITableViewCellAccessoryType;       // default is UITableViewCellAccessoryNone. use to set standard type
	public var editingAccessoryView :UIView;       // if set, use custom view. ignore editingAccessoryType. tracks if enabled can calls accessory action

	public var indentationLevel :Int;           // adjust content indent. default is 0
	public var indentationWidth :Float;           // width for each level. default is 10.0

	public var editing :Bool;// show appropriate edit controls (+/- & reorder). By default -setEditing: calls setEditing:animated: with NO for animated.
	public function setEditing (editing:Bool, animated:Bool) :Void;

	public var showingDeleteConfirmation (default, null) :Bool;  // currently showing "Delete" button

// These methods can be used by subclasses to animate additional changes to the cell when the cell is changing state
// Note that when the cell is swiped, the cell will be transitioned into the UITableViewCellStateShowingDeleteConfirmationMask state,
// but the UITableViewCellStateShowingEditControlMask will not be set.
	public function willTransitionToState (state:UITableViewCellStateMask) :Void;
	public function didTransitionToState (state:UITableViewCellStateMask) :Void;
	#end
}
