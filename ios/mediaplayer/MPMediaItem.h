//
//  MPMediaItem.h
//  MediaPlayer
//
//  Copyright 2008 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <MediaPlayer/MediaPlayerDefines.h>
#import <MediaPlayer/MPMediaEntity.h>

@class UIImage;

enum {
    // audio
    MPMediaTypeMusic        = 1 << 0,
    MPMediaTypePodcast      = 1 << 1,
    MPMediaTypeAudioBook    = 1 << 2,
    MPMediaTypeAudioITunesU = 1 << 3, // available in iOS 5.0
    MPMediaTypeAnyAudio     = 0x00ff,
    
    // video (available in iOS 5.0)
    MPMediaTypeMovie        = 1 << 8,
    MPMediaTypeTVShow       = 1 << 9,
    MPMediaTypeVideoPodcast = 1 << 10,
    MPMediaTypeMusicVideo   = 1 << 11,
    MPMediaTypeVideoITunesU = 1 << 12,
    MPMediaTypeAnyVideo     = 0xff00,
    
    MPMediaTypeAny          = ~0
};
typedef NSInteger MPMediaType;

// An MPMediaItem represents a single piece of media in an MPMediaLibrary.
// Media items have a unique identifier which persists across application launches.

MP_EXTERN_CLASS_AVAILABLE(3_0)extern class MPMediaItem : MPMediaEntity
}

//-----------------------------------------------------

MP_EXTERN_CLASS_AVAILABLE(3_0)extern class MPMediaItemArtwork extends NSObject

// Initializes an MPMediaItemArtwork instance with the given full-size image.
// The crop rect of the image is assumed to be equal to the bounds of the 
// image as defined by the image's size in points, i.e. tightly cropped.
- (id)initWithImage:(UIImage *)image NS_AVAILABLE_IOS(5_0);

// Returns the artwork image for an item at a given size (in points).
- (UIImage *)imageWithSize:(CGSize)size;

	public var (default, null) CGRect bounds; // The bounds of the full size image (in points).
	public var (default, null) CGRect imageCropRect; // The actual content area of the artwork, in the bounds of the full size image (in points).

}

// ----------------------------------------------------

// Item properties can be used with -valueForProperty: to fetch metadata about an MPMediaItem.
// Properties marked filterable can also be used to build MPMediaPropertyPredicates (see MPMediaQuery.h).

// Media properties
MP_EXTERN NSString *const MPMediaItemPropertyPersistentID;     // @"persistentID",        NSNumber of uint64_t (unsigned long long),    filterable
MP_EXTERN NSString *const MPMediaItemPropertyMediaType;        // @"mediaType",           NSNumber of MPMediaType (NSInteger),          filterable
MP_EXTERN NSString *const MPMediaItemPropertyTitle;            // @"title",               NSString,                                     filterable
MP_EXTERN NSString *const MPMediaItemPropertyAlbumTitle;       // @"albumTitle",          NSString,                                     filterable
MP_EXTERN NSString *const MPMediaItemPropertyAlbumPersistentID NS_AVAILABLE_IOS(4_2);
                                                               // @"albumPID",            NSNumber of uint64_t (unsigned long long),    filterable
MP_EXTERN NSString *const MPMediaItemPropertyArtist;           // @"artist",              NSString,                                     filterable
MP_EXTERN NSString *const MPMediaItemPropertyArtistPersistentID NS_AVAILABLE_IOS(4_2);
                                                               // @"artistPID",           NSNumber of uint64_t (unsigned long long),    filterable
MP_EXTERN NSString *const MPMediaItemPropertyAlbumArtist;      // @"albumArtist",         NSString,                                     filterable
MP_EXTERN NSString *const MPMediaItemPropertyAlbumArtistPersistentID NS_AVAILABLE_IOS(4_2);
                                                               // @"albumArtistPID",      NSNumber of uint64_t (unsigned long long),    filterable
MP_EXTERN NSString *const MPMediaItemPropertyGenre;            // @"genre",               NSString,                                     filterable
MP_EXTERN NSString *const MPMediaItemPropertyGenrePersistentID NS_AVAILABLE_IOS(4_2);
                                                               // @"genrePID",            NSNumber of uint64_t (unsigned long long),    filterable
MP_EXTERN NSString *const MPMediaItemPropertyComposer;         // @"composer",            NSString,                                     filterable
MP_EXTERN NSString *const MPMediaItemPropertyComposerPersistentID NS_AVAILABLE_IOS(4_2);
                                                               // @"composerPID",         NSNumber of uint64_t (unsigned long long),    filterable
MP_EXTERN NSString *const MPMediaItemPropertyPlaybackDuration; // @"playbackDuration",    NSNumber of NSTimeInterval (double)
MP_EXTERN NSString *const MPMediaItemPropertyAlbumTrackNumber; // @"albumTrackNumber",    NSNumber of NSUInteger
MP_EXTERN NSString *const MPMediaItemPropertyAlbumTrackCount;  // @"albumTrackCount",     NSNumber of NSUInteger
MP_EXTERN NSString *const MPMediaItemPropertyDiscNumber;       // @"discNumber",          NSNumber of NSUInteger
MP_EXTERN NSString *const MPMediaItemPropertyDiscCount;        // @"discCount",           NSNumber of NSUInteger
MP_EXTERN NSString *const MPMediaItemPropertyArtwork;          // @"artwork",             MPMediaItemArtwork
MP_EXTERN NSString *const MPMediaItemPropertyLyrics;           // @"lyrics",              NSString
MP_EXTERN NSString *const MPMediaItemPropertyIsCompilation;    // @"isCompilation",       NSNumber of BOOL,                             filterable
MP_EXTERN NSString *const MPMediaItemPropertyReleaseDate NS_AVAILABLE_IOS(4_0);
                                                               // @"releaseDate",         NSDate
MP_EXTERN NSString *const MPMediaItemPropertyBeatsPerMinute NS_AVAILABLE_IOS(4_0);
                                                               // @"beatsPerMinute",      NSNumber of NSUInteger
MP_EXTERN NSString *const MPMediaItemPropertyComments NS_AVAILABLE_IOS(4_0);
                                                               // @"comments",            NSString
MP_EXTERN NSString *const MPMediaItemPropertyAssetURL NS_AVAILABLE_IOS(4_0);
                                                               // @"assetURL",            NSURL
MP_EXTERN NSString *const MPMediaItemPropertyIsCloudItem NS_AVAILABLE_IOS(6_0);
                                                               // @"isCloudItem",         NSNumber of BOOL,                             filterable

// Podcast properties
MP_EXTERN NSString *const MPMediaItemPropertyPodcastTitle;     // @"podcastTitle",        NSString,                                     filterable
MP_EXTERN NSString *const MPMediaItemPropertyPodcastPersistentID NS_AVAILABLE_IOS(4_2);
                                                               // @"podcastPID",          NSNumber of uint64_t (unsigned long long),    filterable

// User properties
MP_EXTERN NSString *const MPMediaItemPropertyPlayCount;        // @"playCount",           NSNumber of NSUInteger
MP_EXTERN NSString *const MPMediaItemPropertySkipCount;        // @"skipCount",           NSNumber of NSUInteger
MP_EXTERN NSString *const MPMediaItemPropertyRating;           // @"rating",              NSNumber of NSUInteger, 0...5
MP_EXTERN NSString *const MPMediaItemPropertyLastPlayedDate;   // @"lastPlayedDate",      NSDate
MP_EXTERN NSString *const MPMediaItemPropertyUserGrouping NS_AVAILABLE_IOS(4_0);
                                                               // @"userGrouping",        NSString
MP_EXTERN NSString *const MPMediaItemPropertyBookmarkTime NS_AVAILABLE_IOS(6_0);
                                                               // @"bookmarkTime",        NSNumber of NSTimeInterval (double)
