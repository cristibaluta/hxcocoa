/*
    File:  AVCaptureSession.h

	Framework:  AVFoundation

	Copyright 2010-2012 Apple Inc. All rights reserved.
*/

#import <AVFoundation/AVBase.h>
#import <Foundation/Foundation.h>
#import <CoreMedia/CMFormatDescription.h>

/*!
 @constant AVCaptureSessionRuntimeErrorNotification
 @abstract
    Posted when an unexpected error occurs while an AVCaptureSession instance is running.
 
 @discussion
    The notification object is the AVCaptureSession instance that encountered a runtime error.
    The userInfo dictionary contains an NSError for the key AVCaptureSessionErrorKey.
*/
AVF_EXPORT NSString *const AVCaptureSessionRuntimeErrorNotification NS_AVAILABLE(10_7, 4_0);

/*!
 @constant AVCaptureSessionErrorKey
 @abstract
    The key used to provide an NSError describing the failure condition in an
    AVCaptureSessionRuntimeErrorNotification.
 
 @discussion
    AVCaptureSessionErrorKey may be found in the userInfo dictionary provided with
    an AVCaptureSessionRuntimeErrorNotification.  The NSError associated with the
    notification gives greater detail on the nature of the error, and in some cases
    recovery suggestions. 
*/
AVF_EXPORT NSString *const AVCaptureSessionErrorKey NS_AVAILABLE(10_7, 4_0);

/*!
 @constant AVCaptureSessionDidStartRunningNotification
 @abstract
    Posted when an instance of AVCaptureSession successfully starts running.
 
 @discussion
    Clients may observe the AVCaptureSessionDidStartRunningNotification to know
    when an instance of AVCaptureSession starts running.
*/
AVF_EXPORT NSString *const AVCaptureSessionDidStartRunningNotification NS_AVAILABLE(10_7, 4_0);

/*!
 @constant AVCaptureSessionDidStopRunningNotification
 @abstract
    Posted when an instance of AVCaptureSession stops running.
 
 @discussion
    Clients may observe the AVCaptureSessionDidStopRunningNotification to know
    when an instance of AVCaptureSession stops running.  An AVCaptureSession instance
    may stop running automatically due toexternal system conditions, such as the
    device going to sleep, or being locked by a user.
*/
AVF_EXPORT NSString *const AVCaptureSessionDidStopRunningNotification NS_AVAILABLE(10_7, 4_0);

#if TARGET_OS_IPHONE

/*!
 @constant AVCaptureSessionWasInterruptedNotification
 @abstract
    Posted when an instance of AVCaptureSession becomes interrupted.
 
 @discussion
    Clients may observe the AVCaptureSessionWasInterruptedNotification to know
    when an instance of AVCaptureSession has been interrupted, for example, by
    an incoming phone call, or alarm, or another application taking control of 
    needed hardware resources.  When appropriate, the AVCaptureSession instance
    will stop running automatically in response to an interruption.
*/
AVF_EXPORT NSString *const AVCaptureSessionWasInterruptedNotification NS_AVAILABLE_IOS(4_0);

/*!
 @constant AVCaptureSessionInterruptionEndedNotification
 @abstract
    Posted when an instance of AVCaptureSession ceases to be interrupted.
 
 @discussion
    Clients may observe the AVCaptureSessionInterruptionEndedNotification to know
    when an instance of AVCaptureSession ceases to be interrupted, for example, when
    a  phone call ends, and hardware resources needed to run the session are again
    available.  When appropriate, the AVCaptureSession instance that was previously
    stopped in response to an interruption will automatically restart once the
    interruption ends.
*/
AVF_EXPORT NSString *const AVCaptureSessionInterruptionEndedNotification NS_AVAILABLE_IOS(4_0);

#endif // TARGET_OS_IPHONE

/*!
 @enum AVCaptureVideoOrientation
 @abstract
    Constants indicating video orientation, for use with AVCaptureVideoPreviewLayer 
    (see AVCaptureVideoPreviewLayer.h) and AVCaptureConnection (see below).
 
 @constant AVCaptureVideoOrientationPortrait
    Indicates that video should be oriented vertically, home button on the bottom.
 @constant AVCaptureVideoOrientationPortraitUpsideDown
    Indicates that video should be oriented vertically, home button on the top.
 @constant AVCaptureVideoOrientationLandscapeRight
    Indicates that video should be oriented horizontally, home button on the right.
 @constant AVCaptureVideoOrientationLandscapeLeft
    Indicates that video should be oriented horizontally, home button on the left.
*/
enum {
    AVCaptureVideoOrientationPortrait           = 1,
    AVCaptureVideoOrientationPortraitUpsideDown = 2,
    AVCaptureVideoOrientationLandscapeRight     = 3,
    AVCaptureVideoOrientationLandscapeLeft      = 4,
};
typedef NSInteger AVCaptureVideoOrientation;

/*!
 @constant AVCaptureSessionPresetPhoto
 @abstract
    An AVCaptureSession preset suitable for high resolution photo quality output.
 
 @discussion
    Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPresetPhoto
    for full resolution photo quality output.
*/
AVF_EXPORT NSString *const AVCaptureSessionPresetPhoto NS_AVAILABLE(10_7, 4_0);

/*!
 @constant AVCaptureSessionPresetHigh
 @abstract
    An AVCaptureSession preset suitable for high quality video and audio output.
 
 @discussion
    Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPresetHigh
    to achieve high quality video and audio output.  AVCaptureSessionPresetHigh is the
    default sessionPreset value.
*/
AVF_EXPORT NSString *const AVCaptureSessionPresetHigh NS_AVAILABLE(10_7, 4_0);

/*!
 @constant AVCaptureSessionPresetMedium
 @abstract
    An AVCaptureSession preset suitable for medium quality output.
 
 @discussion
    Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPresetMedium
    to achieve output video and audio bitrates suitable for sharing over WiFi.
*/
AVF_EXPORT NSString *const AVCaptureSessionPresetMedium NS_AVAILABLE(10_7, 4_0);

/*!
 @constant AVCaptureSessionPresetLow
 @abstract
    An AVCaptureSession preset suitable for low quality output.
 
 @discussion
    Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPresetLow
    to achieve output video and audio bitrates suitable for sharing over 3G.
*/
AVF_EXPORT NSString *const AVCaptureSessionPresetLow NS_AVAILABLE(10_7, 4_0);

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

/*!
 @constant AVCaptureSessionPreset320x240
 @abstract
    An AVCaptureSession preset suitable for 320x240 video output.
 
 @discussion
    Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPreset320x240
    to achieve 320x240 output.
*/
AVF_EXPORT NSString *const AVCaptureSessionPreset320x240 NS_AVAILABLE(10_7, NA);

#endif // (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

/*!
 @constant AVCaptureSessionPreset352x288
 @abstract
    An AVCaptureSession preset suitable for 352x288 video output.
 
 @discussion
    Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPreset352x288
    to achieve CIF quality (352x288) output.
*/
AVF_EXPORT NSString *const AVCaptureSessionPreset352x288 NS_AVAILABLE(10_7, 5_0);

/*!
 @constant AVCaptureSessionPreset640x480
 @abstract
    An AVCaptureSession preset suitable for 640x480 video output.
 
 @discussion
    Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPreset640x480
    to achieve VGA quality (640x480) output.
*/
AVF_EXPORT NSString *const AVCaptureSessionPreset640x480 NS_AVAILABLE(10_7, 4_0);

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

/*!
 @constant AVCaptureSessionPreset960x540
 @abstract
    An AVCaptureSession preset suitable for 960x540 video output.
 
 @discussion
    Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPreset960x540
    to achieve quarter HD quality (960x540) output.
*/
AVF_EXPORT NSString *const AVCaptureSessionPreset960x540 NS_AVAILABLE(10_7, NA);

#endif // (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

/*!
 @constant AVCaptureSessionPreset1280x720
 @abstract
    An AVCaptureSession preset suitable for 1280x720 video output.
 
 @discussion
    Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPreset1280x720
    to achieve 1280x720 output.
*/
AVF_EXPORT NSString *const AVCaptureSessionPreset1280x720 NS_AVAILABLE(10_7, 4_0);

#if TARGET_OS_IPHONE

/*!
 @constant AVCaptureSessionPreset1920x1080
 @abstract
    An AVCaptureSession preset suitable for 1920x1080 video output.
 
 @discussion
    Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPreset1920x1080
    to achieve 1920x1080 output.
*/
AVF_EXPORT NSString *const AVCaptureSessionPreset1920x1080 NS_AVAILABLE(NA, 5_0);

/*!
@constant AVCaptureSessionPresetiFrame960x540
@abstract
    An AVCaptureSession preset producing 960x540 Apple iFrame video and audio content.

@discussion
    Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPresetiFrame960x540
    to achieve 960x540 quality iFrame H.264 video at ~30 Mbits/sec with AAC audio.  QuickTime
    movies captured in iFrame format are optimal for editing applications.
*/
AVF_EXPORT NSString *const AVCaptureSessionPresetiFrame960x540 NS_AVAILABLE(NA, 5_0);

/*!
@constant AVCaptureSessionPresetiFrame1280x720
@abstract
    An AVCaptureSession preset producing 1280x720 Apple iFrame video and audio content.

@discussion
    Clients may set an AVCaptureSession instance's sessionPreset to AVCaptureSessionPresetiFrame1280x720
    to achieve 1280x720 quality iFrame H.264 video at ~40 Mbits/sec with AAC audio.  QuickTime
    movies captured in iFrame format are optimal for editing applications.
*/
AVF_EXPORT NSString *const AVCaptureSessionPresetiFrame1280x720 NS_AVAILABLE(NA, 5_0);

#endif // TARGET_OS_IPHONE

@class AVCaptureInput;
@class AVCaptureOutput;
@class AVCaptureConnection;
@class AVCaptureSessionInternal;

/*!
 @class AVCaptureSession
 @abstract
    AVCaptureSession is the central hub of the AVFoundation capture classes.
 
 @discussion
    To perform a real-time capture, a client may instantiate AVCaptureSession and add appropriate
    AVCaptureInputs, such as AVCaptureDeviceInput, and outputs, such as AVCaptureMovieFileOutput.
    [AVCaptureSession startRunning] starts the flow of data from the inputs to the outputs, and 
    [AVCaptureSession stopRunning] stops the flow.  A client may set the sessionPreset property to 
    customize the quality level or bitrate of the output.
*/
NS_CLASS_AVAILABLE(10_7, 4_0)
extern class AVCaptureSession extends NSObject 
{
@private
	AVCaptureSessionInternal *_internal;
}

/*!
 @method canSetSessionPreset:
 @abstract
    Returns whether the receiver can be configured with the given preset.
 
 @param preset
    An AVCaptureSession preset.
 @result
    YES if the receiver can be set to the given preset, NO otherwise.
 
 @discussion
    An AVCaptureSession instance can be associated with a preset that configures its inputs and outputs to fulfill common
    use cases. This method can be used to determine if the receiver supports the desired preset given its
    current input and output configuration.  The receiver's sessionPreset property may only be 
    set to a certain preset if this method returns YES for that preset.
*/
- (BOOL)canSetSessionPreset:(NSString*)preset;

/*!
 	public var  sessionPreset
 @abstract
    Indicates the session preset currently in use by the receiver.
 
 @discussion
    The value of this property is an NSString (one of AVCaptureSessionPreset*) indicating 
    the current session preset in use by the receiver.  The sessionPreset property may be set 
    while the receiver is running.
*/
	public var  NSString *sessionPreset;

/*!
 	public var  inputs
 @abstract
    An NSArray of AVCaptureInputs currently added to the receiver.

 @discussion
    The value of this property is an NSArray of AVCaptureInputs currently added to
    the receiver.  Clients can add AVCaptureInputs to a session by calling -addInput:.
*/
	public var (default, null) NSArray *inputs;

/*!
 @method canAddInput:
 @abstract
    Returns whether the proposed input can be added to the receiver.
 
 @param input
    An AVCaptureInput instance.
 @result
    YES if the proposed input can be added to the receiver, NO otherwise.
 
 @discussion
    An AVCaptureInput instance can only be added to a session using -addInput: if
    canAddInput: returns YES.
*/
- (BOOL)canAddInput:(AVCaptureInput *)input;

/*!
 @method addInput:
 @abstract
    Adds an AVCaptureInput to the session.
 
 @param input
    An AVCaptureInput instance.
 
 @discussion
    An AVCaptureInput instance can only be added to a session using -addInput: if
    canAddInput: returns YES.  -addInput: may be called while the session is running.
*/
- (void)addInput:(AVCaptureInput *)input;

/*!
 @method removeInput:
 @abstract
    Removes an AVCaptureInput from the session.
 
 @param input
    An AVCaptureInput instance.
 
 @discussion
    -removeInput: may be called while the session is running.
*/
- (void)removeInput:(AVCaptureInput *)input;

/*!
 	public var  outputs
 @abstract
    An NSArray of AVCaptureOutputs currently added to the receiver.

 @discussion
    The value of this property is an NSArray of AVCaptureOutputs currently added to
    the receiver.  Clients can add AVCaptureOutputs to a session by calling -addOutput:.
*/
	public var (default, null) NSArray *outputs;

/*!
 @method canAddOutput:
 @abstract
    Returns whether the proposed output can be added to the receiver.
 
 @param output
    An AVCaptureOutput instance.
 @result
    YES if the proposed output can be added to the receiver, NO otherwise.
 
 @discussion
    An AVCaptureOutput instance can only be added to a session using -addOutput: if
    canAddOutput: returns YES.
*/
- (BOOL)canAddOutput:(AVCaptureOutput *)output;

/*!
 @method addOutput:
 @abstract
    Adds an AVCaptureOutput to the session.
 
 @param output
    An AVCaptureOutput instance.
 
 @discussion
    An AVCaptureOutput instance can only be added to a session using -addOutput: if
    canAddOutput: returns YES.  -addOutput: may be called while the session is running.
*/
- (void)addOutput:(AVCaptureOutput *)output;

/*!
 @method removeOutput:
 @abstract
    Removes an AVCaptureOutput from the session.
 
 @param output
    An AVCaptureOutput instance.
 
 @discussion
    -removeOutput: may be called while the session is running.
*/
- (void)removeOutput:(AVCaptureOutput *)output;

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

/*!
 @method addInputWithNoConnections:
 @abstract
    Adds an AVCaptureInput to the session without forming any connections.
 
 @param input
    An AVCaptureInput instance.
 
 @discussion
    -addInputWithNoConnections: may be called while the session is running.
    The -addInput: method is the preferred method for adding an input to an
    AVCaptureSession.  -addInputWithNoConnections: may be called if you need 
    fine-grained control over which inputs are connected to which outputs.
*/
- (void)addInputWithNoConnections:(AVCaptureInput *)input NS_AVAILABLE(10_7, NA);

/*!
 @method addOutputWithNoConnections:
 @abstract
    Adds an AVCaptureOutput to the session without forming any connections.
 
 @param output
    An AVCaptureOutput instance.
 
 @discussion
    -addOutputWithNoConnections: may be called while the session is running.
    The -addOutput: method is the preferred method for adding an output to an
    AVCaptureSession.  -addOutputWithNoConnections: may be called if you need 
    fine-grained control over which inputs are connected to which outputs.
*/
- (void)addOutputWithNoConnections:(AVCaptureOutput *)output NS_AVAILABLE(10_7, NA);

/*!
 @method canAddConnection:
 @abstract
    Returns whether the proposed connection can be added to the receiver.
 
 @param connection
    An AVCaptureConnection instance.
 
 @discussion
    An AVCaptureConnection instance can only be added to a session using -addConnection:
    if canAddConnection: returns YES.  When using -addInput: or -addOutput:, connections
    are formed automatically between all compatible inputs and outputs.  Manually
    adding connections is only necessary when adding an input or output with
    no connections.
*/
- (BOOL)canAddConnection:(AVCaptureConnection *)connection NS_AVAILABLE(10_7, NA);

/*!
 @method addConnection:
 @abstract
    Adds an AVCaptureConnection to the session.
 
 @param connection
    An AVCaptureConnection instance.
 
 @discussion
    An AVCaptureConnection instance can only be added to a session using -addConnection:
    if canAddConnection: returns YES.  When using -addInput: or -addOutput:, connections
    are formed automatically between all compatible inputs and outputs.  Manually
    adding connections is only necessary when adding an input or output with
    no connections.  -addConnection: may be called while the session is running.
*/
- (void)addConnection:(AVCaptureConnection *)connection NS_AVAILABLE(10_7, NA);

/*!
 @method removeConnection:
 @abstract
    Removes an AVCaptureConnection from the session.
 
 @param connection
    An AVCaptureConnection instance.
 
 @discussion
    -removeConnection: may be called while the session is running.
*/
- (void)removeConnection:(AVCaptureConnection *)connection NS_AVAILABLE(10_7, NA);

#endif // (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

/*!
 @method beginConfiguration
 @abstract
    When paired with commitConfiguration, allows a client to batch multiple configuration
    operations on a running session into atomic updates.

 @discussion
    -beginConfiguration / -commitConfiguration are AVCaptureSession's mechanism
    for batching multiple configuration operations on a running session into atomic
    updates.  After calling [session beginConfiguration], clients may add or remove
    outputs, alter the sessionPreset, or configure individual AVCaptureInput or Output
    properties.  All changes will be pended until the client calls [session commitConfiguration],
    at which time they will be applied together.  -beginConfiguration / -commitConfiguration
    pairs may be nested, and will only be applied when the outermost commit is invoked.
*/
- (void)beginConfiguration;

/*!
 @method commitConfiguration
 @abstract
    When preceded by beginConfiguration, allows a client to batch multiple configuration
    operations on a running session into atomic updates.

 @discussion
    -beginConfiguration / -commitConfiguration are AVCaptureSession's mechanism
    for batching multiple configuration operations on a running session into atomic
    updates.  After calling [session beginConfiguration], clients may add or remove
    outputs, alter the sessionPreset, or configure individual AVCaptureInput or Output
    properties.  All changes will be pended until the client calls [session commitConfiguration],
    at which time they will be applied together.  -beginConfiguration / -commitConfiguration
    pairs may be nested, and will only be applied when the outermost commit is invoked.
*/
- (void)commitConfiguration;

/*!
 	public var  running
 @abstract
    Indicates whether the session is currently running.
 
 @discussion
    The value of this property is a BOOL indicating whether the receiver is running.
    Clients can key value observe the value of this property to be notified when
    the session automatically starts or stops running.
*/
	public var (nonatomic, readonly, getter=isRunning) BOOL running;


#if TARGET_OS_IPHONE

/*!
 	public var  interrupted
 @abstract
    Indicates whether the session is being interrupted.
 
 @discussion
    The value of this property is a BOOL indicating whether the receiver is currently
    being interrupted, such as by a phone call or alarm. Clients can key value observe 
    the value of this property to be notified when the session ceases to be interrupted
    and again has access to needed hardware resources.
*/
	public var (nonatomic, readonly, getter=isInterrupted) BOOL interrupted NS_AVAILABLE_IOS(4_0);

#endif // TARGET_OS_IPHONE

/*!
 @method startRunning
 @abstract
    Starts an AVCaptureSession instance running.

 @discussion
    Clients invoke -startRunning to start the flow of data from inputs to outputs connected to 
    the AVCaptureSession instance.  This call blocks until the session object has completely
    started up or failed.  A failure to start running is reported through the AVCaptureSessionRuntimeErrorNotification
    mechanism.
*/
- (void)startRunning;

/*!
 @method stopRunning
 @abstract
    Stops an AVCaptureSession instance that is currently running.

 @discussion
    Clients invoke -stopRunning to stop the flow of data from inputs to outputs connected to 
    the AVCaptureSession instance.  This call blocks until the session object has completely
    stopped.
*/
- (void)stopRunning;

}



/*!
 @enum AVVideoFieldMode
 @abstract
    Constants indicating video field mode, for use with AVCaptureConnection's videoFieldMode
    property (see below).
 
 @constant AVVideoFieldModeBoth
    Indicates that both top and bottom video fields in interlaced content should be passed thru.
 @constant AVVideoFieldModeTopOnly
    Indicates that only the top video field in interlaced content should be passed thru.
 @constant AVVideoFieldModeBottomOnly
    Indicates that the bottom video field only in interlaced content should be passed thru.
 @constant AVVideoFieldModeDeinterlace
    Indicates that top and bottom video fields in interlaced content should be deinterlaced.
*/
enum {
    AVVideoFieldModeBoth        = 0,
    AVVideoFieldModeTopOnly     = 1,
    AVVideoFieldModeBottomOnly  = 2,
    AVVideoFieldModeDeinterlace = 3,
};
typedef NSInteger AVVideoFieldMode;


@class AVCaptureAudioChannel;
@class AVCaptureVideoPreviewLayer;
@class AVCaptureInputPort;
@class AVCaptureConnectionInternal;

/*!
 @class AVCaptureConnection
 @abstract
    AVCaptureConnection represents a connection between an AVCaptureInputPort or ports, and an AVCaptureOutput or 
    AVCaptureVideoPreviewLayer present in an AVCaptureSession.
 
 @discussion
    AVCaptureInputs have one or more AVCaptureInputPorts.  AVCaptureOutputs can accept
    data from one or more sources (example - an AVCaptureMovieFileOutput accepts both video and audio data).
    AVCaptureVideoPreviewLayers can accept data from one AVCaptureInputPort whose mediaType is
    AVMediaTypeVideo. When an input or output is added to a session, or a video preview layer is
    associated with a session, the session greedily forms connections between all the compatible AVCaptureInputs' 
    ports and AVCaptureOutputs or AVCaptureVideoPreviewLayers.  Iterating through an output's connections or a
    video preview layer's sole connection, a client may enable or disable the flow of data from a given input 
    to a given output or preview layer.
     
    Connections involving audio expose an array of AVCaptureAudioChannel objects, which can be used for
    monitoring levels.

    Connections involving video expose video specific properties, such as videoMirrored and videoOrientation.
*/
NS_CLASS_AVAILABLE(10_7, 4_0)
extern class AVCaptureConnection extends NSObject 
{
@private
	AVCaptureConnectionInternal *_internal;
}

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

/*!
 @method connectionWithInputPorts:output:
 @abstract
    Returns an AVCaptureConnection instance describing a connection between the specified inputPorts 
    and the specified output.
 
 @param ports
    An array of AVCaptureInputPort objects associated with AVCaptureInput objects.
 @param output
    An AVCaptureOutput object.
 @result
    An AVCaptureConnection instance joining the specified inputPorts to the specified
    output port.
 
 @discussion
    This method returns an instance of AVCaptureConnection that may be subsequently added to an
    AVCaptureSession instance using AVCaptureSession's -addConnection: method.  When using 
    -addInput: or -addOutput:, connections are formed between all compatible inputs and outputs
    automatically.  You do not need to manually create and add connections to the session unless
    you use the primitive -addInputWithNoConnections: or -addOutputWithNoConnections: methods.
*/
+ (AVCaptureConnection *)connectionWithInputPorts:(NSArray *)ports output:(AVCaptureOutput *)output NS_AVAILABLE(10_7, NA);

/*!
 @method connectionWithInputPort:videoPreviewLayer:
 @abstract
    Returns an AVCaptureConnection instance describing a connection between the specified inputPort 
    and the specified AVCaptureVideoPreviewLayer instance.
 
 @param port
    An AVCaptureInputPort object associated with an AVCaptureInput object.
 @param layer
    An AVCaptureVideoPreviewLayer object.
 @result
    An AVCaptureConnection instance joining the specified inputPort to the specified
    video preview layer.
 
 @discussion
    This method returns an instance of AVCaptureConnection that may be subsequently added to an
    AVCaptureSession instance using AVCaptureSession's -addConnection: method.  When using 
    AVCaptureVideoPreviewLayer's -initWithSession: or -setSession:, a connection is formed between 
    the first compatible input port and the video preview layer automatically.  You do not need to 
    manually create and add connections to the session unless you use AVCaptureVideoPreviewLayer's 
    primitive -initWithSessionWithNoConnection: or -setSessionWithNoConnection: methods.
*/
+ (AVCaptureConnection *)connectionWithInputPort:(AVCaptureInputPort *)port videoPreviewLayer:(AVCaptureVideoPreviewLayer *)layer NS_AVAILABLE(10_7, NA);

/*!
 @method initWithInputPorts:output:
 @abstract
    Returns an AVCaptureConnection instance describing a connection between the specified inputPorts 
    and the specified output.
 
 @param ports
    An array of AVCaptureInputPort objects associated with AVCaptureInput objects.
 @param output
    An AVCaptureOutput object.
 @result
    An AVCaptureConnection instance joining the specified inputPorts to the specified
    output port.
 
 @discussion
    This method returns an instance of AVCaptureConnection that may be subsequently added to an
    AVCaptureSession instance using AVCaptureSession's -addConnection: method.  When using 
    -addInput: or -addOutput:, connections are formed between all compatible inputs and outputs
    automatically.  You do not need to manually create and add connections to the session unless
    you use the primitive -addInputWithNoConnections: or -addOutputWithNoConnections: methods.
*/
- (id)initWithInputPorts:(NSArray *)ports output:(AVCaptureOutput *)output NS_AVAILABLE(10_7, NA);

/*!
 @method initWithInputPort:videoPreviewLayer:
 @abstract
    Returns an AVCaptureConnection instance describing a connection between the specified inputPort 
    and the specified AVCaptureVideoPreviewLayer instance.
 
 @param port
    An AVCaptureInputPort object associated with an AVCaptureInput object.
 @param layer
    An AVCaptureVideoPreviewLayer object.
 @result
    An AVCaptureConnection instance joining the specified inputPort to the specified
    video preview layer.
 
 @discussion
    This method returns an instance of AVCaptureConnection that may be subsequently added to an
    AVCaptureSession instance using AVCaptureSession's -addConnection: method.  When using 
    AVCaptureVideoPreviewLayer's -initWithSession: or -setSession:, a connection is formed between 
    the first compatible input port and the video preview layer automatically.  You do not need to 
    manually create and add connections to the session unless you use AVCaptureVideoPreviewLayer's 
    primitive -initWithSessionWithNoConnection: or -setSessionWithNoConnection: methods.
*/
- (id)initWithInputPort:(AVCaptureInputPort *)port videoPreviewLayer:(AVCaptureVideoPreviewLayer *)layer NS_AVAILABLE(10_7, NA);

#endif // (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

/*!
 	public var  inputPorts
 @abstract
    An array of AVCaptureInputPort instances providing data through this connection.

 @discussion
    An AVCaptureConnection may involve one or more AVCaptureInputPorts producing data
    to the connection's AVCaptureOutput.  This property is read-only.  An AVCaptureConnection's
    inputPorts remain static for the life of the object.  
*/
	public var (default, null) NSArray *inputPorts;

/*!
 	public var  output
 @abstract
    The AVCaptureOutput instance consuming data from this connection's inputPorts.

 @discussion
    An AVCaptureConnection may involve one or more AVCaptureInputPorts producing data
    to the connection's AVCaptureOutput.  This property is read-only.  An AVCaptureConnection's
    output remains static for the life of the object.  Note that a connection can either
    be to an output or a video preview layer, but never to both.
*/
	public var (default, null) AVCaptureOutput *output;

/*!
 	public var  videoPreviewLayer
 @abstract
    The AVCaptureVideoPreviewLayer instance consuming data from this connection's inputPort.
 
 @discussion
    An AVCaptureConnection may involve one AVCaptureInputPort producing data
    to an AVCaptureVideoPreviewLayer object.  This property is read-only.  An AVCaptureConnection's
    videoPreviewLayer remains static for the life of the object. Note that a connection can either
    be to an output or a video preview layer, but never to both.
*/
	public var (default, null) AVCaptureVideoPreviewLayer *videoPreviewLayer NS_AVAILABLE(10_7, 6_0);

/*!
 	public var  enabled
 @abstract
    Indicates whether the connection's output should consume data.

 @discussion
    The value of this property is a BOOL that determines whether the receiver's output should consume data 
    from its connected inputPorts when a session is running. Clients can set this property to stop the 
    flow of data to a given output during capture.  The default value is YES.  
*/
	public var (nonatomic, getter=isEnabled) BOOL enabled;

/*!
 	public var  active
 @abstract
    Indicates whether the receiver's output is currently capable of consuming
    data through this connection.

 @discussion
    The value of this property is a BOOL that determines whether the receiver's output
    can consume data provided through this connection.  This property is read-only.  Clients
    may key-value observe this property to know when a session's configuration forces a
    connection to become inactive.  The default value is YES.  
*/
	public var (nonatomic, readonly, getter=isActive) BOOL active;

/*!
 	public var  audioChannels
 @abstract
    An array of AVCaptureAudioChannel objects representing individual channels of
    audio data flowing through the connection.

 @discussion
    This property is only applicable to AVCaptureConnection instances involving
    audio.  In such connections, the audioChannels array contains one AVCaptureAudioChannel
    object for each channel of audio data flowing through this connection.
*/
	public var (default, null) NSArray *audioChannels;

/*!
 	public var  supportsVideoMirroring
 @abstract
    Indicates whether the connection supports setting the videoMirrored property.

 @discussion
    This property is only applicable to AVCaptureConnection instances involving
    video.  In such connections, the videoMirrored property may only be set if
    -isVideoMirroringSupported returns YES.
*/
	public var (nonatomic, readonly, getter=isVideoMirroringSupported) BOOL supportsVideoMirroring;

/*!
 	public var  videoMirrored
 @abstract
    Indicates whether the video flowing through the connection should be mirrored
    about its vertical axis.

 @discussion
    This property is only applicable to AVCaptureConnection instances involving
    video.  if -isVideoMirroringSupported returns YES, videoMirrored may be set
    to flip the video about its vertical axis and produce a mirror-image effect.
*/
	public var (nonatomic, getter=isVideoMirrored) BOOL videoMirrored;

/*!
 	public var  automaticallyAdjustsVideoMirroring
 @abstract
    Specifies whether or not the value of @"videoMirrored" can change based on configuration
    of the session.
	
 @discussion		
    For some session configurations, video data flowing through the connection will be mirrored 
    by default.  When the value of this property is YES, the value of @"videoMirrored" may change 
    depending on the configuration of the session, for example after switching to a different AVCaptureDeviceInput.
    The default value is YES.
*/
	public var BOOL automaticallyAdjustsVideoMirroring NS_AVAILABLE(10_7, 6_0);

/*!
 	public var  supportsVideoOrientation
 @abstract
    Indicates whether the connection supports setting the videoOrientation property.

 @discussion
    This property is only applicable to AVCaptureConnection instances involving
    video.  In such connections, the videoOrientation property may only be set if
    -isVideoOrientationSupported returns YES.
*/
	public var (nonatomic, readonly, getter=isVideoOrientationSupported) BOOL supportsVideoOrientation;

/*!
 	public var  videoOrientation
 @abstract
    Indicates whether the video flowing through the connection should be rotated
    to a given orientation.

 @discussion
    This property is only applicable to AVCaptureConnection instances involving
    video.  If -isVideoOrientationSupported returns YES, videoOrientation may be set
    to rotate the video buffers being consumed by the connection's output.  Note that
    setting videoOrientation does not necessarily result in a physical rotation of
    video buffers.  For instance, a video connection to an AVCaptureMovieFileOutput
    handles orientation using a Quicktime track matrix.  In the AVCaptureStillImageOutput,
    orientation is handled using Exif tags.
*/
	public var  AVCaptureVideoOrientation videoOrientation;

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

/*!
 	public var  supportsVideoFieldMode
 @abstract
    Indicates whether the connection supports setting the videoFieldMode property.
 
 @discussion
    This property is only applicable to AVCaptureConnection instances involving
    video.  In such connections, the videoFieldMode property may only be set if
    -isVideoFieldModeSupported returns YES.
*/
	public var (nonatomic, readonly, getter=isVideoFieldModeSupported) BOOL supportsVideoFieldMode NS_AVAILABLE(10_7, NA);

/*!
 	public var  videoFieldMode
 @abstract
    Indicates how interlaced video flowing through the connection should be treated.
 
 @discussion
    This property is only applicable to AVCaptureConnection instances involving
    video.  If -isVideoFieldModeSupported returns YES, videoFieldMode may be set
    to affect interlaced video content flowing through the connection.
*/
	public var  AVVideoFieldMode videoFieldMode NS_AVAILABLE(10_7, NA);

#endif // (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

/*!
 	public var  supportsVideoMinFrameDuration
 @abstract
    Indicates whether the connection supports setting the videoMinFrameDuration property.
 
 @discussion
    This property is only applicable to AVCaptureConnection instances involving
    video.  In such connections, the videoMinFrameDuration property may only be set if
    -isVideoMinFrameDurationSupported returns YES.
*/
	public var (nonatomic, readonly, getter=isVideoMinFrameDurationSupported) BOOL supportsVideoMinFrameDuration NS_AVAILABLE(10_7, 5_0);

/*!
 	public var  videoMinFrameDuration
 @abstract
    Indicates the minimum time interval at which the receiver should output consecutive video frames.
 
 @discussion
    The value of this property is a CMTime specifying the minimum duration of each video frame output by the receiver,
    placing a lower bound on the amount of time that should separate consecutive frames. This is equivalent to
    the reciprocal of the maximum frame rate. A value of kCMTimeZero or kCMTimeInvalid indicates an unlimited maximum frame
    rate. The default value is kCMTimeInvalid.
*/
	public var  CMTime videoMinFrameDuration NS_AVAILABLE(10_7, 5_0);

#if TARGET_OS_IPHONE

/*!
 	public var  supportsVideoMaxFrameDuration
 @abstract
    Indicates whether the connection supports setting the videoMaxFrameDuration property.
 
 @discussion
    This property is only applicable to AVCaptureConnection instances involving
    video.  In such connections, the videoMaxFrameDuration property may only be set if
    -isVideoMaxFrameDurationSupported returns YES.
*/
	public var (nonatomic, readonly, getter=isVideoMaxFrameDurationSupported) BOOL supportsVideoMaxFrameDuration NS_AVAILABLE(NA, 5_0);

/*!
 	public var  videoMaxFrameDuration
 @abstract
    Indicates the maximum time interval at which the receiver should output consecutive video frames.
 
 @discussion
    The value of this property is a CMTime specifying the maximum duration of each video frame output by the receiver,
    placing an upper bound on the amount of time that should separate consecutive frames. This is equivalent to
    the reciprocal of the minimum frame rate. A value of kCMTimeZero or kCMTimeInvalid indicates an unlimited minimum frame
    rate. The default value is kCMTimeInvalid.
*/
	public var  CMTime videoMaxFrameDuration NS_AVAILABLE(NA, 5_0);

#endif // TARGET_OS_IPHONE

/*!
 	public var  videoMaxScaleAndCropFactor
 @abstract
    Indicates the maximum video scale and crop factor supported by the receiver.
 
 @discussion
    This property is only applicable to AVCaptureConnection instances involving
    video.  In such connections, the videoMaxScaleAndCropFactor property specifies
    the maximum Float value that may be used when setting the videoScaleAndCropFactor
    property.
*/
	public var (default, null) Float videoMaxScaleAndCropFactor NS_AVAILABLE_IOS(5_0);

/*!
 	public var  videoScaleAndCropFactor
 @abstract
    Indicates the current video scale and crop factor in use by the receiver.
 
 @discussion
    This property is only applicable to AVCaptureConnection instances involving
    video.  In such connections, the videoScaleAndCropFactor property may be set
    to a value in the range of 1.0 to videoMaxScaleAndCropFactor.  At a factor of
    1.0, the image is its original size.  At a factor greater than 1.0, the image
    is scaled by the factor and center-cropped to its original dimensions.
*/
	public var  Float videoScaleAndCropFactor NS_AVAILABLE_IOS(5_0);

/*!
 	public var  supportsVideoStabilization
 @abstract
    Indicates whether the connection supports video stabilization.
 
 @discussion
    This property is only applicable to AVCaptureConnection instances involving video.
    In such connections, the -enablesVideoStabilizationWhenAvailable property may only be set if
    -supportsVideoStabilization returns YES.
*/
	public var (nonatomic, readonly, getter=isVideoStabilizationSupported) BOOL supportsVideoStabilization NS_AVAILABLE_IOS(6_0);

/*!
 	public var  videoStabilizationEnabled
 @abstract
    Indicates whether stabilization is currently being applied to video flowing through the receiver.
 
 @discussion
    This property is only applicable to AVCaptureConnection instances involving video.
    On devices where the video stabilization feature is supported, only a subset of available source 
    formats and resolutions may be available for stabilization.  The videoStabilizationEnabled 
    property returns YES if video stabilization is currently in use.  This property is key-value
    observable.
*/
	public var (nonatomic, readonly, getter=isVideoStabilizationEnabled) BOOL videoStabilizationEnabled NS_AVAILABLE_IOS(6_0);

/*!
 	public var  enablesVideoStabilizationWhenAvailable;
 @abstract
    Indicates whether stabilization should be applied to video flowing through the receiver
    when the feature is available.
 
 @discussion
    This property is only applicable to AVCaptureConnection instances involving video.
    On devices where the video stabilization feature is supported, only a subset of available source 
    formats and resolutions may be available for stabilization.  By setting the
    enablesVideoStabilizationWhenAvailable property to YES, video flowing through the receiver
    is stabilized when available.  Enabling video stabilization may introduce additional latency 
    into the video capture pipeline.  Clients may key-value observe the videoStabilizationEnabled
    property to know when stabilization is in use or not.  The default value is NO.
    For apps linked before iOS 6.0, the default value is YES for a video connection attached to an 
    AVCaptureMovieFileOutput instance.  For apps linked on or after iOS 6.0, the default value is
    always NO.
*/
	public var  BOOL enablesVideoStabilizationWhenAvailable NS_AVAILABLE_IOS(6_0);

}



@class AVCaptureAudioChannelInternal;

/*!
 @class AVCaptureAudioChannel
 @abstract
    AVCaptureAudioChannel represents a single channel of audio flowing through 
    an AVCaptureSession.
 
 @discussion
    An AVCaptureConnection from an input producing audio to an output receiving audio
    exposes an array of AVCaptureAudioChannel objects, one for each channel of audio
    available.  Iterating through these audio channel objects, a client may poll
    for audio levels. Instances of AVCaptureAudioChannel cannot be created directly.
*/
NS_CLASS_AVAILABLE(10_7, 4_0)
extern class AVCaptureAudioChannel extends NSObject
{
@private
	AVCaptureAudioChannelInternal *_internal;
}

/*!
 	public var  averagePowerLevel
 @abstract
    A measurement of the instantaneous average power level of the audio
    flowing through the receiver.

 @discussion
    A client may poll an AVCaptureAudioChannel object for its current
    averagePowerLevel to get its instantaneous average power level in decibels.
    This property is not key-value observable.
*/
	public var (default, null) float averagePowerLevel;

/*!
 	public var  peakHoldLevel
 @abstract
    A measurement of the peak/hold level of the audio flowing through the receiver.

 @discussion
    A client may poll an AVCaptureAudioChannel object for its current
    peakHoldLevel to get its most recent peak hold level in decibels.
    This property is not key-value observable.
*/
	public var (default, null) float peakHoldLevel;

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

/*!
 	public var  volume
 @abstract
    A property indicating the current volume (gain) of the receiver.

 @discussion
    The volume property indicates the current volume or gain of the receiver as a floating
    point value between 0.0 -> 1.0.  If you desire to boost the gain in software, you
    may specify a a value greater than 1.0.
*/
	public var  float volume NS_AVAILABLE(10_7, NA);

/*!
 	public var  enabled
 @abstract
    A property indicating whether the receiver is currently enabled for data capture.

 @discussion
    By default, all AVCaptureAudioChannel objects exposed by a connection are enabled.
    You may set enabled to NO to stop the flow of data for a particular AVCaptureAudioChannel.
*/
	public var (nonatomic, getter=isEnabled) BOOL enabled NS_AVAILABLE(10_7, NA);

#endif // (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

}
