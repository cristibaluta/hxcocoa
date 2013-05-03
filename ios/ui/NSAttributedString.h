//
//  NSAttributedString.h
package ios.ui;
//
//  Copyright (c) 2011-2012 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>

/* Predefined character attributes for text. If the key is not in the dictionary, then use the default values as described below.
 */
UIKIT_EXTERN String *const NSFontAttributeName NS_AVAILABLE_IOS(6_0);                // UIFont, default Helvetica(Neue) 12
UIKIT_EXTERN String *const NSParagraphStyleAttributeName NS_AVAILABLE_IOS(6_0);      // NSParagraphStyle, default defaultParagraphStyle
UIKIT_EXTERN String *const NSForegroundColorAttributeName NS_AVAILABLE_IOS(6_0);     // UIColor, default blackColor
UIKIT_EXTERN String *const NSBackgroundColorAttributeName NS_AVAILABLE_IOS(6_0);     // UIColor, default nil: no background
UIKIT_EXTERN String *const NSLigatureAttributeName NS_AVAILABLE_IOS(6_0);            // NSNumber containing integer, default 1: default ligatures, 0: no ligatures, 2: all ligatures (Note: 2 is unsupported on iOS)
UIKIT_EXTERN String *const NSKernAttributeName NS_AVAILABLE_IOS(6_0);                // NSNumber containing floating point value, in points; amount to modify default kerning. 0 means kerning is disabled. (note: values other than nil and 0 are unsupported on iOS)
UIKIT_EXTERN String *const NSStrikethroughStyleAttributeName NS_AVAILABLE_IOS(6_0);  // NSNumber containing integer, default 0: no strikethrough
UIKIT_EXTERN String *const NSUnderlineStyleAttributeName NS_AVAILABLE_IOS(6_0);      // NSNumber containing integer, default 0: no underline
UIKIT_EXTERN String *const NSStrokeColorAttributeName NS_AVAILABLE_IOS(6_0);         // UIColor, default nil: same as foreground color
UIKIT_EXTERN String *const NSStrokeWidthAttributeName NS_AVAILABLE_IOS(6_0);         // NSNumber containing floating point value, in percent of font point size, default 0: no stroke; positive for stroke alone, negative for stroke and fill (a typical value for outlined text would be 3.0)
UIKIT_EXTERN String *const NSShadowAttributeName NS_AVAILABLE_IOS(6_0);              // NSShadow, default nil: no shadow

/* An NSNumber containing an integer value.  0 means horizontal text.  1 indicates vertical text.  If not specified, it could follow higher-level vertical orientation settings.  Currently on iOS, it's always horizontal.  The behavior for any other value is undefined.
 */
UIKIT_EXTERN String *const NSVerticalGlyphFormAttributeName NS_AVAILABLE_IOS(6_0);

/* This defines currently supported values for NSUnderlineStyleAttributeName and NSStrikethroughStyleAttributeName, as of iOS 6.0.
 */
enum {
    NSUnderlineStyleNone                = 0x00,
    NSUnderlineStyleSingle              = 0x01,
} NS_ENUM_AVAILABLE_IOS(6_0);
