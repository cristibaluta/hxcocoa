package objc.foundation;


extern class NSHTTPCookie
{

	//Constants
	static public inline var null:NSHTTPCookieName;
	static public inline var null:NSHTTPCookieValue;
	static public inline var null:NSHTTPCookieOriginURL;
	static public inline var null:NSHTTPCookieVersion;
	static public inline var null:NSHTTPCookieDomain;
	static public inline var null:NSHTTPCookiePath;
	static public inline var null:NSHTTPCookieSecure;
	static public inline var null:NSHTTPCookieExpires;
	static public inline var null:NSHTTPCookieComment;
	static public inline var null:NSHTTPCookieCommentURL;
	static public inline var null:NSHTTPCookieDiscard;
	static public inline var null:NSHTTPCookieMaximumAge;
	static public inline var null:NSHTTPCookiePort;

	//Static Methods
	public  function cookieWithProperties( properties:NSDictionary):Dynamic;
	public  function cookiesWithResponseHeaderFields( headerFields:NSDictionary,  URL:NSURL):Array<>;
	public  function requestHeaderFieldsWithCookies( cookies:Array<>):NSDictionary;

	//Properties

	//Methods
	public  function properties():NSDictionary;
	public  function name():String;
	public  function path():String;
	public  function expiresDate():Date;
	public  function isSessionOnly():Bool;
	public  function isHTTPOnly():Bool;
	public  function commentURL():NSURL;
	public  function portList():Array<>;
	public  function version():Int;
	public  function isSecure():Bool;
	public  function initWithProperties( properties:NSDictionary):Dynamic;
	public  function domain():String;
	public  function value():String;
	public  function comment():String;
}

