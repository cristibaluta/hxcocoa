package objc.foundation;


extern class NSURLAuthenticationChallenge implements NSCoding
{

	//Constants

	//Static Methods

	//Properties

	//Methods
	public  function useCredential( credential:NSURLCredential,  challenge:NSURLAuthenticationChallenge):Void;
	public  function continueWithoutCredentialForAuthenticationChallenge( challenge:NSURLAuthenticationChallenge):Void;
	public  function cancelAuthenticationChallenge( challenge:NSURLAuthenticationChallenge):Void;
	public  function sender():id<NSURLAuthenticationChallengeSender>;
	public  function rejectProtectionSpaceAndContinueWithChallenge( challenge:NSURLAuthenticationChallenge):Void;
	public  function initWithAuthenticationChallenge( challenge:NSURLAuthenticationChallenge,  sender:id<NSURLAuthenticationChallengeSender>):Dynamic;
	public  function protectionSpace():NSURLProtectionSpace;
	public  function proposedCredential():NSURLCredential;
	public  function previousFailureCount():Int;
	public  function error():NSError;
	public  function initWithProtectionSpace( space:NSURLProtectionSpace,  credential:NSURLCredential,  previousFailureCount:Int,  response:NSURLResponse,  error:NSError,  sender:id<NSURLAuthenticationChallengeSender>):Dynamic;
	public  function performDefaultHandlingForAuthenticationChallenge( challenge:NSURLAuthenticationChallenge):Void;
	public  function failureResponse():NSURLResponse;
}

