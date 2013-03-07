package objc.foundation;


extern class NSURLProtectionSpace implements NSCoding implements NSCopying
{

	//Constants
	static public inline var null:NSURLProtectionSpaceHTTP;
	static public inline var null:NSURLProtectionSpaceHTTPS;
	static public inline var null:NSURLProtectionSpaceFTP;
	static public inline var null:NSURLProtectionSpaceHTTPProxy;
	static public inline var null:NSURLProtectionSpaceHTTPSProxy;
	static public inline var null:NSURLProtectionSpaceFTPProxy;
	static public inline var null:NSURLProtectionSpaceSOCKSProxy;
	static public inline var null:NSURLAuthenticationMethodDefault;
	static public inline var null:NSURLAuthenticationMethodHTTPBasic;
	static public inline var null:NSURLAuthenticationMethodHTTPDigest;
	static public inline var null:NSURLAuthenticationMethodHTMLForm;
	static public inline var null:NSURLAuthenticationMethodNTLM;
	static public inline var null:NSURLAuthenticationMethodNegotiate;
	static public inline var null:NSURLAuthenticationMethodClientCertificate;
	static public inline var null:NSURLAuthenticationMethodServerTrust;

	//Static Methods

	//Properties

	//Methods
	public  function port():Int;
	public  function protocol():String;
	public  function initWithHost( host:String,  port:Int,  protocol:String,  realm:String,  authenticationMethod:String):Dynamic;
	public  function realm():String;
	public  function distinguishedNames():Array<>;
	public  function initWithProxyHost( host:String,  port:Int,  type:String,  realm:String,  authenticationMethod:String):Dynamic;
	public  function isProxy():Bool;
	public  function host():String;
	public  function authenticationMethod():String;
	public  function receivesCredentialSecurely():Bool;
	public  function proxyType():String;
	public  function serverTrust():SecTrustRef;
}

