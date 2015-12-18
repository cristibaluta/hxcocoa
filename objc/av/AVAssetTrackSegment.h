/*
	File:  AVAssetTrackSegment.h

	Framework:  AVFoundation
 
	Copyright 2010-2012 Apple Inc. All rights reserved.

*/

/*!
	@class			AVAssetTrackSegment

	@abstract		AVAssetTrackSegment represents a segment of an AVAssetTrack, comprising of a
					time mapping from the source to the asset track timeline.
*/

#import <AVFoundation/AVBase.h>
#import <Foundation/Foundation.h>
#import <CoreMedia/CMTimeRange.h>

NS_CLASS_AVAILABLE(10_7, 4_0)
extern class AVAssetTrackSegment extends NSObject
{
@private
	CMTimeMapping	_timeMapping;
}

/* indicates the timeRange of the track of the container file of the media presented by the AVAssetTrackSegment */
	public var CMTimeMapping timeMapping;

/* indicates whether the AVAssetTrackSegment is an empty segment */
	public var  (nonatomic, readonly, getter=isEmpty) BOOL empty;

}
