package swift.foundation;

import swift.foundation.NSObjCRuntime;

typedef Protocol = Dynamic;
typedef IMP = Dynamic;

@:framework("Foundation")
extern class NSObject {

	public function new () :Void;// This is used by the compiler only, there's no 'new' method in swift
	
	// Sending Messages

	@:overload( function (aSelector:SEL, withObject:Dynamic, waitUntilDone:Bool, modes:Array<String>) :Void {} )
	public function performSelectorOnMainThread (aSelector:SEL, withObject:Dynamic, waitUntilDone:Bool):Void;
	
	@:overload( function (aSelector:SEL, onThread:NSThread, withObject:Dynamic, waitUntilDone:Bool, modes:Array<String>):Void {} )
	public function performSelector (aSelector:SEL, onThread:NSThread, withObject:Dynamic, waitUntilDone:Bool):Void;
	
	public function performSelectorInBackground (aSelector:SEL, withObject:Dynamic):Void;
	
/*	function performSelector:withObject:afterDelay:
	function performSelector:withObject:afterDelay:inModes:
	function performSelectorOnMainThread:withObject:waitUntilDone:
	function performSelectorOnMainThread:withObject:waitUntilDone:modes:
	function performSelector:onThread:withObject:waitUntilDone:
	function performSelector:onThread:withObject:waitUntilDone:modes:
	function performSelectorInBackground:withObject:
	static function cancelPreviousPerformRequestsWithTarget:
	static function cancelPreviousPerformRequestsWithTarget:selector:object:*/
	
	// Forwarding Messages
/*	function forwardingTargetForSelector:*/
/*	function forwardInvocation:*/


/***********	Base class		***********/

	public static function load () :Void;

	public static function initialize () :Void;
	public function init () :NSObject;

/*	public static function allocWithZone (zone:NSZone) :NSObject;*/
	public static function alloc () :NSObject;
	//public function dealloc () :Void;

	public function finalize () :Void;

	public function copy () :NSObject;
	public function mutableCopy () :NSObject;

/*	public static function copyWithZone (zone:NSZone) :NSObject;
	public static function mutableCopyWithZone (zone:NSZone) :NSObject;*/

	public static function superclass () :Class<Dynamic>;
	public static function __class__ () :Class<Dynamic>;
	public static function instancesRespondToSelector (aSelector:SEL) :Bool;
	public static function conformsToProtocol (protocol:Protocol) :Bool;
	public function methodForSelector (aSelector:SEL) :IMP;
	public static function instanceMethodForSelector (aSelector:SEL) :IMP;
	public function doesNotRecognizeSelector (aSelector:SEL) :Void;

	public function forwardingTargetForSelector (aSelector:SEL) :NSObject;
	public function forwardInvocation (anInvocation:NSInvocation) :Void;
	public function methodSignatureForSelector (aSelector:SEL) :NSMethodSignature;

	public static function instanceMethodSignatureForSelector (aSelector:SEL) :NSMethodSignature;

	//public function allowsWeakReference () :Void;
	//public function retainWeakReference () :Void;

	public static function description () :String;
	
	public static function isSubclassOfClass (aClass:Class<Dynamic>) :Bool;
	
	public static function resolveClassMethod (sel:SEL) :Bool;
	public static function resolveInstanceMethod (sel:SEL) :Bool;
	
	// NSCoderMethods
	
	public static function version () :Int;
	public static function setVersion(aVersion:Int) :Void;
	public function classForCoder () :Class<Dynamic>;
	public function replacementObjectForCoder (aCoder:NSCoder) :NSObject;
	public function awakeAfterUsingCoder (aDecoder:NSCoder) :NSObject;

//	(UIResponderStandardEditActions)   // these methods are not implemented in NSObject

/*		public function cut:(id)sender NS_AVAILABLE_IOS(3_0);
		public function copy:(id)sender NS_AVAILABLE_IOS(3_0);
		public function paste:(id)sender NS_AVAILABLE_IOS(3_0);
		public function select:(id)sender NS_AVAILABLE_IOS(3_0);
		public function selectAll:(id)sender NS_AVAILABLE_IOS(3_0);
		public function delete:(id)sender NS_AVAILABLE_IOS(3_2);
		public function makeTextWritingDirectionLeftToRight:(id)sender NS_AVAILABLE_IOS(5_0);
		public function makeTextWritingDirectionRightToLeft:(id)sender NS_AVAILABLE_IOS(5_0);
		public function toggleBoldface:(id)sender NS_AVAILABLE_IOS(6_0);
		public function toggleItalics:(id)sender NS_AVAILABLE_IOS(6_0);
		public function toggleUnderline:(id)sender NS_AVAILABLE_IOS(6_0);*/

}


/***************	Basic protocols		***************/
// Having an interface and a class with the same name causes problems
@:framework("Foundation")
extern interface NSObjectProtocol {

	public function isEqual (object:Dynamic) :Bool;
	public function hash () :Int;

	public function superclass () :Class<Dynamic>;
	public function __class__ () :Class<Dynamic>;
	public function self () :NSObject;

	//public function performSelector (aSelector:SEL) :NSObject;
	public function performSelector (aSelector:SEL, withObject:Dynamic) :NSObject;
	//public function performSelector (aSelector:SEL, withObject:Dynamic, withObject:Dynamic) :NSObject;

	public function isProxy () :Bool;

	public function isKindOfClass (aClass:Class<Dynamic>) :Bool;
	public function isMemberOfClass (aClass:Class<Dynamic>) :Bool;
	public function conformsToProtocol (aProtocol:Protocol) :Bool;

	public function respondsToSelector (aSelector:SEL) :Bool;

	public function description () :String;

}

/***********	Discardable Content		***********/
@:framework("Foundation")
extern interface NSDiscardableContent {

/*	public function beginContentAccess () :Bool;
	public function endContentAccess () :Void;
	public function discardContentIfPossible () :Void;
	public function isContentDiscarded () :Bool;*/

}

@:framework("Foundation")
extern interface  NSCopying {
#if display
	public function copyWithZone (zone:NSZone) :NSObject;
#end
}

@:framework("Foundation")
extern interface  NSMutableCopying {

	//public function mutableCopyWithZone (zone:NSZone) :NSObject;

}

@:framework("Foundation")
extern interface NSCoding {

	//public function encodeWithCoder (aCoder:NSCoder) :Void;
	//public function initWithCoder (aDecoder:NSCoder) :NSObject;

}

@:framework("Foundation")
extern interface NSSecureCoding {
	
	//public static function supportsSecureCoding () :Bool;
	
}
