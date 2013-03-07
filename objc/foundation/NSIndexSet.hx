package objc.foundation;
import objc.foundation.NSObject;

private typedef NSEnumerationOptions = Dynamic;
private typedef NSSortOptions = Dynamic;
private typedef NSComparator = Dynamic;

extern class NSIndexSet extends NSObject implements NSCopying implements NSMutableCopying implements NSCoding
{

	//Constants

	//Static Methods
	public  function indexSetWithIndexesInRange( range:NSRange):Dynamic;
	public  function indexSetWithIndex( value:Int):Dynamic;
	public  function indexSet():Dynamic;

	//Properties

	//Methods
	public  function indexPassingTest( predicate:Dynamic):Int;
	public  function indexGreaterThanIndex( value:Int):Int;
	public  function removeAllIndexes():Void;
	public  function initWithIndex( value:Int):Dynamic;
	public  function enumerateIndexesWithOptions( opts:NSEnumerationOptions,  block:Dynamic):Void;
	public  function indexesInRange( range:NSRange,  opts:NSEnumerationOptions,  predicate:Dynamic):NSIndexSet;
	public  function removeIndexes( indexSet:NSIndexSet):Void;
	public  function removeIndexesInRange( range:NSRange):Void;
	//public  function getIndexes( indexBuffer:Int,  bufferSize:Int,  range:NSRangePointer):Int;
	public  function countOfIndexesInRange( range:NSRange):Int;
	public  function indexesPassingTest( predicate:Dynamic):NSIndexSet;
	public  function count():Int;
	public  function containsIndex( value:Int):Bool;
	public  function initWithIndexSet( indexSet:NSIndexSet):Dynamic;
	public  function indexLessThanIndex( value:Int):Int;
	public  function enumerateRangesWithOptions( opts:NSEnumerationOptions,  block:Dynamic):Void;
	public  function removeIndex( value:Int):Void;
	public  function addIndexes( indexSet:NSIndexSet):Void;
	public  function enumerateRangesUsingBlock( block:Dynamic):Void;
	public  function indexWithOptions( opts:NSEnumerationOptions,  predicate:Dynamic):Int;
	public  function indexInRange( range:NSRange,  opts:NSEnumerationOptions,  predicate:Dynamic):Int;
	public  function enumerateRangesInRange( range:NSRange,  opts:NSEnumerationOptions,  block:Dynamic):Void;
	public  function containsIndexes( indexSet:NSIndexSet):Bool;
	public  function enumerateIndexesInRange( range:NSRange,  opts:NSEnumerationOptions,  block:Dynamic):Void;
	public  function addIndex( value:Int):Void;
	public  function indexLessThanOrEqualToIndex( value:Int):Int;
	public  function shiftIndexesStartingAtIndex( index:Int,  delta:Int):Void;
	public  function lastIndex():Int;
	public  function intersectsIndexesInRange( range:NSRange):Bool;
	public  function indexesWithOptions( opts:NSEnumerationOptions,  predicate:Dynamic):NSIndexSet;
	public  function initWithIndexesInRange( range:NSRange):Dynamic;
	public  function firstIndex():Int;
	public  function isEqualToIndexSet( indexSet:NSIndexSet):Bool;
	public  function indexGreaterThanOrEqualToIndex( value:Int):Int;
	public  function addIndexesInRange( range:NSRange):Void;
	public  function enumerateIndexesUsingBlock( block:Dynamic):Void;
	public  function containsIndexesInRange( range:NSRange):Bool;
	override public  function init():Dynamic;
}

