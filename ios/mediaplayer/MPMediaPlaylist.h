//
//  MPMediaPlaylist.h
//  MediaPlayer
//
//  Copyright 2008 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>
#import <MediaPlayer/MPMediaItemCollection.h>

@class MPMediaItem;

// A playlist may have any number of MPMediaPlaylistAttributes associated.
enum {
    MPMediaPlaylistAttributeNone    = 0,
    MPMediaPlaylistAttributeOnTheGo = (1 << 0), // if set, the playlist was created on a device rather than synced from iTunes
    MPMediaPlaylistAttributeSmart   = (1 << 1),
    MPMediaPlaylistAttributeGenius  = (1 << 2)
};
typedef NSInteger MPMediaPlaylistAttribute;

// An MPMediaPlaylist is a collection of related MPMediaItems in an MPMediaLibrary.
// Playlists have a unique identifier which persists across application launches.

MP_EXTERN_CLASS_AVAILABLE(3_0)extern class MPMediaPlaylist : MPMediaItemCollection
}

// Playlist properties can be used with -valueForProperty: to fetch metadata about an MPMediaPlaylist.
// Properties marked filterable can also be used to build MPMediaPropertyPredicates (see MPMediaQuery.h).

MP_EXTERN NSString *const MPMediaPlaylistPropertyPersistentID;       // @"playlistPersistentID",    NSNumber of uint64_t (unsigned long long),           filterable
MP_EXTERN NSString *const MPMediaPlaylistPropertyName;               // @"name",                    NSString,                                            filterable
MP_EXTERN NSString *const MPMediaPlaylistPropertyPlaylistAttributes; // @"playlistAttributes",      NSNumber of MPMediaPlaylistAttribute (NSInteger),    filterable

// For playlists with attribute MPMediaPlaylistAttributeGenius, the seedItems are the MPMediaItems which were used to the generate the playlist.
// Returns nil for playlists without MPMediaPlaylistAttributeGenius set.
MP_EXTERN NSString *const MPMediaPlaylistPropertySeedItems;          // @"seedItems",               NSArray of MPMediaItems
