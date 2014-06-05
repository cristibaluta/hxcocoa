/*	CFDate.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/

#if !defined(__COREFOUNDATION_CFDATE__)
#define __COREFOUNDATION_CFDATE__ 1

#include <CoreFoundation/CFBase.h>

CF_IMPLICIT_BRIDGING_ENABLED
CF_EXTERN_C_BEGIN

typedef double CFTimeInterval;
typedef CFTimeInterval CFAbsoluteTime;
/* absolute time is the time interval since the reference date */
/* the reference date (epoch) is 00:00:00 1 January 2001. */

	@:c public static function 
CFAbsoluteTime CFAbsoluteTimeGetCurrent(void);

	@:c public static function 
const CFTimeInterval kCFAbsoluteTimeIntervalSince1970;
	@:c public static function 
const CFTimeInterval kCFAbsoluteTimeIntervalSince1904;

typedef const struct __CFDate * CFDateRef;

	@:c public static function 
CFTypeID CFDateGetTypeID(void);

	@:c public static function 
CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at);

	@:c public static function 
CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate);

	@:c public static function 
CFTimeInterval CFDateGetTimeIntervalSinceDate(CFDateRef theDate, CFDateRef otherDate);

	@:c public static function 
CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context);

CF_IMPLICIT_BRIDGING_DISABLED

typedef const struct __CFTimeZone * CFTimeZoneRef;

typedef struct {
    SInt32 year;
    SInt8 month;
    SInt8 day;
    SInt8 hour;
    SInt8 minute;
    double second;
} CFGregorianDate;

typedef struct {
    SInt32 years;
    SInt32 months;
    SInt32 days;
    SInt32 hours;
    SInt32 minutes;
    double seconds;
} CFGregorianUnits;

typedef CF_OPTIONS(CFOptionFlags, CFGregorianUnitFlags) {
    kCFGregorianUnitsYears = (1UL << 0),
    kCFGregorianUnitsMonths = (1UL << 1),
    kCFGregorianUnitsDays = (1UL << 2),
    kCFGregorianUnitsHours = (1UL << 3),
    kCFGregorianUnitsMinutes = (1UL << 4),
    kCFGregorianUnitsSeconds = (1UL << 5),
    kCFGregorianAllUnits = 0x00FFFFFF
};

	@:c public static function 
Boolean CFGregorianDateIsValid(CFGregorianDate gdate, CFOptionFlags unitFlags);

	@:c public static function 
CFAbsoluteTime CFGregorianDateGetAbsoluteTime(CFGregorianDate gdate, CFTimeZoneRef tz);

	@:c public static function 
CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz);

	@:c public static function 
CFAbsoluteTime CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTime at, CFTimeZoneRef tz, CFGregorianUnits units);

	@:c public static function 
CFGregorianUnits CFAbsoluteTimeGetDifferenceAsGregorianUnits(CFAbsoluteTime at1, CFAbsoluteTime at2, CFTimeZoneRef tz, CFOptionFlags unitFlags);

	@:c public static function 
SInt32 CFAbsoluteTimeGetDayOfWeek(CFAbsoluteTime at, CFTimeZoneRef tz);

	@:c public static function 
SInt32 CFAbsoluteTimeGetDayOfYear(CFAbsoluteTime at, CFTimeZoneRef tz);

	@:c public static function 
SInt32 CFAbsoluteTimeGetWeekOfYear(CFAbsoluteTime at, CFTimeZoneRef tz);

CF_EXTERN_C_END

#endif /* ! __COREFOUNDATION_CFDATE__ */

