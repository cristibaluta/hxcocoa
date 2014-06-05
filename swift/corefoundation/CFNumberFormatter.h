/*	CFNumberFormatter.h
	Copyright (c) 2003-2012, Apple Inc. All rights reserved.
*/

#if !defined(__COREFOUNDATION_CFNUMBERFORMATTER__)
#define __COREFOUNDATION_CFNUMBERFORMATTER__ 1

#include <CoreFoundation/CFBase.h>
#include <CoreFoundation/CFNumber.h>
#include <CoreFoundation/CFLocale.h>

CF_EXTERN_C_BEGIN

typedef struct __CFNumberFormatter *CFNumberFormatterRef;

// CFNumberFormatters are not thread-safe.  Do not use one from multiple threads!

	@:c public static function 
CFTypeID CFNumberFormatterGetTypeID(void);

typedef CF_ENUM(CFIndex, CFNumberFormatterStyle) {	// number format styles
	kCFNumberFormatterNoStyle = 0,
	kCFNumberFormatterDecimalStyle = 1,
	kCFNumberFormatterCurrencyStyle = 2,
	kCFNumberFormatterPercentStyle = 3,
	kCFNumberFormatterScientificStyle = 4,
	kCFNumberFormatterSpellOutStyle = 5
};


	@:c public static function 
CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style);
	// Returns a CFNumberFormatter, localized to the given locale, which
	// will format numbers to the given style.

	@:c public static function 
CFLocaleRef CFNumberFormatterGetLocale(CFNumberFormatterRef formatter);

	@:c public static function 
CFNumberFormatterStyle CFNumberFormatterGetStyle(CFNumberFormatterRef formatter);
	// Get the properties with which the number formatter was created.

	@:c public static function 
CFStringRef CFNumberFormatterGetFormat(CFNumberFormatterRef formatter);

	@:c public static function 
void CFNumberFormatterSetFormat(CFNumberFormatterRef formatter, CFStringRef formatString);
	// Set the format description string of the number formatter.  This
	// overrides the style settings.  The format of the format string
	// is as defined by the ICU library, and is similar to that found
	// in Microsoft Excel and NSNumberFormatter.
	// The number formatter starts with a default format string defined
	// by the style argument with which it was created.


	@:c public static function 
CFStringRef CFNumberFormatterCreateStringWithNumber(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberRef number);

	@:c public static function 
CFStringRef CFNumberFormatterCreateStringWithValue(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberType numberType, const void *valuePtr);
	// Create a string representation of the given number or value
	// using the current state of the number formatter.


typedef CF_OPTIONS(CFOptionFlags, CFNumberFormatterOptionFlags) {
    kCFNumberFormatterParseIntegersOnly = 1	/* only parse integers */
};

	@:c public static function 
CFNumberRef CFNumberFormatterCreateNumberFromString(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFOptionFlags options);

	@:c public static function 
Boolean CFNumberFormatterGetValueFromString(CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFNumberType numberType, void *valuePtr);
	// Parse a string representation of a number using the current state
	// of the number formatter.  The range parameter specifies the range
	// of the string in which the parsing should occur in input, and on
	// output indicates the extent that was used; this parameter can
	// be NULL, in which case the whole string may be used.  The
	// return value indicates whether some number was computed and
	// (if valuePtr is not NULL) stored at the location specified by
	// valuePtr.  The numberType indicates the type of value pointed
	// to by valuePtr.


	@:c public static function 
void CFNumberFormatterSetProperty(CFNumberFormatterRef formatter, CFStringRef key, CFTypeRef value);

	@:c public static function 
CFTypeRef CFNumberFormatterCopyProperty(CFNumberFormatterRef formatter, CFStringRef key);
	// Set and get various properties of the number formatter, the set of
	// which may be expanded in the future.

	@:c public static function  const CFStringRef kCFNumberFormatterCurrencyCode;		// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterDecimalSeparator;	// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterCurrencyDecimalSeparator; // CFString
	@:c public static function  const CFStringRef kCFNumberFormatterAlwaysShowDecimalSeparator; // CFBoolean
	@:c public static function  const CFStringRef kCFNumberFormatterGroupingSeparator;	// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterUseGroupingSeparator;	// CFBoolean
	@:c public static function  const CFStringRef kCFNumberFormatterPercentSymbol;		// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterZeroSymbol;		// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterNaNSymbol;		// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterInfinitySymbol;		// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterMinusSign;		// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterPlusSign;		// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterCurrencySymbol;		// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterExponentSymbol;		// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterMinIntegerDigits;	// CFNumber
	@:c public static function  const CFStringRef kCFNumberFormatterMaxIntegerDigits;	// CFNumber
	@:c public static function  const CFStringRef kCFNumberFormatterMinFractionDigits;	// CFNumber
	@:c public static function  const CFStringRef kCFNumberFormatterMaxFractionDigits;	// CFNumber
	@:c public static function  const CFStringRef kCFNumberFormatterGroupingSize;		// CFNumber
	@:c public static function  const CFStringRef kCFNumberFormatterSecondaryGroupingSize;	// CFNumber
	@:c public static function  const CFStringRef kCFNumberFormatterRoundingMode;		// CFNumber
	@:c public static function  const CFStringRef kCFNumberFormatterRoundingIncrement;	// CFNumber
	@:c public static function  const CFStringRef kCFNumberFormatterFormatWidth;		// CFNumber
	@:c public static function  const CFStringRef kCFNumberFormatterPaddingPosition;	// CFNumber
	@:c public static function  const CFStringRef kCFNumberFormatterPaddingCharacter;	// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterDefaultFormat;		// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterMultiplier;		// CFNumber
	@:c public static function  const CFStringRef kCFNumberFormatterPositivePrefix;		// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterPositiveSuffix;		// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterNegativePrefix;		// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterNegativeSuffix;		// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterPerMillSymbol;		// CFString
	@:c public static function  const CFStringRef kCFNumberFormatterInternationalCurrencySymbol; // CFString
	@:c public static function  const CFStringRef kCFNumberFormatterCurrencyGroupingSeparator CF_AVAILABLE(10_5, 2_0); // CFString
	@:c public static function  const CFStringRef kCFNumberFormatterIsLenient CF_AVAILABLE(10_5, 2_0);		// CFBoolean
	@:c public static function  const CFStringRef kCFNumberFormatterUseSignificantDigits CF_AVAILABLE(10_5, 2_0);	// CFBoolean
	@:c public static function  const CFStringRef kCFNumberFormatterMinSignificantDigits CF_AVAILABLE(10_5, 2_0);	// CFNumber
	@:c public static function  const CFStringRef kCFNumberFormatterMaxSignificantDigits CF_AVAILABLE(10_5, 2_0);	// CFNumber

typedef CF_ENUM(CFIndex, CFNumberFormatterRoundingMode) {
    kCFNumberFormatterRoundCeiling = 0,
    kCFNumberFormatterRoundFloor = 1,
    kCFNumberFormatterRoundDown = 2,
    kCFNumberFormatterRoundUp = 3,
    kCFNumberFormatterRoundHalfEven = 4,
    kCFNumberFormatterRoundHalfDown = 5,
    kCFNumberFormatterRoundHalfUp = 6
};

typedef CF_ENUM(CFIndex, CFNumberFormatterPadPosition) {
    kCFNumberFormatterPadBeforePrefix = 0,
    kCFNumberFormatterPadAfterPrefix = 1,
    kCFNumberFormatterPadBeforeSuffix = 2,
    kCFNumberFormatterPadAfterSuffix = 3
};


	@:c public static function 
Boolean CFNumberFormatterGetDecimalInfoForCurrencyCode(CFStringRef currencyCode, int32_t *defaultFractionDigits, double *roundingIncrement);
	// Returns the number of fraction digits that should be displayed, and
	// the rounding increment (or 0.0 if no rounding is done by the currency)
	// for the given currency.  Returns false if the currency code is unknown
	// or the information is not available.
	// Not localized because these are properties of the currency.

CF_EXTERN_C_END

#endif /* ! __COREFOUNDATION_CFNUMBERFORMATTER__ */

