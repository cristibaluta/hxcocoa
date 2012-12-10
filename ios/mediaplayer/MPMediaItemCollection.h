//
//  MPMediaItemCollection.h
//  MediaPlayer
//
//  Copyright 2008 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>
#import <MediaPlayer/MPMediaItem.h>

// An MPMediaItemCollection is a collection of related MPMediaItems in a media library.

MP_EXTERN_CLASS_AVAILABLE(3_0)extern class MPMediaItemCollection : MPMediaEntity

// Creates a media item collection by copying an array of MPMediaItems.
+ (MPMediaItemCollection *)collectionWithItems:(NSArray *)items;

- (id)initWithItems:(NSArray *)items;

// Returns the MPMediaItems in the collection.
	public var (default, null) NSArray *items;

// Returns an item representative of other items in the collection.
// This item can be used for common item properties in the collection, often more efficiently than fetching an item out of the items array.
	public var (default, null) MPMediaItem *representativeItem;

// Returns the number of items in the collection.
// In some cases, this is more efficient than fetching the items array and asking for the count.
	public var (default, null) NSUInteger count;

// Returns the types of media which the collection holds.
	public var (default, null) MPMediaType mediaTypes;

}
