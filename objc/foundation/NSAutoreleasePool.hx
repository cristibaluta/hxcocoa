package objc.foundation;

@:framework("Foundation")
extern class NSAutoreleasePool {

	//public static function addObject( anObject:Dynamic):Void;
	public function addObject( anObject:Dynamic):Void;
	public function drain():Void;
}
