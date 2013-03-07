package objc.foundation;
import objc.foundation.NSObject;

extern class NSIndexPath implements NSCopying implements NSCoding {

	public static function indexPathWithIndexes (indexes:Array<Int>, length:Int) :NSIndexPath;
	public static function indexPathWithIndex (index:Int) :NSIndexPath;
	
	public function initWithIndexm(index:Int) :NSIndexPath;
	public function initWithIndexes (indexes:Array<Int>, length:Int) :NSIndexPath;
	
	public  function indexPathByAddingIndex( index:Int):NSIndexPath;
	public  function indexPathByRemovingLastIndex():NSIndexPath;
	
	public  function indexAtPosition( position:Int):Int;
	public  function length():Int;
	
	public  function getIndexes( indexes:Int) :Void;
	public  function compare( otherObject:NSIndexPath) :NSComparisonResult;

}

