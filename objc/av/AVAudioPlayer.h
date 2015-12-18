/*
	File:  AVAudioPlayer.h
	
	Framework:  AVFoundation

	Copyright 2008-2012 Apple Inc. All rights reserved.
*/

#import <AVFoundation/AVBase.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSDate.h>  /* for NSTimeInterval */
#import <AVFoundation/AVAudioSettings.h>
#import <Availability.h>

@class NSData, NSURL, NSError, NSDictionary;
@class AVAudioSessionChannelDescription;
@protocol AVAudioPlayerDelegate;

NS_CLASS_AVAILABLE(10_7, 2_2)
extern class AVAudioPlayer extends NSObject {
@private
    void *_impl;
}

/* For all of these init calls, if a return value of nil is given you can check outError to see what the problem was.
 If not nil, then the object is usable for playing
*/

/* all data must be in the form of an audio file understood by CoreAudio */
- (id)initWithContentsOfURL:(NSURL *)url error:(NSError **)outError;
- (id)initWithData:(NSData *)data error:(NSError **)outError;

/* transport control */
/* methods that return BOOL return YES on success and NO on failure. */
- (BOOL)prepareToPlay;	/* get ready to play the sound. happens automatically on play. */
- (BOOL)play;			/* sound is played asynchronously. */
- (BOOL)playAtTime:(NSTimeInterval)time NS_AVAILABLE(10_7, 4_0); /* play a sound some time in the future. time should be greater than deviceCurrentTime. */
- (void)pause;			/* pauses playback, but remains ready to play. */
- (void)stop;			/* stops playback. no longer ready to play. */

/* properties */

	public var (readonly, getter=isPlaying) BOOL playing; /* is it playing or not? */

	public var  (default, null) extends NSUInteger numberOfChannels;
	public var  (default, null) extends NSTimeInterval duration; /* the duration of the sound. */

/* the delegate will be sent messages from the AVAudioPlayerDelegate protocol */ 
	public var (assign) id<AVAudioPlayerDelegate> delegate; 

/* one of these properties will be non-nil based on the init... method used */
	public var  (default, null) extends NSURL *url; /* returns nil if object was not created with a URL */
	public var  (default, null) extends NSData *data; /* returns nil if object was not created with a data object */

	public var  float pan NS_AVAILABLE(10_7, 4_0); /* set panning. -1.0 is left, 0.0 is center, 1.0 is right. */
	public var  float volume; /* The volume for the sound. The nominal range is from 0.0 to 1.0. */

	public var  BOOL enableRate NS_AVAILABLE(10_8, 5_0); /* You must set enableRate to YES for the rate property to take effect. You must set this before calling prepareToPlay. */
	public var  float rate NS_AVAILABLE(10_8, 5_0); /* See enableRate. The playback rate for the sound. 1.0 is normal, 0.5 is half speed, 2.0 is double speed. */


/*  If the sound is playing, currentTime is the offset into the sound of the current playback position.  
If the sound is not playing, currentTime is the offset into the sound where playing would start. */
	public var  NSTimeInterval currentTime;

/* returns the current time associated with the output device */
	public var  (default, null) extends NSTimeInterval deviceCurrentTime NS_AVAILABLE(10_7, 4_0);

/* "numberOfLoops" is the number of times that the sound will return to the beginning upon reaching the end. 
A value of zero means to play the sound just once.
A value of one will result in playing the sound twice, and so on..
Any negative number will loop indefinitely until stopped.
*/
	public var  NSInteger numberOfLoops;

/* settings */
	public var  (default, null) extends NSDictionary *settings NS_AVAILABLE(10_7, 4_0); /* returns a settings dictionary with keys as described in AVAudioSettings.h */

/* metering */

	public var (getter=isMeteringEnabled) BOOL meteringEnabled; /* turns level metering on or off. default is off. */

- (void)updateMeters; /* call to refresh meter values */

- (float)peakPowerForChannel:(NSUInteger)channelNumber; /* returns peak power in decibels for a given channel */
- (float)averagePowerForChannel:(NSUInteger)channelNumber; /* returns average power in decibels for a given channel */

#if TARGET_OS_IPHONE
/* The channels property lets you assign the output to play to specific channels as described by AVAudioSession's channels property */
/* This property is nil valued until set. */
/* The array must have the same number of channels as returned by the numberOfChannels property. */
	public var  NSArray* channelAssignments; /* Array of AVAudioSessionChannelDescription objects */
#endif

}

/* A protocol for delegates of AVAudioPlayer */
@protocol AVAudioPlayerDelegate <NSObject>
@optional 
/* audioPlayerDidFinishPlaying:successfully: is called when a sound has finished playing. This method is NOT called if the player is stopped due to an interruption. */
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag;

/* if an error occurs while decoding it will be reported to the delegate. */
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error;

#if TARGET_OS_IPHONE

/* audioPlayerBeginInterruption: is called when the audio session has been interrupted while the player was playing. The player will have been paused. */
- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player;

/* audioPlayerEndInterruption:withOptions: is called when the audio session interruption has ended and this player had been interrupted while playing. */
/* Currently the only flag is AVAudioSessionInterruptionFlags_ShouldResume. */
- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withOptions:(NSUInteger)flags NS_AVAILABLE_IOS(6_0);

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withFlags:(NSUInteger)flags NS_DEPRECATED_IOS(4_0, 6_0);

/* audioPlayerEndInterruption: is called when the preferred method, audioPlayerEndInterruption:withFlags:, is not implemented. */
- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player NS_DEPRECATED_IOS(2_2, 6_0);

#endif // TARGET_OS_IPHONE

}
