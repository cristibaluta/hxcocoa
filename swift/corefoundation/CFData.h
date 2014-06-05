/*	CFData.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/

#if !defined(__COREFOUNDATION_CFDATA__)
#define __COREFOUNDATION_CFDATA__ 1

#include <CoreFoundation/CFBase.h>

CF_IMPLICIT_BRIDGING_ENABLED
CF_EXTERN_C_BEGIN
    
typedef const struct __CFData * CFDataRef;
typedef struct __CFData * CFMutableDataRef;

	@:c public static function 
CFTypeID CFDataGetTypeID(void);

	@:c public static function 
CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length);

	@:c public static function 
CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator);
    /* Pass kCFAllocatorNull as bytesDeallocator to assure the bytes aren't freed */

	@:c public static function 
CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData);

	@:c public static function 
CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity);

	@:c public static function 
CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData);

	@:c public static function 
CFIndex CFDataGetLength(CFDataRef theData);

	@:c public static function 
const UInt8 *CFDataGetBytePtr(CFDataRef theData);

	@:c public static function 
UInt8 *CFDataGetMutableBytePtr(CFMutableDataRef theData);

	@:c public static function 
void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer); 

	@:c public static function 
void CFDataSetLength(CFMutableDataRef theData, CFIndex length);

	@:c public static function 
void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength);

	@:c public static function 
void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length);

	@:c public static function 
void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength);

	@:c public static function 
void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range);

typedef CF_OPTIONS(CFOptionFlags, CFDataSearchFlags) {
    kCFDataSearchBackwards = 1UL << 0,
    kCFDataSearchAnchored = 1UL << 1
} CF_ENUM_AVAILABLE(10_6, 4_0);

	@:c public static function 
CFRange CFDataFind(CFDataRef theData, CFDataRef dataToFind, CFRange searchRange, CFDataSearchFlags compareOptions) CF_AVAILABLE(10_6, 4_0);

CF_EXTERN_C_END
CF_IMPLICIT_BRIDGING_DISABLED

#endif /* ! __COREFOUNDATION_CFDATA__ */

