package ios.twitter;
import objc.foundation.NSObject;
// #import <Social/SLRequest.h>

enum TWRequestMethod {
    TWRequestMethodGET;// = SLRequestMethodGET,
    TWRequestMethodPOST;// = SLRequestMethodPOST,
    TWRequestMethodDELETE;// = SLRequestMethodDELETE
}

typedef SLRequestMethod = TWRequestMethod; // available in iPhone 5.0
typedef SLRequestHandler = TWRequestHandler;


extern class TWRequest extends NSObject {

	public function initWithURL (url:NSURL, parameters:NSDictionary, requestMethod:TWRequestMethod) :TWRequest;
	
	public var account :ACAccount;
	public var requestMethod :TWRequestMethod;
	public var URL :NSURL;
	public var parameters :NSDictionary;

	public function addMultiPartData (data:NSData, withName:String, type:String) :Void; 
	public function signedURLRequest () :NSURLRequest;
	public function performRequestWithHandler (handler:TWRequestHandler) :Void;

}

