package objc.foundation;


extern class NSURLCredentialStorage
{

	//Constants
	static public inline var null:NSURLCredentialStorageChangedNotification;

	//Static Methods
	public  function sharedCredentialStorage():NSURLCredentialStorage;

	//Properties

	//Methods
	public  function allCredentials():NSDictionary;
	public  function removeCredential( credential:NSURLCredential,  space:NSURLProtectionSpace):Void;
	public  function setDefaultCredential( credential:NSURLCredential,  space:NSURLProtectionSpace):Void;
	public  function credentialsForProtectionSpace( space:NSURLProtectionSpace):NSDictionary;
	public  function setCredential( credential:NSURLCredential,  space:NSURLProtectionSpace):Void;
	public  function defaultCredentialForProtectionSpace( space:NSURLProtectionSpace):NSURLCredential;
}

