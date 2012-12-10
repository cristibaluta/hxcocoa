//
//  MPMediaQuerySection.h
//  MediaPlayer
//
//  Copyright 2010 Apple, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayerDefines.h>

// An MPMediaQuerySection object represents a single section grouping for a query.

MP_EXTERN_CLASS_AVAILABLE(4_2)extern class MPMediaQuerySection extends NSObject, implements NSObject, NSCopying>

// The localized title of the section grouping.
	public var NSString *title;

// The range in the query's corresponding collections or items array represented by this section.
	public var  (nonatomic, assign, readonly) NSRange range;

}
