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

MP_EXTERN_CLASS_AVAILABLE(3_0)extern class MPMediaItem extends MPMediaEntity
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
MP_EXTERN String *const MPMediaItemPropertyPersistentID;     // @"persistentID",        NSNumber of uint64_t (unsigned long long),    filterable
MP_EXTERN String *const MPMediaItemPropertyMediaType;        // @"mediaType",           NSNumber of MPMediaType (Int),          filterable
MP_EXTERN String *const MPMediaItemPropertyTitle;            // @"title",               String,                                     filterable
MP_EXTERN String *const MPMediaItemPropertyAlbumTitle;       // @"albumTitle",          String,                                     filterable
MP_EXTERN String *const MPMediaItemPropertyAlbumPersistentID NS_AVAILABLE_IOS(4_2);
                                                               // @"albumPID",            NSNumber of uint64_t (unsigned long long),    filterable
MP_EXTERN String *const MPMediaItemPropertyArtist;           // @"artist",              String,                                     filterable
MP_EXTERN String *const MPMediaItemPropertyArtistPersistentID NS_AVAILABLE_IOS(4_2);
                                                               // @"artistPID",           NSNumber of uint64_t (unsigned long long),    filterable
MP_EXTERN String *const MPMediaItemPropertyAlbumArtist;      // @"albumArtist",         String,                                     filterable
MP_EXTERN String *const MPMediaItemPropertyAlbumArtistPersistentID NS_AVAILABLE_IOS(4_2);
                                                               // @"albumArtistPID",      NSNumber of uint64_t (unsigned long long),    filterable
MP_EXTERN String *const MPMediaItemPropertyGenre;            // @"genre",               String,                                     filterable
MP_EXTERN String *const MPMediaItemPropertyGenrePersistentID NS_AVAILABLE_IOS(4_2);
                                                               // @"genrePID",            NSNumber of uint64_t (unsigned long long),    filterable
MP_EXTERN String *const MPMediaItemPropertyComposer;         // @"composer",            String,                                     filterable
MP_EXTERN String *const MPMediaItemPropertyComposerPersistentID NS_AVAILABLE_IOS(4_2);
                                                               // @"composerPID",         NSNumber of uint64_t (unsigned long long),    filterable
MP_EXTERN String *const MPMediaItemPropertyPlaybackDuration; // @"playbackDuration",    NSNumber of NSTimeInterval (double)
MP_EXTERN String *const MPMediaItemPropertyAlbumTrackNumber; // @"albumTrackNumber",    NSNumber of NSUInteger
MP_EXTERN String *const MPMediaItemPropertyAlbumTrackCount;  // @"albumTrackCount",     NSNumber of NSUInteger
MP_EXTERN String *const MPMediaItemPropertyDiscNumber;       // @"discNumber",          NSNumber of NSUInteger
MP_EXTERN String *const MPMediaItemPropertyDiscCount;        // @"discCount",           NSNumber of NSUInteger
MP_EXTERN String *const MPMediaItemPropertyArtwork;          // @"artwork",             MPMediaItemArtwork
MP_EXTERN String *const MPMediaItemPropertyLyrics;           // @"lyrics",              String
MP_EXTERN String *const MPMediaItemPropertyIsCompilation;    // @"isCompilation",       NSNumber of BOOL,                             filterable
MP_EXTERN String *const MPMediaItemPropertyReleaseDate NS_AVAILABLE_IOS(4_0);
                                                               // @"releaseDate",         NSDate
MP_EXTERN String *const MPMediaItemPropertyBeatsPerMinute NS_AVAILABLE_IOS(4_0);
                                                               // @"beatsPerMinute",      NSNumber of NSUInteger
MP_EXTERN String *const MPMediaItemPropertyComments NS_AVAILABLE_IOS(4_0);
                                                               // @"comments",            String
MP_EXTERN String *const MPMediaItemPropertyAssetURL NS_AVAILABLE_IOS(4_0);
                                                               // @"assetURL",            NSURL
MP_EXTERN String *const MPMediaItemPropertyIsCloudItem NS_AVAILABLE_IOS(6_0);
                                                               // @"isCloudItem",         NSNumber of BOOL,                             filterable

// Podcast properties
MP_EXTERN String *const MPMediaItemPropertyPodcastTitle;     // @"podcastTitle",        String,                                     filterable
MP_EXTERN String *const MPMediaItemPropertyPodcastPersistentID NS_AVAILABLE_IOS(4_2);
                                                               // @"podcastPID",          NSNumber of uint64_t (unsigned long long),    filterable

// User properties
MP_EXTERN String *const MPMediaItemPropertyPlayCount;        // @"playCount",           NSNumber of NSUInteger
MP_EXTERN String *const MPMediaItemPropertySkipCount;        // @"skipCount",           NSNumber of NSUInteger
MP_EXTERN String *const MPMediaItemPropertyRating;           // @"rating",              NSNumber of NSUInteger, 0...5
MP_EXTERN String *const MPMediaItemPropertyLastPlayedDate;   // @"lastPlayedDate",      NSDate
MP_EXTERN String *const MPMediaItemPropertyUserGrouping NS_AVAILABLE_IOS(4_0);
                                                               // @"userGrouping",        String
MP_EXTERN String *const MPMediaItemPropertyBookmarkTime NS_AVAILABLE_IOS(6_0);
                                                               // @"bookmarkTime",        NSNumber of NSTimeInterval (double)
