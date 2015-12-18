import objc.foundation.NSError;

@:framework("FacebookSDK")
extern enum FBSessionState {
	FBSessionStateOpen;
}

@:framework("FacebookSDK")
extern class FBSession {
	
	public static function activeSession () :FBSession;
	public static function openActiveSessionWithReadPermissions (permissions:Array<String>, allowLoginUI:Bool, completionHandler:FBSession->FBSessionState->NSError->Void) :Void;
	
	public function handleDidBecomeActive () :Void;
	public var accessToken :String;
	
}
