package objc.foundation;

@:framework("Foundation")
extern class NSRunLoop extends NSObject {

	public static function currentRunLoop () :NSRunLoop;
	public static function mainRunLoop () :NSRunLoop;

	public function currentMode () :String;
//- (CFRunLoopRef)getCFRunLoop;

	public function addTimer (timer:NSTimer, forMode:NSRunLoopMode) :Void;

	//public function addPort (aPort:NSPort, forMode:String) :Void;
	//public function removePort (aPort:NSPort, forMode:String) :Void;

	public function limitDateForMode (mode:String) :Date;
	public function acceptInputForMode (mode:String, beforeDate:Date) :Void;

	public function run () :Void;
	public function runUntilDate (limitDate:Date) :Void;
	public function runMode (mode:String, beforeDate:Date) :Bool;


	//public function performSelector (aSelector:SEL, target:Dynamic, argument:Dynamic, order:Int, modes:Array<String>) :Void;
	//public function cancelPerformSelector (aSelector:SEL, target:Dynamic, argument:Dynamic) :Void;
	//public function cancelPerformSelectorsWithTarget (target:Dynamic) :Void;
}

/**************** 	Delayed perform	 ******************/

/*extern class NSObject (NSDelayedPerforming)

- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay inModes:(Array<> *)modes;
- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay;
+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget selector:(SEL)aSelector object:(id)anArgument;
+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget;

}*/

@:framework("Foundation")
extern enum NSRunLoopMode {
	NSDefaultRunLoopMode;
	NSRunLoopCommonModes;
}