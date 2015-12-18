/*
    File:  AVPlayerItemOutput.h

	Framework:  AVFoundation
 
	Copyright 2011-2012 Apple Inc. All rights reserved.

*/

#import <AVFoundation/AVBase.h>
#import <Foundation/Foundation.h>
#import <CoreMedia/CMTime.h>
#import <CoreVideo/CVPixelBuffer.h>

#if ! TARGET_OS_IPHONE

#import <CoreVideo/CVHostTime.h>

#endif // ! TARGET_OS_IPHONE

/*!
	@class			AVPlayerItemOutput
	@abstract		AVPlayerItemOutput is an abstract class encapsulating the common API for all AVPlayerItemOutput subclasses.
	@discussion
		Instances of AVPlayerItemOutput permit the acquisition of individual samples from an AVAsset during playback by an AVPlayer. To provide graceful degradation of service across multiple AVPlayerItemOutput instances for a single source, all AVPlayerItemOutput subclasses only offer the current sample and/or any readily available future samples. All samples earlier than the current sample are automatically discarded by the AVPlayerItemOutput.
		
		You manage an association of an AVPlayerItemOutput instance with an AVPlayerItem as the source input using the AVPlayerItem methods:
		
		• addOutput:
		• removeOutput:
		
		When an AVPlayerItemOutput is associated with an AVPlayerItem, samples are provided for a media type in accordance with the rules for mixing, composition, or exclusion that the AVPlayer honors among multiple enabled tracks of that media type for its own rendering purposes. For example, video media will be composed according to the instructions provided via AVPlayerItem.videoComposition, if present.
 */

@class AVPlayerItemOutputInternal;

NS_CLASS_AVAILABLE(10_8, 6_0)
extern class AVPlayerItemOutput extends NSObject
{
	@private
	AVPlayerItemOutputInternal *_outputInternal;
}

/*!
	@method			itemTimeForHostTime:
	@abstract		Convert a host time, expressed in seconds, to item time.
	@discussion
		Converts a host time value (for example a CADisplayLink timestamp, or the value returned by CACurrentMediaTime()) to the equivalent time on the item's timebase.
		
		Note: The Core Animation CADisplayLink timestamp property expresses the most recent, or previous, screen refresh time. You need to increment this timestamp by the CADisplayLink's duration property to find the next appropriate item time.
	@param			hostTimeInSeconds
					The timestamp value to convert to item time.
	@result			The equivalent item time.
 */

- (CMTime)itemTimeForHostTime:(CFTimeInterval)hostTimeInSeconds;

/*!
	@method			itemTimeForMachAbsoluteTime:
	@abstract		Convenience method to convert a Mach host time to item time.
	@discussion
		Converts Mach host time to the equivalent time on the item's timebase.
		mach_absolute_time() returns time awake since boot in system-specific rational units that can be queried by calling mach_timebase_info().
	@param			machAbsoluteTime
					The Mach host time to convert to item time.
	@result			The equivalent item time.
 */

- (CMTime)itemTimeForMachAbsoluteTime:(int64_t)machAbsoluteTime;

#if !TARGET_OS_IPHONE

/*!
	@method			itemTimeForCVTimeStamp:
	@abstract		Convenience method to convert a CoreVideo timestamp to the equivalent time on the item's timebase.
	@discussion
		Note: A CVDisplayLink provides a parameter inOutputTimestamp that expresses a future screen refresh time. You can use this value directly to find the next appropriate item time.
	@param			timestamp
					The CoreVideo timestamp value to convert to item time.
	@result			The equivalent item time.
 */

- (CMTime)itemTimeForCVTimeStamp:(CVTimeStamp)timestamp NS_AVAILABLE(10_8, NA);

#endif // !TARGET_OS_IPHONE

/*!
		public var 		suppressesPlayerRendering
	@abstract		Indicates whether the output, when added to an AVPlayerItem, will be used in addition to normal rendering of media data by the player or instead of normal rendering. The default value is NO, indicating that the output will be used in addition to normal rendering. If you want to render the media data provided by the output yourself instead of allowing it to be rendered as in normally would be by	AVPlayer, set suppressesPlayerRendering to YES.
	@discussion
		 Whenever any output is added to an AVPlayerItem that has suppressesPlayerRendering set to YES, the media data supplied to the output will not be rendered by AVPlayer. Other media data associated with the item but not provided to such an output is not affected. For example, if an output of class AVPlayerItemVideoOutput with a value of YES for suppressesPlayerRendering is added to an AVPlayerItem, video media for that item will not be rendered by the AVPlayer, while audio media, subtitle media, and other kinds of media, if present, will be rendered.
*/
	public var  (nonatomic, readwrite) BOOL suppressesPlayerRendering NS_AVAILABLE(10_8, 6_0);

}

/*!
	@class			AVPlayerItemVideoOutput
	@abstract		A concrete subclass of AVPlayerItemOutput that vends video images as CVPixelBuffers.
	@discussion
		It is best to use a AVPlayerItemVideoOutput in conjunction with the services of a CVDisplayLink or CADisplayLink to accurately synchronize with screen device refreshes. For optimum efficiency there are opportunities to quiesce these services. Examples include when playback is paused or during playback of empty edits. Below is sample code that illustrates how you might quiesce a CVDisplayLink when used with a AVPlayerItemVideoOutput.


	(void)CVDisplayLinkCreateWithActiveCGDisplays( &myDisplayLink );
	CVDisplayLinkSetOutputCallback( myDisplayLink, myDisplayCallback, self );
	
	[myPlayerItem addOutput:myVideoOutput];
	[myVideoOutput setDelegate:self queue:myDispatchQueue];
	
	...
	
	static CVReturn myDisplayCallback ( CVDisplayLinkRef displayLink, 
										const CVTimeStamp *inNow, 
										const CVTimeStamp *inOutputTime, 
										CVOptionFlags flagsIn, 
										CVOptionFlags *flagsOut, 
										void *displayLinkContext )
	{
		MYObject *self = displayLinkContext;
	 
		CMTime outputItemTime = [[self myVideoOutput] itemTimeForCVTimeStamp:*inOutputTime];
		if ( [[self myVideoOutput] hasNewPixelBufferForItemTime:outputItemTime] ) {
			CVPixelBufferRef pixBuff = NULL;
			CMTime presentationItemTime = kCMTimeZero;
			self->myLastHostTime = inOutputTime->hostTime;
			pixBuff = [[self myVideoOutput] copyPixelBufferForItemTime:outputItemTime itemTimeForDisplay:&presentationItemTime];
	 
			// Use pixBuff here
			// presentationItemTime is the item time appropriate for
			// the next screen refresh
	
			CVBufferRelease( pixBuff );
		}
		else {
			CMTime elapsedTime = CMClockMakeHostTimeFromSystemUnits( inNow->hostTime - self->myLastHostTime );
			if ( CMTimeGetSeconds( elapsedTime ) > NON_QUIESCENT_PERIOD_IN_SECONDS ) {
				[[self myVideoOutput] requestNotificationOfMediaDataChangeWithAdvanceInterval:MY_STARTUP_TIME_IN_SECONDS];
				CVDisplayLinkStop( displayLink );
			}
		}
		return kCVReturnSuccess;
	}
	
	- (void)outputMediaDataWillChange:(AVPlayerItemOutput *)output
	{	
		// Start running again
		myLastHostTime = CVGetCurrentHostTime();
		CVDisplayLinkStart( myDisplayLink );
	}


 */
 
@protocol AVPlayerItemOutputPullDelegate;

@class AVPlayerItemVideoOutputInternal;

NS_CLASS_AVAILABLE(10_8, 6_0)
extern class AVPlayerItemVideoOutput extends AVPlayerItemOutput
{
@private
	AVPlayerItemVideoOutputInternal *_videoOutputInternal;
}

/*!
	@method			initWithPixelBufferAttributes:
	@abstract		Returns an instance of AVPlayerItemVideoOutput, initialized with the specified pixel buffer attributes, for video image output.
	@param			pixelBufferAttributes
					The client requirements for output CVPixelBuffers, expressed using the constants in <CoreVideo/CVPixelBuffer.h>.
	@result			An instance of AVPlayerItemVideoOutput.
 */

- (id)initWithPixelBufferAttributes:(NSDictionary *)pixelBufferAttributes;

/*!
	@method			hasNewPixelBufferForItemTime:
	@abstract		Query if any new video output is available for an item time.
	@discussion
		This method returns YES if there is available video output, appropriate for display, at the specified item time not marked as acquired. If you require multiple objects to acquire video output from the same AVPlayerItem, you should instantiate more than one AVPlayerItemVideoOutput and add each via addOutput:. Each AVPlayerItemVideoOutput maintains a separate record of client acquisition.
	@param			itemTime
					The item time to query.
	@result			A BOOL indicating if there is newer output.
 */

- (BOOL)hasNewPixelBufferForItemTime:(CMTime)itemTime;

/*!
	@method			copyPixelBufferForItemTime:itemTimeForDisplay:
	@abstract		Retrieves an image that is appropriate for display at the specified item time, and marks the image as acquired.
	@discussion
		The client is responsible for calling CVBufferRelease on the returned CVPixelBuffer when finished with it. 
		
		Typically you would call this method in response to a CVDisplayLink callback or CADisplayLink delegate invocation and if hasNewPixelBufferForItemTime: also returns YES. 
		
		The buffer reference retrieved from copyPixelBufferForItemTime:itemTimeForDisplay: may itself be NULL. A reference to a NULL pixel buffer communicates that nothing should be displayed for the supplied item time.
	@param			itemTime
					A CMTime that expresses a desired item time.
	@param			itemTimeForDisplay
					A CMTime pointer whose value will contain the true display deadline for the copied pixel buffer. Can be NULL.
 */

- (CVPixelBufferRef)copyPixelBufferForItemTime:(CMTime)itemTime itemTimeForDisplay:(CMTime *)outItemTimeForDisplay;

/*!
	@method			setDelegate:queue:
	@abstract		Sets the receiver's delegate and a dispatch queue on which the delegate will be called.
	@param			delegate
					An object conforming to AVPlayerItemOutputPullDelegate protocol.
	@param			delegateQueue
					A dispatch queue on which all delegate methods will be called.
 */

- (void)setDelegate:(id<AVPlayerItemOutputPullDelegate>)delegate queue:(dispatch_queue_t)delegateQueue;

/*!
	@method			requestNotificationOfMediaDataChangeWithAdvanceInterval:
	@abstract		Informs the receiver that the AVPlayerItemVideoOutput client is entering a quiescent state.
	@param			interval
					A wall clock time interval.
	@discussion
		Message this method before you suspend your use of a CVDisplayLink or CADisplayLink. The interval you provide will be used to message your delegate, in advance, that it should resume the display link. If the interval you provide is large, effectively requesting wakeup earlier than the AVPlayerItemVideoOutput is prepared to act, the delegate will be invoked as soon as possible. Do not use this method to force a delegate invocation for each sample.
 */
 
- (void)requestNotificationOfMediaDataChangeWithAdvanceInterval:(NSTimeInterval)interval;

/*!
		public var 		delegate
	@abstract		The receiver's delegate.
 */
	public var id<AVPlayerItemOutputPullDelegate>delegate;

/*!
		public var 		delegateQueue
	@abstract		The dispatch queue where the delegate is messaged.
 */

	public var dispatch_queue_t delegateQueue;

}

/*!
	@protocol		AVPlayerItemOutputPullDelegate
	@abstract		Defines common delegate methods for objects participating in AVPlayerItemOutput pull sample output acquisition.
 */
 
 @protocol AVPlayerItemOutputPullDelegate <NSObject>
 
 @optional
 
 /*!
	@method			outputMediaDataWillChange:
	@abstract		A method invoked once, prior to a new sample, if the AVPlayerItemOutput sender was previously messaged requestNotificationOfMediaDataChangeWithAdvanceInterval:.
	@discussion
		This method is invoked once after the sender is messaged requestNotificationOfMediaDataChangeWithAdvanceInterval:.
  */

- (void)outputMediaDataWillChange:(AVPlayerItemOutput *)sender NS_AVAILABLE(10_8, 6_0);
 
 /*!
	@method			outputSequenceWasFlushed:
	@abstract		A method invoked when the output is commencing a new sequence.
	@discussion
		This method is invoked after any seeking and change in playback direction. If you are maintaining any queued future samples, copied previously, you may want to discard these after receiving this message.
  */

- (void)outputSequenceWasFlushed:(AVPlayerItemOutput *)output NS_AVAILABLE(10_8, 6_0);

}

