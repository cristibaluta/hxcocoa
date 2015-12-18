/*
	File:  AVCaptureDevice.h
 
	Framework:  AVFoundation
 
	Copyright 2010-2012 Apple Inc. All rights reserved.
*/

#import <AVFoundation/AVBase.h>
#import <Foundation/Foundation.h>
#import <CoreMedia/CMFormatDescription.h>
#if (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE || TARGET_OS_WIN32)
	#include <CoreGraphics/CGBase.h>
	#include <CoreGraphics/CGGeometry.h>
#elif TARGET_OS_MAC
	#include <ApplicationServices/../Frameworks/CoreGraphics.framework/Headers/CGBase.h>
	#include <ApplicationServices/../Frameworks/CoreGraphics.framework/Headers/CGGeometry.h>
#endif

/*!
 @constant AVCaptureDeviceWasConnectedNotification
 @abstract
    Posted when a device becomes available on the system.

 @discussion
    The notification object is an AVCaptureDevice instance representing the device that became available.
*/
AVF_EXPORT NSString *const AVCaptureDeviceWasConnectedNotification NS_AVAILABLE(10_7, 4_0);

/*!
 @constant AVCaptureDeviceWasDisconnectedNotification
 @abstract
    Posted when a device becomes unavailable on the system.

 @discussion
    The notification object is an AVCaptureDevice instance representing the device that became unavailable.
*/
AVF_EXPORT NSString *const AVCaptureDeviceWasDisconnectedNotification NS_AVAILABLE(10_7, 4_0);

/*!
 @constant  AVCaptureDeviceSubjectAreaDidChangeNotification
 @abstract
	Posted when the instance of AVCaptureDevice has detected a substantial change
	to the video subject area.
 
 @discussion
	Clients may observe the AVCaptureDeviceSubjectAreaDidChangeNotification to know
	when an instance of AVCaptureDevice has detected a substantial change
	to the video subject area.  This notification is only sent if you first set
	subjectAreaChangeMonitoringEnabled to YES.
 */
AVF_EXPORT NSString *const AVCaptureDeviceSubjectAreaDidChangeNotification NS_AVAILABLE_IOS(5_0);

#if TARGET_OS_MAC && ! (TARGET_OS_EMBEDDED || TARGET_OS_IPHONE || TARGET_OS_WIN32)
@class AVCaptureDeviceFormat;
@class AVCaptureDeviceInputSource;
#endif
@class AVCaptureDeviceInternal;

/*!
 @class AVCaptureDevice
 @abstract
    An AVCaptureDevice represents a physical device that provides realtime input media data, such as video and audio.

 @discussion
    Each instance of AVCaptureDevice corresponds to a device, such as a camera or microphone. Instances of
    AVCaptureDevice cannot be created directly. An array of all currently available devices can also be obtained using
    the devices class method. Devices can provide one or more streams of a given media type. Applications can search
    for devices that provide media of a specific type using the devicesWithMediaType: and defaultDeviceWithMediaType:
    class methods.

    Instances of AVCaptureDevice can be used to provide media data to an AVCaptureSession by creating an
    AVCaptureDeviceInput with the device and adding that to the capture session.
*/
NS_CLASS_AVAILABLE(10_7, 4_0)
extern class AVCaptureDevice extends NSObject
{
    AVCaptureDeviceInternal *_internal;
}

/*!
 @method devices
 @abstract
    Returns an array of devices currently available for use as media input sources.
 
 @result
    An NSArray of AVCaptureDevice instances for each available device.

 @discussion
    This method returns an array of AVCaptureDevice instances for input devices currently connected and available for
    capture. The returned array contains all devices that are available at the time the method is called. Applications
    should observe AVCaptureDeviceWasConnectedNotification and AVCaptureDeviceWasDisconnectedNotification to be notified
    when the list of available devices has changed.
*/
+ (NSArray *)devices;

/*!
 @method devicesWithMediaType:
 @abstract
    Returns an array of devices currently available for use as sources of media with the given media type.

 @param mediaType
    The media type, such as AVMediaTypeVideo, AVMediaTypeAudio, or AVMediaTypeMuxed, supported by each returned device.
 @result
    An NSArray of AVCaptureDevice instances for each available device.

 @discussion
    This method returns an array of AVCaptureDevice instances for input devices currently connected and available for
    capture that provide media of the given type. Media type constants are defined in AVMediaFormat.h. The returned
    array contains all devices that are available at the time the method is called. Applications should observe
    AVCaptureDeviceWasConnectedNotification and AVCaptureDeviceWasDisconnectedNotification to be notified when the list
    of available devices has changed.
*/
+ (NSArray *)devicesWithMediaType:(NSString *)mediaType;

/*!
 @method defaultDeviceWithMediaType:
 @abstract
    Returns an AVCaptureDevice instance for the default device of the given media type.

 @param mediaType
    The media type, such as AVMediaTypeVideo, AVMediaTypeAudio, or AVMediaTypeMuxed, supported by the returned device.
 @result
    The default device with the given media type, or nil if no device with that media type exists.

 @discussion
    This method returns the default device of the given media type currently available on the system. For example, for
    AVMediaTypeVideo, this method will return the built in camera that is primarily used for capture and recording.
    Media type constants are defined in AVMediaFormat.h.
*/
+ (AVCaptureDevice *)defaultDeviceWithMediaType:(NSString *)mediaType;

/*!
 @method deviceWithUniqueID:
 @abstract
    Returns an AVCaptureDevice instance with the given unique ID.

 @param deviceUniqueID
    The unique ID of the device instance to be returned.
 @result
    An AVCaptureDevice instance with the given unique ID, or nil if no device with that unique ID is available.

 @discussion
    Every available capture device has a unique ID that persists on one system across device connections and
    disconnections, application restarts, and reboots of the system itself. This method can be used to recall or track
    the status of a specific device whose unique ID has previously been saved.
*/
+ (AVCaptureDevice *)deviceWithUniqueID:(NSString *)deviceUniqueID;

/*!
 	public var  uniqueID
 @abstract
    An ID unique to the model of device corresponding to the receiver.

 @discussion
    Every available capture device has a unique ID that persists on one system across device connections and
    disconnections, application restarts, and reboots of the system itself. Applications can store the value returned by
    this property to recall or track the status of a specific device in the future.
*/
	public var (default, null) NSString *uniqueID;

/*!
 	public var  modelID
 @abstract
    The model ID of the receiver.

 @discussion
    The value of this property is an identifier unique to all devices of the same model. The value is persistent across
    device connections and disconnections, and across different systems. For example, the model ID of the camera built
    in to two identical iPhone models will be the same even though they are different physical devices.
*/
	public var (default, null) NSString *modelID;

/*!
 	public var  localizedName
 @abstract
    A localized human-readable name for the receiver.
 
 @discussion
    This property can be used for displaying the name of a capture device in a user interface.
*/
	public var (default, null) NSString *localizedName;

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

/*!
 	public var  transportType
 @abstract
    The transport type of the receiver (e.g. USB, PCI, etc).

 @discussion
    This property can be used to discover the transport type of a capture device.  Transport types
    are defined in <IOKit/audio/IOAudioTypes.h> as kIOAudioDeviceTransportType*.
*/
	public var (default, null) int32_t transportType NS_AVAILABLE(10_7, NA);

#endif // (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

/*!
 @method hasMediaType:
 @abstract
    Returns whether the receiver provides media with the given media type.

 @param mediaType
    A media type, such as AVMediaTypeVideo, AVMediaTypeAudio, or AVMediaTypeMuxed.
 @result
    YES if the device outputs the given media type, NO otherwise.
 
 @discussion
    Media type constants are defined in AVMediaFormat.h.
*/
- (BOOL)hasMediaType:(NSString *)mediaType;


/*!
 @method lockForConfiguration:
 @abstract
    Requests exclusive access to configure device hardware properties.

 @param outError
    On return, if the device could not be locked, points to an NSError describing why the failure occurred.
 @result
    A BOOL indicating whether the device was successfully locked for configuration.

 @discussion
    In order to set hardware properties on an AVCaptureDevice, such as focusMode and exposureMode, clients must first
    acquire a lock on the device.  Clients should only hold the device lock if they require settable device properties
    to remain unchanged.  Holding the device lock unnecessarily may degrade capture quality in other applications
    sharing the device.
*/
- (BOOL)lockForConfiguration:(NSError **)outError;

/*!
 @method unlockForConfiguration
 @abstract
    Release exclusive control over device hardware properties.

 @discussion
    This method should be called to match an invocation of lockForConfiguration: when an application no longer needs to
    keep device hardware properties from changing automatically.
*/
- (void)unlockForConfiguration;

/*!
 @method supportsAVCaptureSessionPreset:
 @abstract
    Returns whether the receiver can be used in an AVCaptureSession configured with the given preset.

 @param preset
    An AVCaptureSession preset.
 @result
    YES if the receiver can be used with the given preset, NO otherwise.

 @discussion
    An AVCaptureSession instance can be associated with a preset that configures its inputs and outputs to fulfill common
    use cases. This method can be used to determine if the receiver can be used in a capture session with the given
    preset. Presets are defined in AVCaptureSession.h.
*/
- (BOOL)supportsAVCaptureSessionPreset:(NSString *)preset;

/*!
 	public var  connected
 @abstract
    Indicates whether the device is connected and available to the system.

 @discussion
    The value of this property is a BOOL indicating whether the device represented by the receiver is connected and
    available for use as a capture device. Clients can key value observe the value of this property to be notified when
    a device is no longer available. When the value of this property becomes NO for a given instance, it will not become
    YES again. If the same physical device again becomes available to the system, it will be represented using a new
    instance of AVCaptureDevice.
*/
	public var (nonatomic, readonly, getter=isConnected) BOOL connected;

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

/*!
 	public var  inUseByAnotherApplication
 @abstract
    Indicates whether the device is in use by another application.

 @discussion
    The value of this property is a BOOL indicating whether the device represented by the receiver is
    in use by another application. Clients can key value observe the value of this property to be notified when
    another app starts or stops using this device.
*/
	public var (nonatomic, readonly, getter=isInUseByAnotherApplication) BOOL inUseByAnotherApplication NS_AVAILABLE(10_7, NA);

/*!
 	public var  suspended
 @abstract
    Indicates whether the device is suspended.

 @discussion
    The value of this property is a BOOL indicating whether the device represented by the receiver is
    currently suspended.  Some devices disallow data capture due to a feature on the device.
    For example, isSuspended returns YES for theexternal iSight when its privacy iris is closed, or 
    for the internal iSight on a notebook when the notebook's display is closed.  Clients can key value 
    observe the value of this property to be notified when the device becomes suspended or unsuspended.
*/
	public var (nonatomic, readonly, getter=isSuspended) BOOL suspended NS_AVAILABLE(10_7, NA);

/*!
 	public var  linkedDevices
 @abstract
    An array of AVCaptureDevice objects physically linked to the receiver.

 @discussion
    The value of this property is an array of AVCaptureDevice objects that are a part of the same physical 
    device as the receiver.  For example, for theexternal iSight camera, linkedDevices returns an array 
    containing an AVCaptureDevice for theexternal iSight microphone.
*/
	public var (default, null) NSArray *linkedDevices NS_AVAILABLE(10_7, NA);

/*!
 	public var  formats
 @abstract
    An array of AVCaptureDeviceFormat objects supported by the receiver.

 @discussion
    This property can be used to enumerate the formats natively supported by the receiver.  The
    capture device's activeFormat property may be set to one of the formats in this array.  Clients 
    can observe automatic changes to the receiver's formats by key value observing this property.
*/
	public var (default, null) NSArray *formats NS_AVAILABLE(10_7, NA);

/*!
 	public var  activeFormat
 @abstract
    The currently active format of the receiver.

 @discussion
    This property can be used to get or set the currently active device format.
    -setActiveFormat: throws an NSInvalidArgumentException if set to a format not present in the formats
    array.  -setActiveFormat: throws an NSGenericException if called without first obtaining exclusive
    access to the receiver using lockForConfiguration:.  Clients can observe automatic changes to the 
    receiver's activeFormat by key value observing this property.
*/
	public var  AVCaptureDeviceFormat *activeFormat NS_AVAILABLE(10_7, NA);

/*!
 	public var  activeVideoMinFrameDuration
 @abstract
    A property indicating the receiver's current active minimum frame duration (the reciprocal of its max frame rate).

 @discussion
    An AVCaptureDevice's activeVideoMinFrameDuration property is the reciprocal of its active
    maximum frame rate.  To limit the max frame rate of the capture device, clients may
    set this property to a value supported by the receiver's activeFormat (see AVCaptureDeviceFormat's 
    videoSupportedFrameRateRanges property).  -setActiveVideoMinFrameDuration: throws an NSInvalidArgumentException
    if set to an unsupported value.  -setActiveVideoMinFrameDuration: throws an NSGenericException 
    if called without first obtaining exclusive access to the receiver using lockForConfiguration:.
    Clients can observe automatic changes to the receiver's activeVideoMinFrameDuration by key value 
    observing this property.
*/
	public var  CMTime activeVideoMinFrameDuration NS_AVAILABLE(10_7, NA);

/*!
 	public var  inputSources
 @abstract
    An array of AVCaptureDeviceInputSource objects supported by the receiver.
 
 @discussion
    Some devices can capture data from one of multiple data sources (different input jacks on the same 
    audio device, for example).  For devices with multiple possible data sources, inputSources can be 
    used to enumerate the possible choices. Clients can observe automatic changes to the receiver's 
    inputSources by key value observing this property.
*/
	public var (default, null) NSArray *inputSources NS_AVAILABLE(10_7, NA);

/*!
 	public var  activeInputSource
 @abstract
    The currently active input source of the receiver.

 @discussion
    This property can be used to get or set the currently active device input source.
    -setActiveInputSource: throws an NSInvalidArgumentException if set to a value not present in the
    inputSources array.  -setActiveInputSource: throws an NSGenericException if called without first 
    obtaining exclusive access to the receiver using lockForConfiguration:.  Clients can observe automatic  
    changes to the receiver's activeInputSource by key value observing this property.
*/
	public var  AVCaptureDeviceInputSource *activeInputSource NS_AVAILABLE(10_7, NA);

#endif // (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

}


/*!
 @enum AVCaptureDevicePosition
 @abstract
    Constants indicating the physical position of an AVCaptureDevice's hardware on the system.

 @constant AVCaptureDevicePositionUnspecified
    Indicates that the device's position relative to the system hardware is unspecified.
 @constant AVCaptureDevicePositionBack
    Indicates that the device is physically located on the back of the system hardware.
 @constant AVCaptureDevicePositionFront
    Indicates that the device is physically located on the front of the system hardware.
*/
enum {
	AVCaptureDevicePositionUnspecified         = 0,
	AVCaptureDevicePositionBack                = 1,
	AVCaptureDevicePositionFront               = 2
};
typedef NSInteger AVCaptureDevicePosition;

extern class AVCaptureDevice (AVCaptureDevicePosition)

/*!
 	public var  position
 @abstract
    Indicates the physical position of an AVCaptureDevice's hardware on the system.

 @discussion
    The value of this property is an AVCaptureDevicePosition indicating where the receiver's device is physically
    located on the system hardware.
*/
	public var (default, null) AVCaptureDevicePosition position;

}

/*!
 @enum AVCaptureFlashMode
 @abstract
    Constants indicating the mode of the flash on the receiver's device, if it has one.

 @constant AVCaptureFlashModeOff
    Indicates that the flash should always be off.
 @constant AVCaptureFlashModeOn
    Indicates that the flash should always be on.
 @constant AVCaptureFlashModeAuto
    Indicates that the flash should be used automatically depending on ambient light conditions.
*/
enum {
	AVCaptureFlashModeOff  = 0,
	AVCaptureFlashModeOn   = 1,
	AVCaptureFlashModeAuto = 2
};
typedef NSInteger AVCaptureFlashMode;

extern class AVCaptureDevice (AVCaptureDeviceFlash)

/*!
 	public var  hasFlash
 @abstract
    Indicates whether the receiver has a flash.

 @discussion
    The value of this property is a BOOL indicating whether the receiver has a flash. The receiver's flashMode property
    can only be set when this property returns YES.
*/
	public var (default, null) BOOL hasFlash;

/*!
 	public var  flashAvailable
 @abstract
    Indicates whether the receiver's flash is currently available for use.
 
 @discussion
    The value of this property is a BOOL indicating whether the receiver's flash is 
    currently available. The flash may become unavailable if, for example, the device
    overheats and needs to cool off. This property is key-value observable.
*/
	public var (nonatomic, readonly, getter=isFlashAvailable) BOOL flashAvailable NS_AVAILABLE_IOS(5_0);

/*!
 	public var  flashActive
 @abstract
    Indicates whether the receiver's flash is currently active.
 
 @discussion
    The value of this property is a BOOL indicating whether the receiver's flash is 
    currently active. When the flash is active, it will flash if a still image is
    captured. This property is key-value observable.
*/
	public var (nonatomic, readonly, getter=isFlashActive) BOOL flashActive NS_AVAILABLE_IOS(5_0);

/*!
 @method isFlashModeSupported:
 @abstract
    Returns whether the receiver supports the given flash mode.

 @param flashMode
    An AVCaptureFlashMode to be checked.
 @result
    YES if the receiver supports the given flash mode, NO otherwise.

 @discussion
    The receiver's flashMode property can only be set to a certain mode if this method returns YES for that mode.
*/
- (BOOL)isFlashModeSupported:(AVCaptureFlashMode)flashMode;

/*!
 	public var  flashMode
 @abstract
    Indicates current mode of the receiver's flash, if it has one.

 @discussion
    The value of this property is an AVCaptureFlashMode that determines the mode of the 
    receiver's flash, if it has one.  -setFlashMode: throws an NSInvalidArgumentException
    if set to an unsupported value (see -isFlashModeSupported:).  -setFlashMode: throws an NSGenericException 
    if called without first obtaining exclusive access to the receiver using lockForConfiguration:.
    Clients can observe automatic changes to the receiver's flashMode by key value observing this property.
*/
	public var  AVCaptureFlashMode flashMode;

}

/*!
 @enum AVCaptureTorchMode
 @abstract
    Constants indicating the mode of the torch on the receiver's device, if it has one.

 @constant AVCaptureTorchModeOff
    Indicates that the torch should always be off.
 @constant AVCaptureTorchModeOn
    Indicates that the torch should always be on.
 @constant AVCaptureTorchModeAuto
    Indicates that the torch should be used automatically depending on ambient light conditions.
*/
enum {
	AVCaptureTorchModeOff  = 0,
	AVCaptureTorchModeOn   = 1,
	AVCaptureTorchModeAuto = 2,
};
typedef NSInteger AVCaptureTorchMode;

/*!
  @constant AVCaptureMaxAvailableTorchLevel
    A special value that may be passed to -setTorchModeWithLevel:error: to set the torch to the
    maximum level currently available. Under thermal duress, the maximum available torch level
    may be less than 1.0.
*/
extern const float AVCaptureMaxAvailableTorchLevel;

extern class AVCaptureDevice (AVCaptureDeviceTorch)

/*!
 	public var  hasTorch
 @abstract
    Indicates whether the receiver has a torch.

 @discussion
    The value of this property is a BOOL indicating whether the receiver has a torch. The receiver's torchMode property
    can only be set when this property returns YES.
*/
	public var (default, null) BOOL hasTorch;

/*!
 	public var  torchAvailable
 @abstract
    Indicates whether the receiver's torch is currently available for use.
 
 @discussion
    The value of this property is a BOOL indicating whether the receiver's torch is 
    currently available. The torch may become unavailable if, for example, the device
    overheats and needs to cool off. This property is key-value observable.
*/
	public var (nonatomic, readonly, getter=isTorchAvailable) BOOL torchAvailable NS_AVAILABLE_IOS(5_0);

/*!
 	public var  torchActive
 @abstract
    Indicates whether the receiver's torch is currently active.
 
 @discussion
    The value of this property is a BOOL indicating whether the receiver's torch is 
    currently active. If the current torchMode is AVCaptureTorchModeAuto and isTorchActive
    is YES, the torch will illuminate once a recording starts (see AVCaptureOutput.h 
    -startRecordingToOutputFileURL:recordingDelegate:). This property is key-value observable.
*/
	public var (nonatomic, readonly, getter=isTorchActive) BOOL torchActive NS_AVAILABLE_IOS(6_0);

/*!
 	public var  torchLevel
 @abstract
    Indicates the receiver's current torch brightness level as a floating point value.

 @discussion
    The value of this property is a float indicating the receiver's torch level 
    from 0.0 (off) -> 1.0 (full). This property is key-value observable.
*/
	public var (default, null) float torchLevel NS_AVAILABLE_IOS(5_0);

/*!
 @method isTorchModeSupported:
 @abstract
    Returns whether the receiver supports the given torch mode.

 @param torchMode
    An AVCaptureTorchMode to be checked.
 @result
    YES if the receiver supports the given torch mode, NO otherwise.

 @discussion
    The receiver's torchMode property can only be set to a certain mode if this method returns YES for that mode.
*/
- (BOOL)isTorchModeSupported:(AVCaptureTorchMode)torchMode;

/*!
 	public var  torchMode
 @abstract
    Indicates current mode of the receiver's torch, if it has one.

 @discussion
    The value of this property is an AVCaptureTorchMode that determines the mode of the 
    receiver's torch, if it has one.  -setTorchMode: throws an NSInvalidArgumentException
    if set to an unsupported value (see -isTorchModeSupported:).  -setTorchMode: throws an NSGenericException 
    if called without first obtaining exclusive access to the receiver using lockForConfiguration:.
    Clients can observe automatic changes to the receiver's torchMode by key value observing this property.
*/
	public var  AVCaptureTorchMode torchMode;

/*!
 	public var  setTorchModeOnWithLevel:error:
 @abstract
    Sets the current mode of the receiver's torch to AVCaptureTorchModeOn at the specified level.

 @discussion
    This method sets the torch mode to AVCaptureTorchModeOn at a specified level.  torchLevel must be 
    a value between 0 and 1, or the special value AVCaptureMaxAvailableTorchLevel.  The specified value
    may not be available if the iOS device is too hot. This method throws an NSInvalidArgumentException
    if set to an unsupported level. If the specified level is valid, but unavailable, the method returns
    NO with AVErrorTorchLevelUnavailable.  -setTorchModeOnWithLevel:error: throws an NSGenericException 
    if called without first obtaining exclusive access to the receiver using lockForConfiguration:.
    Clients can observe automatic changes to the receiver's torchMode by key value observing the torchMode 
    property.
*/
- (BOOL)setTorchModeOnWithLevel:(float)torchLevel error:(NSError **)outError NS_AVAILABLE_IOS(6_0);

}

/*!
 @enum AVCaptureFocusMode
 @abstract
    Constants indicating the mode of the focus on the receiver's device, if it has one.

 @constant AVCaptureFocusModeLocked
    Indicates that the focus should be locked at the lens' current position.
 @constant AVCaptureFocusModeAutoFocus
    Indicates that the device should autofocus once and then change the focus mode to AVCaptureFocusModeLocked.
 @constant AVCaptureFocusModeContinuousAutoFocus
    Indicates that the device should automatically focus when needed.
*/
enum {
	AVCaptureFocusModeLocked              = 0,
	AVCaptureFocusModeAutoFocus           = 1,
	AVCaptureFocusModeContinuousAutoFocus = 2,
};
typedef NSInteger AVCaptureFocusMode;

extern class AVCaptureDevice (AVCaptureDeviceFocus)

/*!
 @method isFocusModeSupported:
 @abstract
    Returns whether the receiver supports the given focus mode.

 @param focusMode
    An AVCaptureFocusMode to be checked.
 @result
    YES if the receiver supports the given focus mode, NO otherwise.

 @discussion
    The receiver's focusMode property can only be set to a certain mode if this method returns YES for that mode.
*/
- (BOOL)isFocusModeSupported:(AVCaptureFocusMode)focusMode;

/*!
 	public var  focusMode
 @abstract
    Indicates current focus mode of the receiver, if it has one.

 @discussion
    The value of this property is an AVCaptureFocusMode that determines the receiver's focus mode, if it has one.
    -setFocusMode: throws an NSInvalidArgumentException if set to an unsupported value (see -isFocusModeSupported:).  
    -setFocusMode: throws an NSGenericException if called without first obtaining exclusive access to the receiver 
    using lockForConfiguration:.  Clients can observe automatic changes to the receiver's focusMode by key value 
    observing this property.
*/
	public var  AVCaptureFocusMode focusMode;

/*!
 	public var  focusPointOfInterestSupported
 @abstract
    Indicates whether the receiver supports focus points of interest.

 @discussion
    The receiver's focusPointOfInterest property can only be set if this property returns YES.
*/
	public var (nonatomic, readonly, getter=isFocusPointOfInterestSupported) BOOL focusPointOfInterestSupported;

/*!
 	public var  focusPointOfInterest
 @abstract
    Indicates current focus point of interest of the receiver, if it has one.

 @discussion
    The value of this property is a CGPoint that determines the receiver's focus point of interest, if it has one. A
    value of (0,0) indicates that the camera should focus on the top left corner of the image, while a value of (1,1)
    indicates that it should focus on the bottom right. The default value is (0.5,0.5).  -setFocusPointOfInterest:
    throws an NSInvalidArgumentException if isFocusPointOfInterestSupported returns NO.  -setFocusPointOfInterest: throws 
    an NSGenericException if called without first obtaining exclusive access to the receiver using lockForConfiguration:.  
    Clients can observe automatic changes to the receiver's focusMode by key value observing this property.  Note that
    setting focusPointOfInterest alone does not initiate a focus operation.  After setting focusPointOfInterest, call
    -setFocusMode: to apply the new point of interest.
*/
	public var  CGPoint focusPointOfInterest;

/*!
 	public var  adjustingFocus
 @abstract
    Indicates whether the receiver is currently adjusting camera focus.

 @discussion
    The value of this property is a BOOL indicating whether the receiver's camera focus is being automatically
    adjusted because its focus mode is AVCaptureFocusModeAutoFocus or AVCaptureFocusModeContinuousAutoFocus. Clients can
    observe the value of this property to determine whether the camera focus is stable or is being automatically
    adjusted.
*/
	public var (nonatomic, readonly, getter=isAdjustingFocus) BOOL adjustingFocus;

}

/*!
 @enum AVCaptureExposureMode
 @abstract
    Constants indicating the mode of the exposure on the receiver's device, if it has adjustable exposure.

 @constant AVCaptureExposureModeLocked
    Indicates that the exposure should be locked at its current value.
 @constant AVCaptureExposureModeAutoExpose
    Indicates that the device should automatically adjust exposure once and then change the exposure mode to 
    AVCaptureExposureModeLocked.
 @constant AVCaptureExposureModeContinuousAutoExposure
    Indicates that the device should automatically adjust exposure when needed.
*/
enum {
	AVCaptureExposureModeLocked					= 0,
	AVCaptureExposureModeAutoExpose				= 1,
	AVCaptureExposureModeContinuousAutoExposure	= 2,
};
typedef NSInteger AVCaptureExposureMode;

extern class AVCaptureDevice (AVCaptureDeviceExposure)

/*!
 @method isExposureModeSupported:
 @abstract
    Returns whether the receiver supports the given exposure mode.

 @param exposureMode
    An AVCaptureExposureMode to be checked.
 @result
    YES if the receiver supports the given exposure mode, NO otherwise.

 @discussion
    The receiver's exposureMode property can only be set to a certain mode if this method returns YES for that mode.
*/
- (BOOL)isExposureModeSupported:(AVCaptureExposureMode)exposureMode;

/*!
 	public var  exposureMode
 @abstract
    Indicates current exposure mode of the receiver, if it has adjustable exposure.

 @discussion
    The value of this property is an AVCaptureExposureMode that determines the receiver's exposure mode, if it has
    adjustable exposure.  -setExposureMode: throws an NSInvalidArgumentException if set to an unsupported value 
    (see -isExposureModeSupported:).  -setExposureMode: throws an NSGenericException if called without first obtaining 
    exclusive access to the receiver using lockForConfiguration:.  Clients can observe automatic changes to the receiver's 
    exposureMode by key value observing this property.
*/
	public var  AVCaptureExposureMode exposureMode;

/*!
 	public var  exposurePointOfInterestSupported:
 @abstract
    Indicates whether the receiver supports exposure points of interest.
 
 @discussion
    The receiver's exposurePointOfInterest property can only be set if this property returns YES.
*/
	public var (nonatomic, readonly, getter=isExposurePointOfInterestSupported) BOOL exposurePointOfInterestSupported;

/*!
 	public var  exposurePointOfInterest
 @abstract
    Indicates current exposure point of interest of the receiver, if it has one.

 @discussion
    The value of this property is a CGPoint that determines the receiver's exposure point of interest, if it has
    adjustable exposure. A value of (0,0) indicates that the camera should adjust exposure based on the top left
    corner of the image, while a value of (1,1) indicates that it should adjust exposure based on the bottom right corner. The
    default value is (0.5,0.5). -setExposurePointOfInterest: throws an NSInvalidArgumentException if isExposurePointOfInterestSupported 
    returns NO.  -setExposurePointOfInterest: throws an NSGenericException if called without first obtaining exclusive access 
    to the receiver using lockForConfiguration:.  Clients can observe automatic changes to the receiver's exposureMode 
    by key value observing this property.  Note that setting exposurePointOfInterest alone does not initiate an exposure 
    operation.  After setting exposurePointOfInterest, call -setExposureMode: to apply the new point of interest.
*/
	public var  CGPoint exposurePointOfInterest;

/*!
 	public var  adjustingExposure
 @abstract
    Indicates whether the receiver is currently adjusting camera exposure.

 @discussion
    The value of this property is a BOOL indicating whether the receiver's camera exposure is being automatically
    adjusted because its exposure mode is AVCaptureExposureModeAutoExpose or AVCaptureExposureModeContinuousAutoExposure.
    Clients can observe the value of this property to determine whether the camera exposure is stable or is being
    automatically adjusted.
*/
	public var (nonatomic, readonly, getter=isAdjustingExposure) BOOL adjustingExposure;

}

/*!
 @enum AVCaptureWhiteBalanceMode
 @abstract
    Constants indicating the mode of the white balance on the receiver's device, if it has adjustable white balance.

 @constant AVCaptureWhiteBalanceModeLocked
    Indicates that the white balance should be locked at its current value.
 @constant AVCaptureWhiteBalanceModeAutoWhiteBalance
    Indicates that the device should automatically adjust white balance once and then change the white balance mode to 
    AVCaptureWhiteBalanceModeLocked.
 @constant AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance
    Indicates that the device should automatically adjust white balance when needed.
*/
enum {
	AVCaptureWhiteBalanceModeLocked				        = 0,
	AVCaptureWhiteBalanceModeAutoWhiteBalance	        = 1,
    AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance = 2,
};
typedef NSInteger AVCaptureWhiteBalanceMode;

extern class AVCaptureDevice (AVCaptureDeviceWhiteBalance)

/*!
 @method isWhiteBalanceModeSupported:
 @abstract
    Returns whether the receiver supports the given white balance mode.

 @param whiteBalanceMode
    An AVCaptureWhiteBalanceMode to be checked.
 @result
    YES if the receiver supports the given white balance mode, NO otherwise.

 @discussion
    The receiver's whiteBalanceMode property can only be set to a certain mode if this method returns YES for that mode.
*/
- (BOOL)isWhiteBalanceModeSupported:(AVCaptureWhiteBalanceMode)whiteBalanceMode;

/*!
 	public var  whiteBalanceMode
 @abstract
    Indicates current white balance mode of the receiver, if it has adjustable white balance.

 @discussion
    The value of this property is an AVCaptureWhiteBalanceMode that determines the receiver's white balance mode, if it
    has adjustable white balance. -setWhiteBalanceMode: throws an NSInvalidArgumentException if set to an unsupported value 
    (see -isWhiteBalanceModeSupported:).  -setWhiteBalanceMode: throws an NSGenericException if called without first obtaining 
    exclusive access to the receiver using lockForConfiguration:.  Clients can observe automatic changes to the receiver's 
    whiteBalanceMode by key value observing this property.
*/
	public var  AVCaptureWhiteBalanceMode whiteBalanceMode;

/*!
 	public var  adjustingWhiteBalance
 @abstract
    Indicates whether the receiver is currently adjusting camera white balance.

 @discussion
    The value of this property is a BOOL indicating whether the receiver's camera white balance is being
    automatically adjusted because its white balance mode is AVCaptureWhiteBalanceModeAutoWhiteBalance or
    AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance. Clients can observe the value of this property to determine
    whether the camera white balance is stable or is being automatically adjusted.
*/
	public var (nonatomic, readonly, getter=isAdjustingWhiteBalance) BOOL adjustingWhiteBalance;

}

extern class AVCaptureDevice (AVCaptureDeviceSubjectAreaChangeMonitoring)

/*!
 	public var  subjectAreaChangeMonitoringEnabled
 @abstract
	Indicates whether the receiver should monitor the subject area for changes.
 
 @discussion
	The value of this property is a BOOL indicating whether the receiver should
	monitor the video subject area for changes, such as lighting changes, substantial
	movement, etc.  If subject area change monitoring is enabled, the receiver
	sends an AVCaptureDeviceSubjectAreaDidChangeNotification whenever it detects
	a change to the subject area, at which time an interested client may wish
	to re-focus, adjust exposure, white balance, etc.  The receiver must be locked 
	for configuration using lockForConfiguration: before clients can set
	the value of this property.
*/
	public var (nonatomic, getter=isSubjectAreaChangeMonitoringEnabled) BOOL subjectAreaChangeMonitoringEnabled NS_AVAILABLE_IOS(5_0);

}

extern class AVCaptureDevice (AVCaptureDeviceLowLightBoost)

/*!
 	public var  lowLightBoostSupported
 @abstract
    Indicates whether the receiver supports boosting images in low light conditions.
 
 @discussion
    The receiver's automaticallyEnablesLowLightBoostWhenAvailable property can only be set if this property returns YES.
*/
	public var (nonatomic, readonly, getter=isLowLightBoostSupported) BOOL lowLightBoostSupported NS_AVAILABLE_IOS(6_0);

/*!
 	public var  lowLightBoostEnabled
 @abstract
    Indicates whether the receiver's low light boost feature is enabled.
 
 @discussion
    The value of this property is a BOOL indicating whether the receiver is currently enhancing
    images to improve quality due to low light conditions. When -isLowLightBoostEnabled returns
    YES, the receiver has switched into a special mode in which more light can be perceived in images.
    This property is key-value observable.
*/
	public var (nonatomic, readonly, getter=isLowLightBoostEnabled) BOOL lowLightBoostEnabled NS_AVAILABLE_IOS(6_0);

/*!
 	public var  automaticallyEnablesLowLightBoostWhenAvailable
 @abstract
    Indicates whether the receiver should automatically switch to low light boost mode when necessary.
 
 @discussion
    On a receiver where -isLowLightBoostSupported returns YES, a special low light boost mode may be
    engaged to improve image quality. When the automaticallyEnablesLowLightBoostWhenAvailable
    property is set to YES, the receiver switches at its discretion to a special boost mode under
    low light, and back to normal operation when the scene becomes sufficiently lit.  An AVCaptureDevice that
    supports this feature may only engage boost mode for certain source formats or resolutions.
    Clients may observe changes to the lowLightBoostEnabled property to know when the mode has engaged.
    The switch between normal operation and low light boost mode may drop one or more video frames.
    The default value is NO. Setting this property throws an NSInvalidArgumentException if -isLowLightBoostSupported
    returns NO. The receiver must be locked for configuration using lockForConfiguration: before clients
    can set this method, otherwise an NSGenericException is thrown.
*/
	public var  BOOL automaticallyEnablesLowLightBoostWhenAvailable NS_AVAILABLE_IOS(6_0);

}

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

typedef float AVCaptureDeviceTransportControlsSpeed; 

/*!
 @enum AVCaptureDeviceTransportControlsPlaybackMode
 @abstract
    Constants indicating the transport controls' current mode of play back, if it has one.

 @constant AVCaptureDeviceTransportControlsNotPlayingMode
    Indicates that the tape transport is not threaded through the play head.
 @constant AVCaptureDeviceTransportControlsPlayingMode
    Indicates that the tape transport is threaded through the play head.
*/
enum {
	AVCaptureDeviceTransportControlsNotPlayingMode      = 0,
	AVCaptureDeviceTransportControlsPlayingMode         = 1
};
typedef NSInteger AVCaptureDeviceTransportControlsPlaybackMode;

extern class AVCaptureDevice (AVCaptureDeviceTransportControls)

/*!
 	public var  transportControlsSupported
 @abstract
    Returns whether the receiver supports transport control commands.

 @discussion
    For devices with transport controls, such as AVC tape-based camcorders or pro capture devices with
    RS422 deck control, the value of this property is YES.  If transport controls are not supported,
    none of the associated transport control methods and properties are available on the receiver.
*/
	public var (default, null) BOOL transportControlsSupported NS_AVAILABLE(10_7, NA);

/*!
 	public var  transportControlsPlaybackMode
 @abstract
    Returns the receiver's current playback mode.

 @discussion
    For devices that support transport control, this property may be queried to discover the 
    current playback mode.
*/
	public var (default, null) AVCaptureDeviceTransportControlsPlaybackMode transportControlsPlaybackMode NS_AVAILABLE(10_7, NA);

/*!
 	public var  transportControlsSpeed
 @abstract
    Returns the receiver's current playback speed as a floating point value.

 @discussion
    For devices that support transport control, this property may be queried to discover the 
    current playback speed of the deck.
    0.0 -> stopped.
    1.0 -> forward at normal speed.
    -1.0-> reverse at normal speed.
    2.0 -> forward at 2x normal speed.
    etc.
*/
	public var (default, null) AVCaptureDeviceTransportControlsSpeed transportControlsSpeed NS_AVAILABLE(10_7, NA);

/*!
 @method setTransportControlsPlaybackMode:speed:
 @abstract
    sets both the transport controls playback mode and speed in a single method.

 @param mode
    A AVCaptureDeviceTransportControlsPlaybackMode indicating whether the deck should be put into
    play mode.
@param speed
    A AVCaptureDeviceTransportControlsSpeed indicating the speed at which to wind or play the tape.

 @discussion
    A method for setting the receiver's transport controls playback mode and speed.  The receiver must 
    be locked for configuration using lockForConfiguration: before clients can set this method, otherwise
    an NSGenericException is thrown.
*/
- (void)setTransportControlsPlaybackMode:(AVCaptureDeviceTransportControlsPlaybackMode)mode speed:(AVCaptureDeviceTransportControlsSpeed)speed NS_AVAILABLE(10_7, NA);

}

#endif // (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))


#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

@class AVFrameRateRangeInternal;

/*!
 @class AVFrameRateRange
 @abstract
    An AVFrameRateRange expresses a range of valid frame rates as min and max
    rate and min and max duration.

 @discussion
    An AVCaptureDevice exposes an array of formats, and its current activeFormat may be queried.  The
    payload for the formats property is an array of AVCaptureDeviceFormat objects and the activeFormat property
    payload is an AVCaptureDeviceFormat.  AVCaptureDeviceFormat wraps a CMFormatDescription and
    expresses a range of valid video frame rates as an NSArray of AVFrameRateRange objects.
    AVFrameRateRange expresses min and max frame rate as a rate in frames per second and
    duration (CMTime).  An AVFrameRateRange object is immutable.  Its values do not change for the life of the object.
*/
NS_CLASS_AVAILABLE(10_7, NA)
extern class AVFrameRateRange extends NSObject
{
    AVFrameRateRangeInternal *_internal;
}

/*!
 	public var  minFrameRate
 @abstract
    A Float64 indicating the minimum frame rate supported by this range.

 @discussion
    This read-only property indicates the minimum frame rate supported by
    this range in frames per second.
*/
	public var  (default, null) extends Float64 minFrameRate;

/*!
 	public var  maxFrameRate
 @abstract
    A Float64 indicating the maximum frame rate supported by this range.

 @discussion
    This read-only property indicates the maximum frame rate supported by
    this range in frames per second.
*/
	public var  (default, null) extends Float64 maxFrameRate;

/*!
 	public var  maxFrameDuration
 @abstract
    A CMTime indicating the maximum frame duration supported by this range.

 @discussion
    This read-only property indicates the maximum frame duration supported by
    this range.  It is the reciprocal of minFrameRate, and expresses minFrameRate
    as a duration.
*/
	public var  (default, null) extends CMTime maxFrameDuration;

/*!
 	public var  minFrameDuration
 @abstract
    A CMTime indicating the minimum frame duration supported by this range.

 @discussion
    This read-only property indicates the minimum frame duration supported by
    this range.  It is the reciprocal of maxFrameRate, and expresses maxFrameRate
    as a duration.
*/
	public var  (default, null) extends CMTime minFrameDuration;

}

#endif // (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))



#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

@class AVCaptureDeviceFormatInternal;

/*!
 @class AVCaptureDeviceFormat
 @abstract
    An AVCaptureDeviceFormat wraps a CMFormatDescription and other format-related information, such
    as min and max framerate.

 @discussion
    An AVCaptureDevice exposes an array of formats, and its current activeFormat may be queried.  The
    payload for the formats property is an array of AVCaptureDeviceFormat objects and the activeFormat property
    payload is an AVCaptureDeviceFormat.  AVCaptureDeviceFormat is a thin wrapper around a 
    CMFormatDescription, and can carry associated device format information that doesn't go in a
    CMFormatDescription, such as min and max frame rate.  An AVCaptureDeviceFormat object is immutable.
    Its values do not change for the life of the object.
*/
NS_CLASS_AVAILABLE(10_7, NA)
extern class AVCaptureDeviceFormat extends NSObject
{
    AVCaptureDeviceFormatInternal *_internal;
}

/*!
 	public var  mediaType
 @abstract
    An NSString describing the media type of an AVCaptureDevice active or supported format.

 @discussion
    Supported mediaTypes are listed in AVMediaFormat.h.  This is a read-only
    property.  The caller assumes no ownership of the returned value and should not CFRelease it.
*/
	public var (default, null) NSString *mediaType;

/*!
 	public var  formatDescription
 @abstract
    A CMFormatDescription describing an AVCaptureDevice active or supported format.

 @discussion
    A CMFormatDescription describing an AVCaptureDevice active or supported format.  This is a read-only
    property.  The caller assumes no ownership of the returned value and should not CFRelease it.
*/
	public var (default, null) CMFormatDescriptionRef formatDescription;

/*!
 	public var  videoSupportedFrameRateRanges
 @abstract
    A property indicating the format's supported frame rate ranges.

 @discussion
    videoSupportedFrameRateRanges is an array of AVFrameRateRange objects, one for
    each of the format's supported video frame rate ranges.
*/
	public var (default, null) NSArray *videoSupportedFrameRateRanges;

}

#endif // (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))

@class AVCaptureDeviceInputSourceInternal;

/*!
 @class AVCaptureDeviceInputSource
 @abstract
    An AVCaptureDeviceInputSource represents a distinct input source on an AVCaptureDevice object.

 @discussion
    An AVCaptureDevice may optionally present an array of inputSources, representing distinct mutually
    exclusive inputs to the device, for example, an audio AVCaptureDevice might have ADAT optical
    and analog input sources.  A video AVCaptureDevice might have an HDMI input source, or a component 
    input source.
*/
NS_CLASS_AVAILABLE(10_7, NA)
extern class AVCaptureDeviceInputSource extends NSObject
{
    AVCaptureDeviceInputSourceInternal *_internal;
}

/*!
 	public var  inputSourceID
 @abstract
    An ID unique among the inputSources exposed by a given AVCaptureDevice.

 @discussion
    An AVCaptureDevice's inputSources array must contain AVCaptureInputSource objects with unique
    inputSourceIDs.
*/
	public var (default, null) NSString *inputSourceID;

/*!
 	public var  localizedName
 @abstract
    A localized human-readable name for the receiver.

 @discussion
    This property can be used for displaying the name of the capture device input source in a user interface.
*/
	public var (default, null) NSString *localizedName;

}

#endif // (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
