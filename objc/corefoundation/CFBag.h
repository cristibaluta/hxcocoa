/*	CFBag.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/

#if !defined(__COREFOUNDATION_CFBAG__)
#define __COREFOUNDATION_CFBAG__ 1

#include <CoreFoundation/CFBase.h>

CF_IMPLICIT_BRIDGING_ENABLED
CF_EXTERN_C_BEGIN

typedef const void *	(*CFBagRetainCallBack)(CFAllocatorRef allocator, const void *value);
typedef void		(*CFBagReleaseCallBack)(CFAllocatorRef allocator, const void *value);
typedef CFStringRef	(*CFBagCopyDescriptionCallBack)(const void *value);
typedef Boolean		(*CFBagEqualCallBack)(const void *value1, const void *value2);
typedef CFHashCode	(*CFBagHashCallBack)(const void *value);
typedef struct {
    CFIndex				version;
    CFBagRetainCallBack			retain;
    CFBagReleaseCallBack		release;
    CFBagCopyDescriptionCallBack	copyDescription;
    CFBagEqualCallBack			equal;
    CFBagHashCallBack			hash;
} CFBagCallBacks;

	@:c public static function 
const CFBagCallBacks kCFTypeBagCallBacks;
	@:c public static function 
const CFBagCallBacks kCFCopyStringBagCallBacks;

typedef void (*CFBagApplierFunction)(const void *value, void *context);

typedef const struct __CFBag * CFBagRef;
typedef struct __CFBag * CFMutableBagRef;

	@:c public static function 
CFTypeID CFBagGetTypeID(void);

	@:c public static function 
CFBagRef CFBagCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFBagCallBacks *callBacks);

	@:c public static function 
CFBagRef CFBagCreateCopy(CFAllocatorRef allocator, CFBagRef theBag);

	@:c public static function 
CFMutableBagRef CFBagCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFBagCallBacks *callBacks);

	@:c public static function 
CFMutableBagRef CFBagCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFBagRef theBag);

	@:c public static function 
CFIndex CFBagGetCount(CFBagRef theBag);

	@:c public static function 
CFIndex CFBagGetCountOfValue(CFBagRef theBag, const void *value);

	@:c public static function 
Boolean CFBagContainsValue(CFBagRef theBag, const void *value);

	@:c public static function 
const void *CFBagGetValue(CFBagRef theBag, const void *value);

	@:c public static function 
Boolean CFBagGetValueIfPresent(CFBagRef theBag, const void *candidate, const void **value);

	@:c public static function 
void CFBagGetValues(CFBagRef theBag, const void **values);

	@:c public static function 
void CFBagApplyFunction(CFBagRef theBag, CFBagApplierFunction applier, void *context);

	@:c public static function 
void CFBagAddValue(CFMutableBagRef theBag, const void *value);

	@:c public static function 
void CFBagReplaceValue(CFMutableBagRef theBag, const void *value);

	@:c public static function 
void CFBagSetValue(CFMutableBagRef theBag, const void *value);

	@:c public static function 
void CFBagRemoveValue(CFMutableBagRef theBag, const void *value);

	@:c public static function 
void CFBagRemoveAllValues(CFMutableBagRef theBag);

CF_EXTERN_C_END
CF_IMPLICIT_BRIDGING_DISABLED

#endif /* ! __COREFOUNDATION_CFBAG__ */

