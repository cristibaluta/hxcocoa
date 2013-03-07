package objc.foundation;


extern class NSPredicate implements NSCoding implements NSCopying
{

	//Constants

	//Static Methods
	public  function predicateWithValue( value:Bool):NSPredicate;
	public  function predicateWithFormat( predicateFormat:String,  arguments:Array<>):NSPredicate;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function predicateWithFormat1( predicateFormat:String):NSPredicate;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function predicateWithFormat2( predicateFormat:String,  argList:va_list):NSPredicate;
	public  function predicateWithBlock( block:Dynamic):NSPredicate;

	//Properties

	//Methods
	public  function filteredSetUsingPredicate( predicate:NSPredicate):NSSet;
	public  function evaluateWithObject( object:Dynamic):Bool;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function evaluateWithObject1( object:Dynamic,  bindings:NSDictionary):Bool;
	public  function filteredArrayUsingPredicate( predicate:NSPredicate):Array<>;
	public  function filterUsingPredicate( predicate:NSPredicate):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function filterUsingPredicate1( predicate:NSPredicate):Void;
	public  function predicateFormat():String;
	public  function predicateWithSubstitutionVariables( variables:NSDictionary):NSPredicate;
}

