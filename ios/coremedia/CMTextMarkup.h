/*
    File:  CMTextMarkup.h

    Framework:  CoreMedia
 
    Copyright 2012 Apple Inc. All rights reserved.

*/

#ifndef CMTEXTMARKUP_H
#define CMTEXTMARKUP_H

/*!
    @header
    @abstract   Definition of text markup related attributes to which Core Media will respond.

    @discussion Core Media includes support for legible media streams such as subtitles, captions and text. In some
                cases, clients may need to specify style information to control the rendering. In other cases,
                information about the text and applied styling may be communicated from Core Media to the client.
                To carry this information, Core Media defines a set of attributes that may be used in dictionaries
                that Core Media uses. These attributes can also be used as CFAttributedString attributes.
*/

#include <CoreMedia/CMBase.h>
#include <CoreFoundation/CoreFoundation.h>

#ifdef __cplusplus
extern "C" {
#endif
    
#pragma pack(push, 4)

#pragma mark CMTextMarkup Attributes

/*!
    @const      kCMTextMarkupAttribute_ForegroundColorARGB
    @abstract   The foreground color for text.
 
    @discussion Value must be a CFArray of 4 CFNumbers representing A, R, G, and B fields with values between 0 and 1.0.
*/
CM_EXPORT const CFStringRef kCMTextMarkupAttribute_ForegroundColorARGB __OSX_AVAILABLE_STARTING(__MAC_10_9, __IPHONE_6_0);

/*!
    @const      kCMTextMarkupAttribute_BackgroundColorARGB
    @abstract   The background color for the shape holding the text.
 
    @discussion Value must be a CFArray of 4 CFNumbers representing A, R, G, and B fields with values between 0 and 1.0.
*/
CM_EXPORT const CFStringRef kCMTextMarkupAttribute_BackgroundColorARGB __OSX_AVAILABLE_STARTING(__MAC_10_9, __IPHONE_6_0);

/*!
    @const      kCMTextMarkupAttribute_BoldStyle
    @abstract   Allows the setting of a bold style to be applied.

    @discussion Value must be a CFBoolean. The default is kCFBooleanFalse.
                If this attribute is kCFBooleanTrue, the text will be drawn 
                with a bold style. Other styles such as italic may or may 
                not be used as well.
*/
CM_EXPORT const CFStringRef kCMTextMarkupAttribute_BoldStyle __OSX_AVAILABLE_STARTING(__MAC_10_9, __IPHONE_6_0);

/*!
    @const      kCMTextMarkupAttribute_ItalicStyle
    @abstract   Allows the setting of an italic style to be applied.

    @discussion Value must be a CFBoolean. The default is kCFBooleanFalse.
                If this attribute is kCFBooleanTrue, the text will be rendered 
                with an italic style. Other styles such as bold may or may not 
                be used as well.
*/
CM_EXPORT const CFStringRef kCMTextMarkupAttribute_ItalicStyle __OSX_AVAILABLE_STARTING(__MAC_10_9, __IPHONE_6_0);

/*!
    @const      kCMTextMarkupAttribute_UnderlineStyle
    @abstract   Allows the setting of an underline to be applied at render
                time.

    @discussion Value must be a CFBoolean. The default is kCFBooleanFalse.
                If this attribute is kCFBooleanTrue, the text will be rendered 
                with an underline. Other styles such as bold may or may not 
                be used as well.
*/
CM_EXPORT const CFStringRef kCMTextMarkupAttribute_UnderlineStyle __OSX_AVAILABLE_STARTING(__MAC_10_9, __IPHONE_6_0);

/*!
    @const      kCMTextMarkupAttribute_FontFamilyName
    @abstract   The name of the font.
 
    @discussion Value must be a CFString holding the family name of an installed font
                (e.g., "Helvetica") that is used to render and/or measure text.
*/
CM_EXPORT const CFStringRef kCMTextMarkupAttribute_FontFamilyName __OSX_AVAILABLE_STARTING(__MAC_10_9, __IPHONE_6_0);

/*!
    @const      kCMTextMarkupAttribute_RelativeFontSize
    @abstract   The font size expressed as a percentage of the current default font size.
 
    @discussion Value must be a non-negative CFNumber. This is a number holding a percentage
                of the size of the calculated default font size.  A value
                of 120 indicates 20% larger than the default font size. A value of 80
                indicates 80% of the default font size.  The value 100 indicates no size
                difference and is the default.
*/
CM_EXPORT const CFStringRef kCMTextMarkupAttribute_RelativeFontSize __OSX_AVAILABLE_STARTING(__MAC_10_9, __IPHONE_6_0);

#pragma pack(pop)

#ifdef __cplusplus
}
#endif

#endif // CMTEXTMARKUP_H
