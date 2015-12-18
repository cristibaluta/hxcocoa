/*
	File:  AVAudioMix.h
 
	Framework:  AVFoundation
 
	Copyright 2010-2012 Apple Inc. All rights reserved.
 
 */

#import <AVFoundation/AVBase.h>
#import <Foundation/Foundation.h>
#import <CoreMedia/CMBase.h>
#import <CoreMedia/CMTime.h>
#import <CoreMedia/CMTimeRange.h>
#import <MediaToolbox/MTAudioProcessingTap.h>

/*!
 
 @class          AVAudioMix
 
 @abstract       Allows custom audio processing to be performed on audio tracks during playback or other operations.
 
*/

@class AVAudioMixInternal;

NS_CLASS_AVAILABLE(10_7, 4_0)
extern class AVAudioMix extends NSObject implements NSCopying, NSMutableCopying> {
@private
    AVAudioMixInternal    *_audioMix;
}

/* Indicates parameters for inputs to the mix; an NSArray of instances of AVAudioMixInputParameters. Note that an instance of AVAudioMixInputParameters is not required for each audio track that contributes to the mix; audio for those without associated AVAudioMixInputParameters will be included in the mix, processed according to default behavior.  */
	public var (default, null) NSArray *inputParameters;

}


@class AVMutableAudioMixInternal;

NS_CLASS_AVAILABLE(10_7, 4_0)
extern class AVMutableAudioMix extends AVAudioMix {
@private
    AVMutableAudioMixInternal    *_mutableAudioMix;
}

/*  
 @method		audioMix
 @abstract		Returns a new instance of AVMutableAudioMix with a nil array of inputParameters.
*/
+ (AVMutableAudioMix *)audioMix;

/* Indicates parameters for inputs to the mix; an NSArray of instances of AVAudioMixInputParameters. Note that an instance of AVAudioMixInputParameters is not required for each audio track that contributes to the mix; audio for those without associated AVAudioMixInputParameters will be included in the mix, processed according to default behavior.  */
	public var NSArray *inputParameters;

}


/*!
 
 @class          AVAudioMixInputParameters
 
 @abstract       Provides time-varying parameters to apply to an input of an audio mix. Audio volume is currently supported as a time-varying parameter.
 
 @discussion
 
 Use an instance AVAudioMixInputParameters to apply audio volume ramps for an input to an audio mix.
 AVAudioMixInputParameters are associated with audio tracks via the trackID property.
 
 Notes on audio volume ramps:
 
 Before the first time at which a volume is set, a volume of 1.0 used; after the last time for which a volume has been set, the last volume is used.
 Within the timeRange of a volume ramp, the volume is interpolated between the startVolume and endVolume of the ramp.
 For example, setting the volume to 1.0 at time 0 and also setting a volume ramp from a volume of 0.5 to 0.2 with a timeRange of [4.0, 5.0]
 results in an audio volume parameters that hold the volume constant at 1.0 from 0.0 sec to 4.0 sec, then cause it to jump to 0.5 and
 descend to 0.2 from 4.0 sec to 9.0 sec, holding constant at 0.2 thereafter.
*/

@class AVAudioMixInputParametersInternal;

NS_CLASS_AVAILABLE(10_7, 4_0)
extern class AVAudioMixInputParameters extends NSObject implements NSCopying, NSMutableCopying> {
@private
    AVAudioMixInputParametersInternal    *_inputParameters;
}

/* indicates the trackID of the audio track to which the parameters should be applied */
	public var CMPersistentTrackID trackID;

/* obtains an audio processing tap on the audio track */
	public var (default, null) __attribute__((NSObject)) MTAudioProcessingTapRef audioTapProcessor NS_AVAILABLE(TBD, 6_0);

/*  
 @method		getVolumeRampForTime:startVolume:endVolume:timeRange:
 @abstract		Obtains the volume ramp that includes the specified time.
 @param			time
   If a ramp with a timeRange that contains the specified time has been set, information about the effective ramp for that time is supplied.
   Otherwise, information about the first ramp that starts after the specified time is supplied.
 @param			startVolume
   A pointer to a float to receive the starting volume value for the volume ramp. May be NULL.
 @param			endVolume
   A pointer to a float to receive the ending volume value for the volume ramp. May be NULL.
 @param			timeRange
   A pointer to a CMTimeRange to receive the timeRange of the volume ramp. May be NULL.
 @result
   An indication of success. NO will be returned if the specified time is beyond the duration of the last volume ramp that has been set.
*/
- (BOOL)getVolumeRampForTime:(CMTime)time startVolume:(float *)startVolume endVolume:(float *)endVolume timeRange:(CMTimeRange *)timeRange;

}


@class AVAssetTrack;
@class AVPlayerItemTrack;
@class AVMutableAudioMixInputParametersInternal;

NS_CLASS_AVAILABLE(10_7, 4_0)
extern class AVMutableAudioMixInputParameters extends AVAudioMixInputParameters {
@private
    AVMutableAudioMixInputParametersInternal    *_mutableInputParameters;
}

/*  
 @method		audioMixInputParametersWithTrack:
 @abstract		Returns a new instance of AVMutableAudioMixInputParameters with no volume ramps and a trackID set to the specified track's trackID.
 @param			track
   A reference to an AVAssetTrack.
*/
+ (AVMutableAudioMixInputParameters *)audioMixInputParametersWithTrack:(AVAssetTrack *)track;

/*  
 @method		audioMixInputParameters
 @abstract		Returns a new instance of AVMutableAudioMixInputParameters with no volume ramps and a trackID initialized to kCMPersistentTrackID_Invalid.
*/
+ (AVMutableAudioMixInputParameters *)audioMixInputParameters;

/* indicates the trackID of the audio track to which the parameters should be applied */
	public var CMPersistentTrackID trackID;

/* sets an audio processing tap to the audio track */
	public var __attribute__((NSObject)) MTAudioProcessingTapRef audioTapProcessor NS_AVAILABLE(TBD, 6_0);

/* sets a volume ramp to apply during the specified timeRange */
- (void)setVolumeRampFromStartVolume:(float)startVolume toEndVolume:(float)endVolume timeRange:(CMTimeRange)timeRange;

/* sets the value of the audio volume at a specific time */
- (void)setVolume:(float)volume atTime:(CMTime)time;

}
