package objc.quartz;

import objc.Foundation.NSObject;


extern class CATransaction extends NSObject {

	public static function begin () :Void;
	public static function commit () :Void;
	public static function flush () :Void;
	public static function lock () :Void;
	public static function unlock () :Void;
	
	public static function animationDuration () :Float;
	public static function setAnimationDuration (dur:Float) :Void;

	public static function animationTimingFunction () :CAMediaTimingFunction;
	public static function setAnimationTimingFunction (function:CAMediaTimingFunction) :Void;

	public static function disableActions () :Bool;
	public static function setDisableActions (flag:Bool) :Void;

	public static function completionBlock () :Void->Void;
	public static function setCompletionBlock (block:Void->Void) :Void;

	public static function valueForKey (key:String) :Dynamic;
	public static function setValue (anObject:Dynamic, forKey:String) :Void;

}
