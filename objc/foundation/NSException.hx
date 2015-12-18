package objc.foundation;
import objc.foundation.NSObject;
import objc.foundation.NSString;


/***************	Generic Exception names		***************/

/*FOUNDATION_EXPORT NSString * const NSGenericException;
FOUNDATION_EXPORT NSString * const NSRangeException;
FOUNDATION_EXPORT NSString * const NSInvalidArgumentException;
FOUNDATION_EXPORT NSString * const NSInternalInconsistencyException;

FOUNDATION_EXPORT NSString * const NSMallocException;

FOUNDATION_EXPORT NSString * const NSObjectInaccessibleException;
FOUNDATION_EXPORT NSString * const NSObjectNotAvailableException;
FOUNDATION_EXPORT NSString * const NSDestinationInvalidException;
    
FOUNDATION_EXPORT NSString * const NSPortTimeoutException;
FOUNDATION_EXPORT NSString * const NSInvalidSendPortException;
FOUNDATION_EXPORT NSString * const NSInvalidReceivePortException;
FOUNDATION_EXPORT NSString * const NSPortSendException;
FOUNDATION_EXPORT NSString * const NSPortReceiveException;

FOUNDATION_EXPORT NSString * const NSOldStyleException;*/

/***************	Exception object	***************/

extern class NSException extends NSObject implements NSCopying implements NSCoding {

	public static function exceptionWithName (name:String, reason:String, userInfo:NSDictionary) :NSException;
	public function initWithName (name:NSString, reason:String, userInfo:NSDictionary) :NSException;

	public function name () :String;
	public function reason () :String;
	public function userInfo () :NSDictionary;

	public function callStackReturnAddresses () :Array<>;
	public function callStackSymbols () :Array<>;

	public function raise () :Void;

//NSExceptionRaisingConveniences

	public static function raise(name:String, format:String) :Void;
	//public static function raise(name:String, format:String, arguments:Array<>) :Void;

}




extern class NSAssertionHandler extends NSObject {

	public static function currentHandler () :NSAssertionHandler;

	public function handleFailureInMethod (selector:SEL, object:Dynamic, file:String, lineNumber:Int, description:String) :Void;

	public function handleFailureInFunction (functionName:String, file:String, lineNumber:Int, description:String) :Void;

}

