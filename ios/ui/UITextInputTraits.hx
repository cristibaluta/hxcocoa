//
//  UITextInputTraits.h
package ios.ui;

//
// UITextAutocapitalizationType
//
// Controls autocapitalization behavior for a text widget.
// Note: Capitalization does not apply in all script systems. In such
// cases, these values are ignored by the keyboard/input method implementation.
//

@:framework("UIKit")
extern enum UITextAutocapitalizationType {
    UITextAutocapitalizationTypeNone;
    UITextAutocapitalizationTypeWords;
    UITextAutocapitalizationTypeSentences;
    UITextAutocapitalizationTypeAllCharacters;
}

//
// UITextAutocorrectionType
//
// Controls keyboard autocorrection behavior for a text widget.
// Note: Some input methods do not support inline autocorrection, and 
// instead use a conversion and/or candidate selection methodology. In such
// cases, these values are ignored by the keyboard/input method implementation.
//

@:framework("UIKit")
extern enum UITextAutocorrectionType {
    UITextAutocorrectionTypeDefault;
    UITextAutocorrectionTypeNo;
    UITextAutocorrectionTypeYes;
}

//
// UITextSpellCheckingType
//
// Controls the annotation of misspelled words for a text widget.
// Note: Some input methods do not support spell checking.

@:framework("UIKit")
@:require(ios5_0)
extern enum UITextSpellCheckingType {
    UITextSpellCheckingTypeDefault;
    UITextSpellCheckingTypeNo;
    UITextSpellCheckingTypeYes;
}

//
// UIKeyboardType
//
// Requests that a particular keyboard type be displayed when a text widget
// becomes first responder. 
// Note: Some keyboard/input methods types may not support every variant. 
// In such cases, the input method will make a best effort to find a close 
// match to the requested type (e.g. displaying UIKeyboardTypeNumbersAndPunctuation 
// type if UIKeyboardTypeNumberPad is not supported).
//

@:framework("UIKit")
extern enum UIKeyboardType {
    UIKeyboardTypeDefault;                // Default type for the current input method.
    UIKeyboardTypeASCIICapable;           // Displays a keyboard which can enter ASCII characters, non-ASCII keyboards remain active
    UIKeyboardTypeNumbersAndPunctuation;  // Numbers and assorted punctuation.
    UIKeyboardTypeURL;                    // A type optimized for URL entry (shows . / .com prominently).
    UIKeyboardTypeNumberPad;              // A number pad (0-9). Suitable for PIN entry.
    UIKeyboardTypePhonePad;               // A phone pad (1-9, *, 0, #, with letters under the numbers).
    UIKeyboardTypeNamePhonePad;           // A type optimized for entering a person's name or phone number.
    UIKeyboardTypeEmailAddress;           // A type optimized for multiple email address entry (shows space @ . prominently).
	UIKeyboardTypeDecimalPad;             // A number pad with a decimal point.
    @:require(ios5_0)UIKeyboardTypeTwitter;// A type optimized for twitter text entry (easy access to @ #)

    UIKeyboardTypeAlphabet;
}

//
// UIKeyboardAppearance
//
// Requests a keyboard appearance be used when a text widget
// becomes first responder.. 
// Note: Some keyboard/input methods types may not support every variant. 
// In such cases, the input method will make a best effort to find a close 
// match to the requested type.
//

@:framework("UIKit")
extern enum UIKeyboardAppearance {
    UIKeyboardAppearanceDefault;          // Default apperance for the current input method.
    UIKeyboardAppearanceAlert;             // Appearance suitable for use in "alert" scenarios.
}

//
// UIReturnKeyType
//
// Controls the display of the return key. 
//
// Note: This enum is under discussion and may be replaced with a 
// different implementation.
//

@:framework("UIKit")
extern enum UIReturnKeyType {
    UIReturnKeyDefault;
    UIReturnKeyGo;
    UIReturnKeyGoogle;
    UIReturnKeyJoin;
    UIReturnKeyNext;
    UIReturnKeyRoute;
    UIReturnKeySearch;
    UIReturnKeySend;
    UIReturnKeyYahoo;
    UIReturnKeyDone;
    UIReturnKeyEmergencyCall;
}

//
// UITextInputTraits
//
// Controls features of text widgets (or other custom objects that might wish 
// to respond to keyboard input).
//
@:framework("UIKit")
extern interface UITextInputTraits {

#if display

	public var  UITextAutocapitalizationType autocapitalizationType; // default is UITextAutocapitalizationTypeSentences
	public var  UITextAutocorrectionType autocorrectionType;         // default is UITextAutocorrectionTypeDefault
	public var  UITextSpellCheckingType spellCheckingType NS_AVAILABLE_IOS(5_0); // default is UITextSpellCheckingTypeDefault;
	public var  UIKeyboardType keyboardType;                         // default is UIKeyboardTypeDefault
	public var  UIKeyboardAppearance keyboardAppearance;             // default is UIKeyboardAppearanceDefault
	public var  UIReturnKeyType returnKeyType;                       // default is UIReturnKeyDefault (See note under UIReturnKeyType enum)
	public var  BOOL enablesReturnKeyAutomatically;                  // default is NO (when YES, will automatically disable return key when text widget has zero-length contents, and will automatically enable when text widget has non-zero-length contents)
	public var (nonatomic,getter=isSecureTextEntry) BOOL secureTextEntry;       // default is NO
#end
}

