/*	CFTimeZone.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/

#if !defined(__COREFOUNDATION_CFTIMEZONE__)
#define __COREFOUNDATION_CFTIMEZONE__ 1

#include <CoreFoundation/CFBase.h>
#include <CoreFoundation/CFArray.h>
#include <CoreFoundation/CFData.h>
#include <CoreFoundation/CFDate.h>
#include <CoreFoundation/CFDictionary.h>
#include <CoreFoundation/CFString.h>

CF_IMPLICIT_BRIDGING_ENABLED
CF_EXTERN_C_BEGIN

	@:c public static function 
CFTypeID CFTimeZoneGetTypeID(void);

	@:c public static function 
CFTimeZoneRef CFTimeZoneCopySystem(void);

	@:c public static function 
void CFTimeZoneResetSystem(void);

	@:c public static function 
CFTimeZoneRef CFTimeZoneCopyDefault(void);

	@:c public static function 
void CFTimeZoneSetDefault(CFTimeZoneRef tz);

	@:c public static function 
CFArrayRef CFTimeZoneCopyKnownNames(void);

	@:c public static function 
CFDictionaryRef CFTimeZoneCopyAbbreviationDictionary(void);

	@:c public static function 
void CFTimeZoneSetAbbreviationDictionary(CFDictionaryRef dict);

	@:c public static function 
CFTimeZoneRef CFTimeZoneCreate(CFAllocatorRef allocator, CFStringRef name, CFDataRef data);

	@:c public static function 
CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti);

	@:c public static function 
CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev);

	@:c public static function 
CFStringRef CFTimeZoneGetName(CFTimeZoneRef tz);

	@:c public static function 
CFDataRef CFTimeZoneGetData(CFTimeZoneRef tz);

	@:c public static function 
CFTimeInterval CFTimeZoneGetSecondsFromGMT(CFTimeZoneRef tz, CFAbsoluteTime at);

	@:c public static function 
CFStringRef CFTimeZoneCopyAbbreviation(CFTimeZoneRef tz, CFAbsoluteTime at);

	@:c public static function 
Boolean CFTimeZoneIsDaylightSavingTime(CFTimeZoneRef tz, CFAbsoluteTime at);

	@:c public static function 
CFTimeInterval CFTimeZoneGetDaylightSavingTimeOffset(CFTimeZoneRef tz, CFAbsoluteTime at) CF_AVAILABLE(10_5, 2_0);

	@:c public static function 
CFAbsoluteTime CFTimeZoneGetNextDaylightSavingTimeTransition(CFTimeZoneRef tz, CFAbsoluteTime at) CF_AVAILABLE(10_5, 2_0);

typedef CF_ENUM(CFIndex, CFTimeZoneNameStyle) {
	kCFTimeZoneNameStyleStandard,
	kCFTimeZoneNameStyleShortStandard,
	kCFTimeZoneNameStyleDaylightSaving,
	kCFTimeZoneNameStyleShortDaylightSaving,
	kCFTimeZoneNameStyleGeneric,
	kCFTimeZoneNameStyleShortGeneric
} CF_ENUM_AVAILABLE(10_5, 2_0);

	@:c public static function 
CFStringRef CFTimeZoneCopyLocalizedName(CFTimeZoneRef tz, CFTimeZoneNameStyle style, CFLocaleRef locale) CF_AVAILABLE(10_5, 2_0);

	@:c public static function 
const CFStringRef kCFTimeZoneSystemTimeZoneDidChangeNotification CF_AVAILABLE(10_5, 2_0);

CF_EXTERN_C_END
CF_IMPLICIT_BRIDGING_DISABLED

#endif /* ! __COREFOUNDATION_CFTIMEZONE__ */

