package ios.ui;

import objc.foundation.NSObject;

typedef UITextBorderStyle = Int;
    UITextBorderStyleNone,
    UITextBorderStyleLine,
    UITextBorderStyleBezel,
    UITextBorderStyleRoundedRect
};

typedef UITextFieldViewMode = Int;
    UITextFieldViewModeNever,
    UITextFieldViewModeWhileEditing,
    UITextFieldViewModeUnlessEditing,
    UITextFieldViewModeAlways
};

extern class UITextField extends UIControl, implements UITextInput, implements NSCoding {


public var    NSString               *text;                 // default is nil
public var    NSAttributedString     *attributedText NS_AVAILABLE_IOS(6_0); // default is nil
	public var (nonatomic,retain) UIColor                *textColor;            // default is nil. use opaque black
	public var (nonatomic,retain) UIFont                 *font;                 // default is nil. use system font 12 pt
	public var         NSTextAlignment         textAlignment;        // default is NSLeftTextAlignment
	public var         UITextBorderStyle       borderStyle;          // default is UITextBorderStyleNone. If set to UITextBorderStyleRoundedRect, custom background images are ignored.
public var    NSString               *placeholder;          // default is nil. string is drawn 70% gray
public var    NSAttributedString     *attributedPlaceholder NS_AVAILABLE_IOS(6_0); // default is nil
	public var         BOOL                    clearsOnBeginEditing; // default is NO which moves cursor to location clicked. if YES, all text cleared
	public var         BOOL                    adjustsFontSizeToFitWidth; // default is NO. if YES, text will shrink to minFontSize along baseline
	public var         Float                 minimumFontSize;      // default is 0.0. actual min may be pinned to something readable. used if adjustsFontSizeToFitWidth is YES
	public var  id<UITextFieldDelegate> delegate;             // default is nil. weak reference
	public var (nonatomic,retain) UIImage                *background;           // default is nil. draw in border rect. image should be stretchable
	public var (nonatomic,retain) UIImage                *disabledBackground;   // default is nil. ignored if background not set. image should be stretchable

	public var (nonatomic,readonly,getter=isEditing) BOOL editing;
	public var  BOOL allowsEditingTextAttributes NS_AVAILABLE_IOS(6_0); // default is NO. allows editing text attributes with style operations and pasting rich text
public var  NSDictionary *typingAttributes NS_AVAILABLE_IOS(6_0); // automatically resets when the selection changes


	public var         UITextFieldViewMode  clearButtonMode; // sets when the clear button shows up. default is UITextFieldViewModeNever

	public var (nonatomic,retain) UIView              *leftView;        // e.g. magnifying glass
	public var         UITextFieldViewMode  leftViewMode;    // sets when the left view shows up. default is UITextFieldViewModeNever

	public var (nonatomic,retain) UIView              *rightView;       // e.g. bookmarks button
	public var         UITextFieldViewMode  rightViewMode;   // sets when the right view shows up. default is UITextFieldViewModeNever

// drawing and positioning overrides

- (CGRect)borderRectForBounds:(CGRect)bounds;
- (CGRect)textRectForBounds:(CGRect)bounds;
- (CGRect)placeholderRectForBounds:(CGRect)bounds;
- (CGRect)editingRectForBounds:(CGRect)bounds;
- (CGRect)clearButtonRectForBounds:(CGRect)bounds;
- (CGRect)leftViewRectForBounds:(CGRect)bounds;
- (CGRect)rightViewRectForBounds:(CGRect)bounds;

	public function drawTextInRect:(CGRect)rect;
	public function drawPlaceholderInRect:(CGRect)rect;

// Presented when object becomes first responder.  If set to nil, reverts to following responder chain.  If
// set while first responder, will not take effect until reloadInputViews is called.
	public var  (readwrite, retain) UIView *inputView;             
	public var  (readwrite, retain) UIView *inputAccessoryView;

	public var  BOOL clearsOnInsertion NS_AVAILABLE_IOS(6_0); // defaults to NO. if YES, the selection UI is hidden, and inserting text will replace the contents of the field. changing the selection will automatically set this to NO.

}

extern class UIView (UITextField)
- (BOOL)endEditing:(BOOL)force;    // use to make the view or any subview that is the first responder resign (optionally force)
}

extern interface UITextFieldDelegate {

	//@optional

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;        // return NO to disallow editing.
	public function textFieldDidBeginEditing:(UITextField *)textField;           // became first responder
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
	public function textFieldDidEndEditing:(UITextField *)textField;             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

- (BOOL)textFieldShouldClear:(UITextField *)textField;               // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldReturn:(UITextField *)textField;              // called when 'return' key pressed. return NO to ignore.

}

//UIKIT_EXTERN NSString *const UITextFieldTextDidBeginEditingNotification;
//UIKIT_EXTERN NSString *const UITextFieldTextDidEndEditingNotification;
//UIKIT_EXTERN NSString *const UITextFieldTextDidChangeNotification;

