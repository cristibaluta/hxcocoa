package objc.foundation;


extern class NSSortDescriptor implements NSCoding implements NSCopying
{

	//Constants

	//Static Methods
	public  function sortDescriptorWithKey( key:String,  ascending:Bool):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function sortDescriptorWithKey1( key:String,  ascending:Bool,  selector:SEL):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function sortDescriptorWithKey2( key:String,  ascending:Bool,  cmptr:NSComparator):Dynamic;

	//Properties

	//Methods
	public  function selector():SEL;
	public  function compareObject( object1:Dynamic,  object2:Dynamic):NSComparisonResult;
	public  function comparator():NSComparator;
	public  function sortedArrayUsingDescriptors( sortDescriptors:Array<>):Array<>;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function sortedArrayUsingDescriptors1( sortDescriptors:Array<>):Array<>;
	public  function sortUsingDescriptors( sortDescriptors:Array<>):Void;
	public  function initWithKey( key:String,  ascending:Bool):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithKey1( key:String,  ascending:Bool,  selector:SEL):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithKey2( key:String,  ascending:Bool,  cmptr:NSComparator):Dynamic;
	public  function key():String;
	public  function ascending():Bool;
	public  function reversedSortDescriptor():Dynamic;
}

