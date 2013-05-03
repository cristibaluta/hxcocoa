/*	CFCalendar.h
	Copyright (c) 2004-2012, Apple Inc. All rights reserved.
*/

#if !defined(__COREFOUNDATION_CFCALENDAR__)
#define __COREFOUNDATION_CFCALENDAR__ 1

#include <CoreFoundation/CFBase.h>
#include <CoreFoundation/CFLocale.h>
#include <CoreFoundation/CFDate.h>
#include <CoreFoundation/CFTimeZone.h>

CF_IMPLICIT_BRIDGING_ENABLED
CF_EXTERN_C_BEGIN

typedef struct __CFCalendar * CFCalendarRef;

	@:c public static function 
CFTypeID CFCalendarGetTypeID(void);

	@:c public static function 
CFCalendarRef CFCalendarCopyCurrent(void);

	@:c public static function 
CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFStringRef identifier);
	// Create a calendar.  The identifiers are the kCF*Calendar
	// constants in CFLocale.h.

	@:c public static function 
CFStringRef CFCalendarGetIdentifier(CFCalendarRef calendar);
	// Returns the calendar's identifier.

	@:c public static function 
CFLocaleRef CFCalendarCopyLocale(CFCalendarRef calendar);

	@:c public static function 
void CFCalendarSetLocale(CFCalendarRef calendar, CFLocaleRef locale);

	@:c public static function 
CFTimeZoneRef CFCalendarCopyTimeZone(CFCalendarRef calendar);

	@:c public static function 
void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz);

	@:c public static function 
CFIndex CFCalendarGetFirstWeekday(CFCalendarRef calendar);

	@:c public static function 
void CFCalendarSetFirstWeekday(CFCalendarRef calendar, CFIndex wkdy);

	@:c public static function 
CFIndex CFCalendarGetMinimumDaysInFirstWeek(CFCalendarRef calendar);

	@:c public static function 
void CFCalendarSetMinimumDaysInFirstWeek(CFCalendarRef calendar, CFIndex mwd);


typedef CF_OPTIONS(CFOptionFlags, CFCalendarUnit) {
	kCFCalendarUnitEra = (1UL << 1),
	kCFCalendarUnitYear = (1UL << 2),
	kCFCalendarUnitMonth = (1UL << 3),
	kCFCalendarUnitDay = (1UL << 4),
	kCFCalendarUnitHour = (1UL << 5),
	kCFCalendarUnitMinute = (1UL << 6),
	kCFCalendarUnitSecond = (1UL << 7),
	kCFCalendarUnitWeek = (1UL << 8) /* CF_DEPRECATED(10_4, 10_7, 2_0, 5_0) */,
	kCFCalendarUnitWeekday = (1UL << 9),
	kCFCalendarUnitWeekdayOrdinal = (1UL << 10),
	kCFCalendarUnitQuarter CF_ENUM_AVAILABLE(10_6, 4_0) = (1UL << 11),
	kCFCalendarUnitWeekOfMonth CF_ENUM_AVAILABLE(10_7, 5_0) = (1UL << 12),
	kCFCalendarUnitWeekOfYear CF_ENUM_AVAILABLE(10_7, 5_0) = (1UL << 13),
	kCFCalendarUnitYearForWeekOfYear CF_ENUM_AVAILABLE(10_7, 5_0) = (1UL << 14),
};

	@:c public static function 
CFRange CFCalendarGetMinimumRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit unit);

	@:c public static function 
CFRange CFCalendarGetMaximumRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit unit);

	@:c public static function 
CFRange CFCalendarGetRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit smallerUnit, CFCalendarUnit biggerUnit, CFAbsoluteTime at);

	@:c public static function 
CFIndex CFCalendarGetOrdinalityOfUnit(CFCalendarRef calendar, CFCalendarUnit smallerUnit, CFCalendarUnit biggerUnit, CFAbsoluteTime at);

	@:c public static function 
Boolean CFCalendarGetTimeRangeOfUnit(CFCalendarRef calendar, CFCalendarUnit unit, CFAbsoluteTime at, CFAbsoluteTime *startp, CFTimeInterval *tip) CF_AVAILABLE(10_5, 2_0);

	@:c public static function 
Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, /* out */ CFAbsoluteTime *at, const char *componentDesc, ...);

	@:c public static function 
Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...);


enum {
    kCFCalendarComponentsWrap = (1UL << 0)  // option for adding
};

	@:c public static function 
Boolean CFCalendarAddComponents(CFCalendarRef calendar, /* inout */ CFAbsoluteTime *at, CFOptionFlags options, const char *componentDesc, ...);

	@:c public static function 
Boolean CFCalendarGetComponentDifference(CFCalendarRef calendar, CFAbsoluteTime startingAT, CFAbsoluteTime resultAT, CFOptionFlags options, const char *componentDesc, ...);


CF_EXTERN_C_END
CF_IMPLICIT_BRIDGING_DISABLED

#endif /* ! __COREFOUNDATION_CFCALENDAR__ */

