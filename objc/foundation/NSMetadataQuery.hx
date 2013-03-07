package objc.foundation;


extern class NSMetadataQuery
{

	//Constants

	//Static Methods

	//Properties

	//Methods
	public  function setPredicate( predicate:NSPredicate):Void;
	public  function resultCount():Int;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function resultCount1():Int;
	public  function results():Array<>;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function results1():Array<>;
	public  function isGathering():Bool;
	public  function valueForAttribute( key:String):Dynamic;
	public  function setNotificationBatchingInterval( ti:NSTimeInterval):Void;
	public  function value():Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function value1():Dynamic;
	public  function delegate():id<NSMetadataQueryDelegate>;
	public  function setDelegate( delegate:id<NSMetadataQueryDelegate>):Void;
	public  function isStarted():Bool;
	public  function count():Int;
	public  function disableUpdates():Void;
	public  function setSearchScopes( scopes:Array<>):Void;
	public  function setGroupingAttributes( attrs:Array<>):Void;
	public  function notificationBatchingInterval():NSTimeInterval;
	public  function groupedResults():Array<>;
	public  function attribute():String;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function attribute1():String;
	public  function predicate():NSPredicate;
	public  function groupingAttributes():Array<>;
	public  function indexOfResult( result:Dynamic):Int;
	public  function setSortDescriptors( descriptors:Array<>):Void;
	public  function sortDescriptors():Array<>;
	public  function stopQuery():Void;
	public  function searchScopes():Array<>;
	public  function setValueListAttributes( attrs:Array<>):Void;
	public  function enableUpdates():Void;
	public  function startQuery():Bool;
	public  function resultAtIndex( idx:Int):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function resultAtIndex1( idx:Int):Dynamic;
	public  function metadataQuery( query:NSMetadataQuery,  result:NSMetadataItem):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function metadataQuery1( query:NSMetadataQuery,  attrName:String,  attrValue:Dynamic):Dynamic;
	public  function attributes():Array<>;
	public  function isStopped():Bool;
	public  function valueListAttributes():Array<>;
	public  function valuesForAttributes( keys:Array<>):NSDictionary;
	public  function init():Dynamic;
	public  function valueLists():NSDictionary;
	public  function valueOfAttribute( attrName:String,  idx:Int):Dynamic;
	public  function subgroups():Array<>;
}

