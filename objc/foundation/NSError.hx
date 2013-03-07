package objc.foundation;
import objc.foundation.NSObject;

extern class NSError extends NSObject implements NSCopying implements NSSecureCoding {

	public static function errorWithDomain( domain:String,  code:Int,  dict:NSDictionary):Dynamic;
	
	public  function recoveryAttempter():Dynamic;
	public  function localizedFailureReason():String;
	public  function initWithDomain( domain:String,  code:Int,  dict:NSDictionary):Dynamic;
	public  function userInfo():NSDictionary;
	public  function localizedDescription():String;
	public  function domain():String;
	public  function code():Int;
	public  function localizedRecoverySuggestion():String;
	public  function attemptRecoveryFromError( error:NSError,  recoveryOptionIndex:Int,  delegate:Dynamic,  didRecoverSelector:SEL,  contextInfo:Dynamic):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function attemptRecoveryFromError1( error:NSError,  recoveryOptionIndex:Int):Bool;
	public  function localizedRecoveryOptions () :Array<String>;
	public  function helpAnchor():String;
}

