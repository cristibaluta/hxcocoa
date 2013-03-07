package objc.foundation;
import objc.foundation.NSObject;
import objc.foundation.NSDictionary;


extern class NSThread extends NSObject {

	public static function currentThread () :NSThread;
	public static function detachNewThreadSelector (selector:SEL, toTarget:Dynamic, withObject:Dynamic) :Void;
	public static function isMultiThreaded () :Bool;

	public function threadDictionary () :NSMutableDictionary;

	public static function sleepUntilDate (date:Date) :Void;
	public static function sleepForTimeInterval (ti:Float) :Void;
	public static function exit() :Void;
	public static function threadPriority () :Float;
	public static function setThreadPriority (p:Float) :Bool;

	//public function threadPriority():Float;
	//public function setThreadPriority (p:Float):Void;

	public static function callStackReturnAddresses():Array<String>;
	public static function callStackSymbols():Array<String>;

	public function setName (n:String) :Void;
	public function name () :String;

	public function stackSize():Int;
	public function setStackSize (s:Int):Void;
	
	//public function isMainThread():Bool;
	public static function isMainThread():Bool;
	public static function mainThread():NSThread;

	override public function init():NSThread;
	public function initWithTarget (target:Dynamic, selector:SEL, object:Dynamic):NSThread;

	public function isExecuting():Bool;
	public function isFinished():Bool;
	
	public function isCancelled():Bool;
	public function cancel():Void;
	public function start():Void;
	public function main():Void;
}
