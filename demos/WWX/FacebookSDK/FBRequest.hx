import swift.foundation.NSError;

@:framework("FacebookSDK")
extern class FBRequest {
	
	public static function requestForGraphPath (path:String) :FBRequest;
	
	public function startWithCompletionHandler (completionHandler:FBRequestConnection->Dynamic->NSError->Void) :Void;
	
}
