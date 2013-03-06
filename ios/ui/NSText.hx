package ios.ui;

/* Values for NSTextAlignment */
//@:require(ios6_0)
@:framework("UIKit")
extern enum NSTextAlignment {

    NSTextAlignmentLeft;    // Visually left aligned
    NSTextAlignmentCenter;    // Visually centered
    NSTextAlignmentRight;    // Visually right aligned
    NSTextAlignmentJustified;    // Fully-justified. The last line in a paragraph is natural-aligned.
    NSTextAlignmentNatural;    // Indicates the default alignment for script
}

//UIKIT_EXTERN CTTextAlignment NSTextAlignmentToCTTextAlignment(NSTextAlignment nsTextAlignment) NS_AVAILABLE_IOS(6_0);
//UIKIT_EXTERN NSTextAlignment NSTextAlignmentFromCTTextAlignment(CTTextAlignment ctTextAlignment) NS_AVAILABLE_IOS(6_0);

/* Values for NSWritingDirection */
//@:require(ios6_0)
@:framework("UIKit")
extern enum NSWritingDirection {
    NSWritingDirectionNatural;    // Determines direction using the Unicode Bidi Algorithm rules P2 and P3
    NSWritingDirectionLeftToRight;    // Left to right writing direction
    NSWritingDirectionRightToLeft;     // Right to left writing direction
}
