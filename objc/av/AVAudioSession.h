/*
	File:  AVAudioSession.h
	
	Framework:  AVFoundation
	
	Copyright 2009-2012 Apple Inc. All rights reserved.
	
*/

#import <AVFoundation/AVBase.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSDate.h>	/* for NSTimeInterval */
#import <AvailabilityMacros.h>

/* This protocol is available with iPhone 3.0 or later */
@protocol AVAudioSessionDelegate;
@class NSError, NSString, NSArray, NSNumber;
@class AVAudioSessionChannelDescription, AVAudioSessionPortDescription, AVAudioSessionRouteDescription, AVAudioSessionDataSourceDescription;

/*
 Notes on terminology used in this API.
 Some of the property names and class names in AVAudioSession differ from
 the names used in the 'C' language Audio Session API.  In this API, an audio 
 "route" is made up of zero or more input "ports" and zero or more ouput "ports". 
 If the current audio category does not support inputs, the route will consist purely of 
 outputs.  Conversely, if the category does not support output, the route will
 consist purely of inputs.  Categories that support simultaneous input and output
 will have both inputs and outputs in the route.  
 
 A "port" refers to a single input or output within an audio route.  Examples of 
 ports include built-in speaker, wired microphone, or Bluetooth A2DP output.
*/


#pragma mark -- enumerations --

/* For use with AVAudioSessionInterruptionNotification */
typedef NS_OPTIONS(NSUInteger, AVAudioSessionInterruptionOptions)
{
	AVAudioSessionInterruptionOptionShouldResume = 1
} NS_AVAILABLE_IOS(6_0);

/*  options for use when calling setActive:withOptions:error: */
typedef NS_OPTIONS(NSUInteger, AVAudioSessionSetActiveOptions)
{
	AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation = 1
} NS_AVAILABLE_IOS(6_0);

/* values to use for setting overrideOutputAudioPort property */
typedef NS_ENUM(NSUInteger, AVAudioSessionPortOverride)
{
	AVAudioSessionPortOverrideNone    = 0,
	AVAudioSessionPortOverrideSpeaker = 'spkr'
} NS_AVAILABLE_IOS(6_0);

/* values for AVAudioSessionRouteChangeReasonKey in AVAudioSessionRouteChangeNotification userInfo dictionary */
typedef NS_ENUM(NSUInteger, AVAudioSessionRouteChangeReason)
{
	AVAudioSessionRouteChangeReasonUnknown = 0,
	AVAudioSessionRouteChangeReasonNewDeviceAvailable = 1,
	AVAudioSessionRouteChangeReasonOldDeviceUnavailable = 2,
	AVAudioSessionRouteChangeReasonCategoryChange = 3,
	AVAudioSessionRouteChangeReasonOverride = 4,
	AVAudioSessionRouteChangeReasonWakeFromSleep = 6,
	AVAudioSessionRouteChangeReasonNoSuitableRouteForCategory = 7
} NS_AVAILABLE_IOS(6_0);

/* values for setCategory:withOptions:error: */
typedef NS_OPTIONS(NSUInteger, AVAudioSessionCategoryOptions)
{
	AVAudioSessionCategoryOptionMixWithOthers		= 1,  /* only valid with AVAudioSessionCategoryPlayAndRecord and AVAudioSessionCategoryPlayback */
	AVAudioSessionCategoryOptionDuckOthers			= 2,  /* only valid with AVAudioSessionCategoryPlayAndRecord and AVAudioSessionCategoryPlayback */
	AVAudioSessionCategoryOptionAllowBluetooth		= 4,  /* only valid with AVAudioSessionCategoryRecord and AVAudioSessionCategoryPlayAndRecord */
	AVAudioSessionCategoryOptionDefaultToSpeaker	= 8   /* only valid with AVAudioSessionCategoryPlayAndRecord */
} NS_AVAILABLE_IOS(6_0);

typedef NS_ENUM(NSUInteger, AVAudioSessionInterruptionType)
{
	AVAudioSessionInterruptionTypeBegan = 1,  /* the system has interrupted your audio session */
	AVAudioSessionInterruptionTypeEnded = 0,  /* the interruption has ended */
} NS_AVAILABLE_IOS(6_0);


#pragma mark -- AVAudioSession interface --
NS_CLASS_AVAILABLE(NA, 3_0)
extern class AVAudioSession extends NSObject {
@private
    void * _impl;
}

 /* returns singleton instance */
+ (id)sharedInstance;

/* set the session active or inactive */
- (BOOL)setActive:(BOOL)active error:(NSError **)outError;
- (BOOL)setActive:(BOOL)active withOptions:(AVAudioSessionSetActiveOptions)options error:(NSError **)outError NS_AVAILABLE_IOS(6_0);

- (BOOL)setCategory:(NSString *)category error:(NSError **)outError; /* set session category */
- (BOOL)setCategory:(NSString *)category withOptions: (AVAudioSessionCategoryOptions)options error:(NSError **)outError NS_AVAILABLE_IOS(6_0); /* set session category with options */
	public var  (default, null) extends NSString * category; /* get session category */
	public var  (default, null) extends AVAudioSessionCategoryOptions categoryOptions NS_AVAILABLE_IOS(6_0);

- (BOOL)setMode:(NSString *)mode error:(NSError **)outError NS_AVAILABLE_IOS(5_0); /* set session mode */
	public var  (default, null) extends NSString * mode NS_AVAILABLE_IOS(5_0); /* get session mode */

- (BOOL)overrideOutputAudioPort:(AVAudioSessionPortOverride)portOverride  error:(NSError **)outError NS_AVAILABLE_IOS(6_0);

	public var (readonly, getter=isOtherAudioPlaying) BOOL otherAudioPlaying  NS_AVAILABLE_IOS(6_0);

	public var  (default, null) extends AVAudioSessionRouteDescription * currentRoute NS_AVAILABLE_IOS(6_0);

}


/* AVAudioSessionHardwareConfiguration manages the set of properties that reflect the current state of
 audio hardware in the current route.  Applications whose functionality depends on these properties should
 reevaluate them any time the route changes. */
extern class AVAudioSession (AVAudioSessionHardwareConfiguration)

- (BOOL)setPreferredSampleRate:(double)sampleRate  error:(NSError **)outError NS_AVAILABLE_IOS(6_0);
	public var  (default, null) extends double preferredSampleRate NS_AVAILABLE_IOS(6_0);

- (BOOL)setPreferredIOBufferDuration:(NSTimeInterval)duration error:(NSError **)outError;
	public var  (default, null) extends NSTimeInterval preferredIOBufferDuration;

/* inputGain is key-value observable */
- (BOOL)setInputGain:(float)gain  error:(NSError **)outError NS_AVAILABLE_IOS(6_0);
	public var  (default, null) extends float inputGain NS_AVAILABLE_IOS(6_0); /* value in range [0.0, 1.0] */

	public var (readonly, getter=isInputGainSettable) BOOL inputGainSettable  NS_AVAILABLE_IOS(6_0);

	public var (readonly, getter=isInputAvailable) BOOL inputAvailable  NS_AVAILABLE_IOS(6_0); /* is input hardware available or not? */

/* For use with certain accessories, such as some USB audio devices, that support input or output data source selection.
If the attached accessory supports data source selection, the data source properties/methods provide for discovery and 
selection of input and/or output data sources. */
	public var  (default, null) extends NSArray * inputDataSources; /* NSArray of AVAudioSessionDataSourceDescriptions.  Key-value observable. */
	public var  (default, null) extends AVAudioSessionDataSourceDescription * inputDataSource; /* The currently selected data source.  Will be nil if no data sources are available. */
- (BOOL)setInputDataSource:(AVAudioSessionDataSourceDescription *)dataSource error:(NSError **)outError; /* Select from one of the available data sources. */
	public var  (default, null) extends NSArray * outputDataSources; /* NSArray of AVAudioSessionDataSourceDescriptions.  Key-value observable. */
	public var  (default, null) extends AVAudioSessionDataSourceDescription * outputDataSource; /* The currently selected data source.  Will be nil if no data sources are available. */
- (BOOL)setOutputDataSource:(AVAudioSessionDataSourceDescription *)dataSource error:(NSError **)outError; /* Select from one of the available data sources. */

	public var  (default, null) extends double sampleRate NS_AVAILABLE_IOS(6_0);
	public var  (default, null) extends NSInteger inputNumberOfChannels NS_AVAILABLE_IOS(6_0);
	public var  (default, null) extends NSInteger outputNumberOfChannels NS_AVAILABLE_IOS(6_0);
/* currentOutputVolume is key-value observable */
	public var  (default, null) extends float outputVolume  NS_AVAILABLE_IOS(6_0); /* value in range [0.0, 1.0] */
	public var  (default, null) extends NSTimeInterval inputLatency  NS_AVAILABLE_IOS(6_0); /* value in seconds */
	public var  (default, null) extends NSTimeInterval outputLatency  NS_AVAILABLE_IOS(6_0); /* value in seconds */
	public var  (default, null) extends NSTimeInterval IOBufferDuration  NS_AVAILABLE_IOS(6_0); /* value in seconds */

}

extern class AVAudioSession (AVAudioSessionDeprecated)

/* The delegate property is deprecated. Instead, you should register for the NSNotifications named below. */
/* For example: 
 [[NSNotificationCenter defaultCenter] addObserver: myObject 
 selector:    @selector(handleInterruption:) 
 name:        AVAudioSessionInterruptionNotification 
 object:      [AVAudioSession sharedInstance]]; 
 */
	public var (assign) id<AVAudioSessionDelegate> delegate NS_DEPRECATED_IOS(4_0, 6_0);


- (BOOL)setActive:(BOOL)active withFlags:(NSInteger)flags error:(NSError **)outError NS_DEPRECATED_IOS(4_0, 6_0);

	public var  (default, null) extends BOOL inputIsAvailable NS_DEPRECATED_IOS(3_0, 6_0); /* is input hardware available or not? */

/* deprecated.  Use the corresponding properties without "Hardware" in their names. */
	public var  (default, null) extends double currentHardwareSampleRate NS_DEPRECATED_IOS(3_0, 6_0);
	public var  (default, null) extends NSInteger currentHardwareInputNumberOfChannels NS_DEPRECATED_IOS(3_0, 6_0);
	public var  (default, null) extends NSInteger currentHardwareOutputNumberOfChannels NS_DEPRECATED_IOS(3_0, 6_0);
- (BOOL)setPreferredHardwareSampleRate:(double)sampleRate error:(NSError **)outError NS_DEPRECATED_IOS(3_0, 6_0);
	public var  (default, null) extends double preferredHardwareSampleRate NS_DEPRECATED_IOS(3_0, 6_0);

}

#pragma mark -- Names for NSNotifications --

/* Registered listeners will be notified when the system has interrupted the audio session and when
 the interruption has ended.  Check the notification's userInfo dictionary for the interruption type -- either begin or end.
 In the case of an end interruption notification, check the userInfo dictionary for AVAudioSessionInterruptionOptions that
 indicate whether audio playback should resume.
 */
AVF_EXPORT NSString *const AVAudioSessionInterruptionNotification NS_AVAILABLE_IOS(6_0);

/* Registered listeners will be notified when a route change has occurred.  Check the notification's userInfo dictionary for the
 route change reason and for a description of the previous audio route.
 */
AVF_EXPORT NSString *const AVAudioSessionRouteChangeNotification NS_AVAILABLE_IOS(6_0);

/* Registered listeners will be notified when the media server restarts.  In the event that the server restarts,
 take appropriate steps to re-initialize any audio objects used by your application.  See Technical Q&A QA1749.
 */
AVF_EXPORT NSString *const AVAudioSessionMediaServicesWereResetNotification NS_AVAILABLE_IOS(6_0);

#pragma mark -- Keys for NSNotification userInfo dictionaries --

/* keys for AVAudioSessionInterruptionNotification */
AVF_EXPORT NSString *const AVAudioSessionInterruptionTypeKey NS_AVAILABLE_IOS(6_0); /* value is an NSNumber representing an AVAudioSessionInterruptionType */
AVF_EXPORT NSString *const AVAudioSessionInterruptionOptionKey NS_AVAILABLE_IOS(6_0); /* Only present for end interruption events.  Value
																					   is of type AVAudioSessionInterruptionOptions.*/
/* keys for AVAudioSessionRouteChangeNotification */
AVF_EXPORT NSString *const AVAudioSessionRouteChangeReasonKey NS_AVAILABLE_IOS(6_0); /* value is an NSNumber representing an AVAudioSessionRouteChangeReason */
AVF_EXPORT NSString *const AVAudioSessionRouteChangePreviousRouteKey NS_AVAILABLE_IOS(6_0); /* value is AVAudioSessionRouteDescription * */

#pragma mark -- Values for the category property --

/*  Use this category for background sounds such as rain, car engine noise, etc.  
 Mixes with other music. */
AVF_EXPORT NSString *const AVAudioSessionCategoryAmbient;
/*  Use this category for background sounds.  Other music will stop playing. */
AVF_EXPORT NSString *const AVAudioSessionCategorySoloAmbient;
/* Use this category for music tracks.*/
AVF_EXPORT NSString *const AVAudioSessionCategoryPlayback;
/*  Use this category when recording audio. */
AVF_EXPORT NSString *const AVAudioSessionCategoryRecord;
/*  Use this category when recording and playing back audio. */
AVF_EXPORT NSString *const AVAudioSessionCategoryPlayAndRecord;
/*  Use this category when using a hardware codec or signal processor while
 not playing or recording audio. */
AVF_EXPORT NSString *const AVAudioSessionCategoryAudioProcessing;
/*  Use this category to customize the usage of available audio accessories and built-in audio hardware. 
 For example, this category provides an application with the ability to use an available USB output 
 and headphone output simultaneously for separate, distinct streams of audio data. Use of 
 this category by an application requires a more detailed knowledge of, and interaction with, 
 the capabilities of the available audio routes.  May be used for input, output, or both. */
AVF_EXPORT NSString *const AVAudioSessionCategoryMultiRoute NS_AVAILABLE_IOS(6_0);

#pragma mark -- Values for the mode property --

/*!
@abstract      Modes modify the audio category in order to introduce behavior that is tailored to the specific
use of audio within an application.  Available in iOS 5.0 and greater.
 */

/* The default mode */
AVF_EXPORT NSString *const AVAudioSessionModeDefault NS_AVAILABLE_IOS(5_0);

/* Only valid with AVAudioSessionCategoryPlayAndRecord.  Appropriate for Voice over IP
(VoIP) applications.  Reduces the number of allowable audio routes to be only those
that are appropriate for VoIP applications and may engage appropriate system-supplied
signal processing.  Has the side effect of setting AVAudioSessionCategoryOptionAllowBluetooth */
AVF_EXPORT NSString *const AVAudioSessionModeVoiceChat NS_AVAILABLE_IOS(5_0);

/* Set by Game Kit on behalf of an application that uses a GKVoiceChat object; valid
 only with the AVAudioSessionCategoryPlayAndRecord category.
 Do not set this mode directly. If you need similar behavior and are not using
 a GKVoiceChat object, use AVAudioSessionModeVoiceChat instead. */
AVF_EXPORT NSString *const AVAudioSessionModeGameChat NS_AVAILABLE_IOS(5_0);

/* Only valid with AVAudioSessionCategoryPlayAndRecord or AVAudioSessionCategoryRecord.
 Modifies the audio routing options and may engage appropriate system-supplied signal processing. */
AVF_EXPORT NSString *const AVAudioSessionModeVideoRecording NS_AVAILABLE_IOS(5_0);

/* Appropriate for applications that wish to minimize the effect of system-supplied signal
processing for input and/or output audio signals. */
AVF_EXPORT NSString *const AVAudioSessionModeMeasurement NS_AVAILABLE_IOS(5_0);

/* Engages appropriate output signal processing for movie playback scenarios.  Currently
only applied during playback over built-in speaker. */
AVF_EXPORT NSString *const AVAudioSessionModeMoviePlayback NS_AVAILABLE_IOS(6_0);

#pragma mark -- constants for port types --

/* input port types */
AVF_EXPORT NSString *const AVAudioSessionPortLineIn       NS_AVAILABLE_IOS(6_0); /* Line level input on a dock connector */
AVF_EXPORT NSString *const AVAudioSessionPortBuiltInMic   NS_AVAILABLE_IOS(6_0); /* Built-in microphone on an iOS device */
AVF_EXPORT NSString *const AVAudioSessionPortHeadsetMic   NS_AVAILABLE_IOS(6_0); /* Microphone on a wired headset.  Headset refers to an
																				   accessory that has headphone outputs paired with a
																				   microphone. */

/* output port types */
AVF_EXPORT NSString *const AVAudioSessionPortLineOut          NS_AVAILABLE_IOS(6_0); /* Line level output on a dock connector */
AVF_EXPORT NSString *const AVAudioSessionPortHeadphones       NS_AVAILABLE_IOS(6_0); /* Headphone or headset output */
AVF_EXPORT NSString *const AVAudioSessionPortBluetoothA2DP    NS_AVAILABLE_IOS(6_0); /* Output on a Bluetooth A2DP device */
AVF_EXPORT NSString *const AVAudioSessionPortBuiltInReceiver  NS_AVAILABLE_IOS(6_0); /* The speaker you hold to your ear when on a phone call */
AVF_EXPORT NSString *const AVAudioSessionPortBuiltInSpeaker   NS_AVAILABLE_IOS(6_0); /* Built-in speaker on an iOS device */
AVF_EXPORT NSString *const AVAudioSessionPortHDMI             NS_AVAILABLE_IOS(6_0); /* Output via High-Definition Multimedia Interface */
AVF_EXPORT NSString *const AVAudioSessionPortAirPlay          NS_AVAILABLE_IOS(6_0); /* Output on a remote Air Play device */

/* port types that refer to either input or output */
AVF_EXPORT NSString *const AVAudioSessionPortBluetoothHFP NS_AVAILABLE_IOS(6_0); /* Input or output on a Bluetooth Hands-Free Profile device */
AVF_EXPORT NSString *const AVAudioSessionPortUSBAudio     NS_AVAILABLE_IOS(6_0); /* Input or output on a Universal Serial Bus device */


#pragma mark -- helper class interfaces --

/* 
 AVAudioSessionChannelDescription objects provide information about a port's audio channels.
 AudioQueues, AURemoteIO and AUVoiceIO instances can be assigned to communicate with specific 
 hardware channels by setting an array of <port UID, channel index> pairs.
 */
NS_CLASS_AVAILABLE(NA, 6_0)
extern class AVAudioSessionChannelDescription extends NSObject {
@private
    void *_impl;
}

	public var  (default, null) extends NSString *	channelName;
	public var  (default, null) extends NSString *	owningPortUID;  /* the unique identifier (UID) for the channel's owning port */
	public var  (default, null) extends NSUInteger	channelNumber;  /* the index of this channel in its owning port's array of channels */
}

NS_CLASS_AVAILABLE(NA, 6_0)
extern class AVAudioSessionPortDescription extends NSObject {
@private
    void * _impl;
}


	public var  (default, null) extends NSString *	portType;	/* Value is one of the AVAudioSessionPort constants declared above. */
	public var  (default, null) extends NSString *	portName;	/* A descriptive name for the port */
	public var  (default, null) extends NSString *	UID;		/* A system-assigned unique identifier for the port */
	public var  (default, null) extends NSArray *	channels;	/* Array of AVAudioSessionChannelDescription objects */
}

NS_CLASS_AVAILABLE(NA, 6_0)
extern class AVAudioSessionRouteDescription extends NSObject {
@private
    void * _impl;
}

	public var  (default, null) extends NSArray * inputs;  /* Array of AVAudioSessionPortDescription objects */
	public var  (default, null) extends NSArray * outputs; /* Array of AVAudioSessionPortDescription objects */
}

NS_CLASS_AVAILABLE(NA, 6_0)
extern class AVAudioSessionDataSourceDescription extends NSObject {
@private
    void * _impl;
}

	public var  (default, null) extends NSNumber * dataSourceID;	/* system-assigned ID for the data source */
	public var  (default, null) extends NSString * dataSourceName;  /* human-readable name for the data source */
}


#pragma mark -- AVAudioSessionDelegate protocol --
/* The AVAudioSessionDelegate protocol is deprecated. Instead you should register for notifications. */
@protocol AVAudioSessionDelegate <NSObject>
@optional 

- (void)beginInterruption; /* something has caused your audio session to be interrupted */

/* the interruption is over */
- (void)endInterruptionWithFlags:(NSUInteger)flags NS_AVAILABLE_IOS(4_0); /* Currently the only flag is AVAudioSessionInterruptionFlags_ShouldResume. */
		
- (void)endInterruption; /* endInterruptionWithFlags: will be called instead if implemented. */

/* notification for input become available or unavailable */
- (void)inputIsAvailableChanged:(BOOL)isInputAvailable;

}


#pragma mark -- Deprecated enumerations --

/* Deprecated in iOS 6.0.  Use AVAudioSessionInterruptionOptions instead.
 Flags passed to you when endInterruptionWithFlags: is called on the delegate */
enum {
	AVAudioSessionInterruptionFlags_ShouldResume = 1
} NS_DEPRECATED_IOS(4_0, 6_0);

/* Deprecated in iOS 6.0.  Use AVAudioSessionSetActiveOptions instead.
 flags for use when calling setActive:withFlags:error: */
enum {	
	AVAudioSessionSetActiveFlags_NotifyOthersOnDeactivation = 1
} NS_DEPRECATED_IOS(4_0, 6_0);

