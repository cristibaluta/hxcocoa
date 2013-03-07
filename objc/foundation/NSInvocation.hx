package objc.foundation;


extern class NSInvocation extends NSObject
{

	//Constants

	//Static Methods
	public static function invocationWithMethodSignature (sig:NSMethodSignature) :NSInvocation;

	//Properties

	//Methods
	public  function target():Dynamic;
	public  function setTarget( target:Dynamic):Void;
	
	public  function selector():SEL;
	public  function setSelector( selector:SEL):Void;
	
	public  function retainArguments():Void;
	public  function argumentsRetained():Bool;
	public  function methodSignature():NSMethodSignature;
	
	public  function getReturnValue( retLoc:Dynamic):Void;
	public  function setReturnValue( retLoc:Dynamic):Void;
	
	public  function getArgument( argumentLocation:Dynamic,  idx:Int):Void;
	public  function setArgument( argumentLocation:Dynamic,  idx:Int):Void;
	
	public  function invoke():Void;
	public  function invokeWithTarget( target:Dynamic):Void;
}

