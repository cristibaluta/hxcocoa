/*
	File:  AVAssetResourceLoader.h

	Framework:  AVFoundation
 
	Copyright 2010-2012 Apple Inc. All rights reserved.

*/

#import <AVFoundation/AVBase.h>
#import <Foundation/Foundation.h>

@protocol AVAssetResourceLoaderDelegate;

@class AVAssetResourceLoadingRequest;
@class AVAssetResourceLoaderInternal;

NS_CLASS_AVAILABLE(TBD, 6_0)
extern class AVAssetResourceLoader extends NSObject {
@private
	AVAssetResourceLoaderInternal *_resourceLoader;
}

/*!
 @method 		setDelegate:queue:
 @abstract		Sets the receiver's delegate that will mediate resource loading and the dispatch queue on which delegate methods will be invoked.
 @param			delegate
				An object conforming to the AVAssetResourceLoaderDelegate protocol.
 @param			delegateQueue
				A dispatch queue on which all delegate methods will be invoked.
*/
- (void)setDelegate:(id<AVAssetResourceLoaderDelegate>)delegate queue:(dispatch_queue_t)delegateQueue;

/*!
 	public var  		delegate
 @abstract		The receiver's delegate.
 @discussion
  The value of this property is an object conforming to the AVAssetResourceLoaderDelegate protocol. The delegate is set using the setDelegate:queue: method.
*/
	public var id<AVAssetResourceLoaderDelegate> delegate;

/*!
 	public var  		delegateQueue
 @abstract		The dispatch queue on which all delegate methods will be invoked.
 @discussion
  The value of this property is a dispatch_queue_t. The queue is set using the setDelegate:queue: method.
*/
	public var dispatch_queue_t delegateQueue;

}


@protocol AVAssetResourceLoaderDelegate <NSObject>

@optional

/*!
 @method 		resourceLoader:shouldWaitForLoadingOfRequestedResource:
 @abstract		Invoked when assistance is required of the application to load a resource.
 @param 		resourceLoader
				The instance of AVAssetResourceLoader for which the loading request is being made.
 @param 		loadingRequest
				An instance of AVAssetResourceLoadingRequest that provides information about the requested resource. 
 @result 		YES if the delegate can load the resource indicated by the AVAssetResourceLoadingRequest; otherwise NO.
 @discussion
  Delegates receive this message when assistance is required of the application to load a resource. For example, this method is invoked to load decryption keys that have been specified using custom URL schemes.
  If the result is YES, the resource loader expects invocation, either subsequently or immediately, of either -[AVAssetResourceLoadingRequest finishLoadingWithResponse:data:redirect:] or -[AVAssetResourceLoadingRequest finishLoadingWithError:]. If you intend to finish loading the resource after your handling of this message returns, you must retain the instance of AVAssetResourceLoadingRequest until after loading is finished.
  If the result is NO, the resource loader treats the loading of the resource as having failed.
  Note that if the delegate's implementation of -resourceLoader:shouldWaitForLoadingOfRequestedResource: returns YES without finishing the loading request immediately, it may be invoked again with another loading request before the prior request is finished; therefore in such cases the delegate should be prepared to manage multiple loading requests.

*/
- (BOOL)resourceLoader:(AVAssetResourceLoader *)resourceLoader shouldWaitForLoadingOfRequestedResource:(AVAssetResourceLoadingRequest *)loadingRequest;

}


@class AVAssetResourceLoadingRequestInternal;

NS_CLASS_AVAILABLE(TBD, 6_0)
extern class AVAssetResourceLoadingRequest extends NSObject {
@private
	AVAssetResourceLoadingRequestInternal *_loadingRequest;
}

/*! 
 	public var  		request
 @abstract		An NSURLRequest for the requested resource.
*/
	public var NSURLRequest *request;

/*! 
 	public var  		finished
 @abstract		Indicates whether loading of the resource has been finished.
*/
	public var BOOL finished;

/*! 
 @method 		finishLoadingWithResponse:data:redirect:   
 @abstract		Causes the receiver to finish loading a resource that a delegate has previously assumed responsibility for loading by returning YES as the result of -resourceLoader:shouldWaitForLoadingOfRequestedResource:.
 @param			response
 				The NSURLResponse for the NSURLRequest of the receiver. Should be nil if no response is required.
 @param			data
 				An instance of NSData containing the data of the resource. Should be nil if no such data is available.
 @param			redirect
 				An instance of NSURLRequest indicating a redirect of the loading request. Should be nil if no redirect is needed.
*/
- (void)finishLoadingWithResponse:(NSURLResponse *)response data:(NSData *)data redirect:(NSURLRequest *)redirect;
				
/*! 
 @method 		finishLoadingWithError:   
 @abstract		Causes the receiver to handle the failure of the loading a resource that a delegate has previously assumed responsibility for loading by returning YES as the result of -resourceLoader:shouldWaitForLoadingOfRequestedResource:.
 @param			error
 				An instance of NSError indicating the reason for failure.
*/
- (void)finishLoadingWithError:(NSError *)error;

/*! 
 @method 		streamingContentKeyRequestDataForApp:contentIdentifier:error:   
 @abstract		Obtains a streaming content key request for a specific combination of application and content.
 @param			appIdentifier
 				An opaque identifier for the application. The value of this identifier depends on the particular system used to provide the decryption key.
 @param			contentIdentifier
 				An opaque identifier for the content. The value of this identifier depends on the particular system used to provide the decryption key.
 @param			options
 				Additional information necessary to obtain the key, or nil if none.
 @param			error
 				If obtaining the streaming content key request fails, will be set to an instance of NSError describing the failure.
 @result		The key request data that must be transmitted to the key vendor to obtain the content key.
*/
- (NSData *)streamingContentKeyRequestDataForApp:(NSData *)appIdentifier contentIdentifier:(NSData *)contentIdentifier options:(NSDictionary *)options error:(NSError **)outError;

}
