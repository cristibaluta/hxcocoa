package swift.foundation;
import swift.foundation.NSObject;

@:framework("Foundation")
extern class NSError extends NSObject implements NSCopying implements NSSecureCoding {

	public static function errorWithDomain( domain:String, code:Int, dict:NSDictionary):Dynamic;
	
	public function recoveryAttempter():Dynamic;
	public function localizedFailureReason():String;
	public function initWithDomain( domain:String, code:Int, dict:NSDictionary):Dynamic;
	public function userInfo():NSDictionary;
	public function localizedDescription():String;
	public function domain():String;
	public function code():Int;
	public function localizedRecoverySuggestion():String;
	@:overload(function( error:NSError, recoveryOptionIndex:Int):Bool{})
	public function attemptRecoveryFromError( error:NSError, recoveryOptionIndex:Int, delegate:Dynamic, didRecoverSelector:SEL, contextInfo:Dynamic):Void;
	public function localizedRecoveryOptions () :Array<String>;
	public function helpAnchor():String;
}

