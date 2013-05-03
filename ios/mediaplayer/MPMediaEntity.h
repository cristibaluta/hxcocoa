//
//  MPMediaEntity.h
//  MediaPlayer
//
//  Copyright 2010 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>

@class MPMediaLibrary;

// An MPMediaEntity represents an abstract member of an MPMediaLibrary.
// Concrete subclasses are MPMediaItem and MPMediaItemCollection.

MP_EXTERN_CLASS_AVAILABLE(4_2)extern class MPMediaEntity extends NSObject, implements NSObject>

// Returns YES for properties which can be used to construct MPMediaPropertyPredicates.
+ (BOOL)canFilterByProperty:(String *)property;

// Returns the value for the given entity property.
// MPMediaItem and MPMediaPlaylist have their own properties
- (id)valueForProperty:(String *)property;

// Executes a provided block with the fetched values for the given item properties, or nil if no value is available for a property.
// In some cases, enumerating the values for multiple properties can be more efficient than fetching each individual property with -valueForProperty:.
- (void)enumerateValuesForProperties:(NSSet *)properties usingBlock:(void (^)(String *property, id value, BOOL *stop))block NS_AVAILABLE_IOS(4_0);

}

MP_EXTERN String *const MPMediaEntityPropertyPersistentID NS_AVAILABLE_IOS(4_2); // @"persistentID", NSNumber of uint64_t (unsigned long long), filterable
