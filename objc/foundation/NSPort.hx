package objc.foundation;


extern class NSPort implements NSCopying implements NSCoding
{

	//Constants

	//Static Methods
	public  function port():NSPort;
	public  function portWithMachPort( machPort:uint32_t):NSPort;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function portWithMachPort1( machPort:uint32_t,  f:Int):NSPort;

	//Properties

	//Methods
	public  function reservedSpaceLength():Int;
	public  function handlePortMessage( message:NSPortMessage):Void;
	public  function machPort():uint32_t;
	public  function initWithProtocolFamily( family:Int,  type:Int,  protocol:Int,  address:NSData):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithProtocolFamily1( family:Int,  type:Int,  protocol:Int,  sock:NSSocketNativeHandle):Dynamic;
	public  function socket():NSSocketNativeHandle;
	public  function removeConnection( conn:NSConnection,  runLoop:NSRunLoop,  mode:String):Void;
	public  function scheduleInRunLoop( runLoop:NSRunLoop,  mode:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function scheduleInRunLoop1( runLoop:NSRunLoop,  mode:String):Void;
	public  function sendBeforeDate( limitDate:Date,  components:NSMutableArray,  receivePort:NSPort,  headerSpaceReserved:Int):Bool;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function sendBeforeDate1( limitDate:Date,  msgID:Int,  components:NSMutableArray,  receivePort:NSPort,  headerSpaceReserved:Int):Bool;
	public  function initWithTCPPort( port:unsignedshort):Dynamic;
	public  function initRemoteWithTCPPort( port:unsignedshort,  hostName:String):Dynamic;
	public  function protocolFamily():Int;
	public  function invalidate():Void;
	public  function protocol():Int;
	public  function setDelegate( anObject:id<NSPortDelegate>):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function setDelegate1( anObject:id<NSMachPortDelegate>):Void;
	public  function delegate():id<NSPortDelegate>;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function delegate1():id<NSMachPortDelegate>;
	public  function removeFromRunLoop( runLoop:NSRunLoop,  mode:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function removeFromRunLoop1( runLoop:NSRunLoop,  mode:String):Void;
	public  function initRemoteWithProtocolFamily( family:Int,  type:Int,  protocol:Int,  address:NSData):Dynamic;
	public  function socketType():Int;
	public  function handleMachMessage( msg:Dynamic):Void;
	public  function addConnection( conn:NSConnection,  runLoop:NSRunLoop,  mode:String):Void;
	public  function isValid():Bool;
	public  function initWithMachPort( machPort:uint32_t):Dynamic;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function initWithMachPort1( machPort:uint32_t,  f:Int):Dynamic;
	public  function init():Dynamic;
	public  function address():NSData;
}

extern enum null
{
}

