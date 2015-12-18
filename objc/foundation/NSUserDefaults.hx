package objc.foundation;


extern class NSUserDefaults extends NSObject {

	public static function standardUserDefaults() :NSUserDefaults;
	public static function resetStandardUserDefaults() :Void;

	public function init() :NSUserDefaults;
	public function initWithUser (username:String) :NSUserDefaults;
	
	public function objectForKey (defaultName:String) :Dynamic;
	public function setObject (value:Dynamic, forKey:String) :Void;
	public function removeObjectForKey (defaultName:String) :Void;

	public function stringForKey (defaultName:String) :String;
	public function arrayForKey (defaultName:String) :Array<Dynamic>;
	public function dictionaryForKey (defaultName:String) :NSDictionary;
	public function dataForKey (defaultName:String) :NSData;
	public function stringArrayForKey (defaultName:String) :Array<String>;
	public function integerForKey (defaultName:String) :Int;
	public function floatForKey (defaultName:String) :Float;
	public function doubleForKey (defaultName:String) :Float;
	public function boolForKey (defaultName:String) :Bool;
	public function URLForKey (defaultName:String) :NSURL;

	public function setInteger (value:Int, forKey:String) :Void;
	public function setFloat (value:Float, forKey:String) :Void;
	public function setDouble (value:Float, forKey:String) :Void;
	public function setBool (value:Bool, forKey:String) :Void;
	public function setURL (url:NSURL, forKey:String) :Void;

	public function registerDefaults (registrationDictionary:NSDictionary) :Void;

	public function addSuiteNamed (suiteName:String) :Void;
	public function removeSuiteNamed (suiteName:String) :Void;

	public function dictionaryRepresentation () :NSDictionary;

	public function volatileDomainNames() :Array<String>;
	public function volatileDomainForName (domainName:String) :NSDictionary;
	public function setVolatileDomain (domain:NSDictionary, forName:String) :Void;
	public function removeVolatileDomainForName (domainName:String) :Void;
	

	public function persistentDomainNames () :Array<String>;
	public function persistentDomainForName (domainName:String) :NSDictionary;
	public function setPersistentDomain (domain:NSDictionary, forName:String) :Void;
	public function removePersistentDomainForName (domainName:String) :Void;
	
	public function synchronize() :Bool;
	
	public function objectIsForcedForKey (key:String) :Bool;
	//public function objectIsForcedForKey (key:String, inDomain:String) :Bool;
}
