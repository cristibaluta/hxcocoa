//
//  UITextInput.h
package ios.ui;
//
//  Copyright (c) 2009-2012, Apple Inc. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>

#import <UIKit/UITextInputTraits.h>
#import <UIKit/UIResponder.h>

//===================================================================================================
// Responders that implement the UIKeyInput protocol will be driven by the system-provided keyboard,
// which will be made available whenever a conforming responder becomes first responder.

extern interface UIKeyInput <UITextInputTraits>

- (BOOL)hasText;
	public function insertText:(NSString *)text;
	public function deleteBackward;

}

//===================================================================================================
// Responders that implement the UITextInput protocol allow the system-provided keyboard to
// offer more sophisticated behaviors based on a current selection and context.

@class UITextPosition;
@class UITextRange;
@class UITextSelectionRect;

extern interface UITextInputTokenizer;
extern interface UITextInputDelegate;

typedef NS_ENUM(Int, UITextStorageDirection) {
    UITextStorageDirectionForward = 0,
    UITextStorageDirectionBackward
};

typedef NS_ENUM(Int, UITextLayoutDirection) {
    UITextLayoutDirectionRight = 2,
    UITextLayoutDirectionLeft,
    UITextLayoutDirectionUp,
    UITextLayoutDirectionDown
};

typedef NSInteger UITextDirection;

typedef NS_ENUM(Int, UITextWritingDirection) {
    UITextWritingDirectionNatural = -1,
    UITextWritingDirectionLeftToRight = 0,
    UITextWritingDirectionRightToLeft,
};

typedef NS_ENUM(Int, UITextGranularity) {
    UITextGranularityCharacter,
    UITextGranularityWord,
    UITextGranularitySentence,
    UITextGranularityParagraph,
    UITextGranularityLine,
    UITextGranularityDocument
};

@:require(5_1)extern class UIDictationPhrase extends NSObject {
    @private
        NSString *_text;
        NSArray *_alternativeInterpretations;
}

/* -text returns the most likely interpretation for a phrase. If there are other 
 * interpretations, -alternativeInterpretations will return an array of them, with 
 * the first being most likely and the last being least likely. */
	public var NSString *text;
	public var NSArray *alternativeInterpretations;

}

extern interface UITextInput <UIKeyInput>
@required

/* Methods for manipulating text. */
- (NSString *)textInRange:(UITextRange *)range;
	public function replaceRange:(UITextRange *)range withText:(NSString *)text;

/* Text may have a selection, either zero-length (a caret) or ranged.  Editing operations are
 * always performed on the text from this selection.  nil corresponds to no selection. */

	public var  UITextRange *selectedTextRange;

/* If text can be selected, it can be marked. Marked text represents provisionally
 * inserted text that has yet to be confirmed by the user.  It requires unique visual
 * treatment in its display.  If there is any marked text, the selection, whether a
 * caret or an extended range, always resides witihin.
 *
 * Setting marked text either replaces the existing marked text or, if none is present,
 * inserts it from the current selection. */ 

	public var UITextRange *markedTextRange;                       // Nil if no marked text.
	public var NSDictionary *markedTextStyle;                          // Describes how the marked text should be drawn.
	public function setMarkedText:(NSString *)markedText selectedRange:(NSRange)selectedRange;  // selectedRange is a range within the markedText
	public function unmarkText;

/* The end and beginning of the the text document. */
	public var UITextPosition *beginningOfDocument;
	public var UITextPosition *endOfDocument;

/* Methods for creating ranges and positions. */
- (UITextRange *)textRangeFromPosition:(UITextPosition *)fromPosition toPosition:(UITextPosition *)toPosition;
- (UITextPosition *)positionFromPosition:(UITextPosition *)position offset:(Int)offset;
- (UITextPosition *)positionFromPosition:(UITextPosition *)position inDirection:(UITextLayoutDirection)direction offset:(Int)offset;

/* Simple evaluation of positions */
- (NSComparisonResult)comparePosition:(UITextPosition *)position toPosition:(UITextPosition *)other;
- (Int)offsetFromPosition:(UITextPosition *)from toPosition:(UITextPosition *)toPosition;

/* A system-provied input delegate is assigned when the system is interested in input changes. */
	public var id <UITextInputDelegate> inputDelegate;

/* A tokenizer must be provided to inform the text input system about text units of varying granularity. */
	public var id <UITextInputTokenizer> tokenizer;

/* Layout questions. */
- (UITextPosition *)positionWithinRange:(UITextRange *)range farthestInDirection:(UITextLayoutDirection)direction;
- (UITextRange *)characterRangeByExtendingPosition:(UITextPosition *)position inDirection:(UITextLayoutDirection)direction;

/* Writing direction */
- (UITextWritingDirection)baseWritingDirectionForPosition:(UITextPosition *)position inDirection:(UITextStorageDirection)direction;
	public function setBaseWritingDirection:(UITextWritingDirection)writingDirection forRange:(UITextRange *)range;

/* Geometry used to provide, for example, a correction rect. */
- (CGRect)firstRectForRange:(UITextRange *)range;
- (CGRect)caretRectForPosition:(UITextPosition *)position;
- (NSArray *)selectionRectsForRange:(UITextRange *)range NS_AVAILABLE_IOS(6_0);       // Returns an array of UITextSelectionRects

/* Hit testing. */
- (UITextPosition *)closestPositionToPoint:(CGPoint)point;
- (UITextPosition *)closestPositionToPoint:(CGPoint)point withinRange:(UITextRange *)range;
- (UITextRange *)characterRangeAtPoint:(CGPoint)point;

@optional

- (BOOL)shouldChangeTextInRange:(UITextRange *)range replacementText:(NSString *)text NS_AVAILABLE_IOS(6_0);   // return NO to not change text

/* Text styling information can affect, for example, the appearance of a correction rect. */
- (NSDictionary *)textStylingAtPosition:(UITextPosition *)position inDirection:(UITextStorageDirection)direction;

/* To be implemented if there is not a one-to-one correspondence between text positions within range and character offsets into the associated string. */
- (UITextPosition *)positionWithinRange:(UITextRange *)range atCharacterOffset:(Int)offset;
- (Int)characterOffsetOfPosition:(UITextPosition *)position withinRange:(UITextRange *)range;

/* An affiliated view that provides a coordinate system for all geometric values in this protocol.
 * If unimplmeented, the first view in the responder chain will be selected. */
	public var UIView *textInputView;

/* Selection affinity determines whether, for example, the insertion point appears after the last
 * character on a line or before the first character on the following line in cases where text
 * wraps across line boundaries. */
	public var UITextStorageDirection selectionAffinity;

/* This is an optional method for clients that wish to support dictation phrase alternatives. If 
 * they do not implement this method, dictation will just insert the most likely interpretation 
 * of what was spoken via -insertText:.
 * dictationResult is an array of UIDictationPhrases. */
	public function insertDictationResult:(NSArray *)dictationResult;

/* These are optional methods for clients that wish to know when there are pending dictation results. */
	public function dictationRecordingDidEnd;
	public function dictationRecognitionFailed;

/* The following three optional methods are for clients that wish to support a placeholder for 
 * pending dictation results. -insertDictationPlaceholder must return a reference to the 
 * placeholder. This reference will be used to identify the placeholder by the other methods
 * (there may be more than one placeholder). */
- (id)insertDictationResultPlaceholder;
- (CGRect)frameForDictationResultPlaceholder:(id)placeholder;
/* willInsertResult will be NO if the recognition failed. */
	public function removeDictationResultPlaceholder:(id)placeholder willInsertResult:(BOOL)willInsertResult;

}

//---------------------------------------------------------------------------------------------------

/* Keys to style dictionaries. */
UIKIT_EXTERN NSString *const UITextInputTextBackgroundColorKey; // Key to a UIColor
UIKIT_EXTERN NSString *const UITextInputTextColorKey;           // Key to a UIColor
UIKIT_EXTERN NSString *const UITextInputTextFontKey;            // Key to a UIFont


/* To accommodate text entry in documents that contain nested elements, or in which supplying and
 * evaluating characters at indices is an expensive proposition, a position within a text input
 * document is represented as an object, not an integer.  UITextRange and UITextPosition are abstract
 * classes provided to be subclassed when adopting UITextInput */
extern class UITextPosition extends NSObject

}

extern class UITextRange extends NSObject

	public var  (nonatomic, readonly, getter=isEmpty) BOOL empty;     //  Whether the range is zero-length.
	public var UITextPosition *start;
	public var UITextPosition *end;

}

/* UITextSelectionRect defines an annotated selection rect used by the system to
 * offer rich text interaction experience.  It also serves as an abstract class
 * provided to be subclassed when adopting UITextInput */
@:require(6_0)extern class UITextSelectionRect extends NSObject

	public var CGRect rect;
	public var UITextWritingDirection writingDirection;
	public var BOOL containsStart; // Returns YES if the rect contains the start of the selection.
	public var BOOL containsEnd; // Returns YES if the rect contains the end of the selection.
	public var BOOL isVertical; // Returns YES if the rect is for vertically oriented text.

}

/* The input delegate must be notified of changes to the selection and text. */
extern interface UITextInputDelegate <NSObject>

	public function selectionWillChange:(id <UITextInput>)textInput;
	public function selectionDidChange:(id <UITextInput>)textInput;
	public function textWillChange:(id <UITextInput>)textInput;
	public function textDidChange:(id <UITextInput>)textInput;

}


/* A tokenizer allows the text input system to evaluate text units of varying granularity. */
extern interface UITextInputTokenizer <NSObject>

@required

- (UITextRange *)rangeEnclosingPosition:(UITextPosition *)position withGranularity:(UITextGranularity)granularity inDirection:(UITextDirection)direction;   // Returns range of the enclosing text unit of the given granularity, or nil if there is no such enclosing unit.  Whether a boundary position is enclosed depends on the given direction, using the same rule as isPosition:withinTextUnit:inDirection:
- (BOOL)isPosition:(UITextPosition *)position atBoundary:(UITextGranularity)granularity inDirection:(UITextDirection)direction;                             // Returns YES only if a position is at a boundary of a text unit of the specified granularity in the particular direction.
- (UITextPosition *)positionFromPosition:(UITextPosition *)position toBoundary:(UITextGranularity)granularity inDirection:(UITextDirection)direction;   // Returns the next boundary position of a text unit of the given granularity in the given direction, or nil if there is no such position.
- (BOOL)isPosition:(UITextPosition *)position withinTextUnit:(UITextGranularity)granularity inDirection:(UITextDirection)direction;                         // Returns YES if position is within a text unit of the given granularity.  If the position is at a boundary, returns YES only if the boundary is part of the text unit in the given direction.

}


/* A recommended base implementation of the tokenizer protocol. Subclasses are responsible
 * for handling directions and granularities affected by layout.*/
extern class UITextInputStringTokenizer extends NSObject <UITextInputTokenizer> {
  @package
    UIResponder <UITextInput> *_textInput;
}

- (id)initWithTextInput:(UIResponder <UITextInput> *)textInput;

}

@:require(4_2)extern class UITextInputMode extends NSObject

	public var (default, null) NSString *primaryLanguage; // The primary language, if any, of the input mode.  A BCP 47 language identifier such as en-US

+ (UITextInputMode *)currentInputMode; // The current input mode.  Nil if unset.
+ (NSArray *)activeInputModes; // The activate input modes.

}

UIKIT_EXTERN NSString *const UITextInputCurrentInputModeDidChangeNotification NS_AVAILABLE_IOS(4_2);
