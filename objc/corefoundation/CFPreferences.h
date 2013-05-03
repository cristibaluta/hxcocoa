/*	CFPreferences.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/

#if !defined(__COREFOUNDATION_CFPREFERENCES__)
#define __COREFOUNDATION_CFPREFERENCES__ 1

#include <CoreFoundation/CFBase.h>
#include <CoreFoundation/CFArray.h>
#include <CoreFoundation/CFString.h>

CF_EXTERN_C_BEGIN

	@:c public static function 
const CFStringRef kCFPreferencesAnyApplication;
	@:c public static function 
const CFStringRef kCFPreferencesCurrentApplication;
	@:c public static function 
const CFStringRef kCFPreferencesAnyHost;
	@:c public static function 
const CFStringRef kCFPreferencesCurrentHost;
	@:c public static function 
const CFStringRef kCFPreferencesAnyUser;
	@:c public static function 
const CFStringRef kCFPreferencesCurrentUser;

/* NOTE: All CFPropertyListRef values returned from
         CFPreferences API should be assumed to be immutable.
*/

/*	The "App" functions search the various sources of defaults that
	apply to the given application, and should never be called with
	kCFPreferencesAnyApplication - only kCFPreferencesCurrentApplication
	or an application's ID (its bundle identifier).
*/

/* Searches the various sources of application defaults to find the
value for the given key. key must not be NULL.  If a value is found,
it returns it; otherwise returns NULL.  Caller must release the
returned value */
	@:c public static function 
CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID);

/* Convenience to interpret a preferences value as a boolean directly.
Returns false if the key doesn't exist, or has an improper format; under
those conditions, keyExistsAndHasValidFormat (if non-NULL) is set to false */
	@:c public static function 
Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat);

/* Convenience to interpret a preferences value as an integer directly.
Returns 0 if the key doesn't exist, or has an improper format; under
those conditions, keyExistsAndHasValidFormat (if non-NULL) is set to false */
	@:c public static function 
CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat);

/* Sets the given value for the given key in the "normal" place for
application preferences.  key must not be NULL.  If value is NULL,
key is removed instead. */
	@:c public static function 
void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID);

/* Adds the preferences for the given suite to the app preferences for
   the specified application.  To write to the suite domain, use
   CFPreferencesSetValue(), below, using the suiteName in place
   of the appName */
	@:c public static function 
void CFPreferencesAddSuitePreferencesToApp(CFStringRef applicationID, CFStringRef suiteID);

	@:c public static function 
void CFPreferencesRemoveSuitePreferencesFromApp(CFStringRef applicationID, CFStringRef suiteID);

/* Writes all changes in all sources of application defaults.
Returns success or failure. */
	@:c public static function 
Boolean CFPreferencesAppSynchronize(CFStringRef applicationID);

/* The primitive get mechanism; all arguments must be non-NULL
(use the constants above for common values).  Only the exact
location specified by app-user-host is searched.  The returned
CFType must be released by the caller when it is finished with it. */
	@:c public static function 
CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName);

/* Convenience to fetch multiple keys at once.  Keys in 
keysToFetch that are not present in the returned dictionary
are not present in the domain.  If keysToFetch is NULL, all
keys are fetched. */
	@:c public static function 
CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName);

/* The primitive set function; all arguments except value must be
non-NULL.  If value is NULL, the given key is removed */
	@:c public static function 
void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName);

/* Convenience to set multiple values at once.  Behavior is undefined
if a key is in both keysToSet and keysToRemove */
	@:c public static function 
void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName);

	@:c public static function 
Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName);

/* Constructs and returns the list of the name of all applications
which have preferences in the scope of the given user and host.
The returned value must be released by the caller; neither argument
may be NULL. */
	@:c public static function 
CFArrayRef CFPreferencesCopyApplicationList(CFStringRef userName, CFStringRef hostName);

/* Constructs and returns the list of all keys set in the given
location.  The returned value must be released by the caller;
all arguments must be non-NULL */
	@:c public static function 
CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName);

#ifndef CF_OPEN_SOURCE

/* Function to determine whether or not a given key has been imposed on the
user - In cases where machines and/or users are under some kind of management,
callers should use this function to determine whether or not to disable UI elements
corresponding to those preference keys. */
	@:c public static function 
Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID);

#endif

CF_EXTERN_C_END

#endif /* ! __COREFOUNDATION_CFPREFERENCES__ */

