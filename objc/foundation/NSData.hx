package objc.foundation;
/*	NSData.h
	Copyright (c) 1994-2011, Apple Inc. All rights reserved.
*/

/****************	Read/Write Options	****************/

extern enum NSDataReadingOptions {
    NSDataReadingMappedIfSafe;
    NSDataReadingUncached;
    NSDataReadingMappedAlways;
}
extern enum NSDataWritingOptions {	                          
    NSDataWritingAtomic;
    NSDataWritingFileProtectionNone;
    NSDataWritingFileProtectionComplete;
    NSDataWritingFileProtectionCompleteUnlessOpen;
    NSDataWritingFileProtectionCompleteUntilFirstUserAuthentication;
    NSDataWritingFileProtectionMask;
}


/****************	Data Search Options	****************/
extern enum NSDataSearchOptions {
    NSDataSearchBackwards;
    NSDataSearchAnchored;
}

/****************	Immutable Data		****************/

extern class NSData extends NSObject/* implements NSCopying, NSMutableCopying, NSCoding*/ {
	public function length () :Int;
	public function bytes () :Dynamic;

/*- (NSString *)description;
- (void)getBytes:(void *)buffer length:(NSUInteger)length;
- (void)getBytes:(void *)buffer range:(NSRange)range;
- (Bool)isEqualToData:(NSData *)other;
- (NSData *)subdataWithRange:(NSRange)range;
- (Bool)writeToFile:(NSString *)path atomically:(Bool)useAuxiliaryFile;
- (Bool)writeToURL:(NSURL *)url atomically:(Bool)atomically; // the atomically flag is ignored if the url is not of a type the supports atomic writes
- (Bool)writeToFile:(NSString *)path options:(NSDataWritingOptions)writeOptionsMask error:(NSError **)errorPtr;
- (Bool)writeToURL:(NSURL *)url options:(NSDataWritingOptions)writeOptionsMask error:(NSError **)errorPtr;
- (NSRange)rangeOfData:(NSData *)dataToFind options:(NSDataSearchOptions)mask range:(NSRange)searchRange NS_AVAILABLE(10_6, 4_0);


+ (id)data;
+ (id)dataWithBytes:(const void *)bytes length:(NSUInteger)length;
+ (id)dataWithBytesNoCopy:(void *)bytes length:(NSUInteger)length;
+ (id)dataWithBytesNoCopy:(void *)bytes length:(NSUInteger)length freeWhenDone:(Bool)b;
+ (id)dataWithContentsOfFile:(NSString *)path options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;
+ (id)dataWithContentsOfURL:(NSURL *)url options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;
+ (id)dataWithContentsOfFile:(NSString *)path;
+ (id)dataWithContentsOfURL:(NSURL *)url;
- (id)initWithBytes:(const void *)bytes length:(NSUInteger)length;
- (id)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)length;
- (id)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)length freeWhenDone:(Bool)b;
- (id)initWithContentsOfFile:(NSString *)path options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;
- (id)initWithContentsOfURL:(NSURL *)url options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;
- (id)initWithContentsOfFile:(NSString *)path;
- (id)initWithContentsOfURL:(NSURL *)url;
- (id)initWithData:(NSData *)data;
+ (id)dataWithData:(NSData *)data;*/

}


/****************	Mutable Data		****************/

extern class NSMutableData extends NSData {
	
	public var mutableBytes :Dynamic;
	public function setLength (length:Int) :Void;
	public function appendBytes (bytes:Dynamic, length:Int) :Void;
/*	
	
	- (void)appendData:(NSData *)other;
	- (void)increaseLengthBy:(NSUInteger)extraLength;
	- (void)replaceBytesInRange:(NSRange)range withBytes:(const void *)bytes;
	- (void)resetBytesInRange:(NSRange)range;
	- (void)setData:(NSData *)data;
	- (void)replaceBytesInRange:(NSRange)range withBytes:(const void *)replacementBytes length:(NSUInteger)replacementLength;
	
	+ (id)dataWithCapacity:(NSUInteger)aNumItems;
	+ (id)dataWithLength:(NSUInteger)length;
	- (id)initWithCapacity:(NSUInteger)capacity;
	- (id)initWithLength:(NSUInteger)length;*/
	
}


/****************	    Purgeable Data	****************/
/*
extern class NSPurgeableData extends NSMutableData implements NSDiscardableContent {

    NSUInteger _length;
    int32_t _accessCount;
    uint8_t _private[32];
    void *_reserved;
}
*/
	
	
	
	
	
	
	
	/*	

	#import <Foundation/NSObject.h>
	#import <Foundation/NSRange.h>

	@class NSString, NSURL, NSError;


	typedef NS_OPTIONS(NSUInteger, NSDataReadingOptions) {
	    NSDataReadingMappedIfSafe =   1UL << 0,	// Hint to map the file in if possible and safe
	    NSDataReadingUncached = 1UL << 1,	// Hint to get the file not to be cached in the kernel
	    NSDataReadingMappedAlways NS_ENUM_AVAILABLE(10_7, 5_0) = 1UL << 3,	// Hint to map the file in if possible. This takes precedence over NSDataReadingMappedIfSafe if both are given.
    
	    // Options with old names for NSData reading methods. Please stop using these old names.
	    NSDataReadingMapped = NSDataReadingMappedIfSafe,	// Deprecated name for NSDataReadingMappedIfSafe
	    NSMappedRead = NSDataReadingMapped,			// Deprecated name for NSDataReadingMapped
	    NSUncachedRead = NSDataReadingUncached		// Deprecated name for NSDataReadingUncached
	};

	typedef NS_OPTIONS(NSUInteger, NSDataWritingOptions) {
	    NSDataWritingAtomic = 1UL << 0,	// Hint to use auxiliary file when saving; equivalent to atomically:YES
	    NSDataWritingWithoutOverwriting NS_ENUM_AVAILABLE(10_8, 6_0) = 1UL << 1, // Hint to return prevent overwriting an existing file. Cannot be combined with NSDataWritingAtomic.

	    NSDataWritingFileProtectionNone NS_ENUM_AVAILABLE_IOS(4_0)                                  = 0x10000000,
	    NSDataWritingFileProtectionComplete NS_ENUM_AVAILABLE_IOS(4_0)                              = 0x20000000,
	    NSDataWritingFileProtectionCompleteUnlessOpen NS_ENUM_AVAILABLE_IOS(5_0)                    = 0x30000000,
	    NSDataWritingFileProtectionCompleteUntilFirstUserAuthentication NS_ENUM_AVAILABLE_IOS(5_0)  = 0x40000000,
	    NSDataWritingFileProtectionMask NS_ENUM_AVAILABLE_IOS(4_0)                                  = 0xf0000000,

	    // Options with old names for NSData writing methods. Please stop using these old names.
	    NSAtomicWrite = NSDataWritingAtomic	    // Deprecated name for NSDataWritingAtomic
	};


	typedef NS_OPTIONS(NSUInteger, NSDataSearchOptions) {
	    NSDataSearchBackwards = 1UL << 0,
	    NSDataSearchAnchored = 1UL << 1
	} NS_ENUM_AVAILABLE(10_6, 4_0);

	extern class NSData : NSObject implements NSCopying, NSMutableCopying, NSSecureCoding>

	- (NSUInteger)length;
	- (const void *)bytes NS_RETURNS_INNER_POINTER;

	}

	extern class NSData (NSExtendedData)

	- (NSString *)description;
	- (void)getBytes:(void *)buffer length:(NSUInteger)length;
	- (void)getBytes:(void *)buffer range:(NSRange)range;
	- (Bool)isEqualToData:(NSData *)other;
	- (NSData *)subdataWithRange:(NSRange)range;
	- (Bool)writeToFile:(NSString *)path atomically:(Bool)useAuxiliaryFile;
	- (Bool)writeToURL:(NSURL *)url atomically:(Bool)atomically; // the atomically flag is ignored if the url is not of a type the supports atomic writes
	- (Bool)writeToFile:(NSString *)path options:(NSDataWritingOptions)writeOptionsMask error:(NSError **)errorPtr;
	- (Bool)writeToURL:(NSURL *)url options:(NSDataWritingOptions)writeOptionsMask error:(NSError **)errorPtr;
	- (NSRange)rangeOfData:(NSData *)dataToFind options:(NSDataSearchOptions)mask range:(NSRange)searchRange NS_AVAILABLE(10_6, 4_0);

	}

	extern class NSData (NSDataCreation)

	+ (id)data;
	+ (id)dataWithBytes:(const void *)bytes length:(NSUInteger)length;
	+ (id)dataWithBytesNoCopy:(void *)bytes length:(NSUInteger)length;
	+ (id)dataWithBytesNoCopy:(void *)bytes length:(NSUInteger)length freeWhenDone:(Bool)b;
	+ (id)dataWithContentsOfFile:(NSString *)path options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;
	+ (id)dataWithContentsOfURL:(NSURL *)url options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;
	+ (id)dataWithContentsOfFile:(NSString *)path;
	+ (id)dataWithContentsOfURL:(NSURL *)url;
	- (id)initWithBytes:(const void *)bytes length:(NSUInteger)length;
	- (id)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)length;
	- (id)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)length freeWhenDone:(Bool)b;
	- (id)initWithContentsOfFile:(NSString *)path options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;
	- (id)initWithContentsOfURL:(NSURL *)url options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;
	- (id)initWithContentsOfFile:(NSString *)path;
	- (id)initWithContentsOfURL:(NSURL *)url;
	- (id)initWithData:(NSData *)data;
	+ (id)dataWithData:(NSData *)data;

	}

	extern class NSData (NSDeprecated)

	
	- (void)getBytes:(void *)buffer;

	+ (id)dataWithContentsOfMappedFile:(NSString *)path;
	- (id)initWithContentsOfMappedFile:(NSString *)path;

	}

	extern class NSMutableData : NSData

	- (void *)mutableBytes NS_RETURNS_INNER_POINTER;
	- (void)setLength:(NSUInteger)length;

	}

	extern class NSMutableData (NSExtendedMutableData)

	- (void)appendBytes:(const void *)bytes length:(NSUInteger)length;
	- (void)appendData:(NSData *)other;
	- (void)increaseLengthBy:(NSUInteger)extraLength;
	- (void)replaceBytesInRange:(NSRange)range withBytes:(const void *)bytes;
	- (void)resetBytesInRange:(NSRange)range;
	- (void)setData:(NSData *)data;
	- (void)replaceBytesInRange:(NSRange)range withBytes:(const void *)replacementBytes length:(NSUInteger)replacementLength;

	}

	extern class NSMutableData (NSMutableDataCreation)

	+ (id)dataWithCapacity:(NSUInteger)aNumItems;
	+ (id)dataWithLength:(NSUInteger)length;
	- (id)initWithCapacity:(NSUInteger)capacity;
	- (id)initWithLength:(NSUInteger)length;

	}

	NS_CLASS_AVAILABLE(10_6, 4_0)
	extern class NSPurgeableData : NSMutableData <NSDiscardableContent> {
	@private
	    NSUInteger _length;
	    int32_t _accessCount;
	    uint8_t _private[32];
	    void *_reserved;
	}

	}
*/

	