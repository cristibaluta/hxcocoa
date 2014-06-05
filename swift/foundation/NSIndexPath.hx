package swift.foundation;
import swift.foundation.NSObject;
import swift.foundation.NSString;

@:framework("Foundation")
extern class NSIndexPath implements NSCopying implements NSCoding {

	public static function indexPathWithIndexes (indexes:Array<Int>, length:Int) :NSIndexPath;
	public static function indexPathWithIndex (index:Int) :NSIndexPath;
	
	public function initWithIndexm(index:Int) :NSIndexPath;
	public function initWithIndexes (indexes:Array<Int>, length:Int) :NSIndexPath;
	
	public function indexPathByAddingIndex( index:Int):NSIndexPath;
	public function indexPathByRemovingLastIndex():NSIndexPath;
	
	public function indexAtPosition( position:Int):Int;
	public function length():Int;
	
	public function getIndexes( indexes:Int) :Void;
	//public function compare( otherObject:NSIndexPath) :NSComparisonResult;
	
	
	// UITableView category
	public static function indexPathForRow (row:Int, inSection:Int) :NSIndexPath;

	public var section (default, null) :Int;
	public var row (default, null) :Int;
	
	// (UICollectionViewAdditions)
	public static function indexPathForItem (item:Int, inSection:Int) :NSIndexPath;
	public var item :Int;
	
}

