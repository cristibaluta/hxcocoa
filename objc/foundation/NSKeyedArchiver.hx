package objc.foundation;


extern class NSKeyedArchiver extends NSCoder
{

	//Constants
	static public inline var _bytes:*;

	//Static Methods
	public  function archiveRootObject( rootObject:Dynamic,  path:String):Bool;
	public  function classNameForClass( cls:Class):String;
	public  function setClass( cls:Class,  codedName:String):Void;
	public  function classForKeyedUnarchiver():Class;
	public  function setClassName( codedName:String,  cls:Class):Void;
	public  function classForClassName( codedName:String):Class;
	public  function unarchiveObjectWithFile( path:String):Dynamic;
	public  function classFallbacksForKeyedArchiver():Array<>;
	public  function archivedDataWithRootObject( rootObject:Dynamic):NSData;
	public  function unarchiveObjectWithData( data:NSData):Dynamic;

	//Properties

	//Methods
	public override function encodeInt64( intv:int64_t,  key:String):Void;
	public  function unarchiver( unarchiver:NSKeyedUnarchiver,  name:String,  classNames:Array<>):Class;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function unarchiver1( unarchiver:NSKeyedUnarchiver,  NS_RELEASES_ARGUMENT:Dynamic):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function unarchiver2( unarchiver:NSKeyedUnarchiver,  object:Dynamic,  newObject:Dynamic):Void;
	public  function classForClassName( codedName:String):Class;
	public override function decodeObjectForKey( key:String):Dynamic;
	public override function containsValueForKey( key:String):Bool;
	public override function decodeInt32ForKey( key:String):int32_t;
	public override function encodeBytes( bytesp:constuint8_t,  lenv:Int,  key:String):Void;
	public override function decodeInt64ForKey( key:String):int64_t;
	public  function classForKeyedArchiver():Class;
	public  function initForWritingWithMutableData( data:NSMutableData):Dynamic;
	public  function setDelegate( delegate:id<NSKeyedArchiverDelegate>):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function setDelegate1( delegate:id<NSKeyedUnarchiverDelegate>):Void;
	public  function delegate():id<NSKeyedArchiverDelegate>;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function delegate1():id<NSKeyedUnarchiverDelegate>;
	public  function setClassName( codedName:String,  cls:Class):Void;
	public override function decodeDoubleForKey( key:String):Float;
	public  function archiver( archiver:NSKeyedArchiver,  object:Dynamic):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function archiver1( archiver:NSKeyedArchiver,  object:Dynamic):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function archiver2( archiver:NSKeyedArchiver,  object:Dynamic,  newObject:Dynamic):Void;
	public override function decodeIntForKey( key:String):Int;
	public  function archiverWillFinish( archiver:NSKeyedArchiver):Void;
	public  function finishEncoding():Void;
	public override function encodeFloat( realv:Float,  key:String):Void;
	public override function decodeBoolForKey( key:String):Bool;
	public  function archiverDidFinish( archiver:NSKeyedArchiver):Void;
	public override function encodeConditionalObject( objv:Dynamic,  key:String):Void;
	public  function finishDecoding():Void;
	public  function unarchiverWillFinish( unarchiver:NSKeyedUnarchiver):Void;
	public override function encodeInt( intv:Int,  key:String):Void;
	public override function encodeDouble( realv:Float,  key:String):Void;
	public  function initForReadingWithData( data:NSData):Dynamic;
	public  function unarchiverDidFinish( unarchiver:NSKeyedUnarchiver):Void;
	public override function encodeBool( boolv:Bool,  key:String):Void;
	public override function decodeFloatForKey( key:String):Float;
	public override function encodeObject( objv:Dynamic,  key:String):Void;
	public override function decodeBytesForKey( key:String,  lengthp:Int):constuint8_t;
	public  function setOutputFormat( format:NSPropertyListFormat):Void;
	public  function classNameForClass( cls:Class):String;
	public  function setClass( cls:Class,  codedName:String):Void;
	public  function replacementObjectForKeyedArchiver( archiver:NSKeyedArchiver):Dynamic;
	public  function outputFormat():NSPropertyListFormat;
	public override function encodeInt32( intv:int32_t,  key:String):Void;
}

