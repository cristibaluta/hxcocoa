package objc.foundation;


extern class NSOperation
{

	//Constants

	//Static Methods
	public  function currentQueue():Dynamic;
	public  function blockOperationWithBlock( block:Dynamic):Dynamic;
	public  function mainQueue():Dynamic;

	//Properties

	//Methods
	public  function setMaxConcurrentOperationCount( cnt:Int):Void;
	public  function executionBlocks():Array<>;
	public  function addOperation( op:NSOperation):Void;
	public  function setQueuePriority( p:NSOperationQueuePriority):Void;
	public  function setSuspended( b:Bool):Void;
	public  function addOperations( ops:Array<>,  wait:Bool):Void;
	public  function setName( n:String):Void;
	public  function operations():Array<>;
	public  function isCancelled():Bool;
	public  function dependencies():Array<>;
	public  function cancelAllOperations():Void;
	public  function start():Void;
	public  function initWithInvocation( inv:NSInvocation):Dynamic;
	public  function initWithTarget( target:Dynamic,  sel:SEL,  arg:Dynamic):Dynamic;
	public  function main():Void;
	public  function threadPriority():Float;
	public  function addExecutionBlock( block:Dynamic):Void;
	public  function removeDependency( op:NSOperation):Void;
	public  function name():String;
	public  function (():Dynamic;
	public  function setThreadPriority( p:Float):Void;
	public  function invocation():NSInvocation;
	public  function queuePriority():NSOperationQueuePriority;
	public  function isExecuting():Bool;
	public  function isFinished():Bool;
	public  function addDependency( op:NSOperation):Void;
	public  function result():Dynamic;
	public  function isReady():Bool;
	public  function isSuspended():Bool;
	public  function isConcurrent():Bool;
	public  function waitUntilFinished():Void;
	public  function maxConcurrentOperationCount():Int;
	public  function cancel():Void;
	public  function waitUntilAllOperationsAreFinished():Void;
	public  function setCompletionBlock( block:Dynamic):Void;
	public  function addOperationWithBlock( block:Dynamic):Void;
	public  function init():Dynamic;
	public  function operationCount():Int;
}

extern enum NSOperationQueuePriority
{
	NSOperationQueuePriorityVeryLow;
	NSOperationQueuePriorityLow;
	NSOperationQueuePriorityNormal;
	NSOperationQueuePriorityHigh;
	NSOperationQueuePriorityVeryHigh;
}

extern enum null
{
}

