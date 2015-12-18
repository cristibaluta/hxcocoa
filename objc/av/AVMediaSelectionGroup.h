/*
	File:  AVMediaSelectionGroup.h

	Framework:  AVFoundation
 
	Copyright 2011-2012 Apple Inc. All rights reserved.

*/

/*!
 @class			AVMediaSelectionGroup

 @abstract		AVMediaSelectionGroup provides a collection of mutually exclusive options for the presentation of media within an asset.

*/

#import <AVFoundation/AVBase.h>
#import <Foundation/Foundation.h>

@class AVMediaSelectionOption;
@class AVMediaSelectionGroupInternal;

NS_CLASS_AVAILABLE(10_8, 5_0)
extern class AVMediaSelectionGroup extends NSObject implements NSCopying> {
	AVMediaSelectionGroupInternal	*_mediaSelectionGroup;
}

/*!
 	public var 		options
 @abstract		A collection of mutually exclusive media selection options.
 @discussion	An NSArray of AVMediaSelectionOption*.
*/
	public var NSArray *options;

/*!
 	public var 		allowsEmptySelection
 @abstract		Indicates whether it's possible to present none of the options in the group when an associated AVPlayerItem is played.
 @discussion
	If allowsEmptySelection is YES, all of the available media options in the group can be deselected by passing nil
	as the specified AVMediaSelectionOption to -[AVPlayerItem selectMediaOption:inMediaSelectionGroup:].
*/
	public var BOOL allowsEmptySelection;

/*!
  @method		mediaSelectionOptionWithPropertyList:
  @abstract		Returns the instance of AVMediaSelectionOption with properties that match the specified property list.
  @param		plist
  				A property list previously obtained from an option in the group via -[AVMediaSelectionOption propertyList].
  @result		If the specified properties match those of an option in the group, an instance of AVMediaSelectionOption. Otherwise nil.
*/
- (AVMediaSelectionOption *)mediaSelectionOptionWithPropertyList:(id)plist;

}


/*!
  @category		AVMediaSelectionOptionFiltering
  @abstract		Filtering of media selection options.
  @discussion
	The AVMediaSelectionOptionFiltering category is provided for convenience in filtering the media selection options in a group
	according to playability, locale, and media characteristics.
	Note that it's possible to implement additional filtering behaviors by using -[NSArray indexesOfObjectsPassingTest:].
*/
extern class AVMediaSelectionGroup (AVMediaSelectionOptionFiltering)

/*!
  @method		playableMediaSelectionOptionsFromArray:
  @abstract		Filters an array of AVMediaSelectionOptions according to whether they are playable.
  @param		mediaSelectionOptions
  				An array of AVMediaSelectionOption to be filtered according to whether they are playable.
  @result		An instance of NSArray containing the media selection options of the specified NSArray that are playable.
*/
+ (NSArray *)playableMediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions;

/*!
 @method		mediaSelectionOptionsFromArray:filteredAndSortedAccordingToPreferredLanguages:
 @abstract		Filters an array of AVMediaSelectionOptions according to whether their locales match any language identifier in the specified array of preferred languages. The returned array is sorted according to the order of preference of the language each matches.
 @param			mediaSelectionOptions
				An array of AVMediaSelectionOptions to be filtered and sorted.
 @param			preferredLanguages
				An array of language identifiers in order of preference, each of which is an IETF BCP 47 (RFC 4646) language identifier. Use +[NSLocale preferredLanguages] to obtain the user's list of preferred languages.
 @result		An instance of NSArray containing media selection options of the specified NSArray that match a preferred language, sorted according to the order of preference of the language each matches.
*/
+ (NSArray *)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions filteredAndSortedAccordingToPreferredLanguages:(NSArray *)preferredLanguages NS_AVAILABLE(10_8, 6_0);

/*!
  @method		mediaSelectionOptionsFromArray:withLocale:
  @abstract		Filters an array of AVMediaSelectionOptions according to locale.
  @param		mediaSelectionOptions
				An array of AVMediaSelectionOption to be filtered by locale.
  @param		locale
  				The NSLocale that must be matched for a media selection option to be copied to the output array.
  @result		An instance of NSArray containing the media selection options of the specified NSArray that match the specified locale.
*/
+ (NSArray *)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions withLocale:(NSLocale *)locale;

/*!
  @method		mediaSelectionOptionsFromArray:withMediaCharacteristics:
  @abstract		Filters an array of AVMediaSelectionOptions according to one or more media characteristics.
  @param		mediaSelectionOptions
  				An array of AVMediaSelectionOptions to be filtered by media characteristic.
  @param		mediaCharacteristics
  				The media characteristics that must be matched for a media selection option to be copied to the output array.
  @result		An instance of NSArray containing the media selection options of the specified NSArray that match the specified
				media characteristics.
*/
+ (NSArray *)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions withMediaCharacteristics:(NSArray *)mediaCharacteristics;

/*!
  @method		mediaSelectionOptionsFromArray:withoutMediaCharacteristics:
  @abstract		Filters an array of AVMediaSelectionOptions according to whether they lack one or more media characteristics.
  @param		mediaSelectionOptions
  				An array of AVMediaSelectionOptions to be filtered by media characteristic.
  @param		mediaCharacteristics
  				The media characteristics that must not be present for a media selection option to be copied to the output array.
  @result		An instance of NSArray containing the media selection options of the specified NSArray that lack the specified
				media characteristics.
*/
+ (NSArray *)mediaSelectionOptionsFromArray:(NSArray *)mediaSelectionOptions withoutMediaCharacteristics:(NSArray *)mediaCharacteristics;

}


/*!
 @class			AVMediaSelectionOption

 @abstract		AVMediaSelectionOption represents a specific option for the presentation of media within a group of options.

*/

@class AVMediaSelectionOptionInternal;

NS_CLASS_AVAILABLE(10_8, 5_0)
extern class AVMediaSelectionOption extends NSObject implements NSCopying> {
	AVMediaSelectionOptionInternal	*_mediaSelectionOption;
}

/*!
 	public var 		mediaType
 @abstract		The media type of the media data, e.g. AVMediaTypeAudio, AVMediaTypeSubtitle, etc.
*/
	public var NSString *mediaType;

/*!
 	public var 		mediaSubTypes
 @abstract		The mediaSubTypes of the media data associated with the option. 
 @discussion
	An NSArray of NSNumbers carrying four character codes (of type FourCharCode) as defined in CoreAudioTypes.h for audio media and in CMFormatDescription.h for video media.
	Also see CMFormatDescriptionGetMediaSubType in CMFormatDescription.h for more information about media subtypes.
	
	Note that if no information is available about the encoding of the media presented when a media option is selected, the value of mediaSubTypes will be an empty array. This can occur, for example, with streaming media. In these cases the value of mediaSubTypes should simply not be used as a criteria for selection.
*/
	public var NSArray *mediaSubTypes;

/*!
  @method		hasMediaCharacteristic:
  @abstract		Reports whether the media selection option includes media with the specified media characteristic.
  @param		mediaCharacteristic
  				The media characteristic of interest, e.g. AVMediaCharacteristicVisual, AVMediaCharacteristicAudible, AVMediaCharacteristicLegible, etc.
  @result		YES if the media selection option includes media with the specified characteristic, otherwise NO.
*/
- (BOOL)hasMediaCharacteristic:(NSString *)mediaCharacteristic;

/*!
 	public var 		playable
 @abstract		Indicates whether a media selection option is playable.
 @discussion	If the media data associated with the option cannot be decoded or otherwise rendered, playable is NO.
*/
	public var  (nonatomic, readonly, getter=isPlayable) BOOL playable;

/*!
 	public var 		locale
 @abstract		Indicates the locale for which the media option was authored.
 @discussion
 	Use -[NSLocale objectForKey:NSLocaleLanguageCode] to obtain the language code of the locale. See NSLocale.h for additional information.
*/
	public var NSLocale *locale;

/*!
 	public var 		commonMetadata
 @abstract		Provides an array of AVMetadataItems for each common metadata key for which a value is available.
 @discussion
   The array of AVMetadataItems can be filtered according to language via +[AVMetadataItem metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:], according to locale via +[AVMetadataItem metadataItemsFromArray:withLocale:],
   or according to key via +[AVMetadataItem metadataItemsFromArray:withKey:keySpace:].
   Example: to obtain the name (or title) of a media selection option in any of the user's preferred languages.

	NSString *title = nil;
	NSArray *titles = [AVMetadataItem metadataItemsFromArray:[mediaSelectionOption commonMetadata] withKey:AVMetadataCommonKeyTitle keySpace:AVMetadataKeySpaceCommon];
	if ([titles count] > 0)
	{
		// Try to get a title that matches one of the user's preferred languages.
		NSArray *titlesForPreferredLanguages = [AVMetadataItem metadataItemsFromArray:titles filteredAndSortedAccordingToPreferredLanguages:[NSLocale preferredLanguages]];
		if ([titlesForPreferredLanguages count] > 0)
		{
			title = [[titlesForPreferredLanguages objectAtIndex:0] stringValue];
		}
		
		// No matches in any of the preferred languages. Just use the primary title metadata we find.
		if (title == nil)
		{
			title = [[titles objectAtIndex:0] stringValue];
		}
	}

*/
	public var NSArray *commonMetadata;

/*!
 	public var 		availableMetadataFormats
 @abstract		Provides an NSArray of NSStrings, each representing a metadata format that contains metadata associated with the option (e.g. ID3, iTunes metadata, etc.).
 @discussion
   Metadata formats are defined in AVMetadataFormat.h.
*/
	public var NSArray *availableMetadataFormats;

/*!
  @method		metadataForFormat:
  @abstract		Provides an NSArray of AVMetadataItems, one for each metadata item in the container of the specified format.
  @param		format
  				The metadata format for which items are requested.
  @result		An NSArray containing AVMetadataItems; may be nil if there is no metadata of the specified format.
*/
- (NSArray *)metadataForFormat:(NSString *)format;

/*!
  @method		associatedMediaSelectionOptionInMediaSelectionGroup
  @abstract		If a media selection option in another group is associated with the specified option, returns a reference to the associated option.
  @param		mediaSelectionGroup
  				A media selection group in which an associated option is to be sought.
  @result		An instance of AVMediaSelectionOption.
 @discussion
   Audible media selection options often have associated legible media selection options; in particular, audible options are typically associated with forced-only subtitle options with the same locale. See AVMediaCharacteristicContainsOnlyForcedSubtitles in AVMediaFormat.h for a discussion of forced-only subtitles.
*/
- (AVMediaSelectionOption *)associatedMediaSelectionOptionInMediaSelectionGroup:(AVMediaSelectionGroup *)mediaSelectionGroup;

/*!
  @method		propertyList
  @abstract		Returns a serializable property list that can be used to obtain an instance of AVMediaSelectionOption representing the same option as the receiver via -[AVMediaSelectionGroup mediaSelectionOptionWithPropertyList:].
  @result		A serializable property list that's sufficient to identify the option within its group. For serialization utilities, see NSPropertyList.h.
*/
- (id)propertyList;

}
