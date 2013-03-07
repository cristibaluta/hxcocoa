/*
    File:  AVMetadataItem.h

	Framework:  AVFoundation
 
	Copyright 2010-2012 Apple Inc. All rights reserved.

*/

#import <AVFoundation/AVBase.h>
#import <Foundation/Foundation.h>
#import <CoreMedia/CMTime.h>
#import <AVFoundation/AVMetadataFormat.h>
#import <AVFoundation/AVAsynchronousKeyValueLoading.h>

#if TARGET_OS_IPHONE
#import <CoreGraphics/CoreGraphics.h>
#else // ! TARGET_OS_IPHONE
#import <ApplicationServices/../Frameworks/CoreGraphics.framework/Headers/CoreGraphics.h>
#endif // ! TARGET_OS_IPHONE

/*!
    @class			AVMetadataItem

    @abstract		AVMetadataItem represents an item of metadata associated with an audiovisual asset or with
    				one of its tracks.
    
	@discussion		AVMetadataItems have keys that accord with the specification of the container format from
					which they're drawn. Full details of the metadata formats, metadata keys, and metadata keyspaces
					supported by AVFoundation are available among the defines in AVMetadataFormat.h.
	
					Note that arrays of AVMetadataItems vended by AVAsset and other classes are "lazy", similar
					to array-based keys that support key-value observing, meaning that you can obtain
					objects from those arrays without incurring overhead for items you don't ultimately inspect.
					
					You can filter arrays of AVMetadataItems by locale or by key and keySpace via the category
					AVMetadataItemArrayFiltering defined below.
*/

@class AVMetadataItemInternal;

NS_CLASS_AVAILABLE(10_7, 4_0)
extern class AVMetadataItem extends NSObject <AVAsynchronousKeyValueLoading, NSCopying, NSMutableCopying>
{
	AVMetadataItemInternal	*_priv;
}

/* indicates the key of the metadata item */
	public var (default, null) id<NSObject, NSCopying> key;

/* indicates the common key of the metadata item */
	public var (default, null) NSString *commonKey;

/* indicates the keyspace of the metadata item's key; this will typically
   be the default keyspace for the metadata container in which the metadata item is stored */
	public var (default, null) NSString *keySpace;

/* indicates the locale of the metadata item; may be nil if no locale information is available for the metadata item */
	public var (default, null) NSLocale *locale;

/* indicates the timestamp of the metadata item. */
	public var CMTime time;

/* indicates the duration of the metadata item */
	public var CMTime duration NS_AVAILABLE(10_7, 4_2);

/* provides the value of the metadata item */
	public var (default, null) id<NSObject, NSCopying> value;

/* provides a dictionary of the additional attributes */
	public var (default, null) NSDictionary *extraAttributes;

}


extern class AVMetadataItem (AVMetadataItemTypeCoercion)

/* provides the value of the metadata item as a string; will be nil if the value cannot be represented as a string */
	public var NSString *stringValue;

/* provides the value of the metadata item as an NSNumber. If the metadata item's value can't be coerced to a number, @"numberValue" will be nil. */
	public var NSNumber *numberValue;

/* provides the value of the metadata item as an NSDate. If the metadata item's value can't be coerced to a date, @"dateValue" will be nil. */
	public var NSDate *dateValue;

/* provides the raw bytes of the value of the metadata item */
	public var NSData *dataValue;

}


extern class AVMetadataItem (AVAsynchronousKeyValueLoading)

/* The following two methods of the AVAsynchronousKeyValueLoading protocol are re-declared here so that they can be annotated with availability information. See AVAsynchronousKeyValueLoading.h for documentation. */

- (AVKeyValueStatus)statusOfValueForKey:(NSString *)key error:(NSError **)outError NS_AVAILABLE(10_7, 4_2);

- (void)loadValuesAsynchronouslyForKeys:(NSArray *)keys completionHandler:(void (^)(void))handler NS_AVAILABLE(10_7, 4_2);

}


extern class AVMetadataItem (AVMetadataItemArrayFiltering)

/*!
 @method		metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:
 @abstract		Filters an array of AVMetadataItems according to whether their locales match any language identifier in the specified array of preferred languages. The returned array is sorted according to the order of preference of the language each matches.
 @param			metadataItems
				An array of AVMetadataItems to be filtered and sorted.
 @param			preferredLanguages
				An array of language identifiers in order of preference, each of which is an IETF BCP 47 (RFC 4646) language identifier. Use +[NSLocale preferredLanguages] to obtain the user's list of preferred languages.
 @result		An instance of NSArray containing metadata items of the specified NSArray that match a preferred language, sorted according to the order of preference of the language each matches.
*/
+ (NSArray *)metadataItemsFromArray:(NSArray *)metadataItems filteredAndSortedAccordingToPreferredLanguages:(NSArray *)preferredLanguages NS_AVAILABLE(10_8, 6_0);

/*!
	@method			metadataItemsFromArray:withLocale:
	@abstract		Filters an array of AVMetadataItems according to locale.
	@param			metadataItems
					An array of AVMetadataItems to be filtered by locale.
	@param			locale
					The NSLocale that must be matched for a metadata item to be copied to the output array.
	@result			An instance of NSArray containing the metadata items of the target NSArray that match the specified locale.
*/
+ (NSArray *)metadataItemsFromArray:(NSArray *)metadataItems withLocale:(NSLocale *)locale;

/*!
	@method			metadataItemsFromArray:withKey:keySpace:
	@abstract		Filters an array of AVMetadataItems according to key and/or keySpace.
	@param			metadataItems
					An array of AVMetadataItems to be filtered by key and/or keyspace.
	@param			key
					The key that must be matched for a metadata item to be copied to the output array.
					Note that to match item keys with any of the common keys, e.g. AVMetadataCommonKeyTitle, it's necessary
					to pass AVMetadataKeySpaceCommon as the keyspace parameter.
					If no filtering according to key is desired, pass nil. 
	@param			keySpace
					The keySpace that must be matched for a metadata item to be copied to the output array.
					If no filtering according to keySpace is desired, pass nil. (See special note above about the use of common keys.)
	@result			An instance of NSArray containing the metadata items of the target NSArray that match the specified
					key and/or keySpace.
*/
+ (NSArray *)metadataItemsFromArray:(NSArray *)metadataItems withKey:(id)key keySpace:(NSString *)keySpace;

}


/*!
    @class			AVMutableMetadataItem

    @abstract		AVMutableMetadataItem provides support for building collections of metadata to be written
    				to asset files via AVAssetExportSession, AVAssetWriter or AVAssetWriterInput.
    
	@discussion		Can be initialized from an existing AVMetadataItem or with a one or more of the basic properties
					of a metadata item: a key, a keySpace, a locale, and a value.
*/

@class AVMutableMetadataItemInternal;

NS_CLASS_AVAILABLE(10_7, 4_0)
extern class AVMutableMetadataItem extends AVMetadataItem
{
	AVMutableMetadataItemInternal	*_mutablePriv;
}

	public var  id<NSObject, NSCopying> key;

/* indicates the keyspace of the metadata item's key; this will typically
   be the default keyspace for the metadata container in which the metadata item is stored */
	public var  NSString *keySpace;

/* indicates the locale of the metadata item; may be nil if no locale information is available for the metadata item */
	public var  NSLocale *locale;

/* indicates the timestamp of the metadata item. */
	public var  CMTime time;

/* indicates the duration of the metadata item */
	public var  CMTime duration NS_AVAILABLE(10_7, 4_2);

/* provides the value of the metadata item */
	public var  id<NSObject, NSCopying> value;

/* provides a dictionary of the additional attributes */
	public var  NSDictionary *extraAttributes;

/*!
	@method			metadataItem
	@abstract		Returns an instance of AVMutableMetadataItem.
*/
+ (AVMutableMetadataItem *)metadataItem;

}

