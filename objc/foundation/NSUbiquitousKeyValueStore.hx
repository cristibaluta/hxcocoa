package objc.foundation;


extern class NSUbiquitousKeyValueStore
{

	//Constants

	//Static Methods
	public  function defaultStore():NSUbiquitousKeyValueStore;

	//Properties

	//Methods
	public  function objectForKey( aKey:String):Dynamic;
	public  function stringForKey( aKey:String):String;
	public  function dictionaryRepresentation():NSDictionary;
	public  function dictionaryForKey( aKey:String):NSDictionary;
	public  function setLongLong( value:longlong,  aKey:String):Void;
	public  function setBool( value:Bool,  aKey:String):Void;
	public  function setArray( anArray:Array<>,  aKey:String):Void;
	public  function synchronize():Bool;
	public  function setObject( anObject:Dynamic,  aKey:String):Void;
	public  function setString( aString:String,  aKey:String):Void;
	public  function setData( aData:NSData,  aKey:String):Void;
	public  function boolForKey( aKey:String):Bool;
	public  function removeObjectForKey( aKey:String):Void;
	public  function doubleForKey( aKey:String):Float;
	public  function dataForKey( aKey:String):NSData;
	public  function setDictionary( aDictionary:NSDictionary,  aKey:String):Void;
	public  function arrayForKey( aKey:String):Array<>;
	public  function setDouble( value:Float,  aKey:String):Void;
	public  function longLongForKey( aKey:String):longlong;
}

extern enum null
{
}

