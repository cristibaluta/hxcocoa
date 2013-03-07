package objc.quartz;

import objc.foundation.NSObject;

extern class CADisplayLink extends NSObject {

	public static function displayLinkWithTarget (target:Dynamic, selector:SEL) :CADisplayLink;

	public function addToRunLoop (runLoop:NSRunLoop, forMode:String) :Void;
	public function removeFromRunLoop (runLoop:NSRunLoop, forMode:String) :Void;
	public function invalidate () :Void;


	public var (default, null) timestamp :Float;
	public var (default, null) duration :Float;
	public var (isPaused, null) paused :Bool;
	public var frameInterval :Int;

}
