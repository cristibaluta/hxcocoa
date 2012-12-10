//
//  UIResponder.h
package ios.ui;
//
//  Copyright (c) 2005-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UIEvent.h>

extern class UIResponder extends NSObject {
  @private
}

- (UIResponder*)nextResponder;

- (BOOL)canBecomeFirstResponder;    // default is NO
- (BOOL)becomeFirstResponder;

- (BOOL)canResignFirstResponder;    // default is YES
- (BOOL)resignFirstResponder;

- (BOOL)isFirstResponder;

// Generally, all responders which do custom touch handling should override all four of these methods.
// Your responder will receive either touchesEnded:withEvent: or touchesCancelled:withEvent: for each
// touch it is handling (those touches it received in touchesBegan:withEvent:).
// *** You must handle cancelled touches to ensure correct behavior in your application.  Failure to
// do so is very likely to lead to incorrect behavior or crashes.
	public function touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
	public function touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
	public function touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
	public function touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

	public function motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event NS_AVAILABLE_IOS(3_0);
	public function motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event NS_AVAILABLE_IOS(3_0);
	public function motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event NS_AVAILABLE_IOS(3_0);

	public function remoteControlReceivedWithEvent:(UIEvent *)event NS_AVAILABLE_IOS(4_0);

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender NS_AVAILABLE_IOS(3_0);
	public var (default, null) NSUndoManager *undoManager NS_AVAILABLE_IOS(3_0);

}

extern class NSObject(UIResponderStandardEditActions)   // these methods are not implemented in NSObject

	public function cut:(id)sender NS_AVAILABLE_IOS(3_0);
	public function copy:(id)sender NS_AVAILABLE_IOS(3_0);
	public function paste:(id)sender NS_AVAILABLE_IOS(3_0);
	public function select:(id)sender NS_AVAILABLE_IOS(3_0);
	public function selectAll:(id)sender NS_AVAILABLE_IOS(3_0);
	public function delete:(id)sender NS_AVAILABLE_IOS(3_2);
	public function makeTextWritingDirectionLeftToRight:(id)sender NS_AVAILABLE_IOS(5_0);
	public function makeTextWritingDirectionRightToLeft:(id)sender NS_AVAILABLE_IOS(5_0);
	public function toggleBoldface:(id)sender NS_AVAILABLE_IOS(6_0);
	public function toggleItalics:(id)sender NS_AVAILABLE_IOS(6_0);
	public function toggleUnderline:(id)sender NS_AVAILABLE_IOS(6_0);

}

extern class UIResponder (UIResponderInputViewAdditions)

// Called and presented when object becomes first responder.  Goes up the responder chain.
	public var (default, null) UIView *inputView NS_AVAILABLE_IOS(3_2);            
	public var (default, null) UIView *inputAccessoryView NS_AVAILABLE_IOS(3_2); 

// If called while object is first responder, reloads inputView and inputAccessoryView.  Otherwise ignored.
	public function reloadInputViews NS_AVAILABLE_IOS(3_2);

}
