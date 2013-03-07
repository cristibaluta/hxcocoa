package objc.foundation;

import objc.foundation.NSObject;

private typedef NSEnumerationOptions = Dynamic;
private typedef NSSortOptions = Dynamic;
private typedef NSComparator = Dynamic;

extern enum NSBinarySearchingOptions
{
	NSBinarySearchingFirstEqual;
	NSBinarySearchingLastEqual;
	NSBinarySearchingInsertionIndex;
}

@:framework("Foundation")
extern class NSArray extends NSObject implements NSCopying implements NSMutableCopying implements NSSecureCoding/* implements NSFastEnumeration*/ {

	public function count () :Int;
	public function objectAtIndex (index:Int) :Dynamic;
    
	// NSExtendedArray)

	public function arrayByAddingObject (anObject:Dynamic) :NSArray;
	public function arrayByAddingObjectsFromArray (otherArray:NSArray) :NSArray;
	public function componentsJoinedByString (separator:String) :String;
	public function containsObject (anObject:Dynamic) :Bool;
	public function description():String;
	@:overload(function(locale:Dynamic, indent:Int):String{})
	public function descriptionWithLocale (locale:Dynamic) :String;
	public function firstObjectCommonWithArray (otherArray:NSArray) :Dynamic;
	//public function getObjects (id __unsafe_unretained [])objects range (NSRange)range;
	@:overload(function(anObject:Dynamic, inRange:NSRange):Int{})
	public function indexOfObject (anObject:Dynamic) :Int;
	@:overload(function(anObject:Dynamic, inRange:NSRange):Int{})
	public function indexOfObjectIdenticalTo (anObject:Dynamic) :Int;
	public function isEqualToArray (otherArray:NSArray) :Bool;
	public function lastObject() :Dynamic;
	public function objectEnumerator() :NSEnumerator;
	public function reverseObjectEnumerator() :NSEnumerator;
	public function sortedArrayHint () :NSData;
	public function sortedArrayUsingFunction (comparator:Dynamic->Dynamic->Void->Int, context:Void->Void) :NSArray;
	//public function sortedArrayUsingFunction (NSInteger (*)(id, id, void *))comparator context (void *)context hint (NSData *) :NSArray;
	public function sortedArrayUsingSelector (comparator:SEL) :NSArray;
	public function subarrayWithRange (range:NSRange) :NSArray;
	public function writeToFile (path:String, atomically:Bool) :Bool;
	public function writeToURL (url:NSURL, atomically:Bool) :Bool;

	//public function makeObjectsPerformSelector (aSelector:SEL) :Void;
	public function makeObjectsPerformSelector (aSelector:SEL, withObject:Dynamic) :Void;

	public function objectsAtIndexes (indexes:NSIndexSet) :NSArray;

	@:require(ios6_0) @:require(osx10_8) public function objectAtIndexedSubscript (idx:Int) :Dynamic;

#if NS_BLOCKS_AVAILABLE
	public function enumerateObjectsUsingBlock (void (^)(id obj, Int idx, Bool *stop))block  :NSArray;
	public function enumerateObjectsWithOptions (NSEnumerationOptions)opts usingBlock (void (^)(id obj, Int idx, Bool *stop))block  :NSArray;
	public function enumerateObjectsAtIndexes (NSIndexSet *)s options (NSEnumerationOptions)opts usingBlock (void (^)(id obj, Int idx, Bool *stop)) :NSArray;

- (Int)indexOfObjectPassingTest (Bool (^)(id obj, Int idx, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
- (Int)indexOfObjectWithOptions (NSEnumerationOptions)opts passingTest (Bool (^)(id obj, Int idx, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
- (Int)indexOfObjectAtIndexes (NSIndexSet *)s options (NSEnumerationOptions)opts passingTest (Bool (^)(id obj, Int idx, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);

- (NSIndexSet *)indexesOfObjectsPassingTest (Bool (^)(id obj, Int idx, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
- (NSIndexSet *)indexesOfObjectsWithOptions (NSEnumerationOptions)opts passingTest (Bool (^)(id obj, Int idx, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);
- (NSIndexSet *)indexesOfObjectsAtIndexes (NSIndexSet *)s options (NSEnumerationOptions)opts passingTest (Bool (^)(id obj, Int idx, Bool *stop))predicate NS_AVAILABLE(10_6, 4_0);

	public function sortedArrayUsingComparator (cmptr:NSComparator) :NSArray;
	public function sortedArrayWithOptions (NSSortOptions)opts usingComparator (NSComparator) :NSArray;

- (Int)indexOfObject (id)obj inSortedRange (NSRange)r options (NSBinarySearchingOptions)opts usingComparator (NSComparator)cmp NS_AVAILABLE(10_6, 4_0); // binary search

#end

	// NSArrayCreation

	public static function array () :NSArray;
	public static function arrayWithObject (anObject:Dynamic) :NSArray;
	//public static function arrayWithObjects (const id [])objects count (Int)cnt;
	//public static function arrayWithObjects (id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
	public static function arrayWithArray (array:NSArray) :NSArray;

	//public function initWithObjects (const id [])objects count (Int)cnt;
	//public function initWithObjects (id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
	public function initWithArray (array:NSArray) :NSArray;
	//public function initWithArray (array:NSArray, copyItems:Bool) :NSArray;

	public static function arrayWithContentsOfFile (path:String) :NSArray;
	public static function arrayWithContentsOfURL (url:NSURL) :NSArray;
	public function initWithContentsOfFile (path:NSString) :NSArray;
	public function initWithContentsOfURL (url:NSURL) :NSArray;

}


/****************	Mutable Array		****************/

@:framework("Foundation")
extern class NSMutableArray extends NSArray {

	public function addObject (anObject:Dynamic) :Int;
	public function insertObject (anObject:Dynamic, atIndex:Int) :Void;
	public function removeLastObject () :Void;
	public function removeObjectAtIndex (index:Int) :Void;
	public function replaceObjectAtIndex (index:Int, withObject:Dynamic) :Void;

	// NSExtendedMutableArray
    
	public function addObjectsFromArray (otherArray:NSArray) :Void;
	public function exchangeObjectAtIndex (idx1:Int, withObjectAtIndex:Int) :Void;
	public function removeAllObjects () :Void;
	//public function removeObject (anObject:Dynamic, inRange:NSRange) :Void;
	public function removeObject (anObject:Dynamic) :Void;
	//public function removeObjectIdenticalTo (id)anObject inRange (NSRange)range;
	public function removeObjectIdenticalTo (anObject:Dynamic) :Void;
	public function removeObjectsInArray (otherArray:NSArray) :Void;
	public function removeObjectsInRange (range:NSRange) :Void;
	//public function replaceObjectsInRange (range:NSRange, withObjectsFromArray:NSArray, range:NSRange) :Void;
	public function replaceObjectsInRange (range:NSRange, withObjectsFromArray:NSArray) :Void;
	public function setArray (otherArray:NSArray) :Void;
	public function sortUsingFunction (func:Dynamic->Dynamic->Int, context:Void->Void) :Void;
	public function sortUsingSelector (comparator:SEL) :Void;

	public function insertObjects (objects:NSArray, atIndexes:NSIndexSet) :Void;
	public function removeObjectsAtIndexes (indexes:NSIndexSet) :Void;
	public function replaceObjectsAtIndexes (indexes:NSIndexSet, withObjects:NSArray) :Void;

	@:require(ios6_0) @:require(osx10_8) public function setObject (obj:Dynamic, atIndexedSubscript:Int) :Void;

#if NS_BLOCKS_AVAILABLE
	public function sortUsingComparator (NSComparator)cmptr NS_AVAILABLE(10_6, 4_0);
	public function sortWithOptions (NSSortOptions)opts usingComparator (NSComparator)cmptr NS_AVAILABLE(10_6, 4_0);
#end

	// NSMutableArrayCreation)

	public static function arrayWithCapacity (numItems:Int) :NSMutableArray;
	public function initWithCapacity (numItems:Int) :NSMutableArray;

}
