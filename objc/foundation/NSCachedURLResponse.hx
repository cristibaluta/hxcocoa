package objc.foundation;


@:framework("Foundation")
extern class NSCachedURLResponse implements NSCoding implements NSCopying {

	public static function sharedURLCache():NSURLCache;
	public static function setSharedURLCache( cache:NSURLCache):Void;

	public  function response():NSURLResponse;
	public  function cachedResponseForRequest( request:NSURLRequest):NSCachedURLResponse;
	public  function currentDiskUsage():Int;
	public  function initWithMemoryCapacity( memoryCapacity:Int,  diskCapacity:Int,  path:String):Dynamic;
	public  function storeCachedResponse( cachedResponse:NSCachedURLResponse,  request:NSURLRequest):Void;
	public  function userInfo():NSDictionary;
	public  function memoryCapacity():Int;
	public  function diskCapacity():Int;
	public  function initWithResponse( response:NSURLResponse,  data:NSData):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithResponse1( response:NSURLResponse,  data:NSData,  userInfo:NSDictionary,  storagePolicy:NSURLCacheStoragePolicy):Dynamic;
	public  function storagePolicy():NSURLCacheStoragePolicy;
	public  function setMemoryCapacity( memoryCapacity:Int):Void;
	public  function setDiskCapacity( diskCapacity:Int):Void;
	public  function removeCachedResponseForRequest( request:NSURLRequest):Void;
	public  function removeAllCachedResponses():Void;
	public  function currentMemoryUsage():Int;
	public  function data():NSData;
}

extern enum null
{
	NSURLCacheStorageAllowed;
	NSURLCacheStorageAllowedInMemoryOnly;
	NSURLCacheStorageNotAllowed;
}

