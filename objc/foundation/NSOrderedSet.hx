package objc.foundation;


extern class NSOrderedSet implements NSCopying implements NSMutableCopying implements NSSecureCoding implements NSFastEnumeration
{

	//Constants

	//Static Methods
	public  function orderedSetWithObjects( objects:constid[],  cnt:Int):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function orderedSetWithObjects1( firstObj:Dynamic):Dynamic;
	public  function orderedSetWithSet( set:NSSet):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function orderedSetWithSet1( set:NSSet,  flag:Bool):Dynamic;
	public  function orderedSet():Dynamic;
	public  function orderedSetWithCapacity( numItems:Int):Dynamic;
	public  function orderedSetWithObject( object:Dynamic):Dynamic;
	public  function orderedSetWithOrderedSet( set:NSOrderedSet):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function orderedSetWithOrderedSet1( set:NSOrderedSet,  range:NSRange,  flag:Bool):Dynamic;
	public  function orderedSetWithArray( array:Array<>):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function orderedSetWithArray1( array:Array<>,  range:NSRange,  flag:Bool):Dynamic;

	//Properties

	//Methods
	public  function enumerateObjectsAtIndexes( s:NSIndexSet,  opts:NSEnumerationOptions,  block:Dynamic):Void;
	public  function objectAtIndexedSubscript( idx:Int):Dynamic;
	public  function replaceObjectAtIndex( idx:Int,  object:Dynamic):Void;
	public  function lastObject():Dynamic;
	public  function indexesOfObjectsWithOptions( opts:NSEnumerationOptions,  predicate:Dynamic):NSIndexSet;
	public  function intersectsSet( set:NSSet):Bool;
	public  function reversedOrderedSet():NSOrderedSet;
	public  function objectAtIndex( idx:Int):Dynamic;
	public  function addObjectsFromArray( array:Array<>):Void;
	public  function removeObjectsInRange( range:NSRange):Void;
	public  function intersectOrderedSet( other:NSOrderedSet):Void;
	public  function initWithObjects( objects:constid[],  cnt:Int):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithObjects1( firstObj:Dynamic):Dynamic;
	public  function sortedArrayWithOptions( opts:NSSortOptions,  cmptr:NSComparator):Array<>;
	public  function initWithSet( set:NSSet):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithSet1( set:NSSet,  flag:Bool):Dynamic;
	public  function initWithCapacity( numItems:Int):Dynamic;
	public  function sortRange( range:NSRange,  opts:NSSortOptions,  cmptr:NSComparator):Void;
	public  function indexesOfObjectsPassingTest( predicate:Dynamic):NSIndexSet;
	public  function minusSet( other:NSSet):Void;
	public  function addObjects( objects:constid[],  count:Int):Void;
	public  function removeAllObjects():Void;
	public  function enumerateObjectsWithOptions( opts:NSEnumerationOptions,  block:Dynamic):Void;
	public  function isSubsetOfSet( set:NSSet):Bool;
	public  function indexOfObjectAtIndexes( s:NSIndexSet,  opts:NSEnumerationOptions,  predicate:Dynamic):Int;
	public  function isEqualToOrderedSet( other:NSOrderedSet):Bool;
	public  function removeObject( object:Dynamic):Void;
	public  function minusOrderedSet( other:NSOrderedSet):Void;
	public  function unionSet( other:NSSet):Void;
	public  function description():String;
	public  function initWithObject( object:Dynamic):Dynamic;
	public  function insertObjects( objects:Array<>,  indexes:NSIndexSet):Void;
	public  function exchangeObjectAtIndex( idx1:Int,  idx2:Int):Void;
	public  function insertObject( object:Dynamic,  idx:Int):Void;
	public  function addObject( object:Dynamic):Void;
	public  function unionOrderedSet( other:NSOrderedSet):Void;
	public  function objectsAtIndexes( indexes:NSIndexSet):Array<>;
	public  function array():Array<>;
	public  function descriptionWithLocale( locale:Dynamic):String;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function descriptionWithLocale1( locale:Dynamic,  level:Int):String;
	public  function replaceObjectsInRange( range:NSRange,  objects:constid[],  count:Int):Void;
	public  function intersectsOrderedSet( other:NSOrderedSet):Bool;
	public  function indexOfObjectWithOptions( opts:NSEnumerationOptions,  predicate:Dynamic):Int;
	public  function objectEnumerator():NSEnumerator;
	public  function initWithOrderedSet( set:NSOrderedSet):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithOrderedSet1( set:NSOrderedSet,  flag:Bool):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithOrderedSet2( set:NSOrderedSet,  range:NSRange,  flag:Bool):Dynamic;
	public  function setObject( obj:Dynamic,  idx:Int):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function setObject1( obj:Dynamic,  idx:Int):Void;
	public  function intersectSet( other:NSSet):Void;
	public  function count():Int;
	public  function enumerateObjectsUsingBlock( block:Dynamic):Void;
	public  function getObjects( objects:Dynamic,  range:NSRange):Void;
	public  function isSubsetOfOrderedSet( other:NSOrderedSet):Bool;
	public  function sortUsingComparator( cmptr:NSComparator):Void;
	public  function firstObject():Dynamic;
	public  function removeObjectsAtIndexes( indexes:NSIndexSet):Void;
	public  function moveObjectsAtIndexes( indexes:NSIndexSet,  idx:Int):Void;
	public  function sortWithOptions( opts:NSSortOptions,  cmptr:NSComparator):Void;
	public  function initWithArray( array:Array<>):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithArray1( set:Array<>,  flag:Bool):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithArray2( set:Array<>,  range:NSRange,  flag:Bool):Dynamic;
	public  function sortedArrayUsingComparator( cmptr:NSComparator):Array<>;
	public  function replaceObjectsAtIndexes( indexes:NSIndexSet,  objects:Array<>):Void;
	public  function indexOfObject( object:Dynamic):Int;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function indexOfObject1( object:Dynamic,  range:NSRange,  opts:NSBinarySearchingOptions,  cmp:NSComparator):Int;
	public  function indexesOfObjectsAtIndexes( s:NSIndexSet,  opts:NSEnumerationOptions,  predicate:Dynamic):NSIndexSet;
	public  function removeObjectAtIndex( idx:Int):Void;
	public  function set():NSSet;
	public  function reverseObjectEnumerator():NSEnumerator;
	public  function indexOfObjectPassingTest( predicate:Dynamic):Int;
	public  function containsObject( object:Dynamic):Bool;
	public  function removeObjectsInArray( array:Array<>):Void;
}

