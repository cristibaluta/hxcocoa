package objc.foundation;


extern class NSMethodSignature extends NSObject {

	//Constants

	//Static Methods
	public static function signatureWithObjCTypes( types:String) :NSMethodSignature;

	//Properties

	//Methods
	public  function isOneway():Bool;
	public  function frameLength():Int;
	public  function numberOfArguments():Int;
	public  function getArgumentTypeAtIndex( idx:Int):String;
	public  function methodReturnType():String;
	public  function methodReturnLength():Int;
}
