/*	CFLocale.h
	Copyright (c) 2002-2012, Apple Inc. All rights reserved.
*/

#if !defined(__COREFOUNDATION_CFLOCALE__)
#define __COREFOUNDATION_CFLOCALE__ 1

#include <CoreFoundation/CFBase.h>
#include <CoreFoundation/CFArray.h>
#include <CoreFoundation/CFDictionary.h>

CF_IMPLICIT_BRIDGING_ENABLED
CF_EXTERN_C_BEGIN

typedef const struct __CFLocale *CFLocaleRef;

	@:c public static function 
CFTypeID CFLocaleGetTypeID(void);

	@:c public static function 
CFLocaleRef CFLocaleGetSystem(void);
	// Returns the "root", canonical locale.  Contains fixed "backstop" settings.

	@:c public static function 
CFLocaleRef CFLocaleCopyCurrent(void);
	// Returns the logical "user" locale for the current user.
	// [This is Copy in the sense that you get a retain you have to release,
	// but we may return the same cached object over and over.]  Settings
	// you get from this locale do not change under you as CFPreferences
	// are changed (for safety and correctness).  Generally you would not
	// grab this and hold onto it forever, but use it to do the operations
	// you need to do at the moment, then throw it away.  (The non-changing
	// ensures that all the results of your operations are consistent.)

	@:c public static function 
CFArrayRef CFLocaleCopyAvailableLocaleIdentifiers(void);
	// Returns an array of CFStrings that represents all locales for
	// which locale data is available.

	@:c public static function 
CFArrayRef CFLocaleCopyISOLanguageCodes(void);
	// Returns an array of CFStrings that represents all known legal ISO
	// language codes.  Note: many of these will not have any supporting
	// locale data in Mac OS X.

	@:c public static function 
CFArrayRef CFLocaleCopyISOCountryCodes(void);
	// Returns an array of CFStrings that represents all known legal ISO
	// country codes.  Note: many of these will not have any supporting
	// locale data in Mac OS X.

	@:c public static function 
CFArrayRef CFLocaleCopyISOCurrencyCodes(void);
	// Returns an array of CFStrings that represents all known legal ISO
	// currency codes.  Note: some of these currencies may be obsolete, or
	// represent other financial instruments.

	@:c public static function 
CFArrayRef CFLocaleCopyCommonISOCurrencyCodes(void) CF_AVAILABLE(10_5, 2_0);
	// Returns an array of CFStrings that represents ISO currency codes for
	// currencies in common use.

	@:c public static function 
CFArrayRef CFLocaleCopyPreferredLanguages(void) CF_AVAILABLE(10_5, 2_0);
	// Returns the array of canonicalized CFString locale IDs that the user prefers.

	@:c public static function 
CFStringRef CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier);
	// Map an arbitrary language identification string (something close at
	// least) to a canonical language identifier.

	@:c public static function 
CFStringRef CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier);
	// Map an arbitrary locale identification string (something close at
	// least) to the canonical identifier.

	@:c public static function 
CFStringRef CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes(CFAllocatorRef allocator, LangCode lcode, RegionCode rcode);
	// Map a Mac OS LangCode and RegionCode to the canonical locale identifier.

	@:c public static function 
CFStringRef CFLocaleCreateLocaleIdentifierFromWindowsLocaleCode(CFAllocatorRef allocator, uint32_t lcid) CF_AVAILABLE(10_6, 4_0);
	// Map a Windows LCID to the canonical locale identifier.

	@:c public static function 
uint32_t CFLocaleGetWindowsLocaleCodeFromLocaleIdentifier(CFStringRef localeIdentifier) CF_AVAILABLE(10_6, 4_0);
	// Map a locale identifier to a Windows LCID.

typedef CF_ENUM(CFIndex, CFLocaleLanguageDirection) {
    kCFLocaleLanguageDirectionUnknown = 0,
    kCFLocaleLanguageDirectionLeftToRight = 1,
    kCFLocaleLanguageDirectionRightToLeft = 2,
    kCFLocaleLanguageDirectionTopToBottom = 3,
    kCFLocaleLanguageDirectionBottomToTop = 4
};

	@:c public static function 
CFLocaleLanguageDirection CFLocaleGetLanguageCharacterDirection(CFStringRef isoLangCode) CF_AVAILABLE(10_6, 4_0);

	@:c public static function 
CFLocaleLanguageDirection CFLocaleGetLanguageLineDirection(CFStringRef isoLangCode) CF_AVAILABLE(10_6, 4_0);

	@:c public static function 
CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFStringRef localeID);
	// Parses a locale ID consisting of language, script, country, variant,
	// and keyword/value pairs into a dictionary. The keys are the constant
	// CFStrings corresponding to the locale ID components, and the values
	// will correspond to constants where available.
	// Example: "en_US@calendar=japanese" yields a dictionary with three
	// entries: kCFLocaleLanguageCode=en, kCFLocaleCountryCode=US, and
	// kCFLocaleCalendarIdentifier=kCFJapaneseCalendar.

	@:c public static function 
CFStringRef CFLocaleCreateLocaleIdentifierFromComponents(CFAllocatorRef allocator, CFDictionaryRef dictionary);
	// Reverses the actions of CFLocaleCreateDictionaryFromLocaleIdentifier,
	// creating a single string from the data in the dictionary. The
	// dictionary {kCFLocaleLanguageCode=en, kCFLocaleCountryCode=US,
	// kCFLocaleCalendarIdentifier=kCFJapaneseCalendar} becomes
	// "en_US@calendar=japanese".

	@:c public static function 
CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFStringRef localeIdentifier);
	// Returns a CFLocaleRef for the locale named by the "arbitrary" locale identifier.

	@:c public static function 
CFLocaleRef CFLocaleCreateCopy(CFAllocatorRef allocator, CFLocaleRef locale);
	// Having gotten a CFLocale from somebody, code should make a copy
	// if it is going to use it for several operations
	// or hold onto it.  In the future, there may be mutable locales.

	@:c public static function 
CFStringRef CFLocaleGetIdentifier(CFLocaleRef locale);
	// Returns the locale's identifier.  This may not be the same string
	// that the locale was created with (CFLocale may canonicalize it).

	@:c public static function 
CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFStringRef key);
	// Returns the value for the given key.  This is how settings and state
	// are accessed via a CFLocale.  Values might be of any CF type.

	@:c public static function 
CFStringRef CFLocaleCopyDisplayNameForPropertyValue(CFLocaleRef displayLocale, CFStringRef key, CFStringRef value);
	// Returns the display name for the given value.  The key tells what
	// the value is, and is one of the usual locale property keys, though
	// not all locale property keys have values with display name values.


	@:c public static function  const CFStringRef kCFLocaleCurrentLocaleDidChangeNotification CF_AVAILABLE(10_5, 2_0);


// Locale Keys
	@:c public static function  const CFStringRef kCFLocaleIdentifier;
	@:c public static function  const CFStringRef kCFLocaleLanguageCode;
	@:c public static function  const CFStringRef kCFLocaleCountryCode;
	@:c public static function  const CFStringRef kCFLocaleScriptCode;
	@:c public static function  const CFStringRef kCFLocaleVariantCode;

	@:c public static function  const CFStringRef kCFLocaleExemplarCharacterSet;
	@:c public static function  const CFStringRef kCFLocaleCalendarIdentifier;
	@:c public static function  const CFStringRef kCFLocaleCalendar;
	@:c public static function  const CFStringRef kCFLocaleCollationIdentifier;
	@:c public static function  const CFStringRef kCFLocaleUsesMetricSystem;
	@:c public static function  const CFStringRef kCFLocaleMeasurementSystem; // "Metric" or "U.S."
	@:c public static function  const CFStringRef kCFLocaleDecimalSeparator;
	@:c public static function  const CFStringRef kCFLocaleGroupingSeparator;
	@:c public static function  const CFStringRef kCFLocaleCurrencySymbol;
	@:c public static function  const CFStringRef kCFLocaleCurrencyCode; // ISO 3-letter currency code
	@:c public static function  const CFStringRef kCFLocaleCollatorIdentifier CF_AVAILABLE(10_6, 4_0);
	@:c public static function  const CFStringRef kCFLocaleQuotationBeginDelimiterKey CF_AVAILABLE(10_6, 4_0);
	@:c public static function  const CFStringRef kCFLocaleQuotationEndDelimiterKey CF_AVAILABLE(10_6, 4_0);
	@:c public static function  const CFStringRef kCFLocaleAlternateQuotationBeginDelimiterKey CF_AVAILABLE(10_6, 4_0);
	@:c public static function  const CFStringRef kCFLocaleAlternateQuotationEndDelimiterKey CF_AVAILABLE(10_6, 4_0);

// Values for kCFLocaleCalendarIdentifier
	@:c public static function  const CFStringRef kCFGregorianCalendar;
	@:c public static function  const CFStringRef kCFBuddhistCalendar;
	@:c public static function  const CFStringRef kCFChineseCalendar;
	@:c public static function  const CFStringRef kCFHebrewCalendar;
	@:c public static function  const CFStringRef kCFIslamicCalendar;
	@:c public static function  const CFStringRef kCFIslamicCivilCalendar;
	@:c public static function  const CFStringRef kCFJapaneseCalendar;
	@:c public static function  const CFStringRef kCFRepublicOfChinaCalendar CF_AVAILABLE(10_6, 4_0);
	@:c public static function  const CFStringRef kCFPersianCalendar CF_AVAILABLE(10_6, 4_0);
	@:c public static function  const CFStringRef kCFIndianCalendar CF_AVAILABLE(10_6, 4_0);
	@:c public static function  const CFStringRef kCFISO8601Calendar CF_AVAILABLE(10_6, 4_0);

CF_EXTERN_C_END
CF_IMPLICIT_BRIDGING_DISABLED

#endif /* ! __COREFOUNDATION_CFLOCALE__ */

