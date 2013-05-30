//
//  NSParagraphStyle.h
package ios.ui;


@:framework("UIKit")
@:require(ios6_0)
extern enum NSLineBreakMode {		/* What to do with long lines */
    NSLineBreakByWordWrapping;     	/* Wrap at word boundaries, default */
    NSLineBreakByCharWrapping;		/* Wrap at character boundaries */
    NSLineBreakByClipping;		/* Simply clip */
    NSLineBreakByTruncatingHead;	/* Truncate at head of line: "...wxyz" */
    NSLineBreakByTruncatingTail;	/* Truncate at tail of line: "abcd..." */
    NSLineBreakByTruncatingMiddle;	/* Truncate middle of line:  "ab...yz" */
}

@:framework("UIKit")
@require(ios_6_0)
extern class NSParagraphStyle extends NSObject {

+ (NSParagraphStyle *)defaultParagraphStyle;

+ (NSWritingDirection)defaultWritingDirectionForLanguage:(String *)languageName;  // languageName is in ISO lang region format

	public var lineSpacing (default, null) :Float ; /* "Leading": distance between the bottom of one line fragment and top of next (applied between lines in the same container). Can't be negative. This value is included in the line fragment heights in layout manager. */
	public var paragraphSpacing (default, null) :Float ; /* Distance between the bottom of this paragraph and top of next (or the beginning of its paragraphSpacingBefore, if any). */
	public var alignment (default, null) :NSTextAlignment ;

/* The following values are relative to the appropriate margin (depending on the paragraph direction) */

	public var headIndent (default, null) :Float ; /* Distance from margin to front edge of paragraph */
	public var tailIndent (default, null) :Float ; /* Distance from margin to back edge of paragraph; if negative or 0, from other margin */
	public var firstLineHeadIndent (default, null) :Float ; /* Distance from margin to edge appropriate for text direction */

	public var minimumLineHeight (default, null) :Float ; /* Line height is the distance from bottom of descenders to top of ascenders; basically the line fragment height. Does not include lineSpacing (which is added after this computation). */
	public var maximumLineHeight (default, null) :Float ; /* 0 implies no maximum. */ 

	public var lineBreakMode (default, null) :NSLineBreakMode ;

	public var baseWritingDirection (default, null) :NSWritingDirection ;

	public var lineHeightMultiple (default, null) :Float ; /* Natural line height is multiplied by this factor (if positive) before being constrained by minimum and maximum line height. */
	public var paragraphSpacingBefore (default, null) :Float ; /* Distance between the bottom of the previous paragraph (or the end of its paragraphSpacing, if any) and the top of this paragraph. */

/* Specifies the threshold for hyphenation.  Valid values lie between 0.0 and 1.0 inclusive.  Hyphenation will be attempted when the ratio of the text width as broken without hyphenation to the width of the line fragment is less than the hyphenation factor.  When this takes on its default value of 0.0, the layout manager's hyphenation factor is used instead.  When both are 0.0, hyphenation is disabled.
 
    NOTE: On iOS, the only supported values are 0.0 and 1.0.
*/
	public var hyphenationFactor (default, null) :Float;
}


@:framework("UIKit")
@:require(6_0)
extern class NSMutableParagraphStyle extends NSParagraphStyle {

	public var lineSpacing :Float;
	public var paragraphSpacing :Float;
	public var alignment :NSTextAlignment;
	public var firstLineHeadIndent :Float;
	public var headIndent :Float;
	public var tailIndent :Float;
	public var lineBreakMode :NSLineBreakMode;
	public var minimumLineHeight :Float;
	public var maximumLineHeight :Float;
	public var baseWritingDirection :NSWritingDirection;
	public var lineHeightMultiple :Float;
	public var paragraphSpacingBefore :Float;
	public var hyphenationFactor :Float;

}
