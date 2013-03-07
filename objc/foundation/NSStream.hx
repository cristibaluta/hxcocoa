package objc.foundation;


@:framework("Foundation")
extern class NSStream {

	//Constants

	//Static Methods
	public  function outputStreamToMemory():Dynamic;
	public  function outputStreamWithURL( url:NSURL,  shouldAppend:Bool):Dynamic;
	public  function inputStreamWithFileAtPath( path:String):Dynamic;
	public  function getStreamsToHost( host:NSHost,  port:Int,  inputStream:NSInputStream*,  outputStream:NSOutputStream*):Void;
	public  function outputStreamToBuffer( buffer:uint8_t,  capacity:Int):Dynamic;
	public  function outputStreamToFileAtPath( path:String,  shouldAppend:Bool):Dynamic;
	public  function inputStreamWithURL( url:NSURL):Dynamic;
	public  function inputStreamWithData( data:NSData):Dynamic;

	//Properties

	//Methods
	public  function streamStatus():NSStreamStatus;
	public  function hasBytesAvailable():Bool;
	public  function initWithFileAtPath( path:String):Dynamic;
	public  function initToFileAtPath( path:String,  shouldAppend:Bool):Dynamic;
	public  function stream( aStream:NSStream,  eventCode:NSStreamEvent):Void;
	public  function scheduleInRunLoop( aRunLoop:NSRunLoop,  mode:String):Void;
	public  function close():Void;
	public  function streamError():NSError;
	public  function propertyForKey( key:String):Dynamic;
	public  function setProperty( property:Dynamic,  key:String):Bool;
	public  function hasSpaceAvailable():Bool;
	public  function open():Void;
	public  function initWithData( data:NSData):Dynamic;
	public  function delegate():id<NSStreamDelegate>;
	public  function setDelegate( delegate:id<NSStreamDelegate>):Void;
	public  function removeFromRunLoop( aRunLoop:NSRunLoop,  mode:String):Void;
	public  function write( buffer:constuint8_t,  len:Int):Int;
	public  function initToBuffer( buffer:uint8_t,  capacity:Int):Dynamic;
	public  function read( buffer:uint8_t,  len:Int):Int;
	public  function getBuffer( buffer:uint8_t*,  len:Int):Bool;
	public  function initToMemory():Dynamic;
	public  function initWithURL( url:NSURL):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithURL1( url:NSURL,  shouldAppend:Bool):Dynamic;
}

extern enum NSStreamStatus
{
	NSStreamStatusNotOpen;
	NSStreamStatusOpening;
	NSStreamStatusOpen;
	NSStreamStatusReading;
	NSStreamStatusWriting;
	NSStreamStatusAtEnd;
	NSStreamStatusClosed;
	NSStreamStatusError;
}

extern enum NSStreamEvent
{
	NSStreamEventNone;
	NSStreamEventOpenCompleted;
	NSStreamEventHasBytesAvailable;
	NSStreamEventHasSpaceAvailable;
	NSStreamEventErrorOccurred;
	NSStreamEventEndEncountered;
}

