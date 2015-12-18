package objc.foundation;


extern class NSURLAuthenticationChallenge implements NSCoding
{

	//Constants

	//Static Methods

	//Properties

	//Methods
	public function useCredential( credential:NSURLCredential,  challenge:NSURLAuthenticationChallenge):Void;
	public function continueWithoutCredentialForAuthenticationChallenge( challenge:NSURLAuthenticationChallenge):Void;
	public function cancelAuthenticationChallenge( challenge:NSURLAuthenticationChallenge):Void;
	public function sender():id<NSURLAuthenticationChallengeSender>;
	public function rejectProtectionSpaceAndContinueWithChallenge( challenge:NSURLAuthenticationChallenge):Void;
	public function initWithAuthenticationChallenge( challenge:NSURLAuthenticationChallenge,  sender:id<NSURLAuthenticationChallengeSender>):Dynamic;
	public function protectionSpace():NSURLProtectionSpace;
	public function proposedCredential():NSURLCredential;
	public function previousFailureCount():Int;
	public function error():NSError;
	public function initWithProtectionSpace( space:NSURLProtectionSpace,  credential:NSURLCredential,  previousFailureCount:Int,  response:NSURLResponse,  error:NSError,  sender:id<NSURLAuthenticationChallengeSender>):Dynamic;
	public function performDefaultHandlingForAuthenticationChallenge( challenge:NSURLAuthenticationChallenge):Void;
	public function failureResponse():NSURLResponse;
}

/*	
    NSURLAuthenticationChallenge.h
    Copyright (c) 2003-2012, Apple Inc. All rights reserved.    
    
    Public header file.
*/

package objc.foundation;

@class NSURLAuthenticationChallenge;
@class NSURLCredential;
@class NSURLProtectionSpace;
@class NSURLResponse;
@class NSError;

/*!  
    @protocol NSURLAuthenticationChallengeSender 
    @discussion This protocol represents the sender of an
    authentication challenge. It has methods to provide a credential,
    to continue without any credential, getting whatever failure
    result would happen in that case, cancel a challenge, perform the default
    action as defined by the system, or reject the currently supplied protection-space
    in the challenge.
*/

@protocol NSURLAuthenticationChallengeSender <NSObject>

/*!
    @method useCredential:forAuthenticationChallenge:
*/
public function useCredential:(NSURLCredential *)credential forAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;

/*!
    @method continueWithoutCredentialForAuthenticationChallenge:
*/
public function continueWithoutCredentialForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;

/*!
    @method cancelAuthenticationChallenge:
*/
public function cancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;

@optional
/*!
 @method performDefaultHandlingForAuthenticationChallenge:
 */
public function performDefaultHandlingForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;

/*!
 @method rejectProtectionSpaceAndContinueWithChallenge:
 */
public function rejectProtectionSpaceAndContinueWithChallenge:(NSURLAuthenticationChallenge *)challenge;

}

@class NSURLAuthenticationChallengeInternal;

/*!
    @class NSURLAuthenticationChallenge
    @discussion This class represents an authentication challenge. It
    provides all the information about the challenge, and has a method
    to indicate when it's done.
*/

extern class NSURLAuthenticationChallenge extends NSObject implements NSObject>
{
@private
    NSURLAuthenticationChallengeInternal *_internal;
}

/*!
    @method initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:
    @abstract Initialize an authentication challenge 
    @param space The NSURLProtectionSpace to use
    @param credential The proposed NSURLCredential for this challenge, or nil
    @param previousFailureCount A count of previous failures attempting access.
    @param response The NSURLResponse for the authentication failure, if applicable, else nil
    @param error The NSError for the authentication failure, if applicable, else nil
    @result An authentication challenge initialized with the specified parameters
*/
- (id)initWithProtectionSpace:(NSURLProtectionSpace *)space proposedCredential:(NSURLCredential *)credential previousFailureCount:(Int)previousFailureCount failureResponse:(NSURLResponse *)response error:(NSError *)error sender:(id<NSURLAuthenticationChallengeSender>)sender;

/*!
    @method initWithAuthenticationChallenge:
    @abstract Initialize an authentication challenge copying all parameters from another one.
    @param challenge
    @result A new challenge initialized with the parameters from the passed in challenge
    @discussion This initializer may be useful to subclassers that want to proxy
    one type of authentication challenge to look like another type.
*/
- (id)initWithAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge sender:(id<NSURLAuthenticationChallengeSender>)sender;

/*!
    @method protectionSpace
    @abstract Get a description of the protection space that requires authentication
    @result The protection space that needs authentication
*/
- (NSURLProtectionSpace *)protectionSpace;

/*!
    @method proposedCredential
    @abstract Get the proposed credential for this challenge
    @result The proposed credential
    @discussion proposedCredential may be nil, if there is no default
    credential to use for this challenge (either stored or in the
    URL). If the credential is not nil and returns YES for
    hasPassword, this means the NSURLConnection thinks the credential
    is ready to use as-is. If it returns NO for hasPassword, then the
    credential is not ready to use as-is, but provides a default
    username the client could use when prompting.
*/
- (NSURLCredential *)proposedCredential;

/*!
    @method previousFailureCount
    @abstract Get count of previous failed authentication attempts
    @result The count of previous failures
*/
- (Int)previousFailureCount;

/*!
    @method failureResponse
    @abstract Get the response representing authentication failure.
    @result The failure response or nil
    @discussion If there was a previous authentication failure, and
    this protocol uses responses to indicate authentication failure,
    then this method will return the response. Otherwise it will
    return nil.
*/
- (NSURLResponse *)failureResponse;

/*!
    @method error
    @abstract Get the error representing authentication failure.
    @discussion If there was a previous authentication failure, and
    this protocol uses errors to indicate authentication failure,
    then this method will return the error. Otherwise it will
    return nil.
*/
- (NSError *)error;

/*!
    @method sender
    @abstract Get the sender of this challenge
    @result The sender of the challenge
    @discussion The sender is the object you should reply to when done processing the challenge.
*/
- (id<NSURLAuthenticationChallengeSender>)sender;

}
