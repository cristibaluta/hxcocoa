package objc.foundation;

@:framework("Foundation")
extern class NSTimer extends NSObject {
	
	//public static function timerWithTimeInterval (ti:Float, invocation:NSInvocation, repeats:Bool) :NSTimer;
	//public static function scheduledTimerWithTimeInterval (ti:Float, invocation:NSInvocation, repeats:Bool) :NSTimer;
	
	public static function timerWithTimeInterval (ti:Float, target:Dynamic, selector:SEL, userInfo:Dynamic, repeats:Bool) :NSTimer;
	public static function scheduledTimerWithTimeInterval (ti:Float, target:Dynamic, selector:SEL, userInfo:Dynamic, repeats:Bool) :NSTimer;
	
	public function initWithFireDate (date:Date, interval:Float, target:Dynamic, selector:SEL, userInfo:Dynamic, repeats:Bool) :NSTimer;
	public function fire () :Void;
	public function fireDate () :Date;
	public function setFireDate (date:Date) :Void;
	public function userInfo () :Dynamic;
	public function timeInterval () :Float;
	public function invalidate () :Void;
	public function isValid () :Bool;
}
