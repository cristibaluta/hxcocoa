/*
	File:  AVAssetWriter.h

	Framework:  AVFoundation
 
	Copyright 2010-2012 Apple Inc. All rights reserved.

*/

#import <AVFoundation/AVBase.h>
#import <Foundation/Foundation.h>
#import <CoreMedia/CMBase.h>
#import <CoreMedia/CMTime.h>
#import <CoreMedia/CMSampleBuffer.h>

@class AVAssetWriterInput;

/*!
 @enum AVAssetWriterStatus
 @abstract
	These constants are returned by the AVAssetWriter status property to indicate whether it can successfully write samples to its output file.

 @constant	 AVAssetWriterStatusUnknown
	Indicates that the status of the asset writer is not currently known.
 @constant	 AVAssetWriterStatusWriting
	Indicates that the asset writer is successfully writing samples to its output file.
 @constant	 AVAssetWriterStatusCompleted
	Indicates that the asset writer has successfully written all samples following a call to finishWriting.
 @constant	 AVAssetWriterStatusFailed
	Indicates that the asset writer can no longer write samples to its output file because of an error. The error is described by the value of the asset writer's error property.
 @constant	 AVAssetWriterStatusCancelled
	Indicates that the asset writer can no longer write samples because writing was canceled with the cancelWriting method.
 */
enum {
	AVAssetWriterStatusUnknown = 0,
	AVAssetWriterStatusWriting,
	AVAssetWriterStatusCompleted,
	AVAssetWriterStatusFailed,
	AVAssetWriterStatusCancelled
};
typedef NSInteger AVAssetWriterStatus;

@class AVAssetWriterInternal;

/*!
 @class AVAssetWriter
 @abstract
	 AVAssetWriter provides services for writing media data to a new file,
 
 @discussion
	Instances of AVAssetWriter can write media to new files in formats such as the QuickTime movie file format or the MPEG-4 file format. AVAssetWriter has support for automatic interleaving of media data for multiple concurrent tracks. Source media data can be obtained from instances of AVAssetReader for one or more assets or from other sources outside of AVFoundation.

	Instances of AVAssetWriter can re-encode media samples as they are written. Instances of AVAssetWriter can also optionally write metadata collections to the output file.
 
	A single instance of AVAssetWriter can be used once to write to a single file. Clients that wish to write to files multiple times must use a new instance of AVAssetWriter each time.
 */
NS_CLASS_AVAILABLE(10_7, 4_1)
extern class AVAssetWriter extends NSObject
{
@private
	AVAssetWriterInternal	*_internal;
}

/*!
 @method assetWriterWithURL:fileType:error:
 @abstract
	Returns an instance of AVAssetWriter configured to write to a file in a specified container format.
 
 @param URL
	The location of the file to be written. The URL must be a file URL.
 @param fileType
	A UTI indicating the format of the file to be written.
 @param outError
	On return, if initialization of the AVAssetWriter fails, points to an NSError describing the nature of the failure.
 @result
	An instance of AVAssetWriter.
 
 @discussion
	Writing will fail if a file already exists at the specified URL.
	
	UTIs for container formats that can be written are declared in AVMediaFormat.h.
 */
+ (AVAssetWriter *)assetWriterWithURL:(NSURL *)outputURL fileType:(NSString *)outputFileType error:(NSError **)outError;

/*!
 @method initWithURL:fileType:error:
 @abstract
	Creates an instance of AVAssetWriter configured to write to a file in a specified container format.
 
 @param URL
	The location of the file to be written. The URL must be a file URL.
 @param fileType
	A UTI indicating the format of the file to be written.
 @param outError
	On return, if initialization of the AVAssetWriter fails, points to an NSError describing the nature of the failure.
 @result
	An instance of AVAssetWriter.
 
 @discussion
	Writing will fail if a file already exists at the specified URL.
	
	UTIs for container formats that can be written are declared in AVMediaFormat.h.
 */
- (id)initWithURL:(NSURL *)outputURL fileType:(NSString *)outputFileType error:(NSError **)outError;

/*!
 	public var  outputURL
 @abstract
	The location of the file for which the instance of AVAssetWriter was initialized for writing.
 @discussion
	You may use UTTypeCopyPreferredTagWithClass(outputFileType, kUTTagClassFilenameExtension) to obtain an appropriate path extension for the outputFileType you have specified. For more information about UTTypeCopyPreferredTagWithClass and kUTTagClassFilenameExtension, on iOS see <MobileCoreServices/UTType.h> and on Mac OS X see <LaunchServices/UTType.h>.
 */
	public var NSURL *outputURL;

/*!
 	public var  outputFileType
 @abstract
	The UTI of the file format of the file for which the instance of AVAssetWriter was initialized for writing.
 */
	public var NSString *outputFileType;

/*!
 	public var  availableMediaTypes
 @abstract
	The media types for which inputs can be added to the receiver.

 @discussion
	Some media types may not be accepted within the file format with which an AVAssetWriter was initialized.
 */
	public var NSArray *availableMediaTypes;

/*!
 	public var  status
 @abstract
	The status of writing samples to the receiver's output file.

 @discussion
	The value of this property is an AVAssetWriterStatus that indicates whether writing is in progress, has completed successfully, has been canceled, or has failed. Clients of AVAssetWriterInput objects should check the value of this property after appending samples fails to determine why no more samples could be written. This property is thread safe.
 */
	public var AVAssetWriterStatus status;

/*!
 	public var  error
 @abstract
	If the receiver's status is AVAssetWriterStatusFailed, this describes the error that caused the failure.

 @discussion
	The value of this property is an NSError that describes what caused the receiver to no longer be able to write to its output file. If the receiver's status is not AVAssetWriterStatusFailed, the value of this property is nil. This property is thread safe.
 */
	public var NSError *error;

/*!
 	public var  metadata
 @abstract
	A collection of metadata to be written to the receiver's output file.

 @discussion
	The value of this property is an array of AVMetadataItem objects representing the collection of top-level metadata to be written in the output file.
	
	This property cannot be set after writing has started.
 */
	public var NSArray *metadata;

/*!
 	public var  shouldOptimizeForNetworkUse
 @abstract
	Specifies whether the output file should be written in way that makes it more suitable for playback over a network
 
 @discussion
	When the value of this property is YES, the output file will be written in such a way that playback can start after only a small amount of the file is downloaded.
	
	This property cannot be set after writing has started.
 */
	public var BOOL shouldOptimizeForNetworkUse;

/*!
 	public var  inputs
 @abstract
	The inputs from which the asset writer receives media data.
 @discussion
	The value of this property is an NSArray containing concrete instances of AVAssetWriterInput. Inputs can be added to the receiver using the addInput: method.
 */
	public var NSArray *inputs;

/*!
 @method canApplyOutputSettings:forMediaType:
 @abstract
	Tests whether output settings for a specific media type are supported by the receiver's file format.

 @param outputSettings
	The output settings that are to be tested.
 @param mediaType
	The media type for which the output settings are to be tested. Media types are defined in AVMediaFormat.h.
 @result
	A BOOL indicating whether the given output settings can be used for the given media type.
 
 @discussion
	This method determines whether the output settings for the specified media type can be used with the receiver's file format. For example, video compression settings that specify H.264 compression are not compatible with file formats that cannot contain H.264-compressed video.
 
	Attempting to add an input with output settings and a media type for which this method returns NO will cause an exception to be thrown.
*/
- (BOOL)canApplyOutputSettings:(NSDictionary *)outputSettings forMediaType:(NSString *)mediaType;

/*!
 @method canAddInput:
 @abstract
	Tests whether an input can be added to the receiver.

 @param input
	The AVAssetWriterInput object to be tested.
 @result
	A BOOL indicating whether the input can be added to the receiver.

 @discussion
	An input that accepts media data of a type that is not compatible with the receiver, or with output settings that are not compatible with the receiver, cannot be added.
 */
- (BOOL)canAddInput:(AVAssetWriterInput *)input;

/*!
 @method addInput:
 @abstract
	Adds an input to the receiver.

 @param input
	The AVAssetWriterInput object to be added.

 @discussion
	Inputs are created with a media type and output settings. These both must be compatible with the receiver.
	
	Inputs cannot be added after writing has started.
 */
- (void)addInput:(AVAssetWriterInput *)input;

/*!
 @method startWriting
 @abstract
	Prepares the receiver for accepting input and for writing its output to its output file.

 @result
	A BOOL indicating whether writing successfully started.
 
 @discussion
	This method must be called after all inputs have been added and other configuration properties have been set in order to tell the receiver to prepare for writing. After this method is called, clients can start writing sessions using startSessionAtSourceTime: and can write media samples using the methods provided by each of the receiver's inputs.
 
	If writing cannot be started, this method returns NO. Clients can check the values of the status and error properties for more information on why writing could not be started.
 
	On iOS, if the status of an AVAssetWriter is AVAssetWriterStatusWriting when the client app goes into the background, its status will change to AVAssetWriterStatusFailed and appending to any of its inputs will fail.  You may want to use -[UIApplication beginBackgroundTaskWithExpirationHandler:] to avoid being interrupted in the middle of a writing session and to finish writing the data that has already been appended.  For more information about executing code in the background, see the iOS Application Programming Guide.
 */
- (BOOL)startWriting;

/*!
 @method startSessionAtSourceTime:
 @abstract
	Initiates a sample-writing session for the receiver.
 
 @param startTime
	The starting asset time for the sample-writing session, in the timeline of the source samples.

 @discussion
	Sequences of sample data appended to the asset writer inputs are considered to fall within "sample-writing sessions", initiated with this method. Accordingly, this method must be called after writing has started using startWriting but before any sample data is appended to the receiver's inputs.
	
	Each writing session has a start time which, where allowed by the file format being written, defines the mapping from the timeline of source samples onto the file's timeline. In the case of the QuickTime movie file format, the first session begins at movie time 0, so a sample appended with timestamp T will be played at movie time (T-startTime).  Samples with timestamps before startTime will still be added to the output media but will be edited out of the movie. If the earliest buffer for an input is later than startTime, an empty edit will be inserted to preserve synchronization between tracks of the output asset.
	
	It is an error to invoke startSessionAtSourceTime: twice in a row without invoking endSessionAtSourceTime: in between.
 
	NOTE: Multiple sample-writing sessions are currently not supported. It is an error to call startSessionAtSourceTime: a second time after calling endSessionAtSourceTime:.
 */
- (void)startSessionAtSourceTime:(CMTime)startTime;

/*!
 @method endSessionAtSourceTime:
 @abstract
	Concludes a sample-writing session.

 @param endTime
	The ending asset time for the sample-writing session, in the timeline of the source samples.

 @discussion
	Call this method to complete a session started with startSessionAtSourceTime:.
 
	The endTime defines the moment on the timeline of source samples at which the session ends. In the case of the QuickTime movie file format, each sample-writing session's startTime...endTime pair corresponds to a period of movie time into which the session's samples are inserted. Samples with later timestamps will be still be added to the media but will be edited out of the movie. So if the first session has duration D1 = endTime - startTime, it will be inserted into the movie at movie time 0 through D1; the second session would be inserted into the movie at movie time D1 through D1+D2, etc. It is legal to have a session with no samples; this will cause creation of an empty edit of the prescribed duration.
	
	It is not mandatory to call endSessionAtSourceTime:; if finishWriting is called without endSessionAtSourceTime:, the session's effective end time will be the latest end timestamp of the session's samples (i.e., no samples will be edited out at the end).
	
	NOTE: Multiple sample-writing sessions are currently not supported. It is an error to call startSessionAtSourceTime: a second time after calling endSessionAtSourceTime:.
 */
- (void)endSessionAtSourceTime:(CMTime)endTime;

/*!
 @method cancelWriting
 @abstract
	Cancels the creation of the output file.
 
 @discussion
	If the status of the receiver is "failed" or "completed," -cancelWriting is a no-op.  Otherwise, this method will block until writing is canceled.
 
	If an output file was created by the receiver during the writing process, -cancelWriting will delete the file.
	
	This method should not be called concurrently with -[AVAssetWriterInput appendSampleBuffer:] or -[AVAssetWriterInputPixelBufferAdaptor appendPixelBuffer:withPresentationTime:].
*/
- (void)cancelWriting;

/*!
 @method finishWriting
 @abstract
	Completes the writing of the output file.
 
 @result
	A BOOL indicating whether writing successfully finished.
 
 @discussion
	This method is deprecated.  Use finishWritingWithCompletionHandler: instead.

	This method will block until writing is finished. When this method returns successfully, the file being written by the receiver is complete and ready to use.

	Because this method is blocking and can take a long time to execute (especially with shouldOptimizeForNetworkUse set to YES), it should not be called from the main thread.  Doing so can cause the finishWriting operation to fail.

	If writing cannot be finished, this method returns NO. Clients can check the values of the status and error properties for more information on why writing could not be finished.
	
	This method should not be called concurrently with -[AVAssetWriterInput appendSampleBuffer:] or -[AVAssetWriterInputPixelBufferAdaptor appendPixelBuffer:withPresentationTime:].
*/
- (BOOL)finishWriting NS_DEPRECATED(10_7, TBD, 4_1, 6_0);

/*!
 @method finishWritingWithCompletionHandler:
 @abstract
	Marks all unfinished inputs as finished and completes the writing of the output file.

 @discussion
	This method returns immediately and causes its work to be performed asynchronously.
	
	When the writing of the output file is finished, or if a failure or a cancellation occurs in the meantime, the specified handler will be invoked to indicate completion of the operation. To determine whether the operation succeeded, your handler can check the value of AVAssetWriter.status. If the status is AVAssetWriterStatusFailed, AVAsset.error will contain an instance of NSError that describes the failure.
	
	To guarantee that all sample buffers are successfully written, ensure all calls to -[AVAssetWriterInput appendSampleBuffer:] or -[AVAssetWriterInputPixelBufferAdaptor appendPixelBuffer:withPresentationTime:] have returned before invoking this method.
*/
- (void)finishWritingWithCompletionHandler:(void (^)(void))handler NS_AVAILABLE(TBD, 6_0);

}


extern class AVAssetWriter (AVAssetWriterFileTypeSpecificProperties)

/*!
 	public var  movieFragmentInterval
 @abstract
	For file types that support movie fragments, specifies the frequency at which movie fragments should be written.
 
 @discussion
	When movie fragments are used, a partially written asset whose writing is unexpectedly interrupted can be successfully opened and played up to multiples of the specified time interval. The default value of this property is kCMTimeInvalid, which indicates that movie fragments should not be used.

	This property cannot be set after writing has started.
 */
	public var CMTime movieFragmentInterval;

/*!
 	public var  movieTimeScale
 @abstract
	For file types that contain a 'moov' atom, such as QuickTime Movie files, specifies the asset-level time scale to be used. 

 @discussion
	The default value is 0, which indicates that the receiver should choose a convenient value, if applicable.
 
	This property cannot be set after writing has started.
 */
	public var CMTimeScale movieTimeScale NS_AVAILABLE(10_7, 4_3);

}
