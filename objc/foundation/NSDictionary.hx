package objc.foundation;
import objc.foundation.NSObject;
typedef NSFastEnumeration = Dynamic;
typedef NSComparator = Dynamic;
typedef NSSortOptions = Dynamic;
typedef NSEnumerationOptions = Dynamic;

extern class NSDictionary extends NSObject implements NSCopying implements NSMutableCopying implements NSSecureCoding implements NSFastEnumeration {

	public function count () :Int;
	public function objectForKey (aKey:Dynamic) :Dynamic;
	public function keyEnumerator () :NSEnumerator;

	// NSExtendedDictionary
	public function allKeys () :Array<Dynamic>;
	public function allKeysForObject (anObject:Dynamic) :Array<Dynamic>;
	public function allValues () :Array<Dynamic>;
	public function description () :String;
	public function descriptionInStringsFileFormat () :String;
	public function descriptionWithLocale (locale:Dynamic) :String;
	//public  function descriptionWithLocale1 (locale:Dynamic, indent:Int) :String;
	public function isEqualToDictionary (otherDictionary:NSDictionary) :Bool;
	public function objectEnumerator () :NSEnumerator;
	public function objectsForKeys (keys:Array<String>, notFoundMarker:Dynamic) :Array<Dynamic>;
	public function writeToFile (path:String, atomically:Bool) :Bool;
	public function writeToURL (url:NSURL, atomically:Bool) :Bool;
	
	public function keysSortedByValueUsingSelector (comparator:SEL) :Array<Dynamic>;
	public function getObjects (objects:Array<Dynamic>, andKeys:Array<Dynamic>) :Void;

	@:require(osx_10_8) @:require(ios6_0) public function objectForKeyedSubscript (key:Dynamic) :Dynamic;
	
	

	// NSDictionaryCreation
	public static function dictionary () :NSDictionary;
	public static function dictionaryWithObject (object:Dynamic, forKey:NSCopying) :NSDictionary;
	public static function dictionaryWithDictionary (dict:NSDictionary) :NSDictionary;
	public static function dictionaryWithObjects (objects:Array<Dynamic>, forKeys:Array<Dynamic>) :NSDictionary;
	
	
/*#if NS_BLOCKS_AVAILABLE
- (void)enumerateKeysAndObjectsUsingBlock:(void (^)(id key, id obj, Bool *stop))block NS_AVAILABLE(10_6, 4_0);
- (void)enumerateKeysAndObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void (^)(id key, id obj, Bool *stop))block NS_AVAILABLE(10_6, 4_0);

- (Array<> *)keysSortedByValueUsingComparator:(NSComparator)cmptr NS_AVAILABLE(10_6, 4_0);
- (Array<> *)keysSortedByValueWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr NS_AVAILABLE(10_6, 4_0);

- (NSSet *)keysOfEntriesPassingTest:(Bool (^)(id key, id obj, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
- (NSSet *)keysOfEntriesWithOptions:(NSEnumerationOptions)opts passingTest:(Bool (^)(id key, id obj, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
#endif*/


	public function initWithObjectsAndKeys (object:Dynamic, key:Dynamic) :NSDictionary;
	public function initWithDictionary (otherDictionary:NSDictionary) :NSDictionary;
	//public function initWithDictionary (otherDictionary:NSDictionary, copyItems:Bool) :NSDictionary;
	public function initWithObjects (objects:Array<Dynamic>, forKeys:Array<Dynamic>) :NSDictionary;

	public static function dictionaryWithContentsOfFile (path:String) :NSDictionary;
	public static function dictionaryWithContentsOfURL (url:NSURL) :NSDictionary;
	public function initWithContentsOfFile (path:String) :NSDictionary;
	public function initWithContentsOfURL (url:NSURL) :NSDictionary;
	
	//NSSharedKeySetDictionary)
	public static function sharedKeySetForKeys (keys:Array<Dynamic>) :NSDictionary;//NS_AVAILABLE(10_8, 6_0);

	//NSSharedKeySetDictionary)
	public static function dictionaryWithSharedKeySet (keyset:Dynamic) :NSDictionary;//NS_AVAILABLE(10_8, 6_0);
}

/****************	Mutable Dictionary	****************/

extern class NSMutableDictionary extends NSDictionary {

	public function removeObjectForKey (aKey:Dynamic) :Void;
	public function setObject (anObject:Dynamic, forKey:Dynamic) :Void;

	// NSExtendedMutableDictionary)

	public function addEntriesFromDictionary (otherDictionary:NSDictionary) :Void;
	public function removeAllObjects () :Void;
	public function removeObjectsForKeys (keyArray:Array<Dynamic>) :Void;
	public function setDictionary (otherDictionary:NSDictionary) :Void;
	//public function setObject (obj:Dynamic, forKeyedSubscript:Dynamic) :Void;// NS_AVAILABLE(10_8, 6_0);

	// NSMutableDictionaryCreation)

	public static function dictionaryWithCapacity (numItems:Int) :NSDictionary;
	public function initWithCapacity (numItems:Int) :NSDictionary;

}
