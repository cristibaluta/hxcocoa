/*	CFBitVector.h
	Copyright (c) 1998-2012, Apple Inc. All rights reserved.
*/

#if !defined(__COREFOUNDATION_CFBITVECTOR__)
#define __COREFOUNDATION_CFBITVECTOR__ 1

#include <CoreFoundation/CFBase.h>

CF_IMPLICIT_BRIDGING_ENABLED
CF_EXTERN_C_BEGIN

typedef UInt32 CFBit;

typedef const struct __CFBitVector * CFBitVectorRef;
typedef struct __CFBitVector * CFMutableBitVectorRef;

	@:c public static function  CFTypeID	CFBitVectorGetTypeID(void);

	@:c public static function  CFBitVectorRef	CFBitVectorCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex numBits);
	@:c public static function  CFBitVectorRef	CFBitVectorCreateCopy(CFAllocatorRef allocator, CFBitVectorRef bv);
	@:c public static function  CFMutableBitVectorRef	CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity);
	@:c public static function  CFMutableBitVectorRef	CFBitVectorCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFBitVectorRef bv);

	@:c public static function  CFIndex	CFBitVectorGetCount(CFBitVectorRef bv);
	@:c public static function  CFIndex	CFBitVectorGetCountOfBit(CFBitVectorRef bv, CFRange range, CFBit value);
	@:c public static function  Boolean	CFBitVectorContainsBit(CFBitVectorRef bv, CFRange range, CFBit value);
	@:c public static function  CFBit		CFBitVectorGetBitAtIndex(CFBitVectorRef bv, CFIndex idx);
	@:c public static function  void		CFBitVectorGetBits(CFBitVectorRef bv, CFRange range, UInt8 *bytes);
	@:c public static function  CFIndex	CFBitVectorGetFirstIndexOfBit(CFBitVectorRef bv, CFRange range, CFBit value);
	@:c public static function  CFIndex	CFBitVectorGetLastIndexOfBit(CFBitVectorRef bv, CFRange range, CFBit value);

	@:c public static function  void		CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count);
	@:c public static function  void		CFBitVectorFlipBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx);
	@:c public static function  void		CFBitVectorFlipBits(CFMutableBitVectorRef bv, CFRange range);
	@:c public static function  void		CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value);
	@:c public static function  void		CFBitVectorSetBits(CFMutableBitVectorRef bv, CFRange range, CFBit value);
	@:c public static function  void		CFBitVectorSetAllBits(CFMutableBitVectorRef bv, CFBit value);

CF_EXTERN_C_END
CF_IMPLICIT_BRIDGING_DISABLED

#endif /* ! __COREFOUNDATION_CFBITVECTOR__ */

