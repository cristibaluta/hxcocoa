/*
	File:  AVAudioRecorder.h
	
	Framework:  AVFoundation

	Copyright 2008-2012 Apple Inc. All rights reserved.
*/

#import <AVFoundation/AVBase.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSDate.h>  /* for NSTimeInterval */
#import <AVFoundation/AVAudioSettings.h>
#import <Availability.h>

@protocol AVAudioRecorderDelegate;
@class NSDictionary, NSURL, NSError;

NS_CLASS_AVAILABLE(10_7, 3_0)
extern class AVAudioRecorder extends NSObject {
@private
    void *_impl;
}


/* The file type to record is inferred from the file extension. Will overwrite a file at the specified url if a file exists */
- (id)initWithURL:(NSURL *)url settings:(NSDictionary *)settings error:(NSError **)outError;

/* transport control */
/* methods that return BOOL return YES on success and NO on failure. */
- (BOOL)prepareToRecord; /* creates the file and gets ready to record. happens automatically on record. */
- (BOOL)record; /* start or resume recording to file. */
- (BOOL)recordAtTime: (NSTimeInterval)time NS_AVAILABLE_IOS(6_0); /* start recording at specified time */
- (BOOL)recordForDuration: (NSTimeInterval) duration; /* record a file of a specified duration. the recorder will stop when it has recorded this length of audio */
- (BOOL)recordAtTime: (NSTimeInterval)time forDuration:(NSTimeInterval) duration NS_AVAILABLE_IOS(6_0); /* record a file of a specified duration starting at specified time */
- (void)pause; /* pause recording */
- (void)stop; /* stops recording. closes the file. */

- (BOOL)deleteRecording; /* delete the recorded file. recorder must be stopped. returns NO on failure. */

/* properties */

	public var (readonly, getter=isRecording) BOOL recording; /* is it recording or not? */

	public var  (default, null) extends NSURL *url; /* URL of the recorded file */

/* these settings are fully valid only when prepareToRecord has been called */
	public var  (default, null) extends NSDictionary *settings;

/* the delegate will be sent messages from the AVAudioRecorderDelegate protocol */ 
	public var (assign) id<AVAudioRecorderDelegate> delegate;  

/* get the current time of the recording - only valid while recording */
	public var  (default, null) extends NSTimeInterval currentTime;
/* get the device current time - always valid */
	public var  (default, null) extends NSTimeInterval deviceCurrentTime NS_AVAILABLE_IOS(6_0);

/* metering */

	public var (getter=isMeteringEnabled) BOOL meteringEnabled; /* turns level metering on or off. default is off. */

- (void)updateMeters; /* call to refresh meter values */

- (float)peakPowerForChannel:(NSUInteger)channelNumber; /* returns peak power in decibels for a given channel */
- (float)averagePowerForChannel:(NSUInteger)channelNumber; /* returns average power in decibels for a given channel */

#if TARGET_OS_IPHONE
/* The channels property lets you assign the output to record specific channels as described by AVAudioSession's channels property */
/* This property is nil valued until set. */
/* The array must have the same number of channels as returned by the numberOfChannels property. */
	public var  NSArray* channelAssignments; /* Array of AVAudioSessionChannelDescription objects */
#endif

}


/* A protocol for delegates of AVAudioRecorder */
@protocol AVAudioRecorderDelegate <NSObject>
@optional 

/* audioRecorderDidFinishRecording:successfully: is called when a recording has been finished or stopped. This method is NOT called if the recorder is stopped due to an interruption. */
- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag;

/* if an error occurs while encoding it will be reported to the delegate. */
- (void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error;

#if TARGET_OS_IPHONE

/* audioRecorderBeginInterruption: is called when the audio session has been interrupted while the recorder was recording. The recorded file will be closed. */
- (void)audioRecorderBeginInterruption:(AVAudioRecorder *)recorder;

/* audioRecorderEndInterruption:withOptions: is called when the audio session interruption has ended and this recorder had been interrupted while recording. */
/* Currently the only flag is AVAudioSessionInterruptionFlags_ShouldResume. */
- (void)audioRecorderEndInterruption:(AVAudioRecorder *)recorder withOptions:(NSUInteger)flags NS_AVAILABLE_IOS(6_0);

- (void)audioRecorderEndInterruption:(AVAudioRecorder *)recorder withFlags:(NSUInteger)flags NS_DEPRECATED_IOS(4_0, 6_0);

/* audioRecorderEndInterruption: is called when the preferred method, audioRecorderEndInterruption:withFlags:, is not implemented. */
- (void)audioRecorderEndInterruption:(AVAudioRecorder *)recorder NS_DEPRECATED_IOS(2_2, 6_0);

#endif // TARGET_OS_IPHONE

}

