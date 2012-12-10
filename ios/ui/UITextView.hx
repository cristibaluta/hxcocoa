//
//  UITextView.h
package ios.ui;
//
//  Copyright (c) 2007-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIScrollView.h>
#import <UIKit/UIStringDrawing.h>
#import <UIKit/UITextInput.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UIDataDetectors.h>

@class DOMHTMLElement;
@class UIDelayedAction;
@class UIEvent, UITouch, UIFont, UIColor;
@class UITextInputTraits;
@class UITextInteractionAssistant;
@class UIWebDocumentView;
@class WebCoreFrameBridge;
@class WebFrame;
@class UITextInteractionAssistant;
@class UITextSelectionView;
@class UITextView;


extern interface UITextViewDelegate <NSObject, UIScrollViewDelegate>

@optional

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;
- (BOOL)textViewShouldEndEditing:(UITextView *)textView;

	public function textViewDidBeginEditing:(UITextView *)textView;
	public function textViewDidEndEditing:(UITextView *)textView;

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
	public function textViewDidChange:(UITextView *)textView;

	public function textViewDidChangeSelection:(UITextView *)textView;

}


extern class UITextView : UIScrollView <UITextInput> 
{
  @package
    WebFrame           *m_frame;
    DOMHTMLElement     *m_body;
    int                 m_marginTop;
    UIDelayedAction    *m_selectionTimer;
    UIDelayedAction    *m_longPressAction;
    BOOL                m_editable;
    BOOL                m_editing;
    BOOL                m_becomesEditableWithGestures;
    BOOL                m_reentrancyGuard;
    BOOL                m_readyForScroll;
    BOOL                m_hasExplicitTextAlignment;
    BOOL                m_hasExplicitLineHeight;
    
    // Gesture recognition.
    UITextInteractionAssistant *m_interactionAssistant;
    
    // property ivars
    UIWebDocumentView  *m_webView;
    UIFont             *m_font;
    UIColor            *m_textColor;
    NSTextAlignment     m_textAlignment;
    UIView             *m_inputView;
    UIView             *m_inputAccessoryView;
    Float             m_lineHeight;
    BOOL                m_skipScrollContainingView;
    BOOL                m_allowsEditingTextAttributes;
    BOOL                m_usesAttributedText;
    BOOL                m_clearsOnInsertion;
}

	public var  id<UITextViewDelegate> delegate;
public var  NSString *text;
	public var (nonatomic,retain) UIFont *font;
	public var (nonatomic,retain) UIColor *textColor;
	public var  NSTextAlignment textAlignment;    // default is NSLeftTextAlignment
	public var  NSRange selectedRange;
	public var (nonatomic,getter=isEditable) BOOL editable;
	public var  UIDataDetectorTypes dataDetectorTypes NS_AVAILABLE_IOS(3_0);

	public var  BOOL allowsEditingTextAttributes NS_AVAILABLE_IOS(6_0); // defaults to NO
public var  NSAttributedString *attributedText NS_AVAILABLE_IOS(6_0); // default is nil
public var  NSDictionary *typingAttributes NS_AVAILABLE_IOS(6_0); // automatically resets when the selection changes

- (BOOL)hasText;
	public function scrollRangeToVisible:(NSRange)range;


// Presented when object becomes first responder.  If set to nil, reverts to following responder chain.  If
// set while first responder, will not take effect until reloadInputViews is called.
	public var  (readwrite, retain) UIView *inputView;             
	public var  (readwrite, retain) UIView *inputAccessoryView;

	public var  BOOL clearsOnInsertion NS_AVAILABLE_IOS(6_0); // defaults to NO. if YES, the selection UI is hidden, and inserting text will replace the contents of the field. changing the selection will automatically set this to NO.

}

UIKIT_EXTERN NSString * const UITextViewTextDidBeginEditingNotification;
UIKIT_EXTERN NSString * const UITextViewTextDidChangeNotification;
UIKIT_EXTERN NSString * const UITextViewTextDidEndEditingNotification;
