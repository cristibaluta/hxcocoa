package objc.foundation;


extern class NSProxy implements NSObject {

	public static function alloc () :Dynamic;
	public static function allocWithZone (zone:NSZone) :Dynamic;
	public static function respondsToSelector (aSelector:SEL) :Bool;
	public static function class():Class<Dynamic>;
	
	public function methodSignatureForSelector (sel:SEL) :NSMethodSignature;
	public function forwardInvocation (invocation:NSInvocation) :Void;
	public function debugDescription():String;
	public function dealloc():Void;
	public function finalize():Void;
	public function description():String;
	
	//public  function allowsWeakReference():Bool;
	//public  function retainWeakReference():Bool;
}

