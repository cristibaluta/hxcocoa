//
//  NSAttributedString.h
package ios.ui;


@:framework("UIKit")
@:require(ios6)
extern enum NSAttributedString {
	NSFontAttributeName;				// UIFont, default Helvetica(Neue) 12
	NSParagraphStyleAttributeName;      // NSParagraphStyle, default defaultParagraphStyle
	NSForegroundColorAttributeName;     // UIColor, default blackColor
	NSBackgroundColorAttributeName;     // UIColor, default nil: no background
	NSLigatureAttributeName;            // NSNumber containing integer, default 1: default ligatures, 0: no ligatures, 2: all ligatures (Note: 2 is unsupported on iOS)
	NSKernAttributeName;                // NSNumber containing floating point value, in points; amount to modify default kerning. 0 means kerning is disabled. (note: values other than nil and 0 are unsupported on iOS)
	NSStrikethroughStyleAttributeName;  // NSNumber containing integer, default 0: no strikethrough
	NSUnderlineStyleAttributeName;      // NSNumber containing integer, default 0: no underline
	NSStrokeColorAttributeName;         // UIColor, default nil: same as foreground color
	NSStrokeWidthAttributeName;         // NSNumber containing floating point value, in percent of font point size, default 0: no stroke; positive for stroke alone, negative for stroke and fill (a typical value for outlined text would be 3.0)
	NSShadowAttributeName;              // NSShadow, default nil: no shadow
	NSVerticalGlyphFormAttributeName;
}

/* This defines currently supported values for NSUnderlineStyleAttributeName and NSStrikethroughStyleAttributeName, as of iOS 6.0.
 */
@:framework("UIKit")
@:require(ios6)
extern enum NSUnderlineStyleAttributeName {
    NSUnderlineStyleNone;
    NSUnderlineStyleSingle;
}
