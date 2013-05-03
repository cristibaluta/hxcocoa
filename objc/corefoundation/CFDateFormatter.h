/*	CFDateFormatter.h
	Copyright (c) 2003-2012, Apple Inc. All rights reserved.
*/

#if !defined(__COREFOUNDATION_CFDATEFORMATTER__)
#define __COREFOUNDATION_CFDATEFORMATTER__ 1

#include <CoreFoundation/CFBase.h>
#include <CoreFoundation/CFDate.h>
#include <CoreFoundation/CFLocale.h>

CF_EXTERN_C_BEGIN

typedef struct __CFDateFormatter *CFDateFormatterRef;

// CFDateFormatters are not thread-safe.  Do not use one from multiple threads!

	@:c public static function 
CFStringRef CFDateFormatterCreateDateFormatFromTemplate(CFAllocatorRef allocator, CFStringRef tmplate, CFOptionFlags options, CFLocaleRef locale) CF_AVAILABLE(10_6, 4_0);
	// no options defined, pass 0 for now

	@:c public static function 
CFTypeID CFDateFormatterGetTypeID(void);

typedef CF_ENUM(CFIndex, CFDateFormatterStyle) {	// date and time format styles
	kCFDateFormatterNoStyle = 0,
	kCFDateFormatterShortStyle = 1,
	kCFDateFormatterMediumStyle = 2,
	kCFDateFormatterLongStyle = 3,
	kCFDateFormatterFullStyle = 4
};

// The exact formatted result for these date and time styles depends on the
// locale, but generally:
//     Short is completely numeric, such as "12/13/52" or "3:30pm"
//     Medium is longer, such as "Jan 12, 1952"
//     Long is longer, such as "January 12, 1952" or "3:30:32pm"
//     Full is pretty complete; e.g. "Tuesday, April 12, 1952 AD" or "3:30:42pm PST"
// The specifications though are left fuzzy, in part simply because a user's
// preference choices may affect the output, and also the results may change
// from one OS release to another.  To produce an exactly formatted date you
// should not rely on styles and localization, but set the format string and
// use nothing but numbers.

	@:c public static function 
CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle);
	// Returns a CFDateFormatter, localized to the given locale, which
	// will format dates to the given date and time styles.

	@:c public static function 
CFLocaleRef CFDateFormatterGetLocale(CFDateFormatterRef formatter);

	@:c public static function 
CFDateFormatterStyle CFDateFormatterGetDateStyle(CFDateFormatterRef formatter);

	@:c public static function 
CFDateFormatterStyle CFDateFormatterGetTimeStyle(CFDateFormatterRef formatter);
	// Get the properties with which the date formatter was created.

	@:c public static function 
CFStringRef CFDateFormatterGetFormat(CFDateFormatterRef formatter);

	@:c public static function 
void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString);
	// Set the format description string of the date formatter.  This
	// overrides the style settings.  The format of the format string
	// is as defined by the ICU library.  The date formatter starts with a
	// default format string defined by the style arguments with
	// which it was created.


	@:c public static function 
CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date);

	@:c public static function 
CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at);
	// Create a string representation of the given date or CFAbsoluteTime
	// using the current state of the date formatter.


	@:c public static function 
CFDateRef CFDateFormatterCreateDateFromString(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFStringRef string, CFRange *rangep);

	@:c public static function 
Boolean CFDateFormatterGetAbsoluteTimeFromString(CFDateFormatterRef formatter, CFStringRef string, CFRange *rangep, CFAbsoluteTime *atp);
	// Parse a string representation of a date using the current state
	// of the date formatter.  The range parameter specifies the range
	// of the string in which the parsing should occur in input, and on
	// output indicates the extent that was used; this parameter can
	// be NULL, in which case the whole string may be used.  The
	// return value indicates whether some date was computed and
	// (if atp is not NULL) stored at the location specified by atp.


	@:c public static function 
void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value);

	@:c public static function 
CFTypeRef CFDateFormatterCopyProperty(CFDateFormatterRef formatter, CFStringRef key);
	// Set and get various properties of the date formatter, the set of
	// which may be expanded in the future.

	@:c public static function  const CFStringRef kCFDateFormatterIsLenient;	// CFBoolean
	@:c public static function  const CFStringRef kCFDateFormatterTimeZone;		// CFTimeZone
	@:c public static function  const CFStringRef kCFDateFormatterCalendarName;	// CFString
	@:c public static function  const CFStringRef kCFDateFormatterDefaultFormat;	// CFString
	@:c public static function  const CFStringRef kCFDateFormatterTwoDigitStartDate; // CFDate
	@:c public static function  const CFStringRef kCFDateFormatterDefaultDate;	// CFDate
	@:c public static function  const CFStringRef kCFDateFormatterCalendar;		// CFCalendar
	@:c public static function  const CFStringRef kCFDateFormatterEraSymbols;	// CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterMonthSymbols;	// CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterShortMonthSymbols; // CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterWeekdaySymbols;	// CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterShortWeekdaySymbols; // CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterAMSymbol;		// CFString
	@:c public static function  const CFStringRef kCFDateFormatterPMSymbol;		// CFString
	@:c public static function  const CFStringRef kCFDateFormatterLongEraSymbols CF_AVAILABLE(10_5, 2_0);   // CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterVeryShortMonthSymbols CF_AVAILABLE(10_5, 2_0); // CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterStandaloneMonthSymbols CF_AVAILABLE(10_5, 2_0); // CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterShortStandaloneMonthSymbols CF_AVAILABLE(10_5, 2_0); // CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterVeryShortStandaloneMonthSymbols CF_AVAILABLE(10_5, 2_0); // CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterVeryShortWeekdaySymbols CF_AVAILABLE(10_5, 2_0); // CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterStandaloneWeekdaySymbols CF_AVAILABLE(10_5, 2_0); // CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterShortStandaloneWeekdaySymbols CF_AVAILABLE(10_5, 2_0); // CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterVeryShortStandaloneWeekdaySymbols CF_AVAILABLE(10_5, 2_0); // CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterQuarterSymbols CF_AVAILABLE(10_5, 2_0); 	// CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterShortQuarterSymbols CF_AVAILABLE(10_5, 2_0); // CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterStandaloneQuarterSymbols CF_AVAILABLE(10_5, 2_0); // CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterShortStandaloneQuarterSymbols CF_AVAILABLE(10_5, 2_0); // CFArray of CFString
	@:c public static function  const CFStringRef kCFDateFormatterGregorianStartDate CF_AVAILABLE(10_5, 2_0); // CFDate
	@:c public static function  const CFStringRef kCFDateFormatterDoesRelativeDateFormattingKey CF_AVAILABLE(10_6, 4_0); // CFBoolean

// See CFLocale.h for these calendar constants:
//	const CFStringRef kCFGregorianCalendar;
//	const CFStringRef kCFBuddhistCalendar;
//	const CFStringRef kCFJapaneseCalendar;
//	const CFStringRef kCFIslamicCalendar;
//	const CFStringRef kCFIslamicCivilCalendar;
//	const CFStringRef kCFHebrewCalendar;
//	const CFStringRef kCFChineseCalendar;
//	const CFStringRef kCFRepublicOfChinaCalendar;
//	const CFStringRef kCFPersianCalendar;
//	const CFStringRef kCFIndianCalendar;
//	const CFStringRef kCFISO8601Calendar;

CF_EXTERN_C_END

#endif /* ! __COREFOUNDATION_CFDATEFORMATTER__ */

