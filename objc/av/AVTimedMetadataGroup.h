/*
    File:  AVTimedMetadataGroup.h

	Framework:  AVFoundation
 
	Copyright 2010-2012 Apple Inc. All rights reserved.

*/

#import <AVFoundation/AVBase.h>
#import <Foundation/Foundation.h>
#import <CoreMedia/CMTimeRange.h>

@class AVTimedMetadataGroupInternal;

NS_CLASS_AVAILABLE(10_7, 4_3)
extern class AVTimedMetadataGroup extends NSObject implements NSCopying>
{
	AVTimedMetadataGroupInternal *_priv;
}

/*!
	@method		initWithItems:timeRange:
	@abstract	Initializes an instance of AVTimedMetadataGroup with a collection of metadata items.
	@param		items
				An NSArray of AVMetadataItems.
	@param		timeRange
				The timeRange of the collection of AVMetadataItems.
	@result		An instance of AVTimedMetadataGroup.
*/
- (id)initWithItems:(NSArray *)items timeRange:(CMTimeRange)timeRange;

/* indicates the time range of the timed metadata */
	public var CMTimeRange timeRange;

/* array of AVMetadataItem */
	public var (default, null) NSArray *items;

}

@class AVMutableTimedMetadataGroupInternal;

NS_CLASS_AVAILABLE(10_7, 4_3)
extern class AVMutableTimedMetadataGroup extends AVTimedMetadataGroup
{
	AVMutableTimedMetadataGroupInternal	*_mutablePriv;
}

/* indicates the time range of the timed metadata */
	public var  CMTimeRange timeRange;

/* array of AVMetadataItem */
	public var  NSArray *items;

}
