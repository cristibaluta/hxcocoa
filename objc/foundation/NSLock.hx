package objc.foundation;

extern interface NSLocking {
	public function lock() :Void;
	public function unlock() :Void;
}

extern class NSLock extends NSObject implements NSLocking {

	public function tryLock () :Bool;
	public function lockBeforeDate (limit:Date) :Bool;
	public function name () :String;
	public function setName (n:String) :Void;
}

extern class NSConditionLock extends NSObject implements NSLocking {

	public function initWithCondition (condition:Int) :NSConditionLock;
	public function condition () :Int;
	public function lockWhenCondition (condition:Int) :Void;
	public function tryLock () :Bool;
	public function tryLockWhenCondition (condition:Int) :Bool;
	public function unlockWithCondition (condition:Int) :Void;
	public function lockBeforeDate (limit:Date) :Bool;
	public function lockWhenCondition1 (condition:Int, beforeDate:Date) :Bool;
	public function name () :String;
	public function setName (n:String) :Void;
}

extern class NSRecursiveLock extends NSObject implements NSLocking {

	public function tryLock () :Bool;
	public function lockBeforeDate (limit:Date) :Bool;
	public function name () :String;
	public function setName (n:String) :Void;
}

extern class NSCondition extends NSObject implements NSLocking {
	
	public function wait () :Void;
	public function waitUntilDate ( limit:Date) :Bool;
	public function signal () :Void;
	public function broadcast () :Void;
	public function name () :String;
	public function setName (n:String) :Void;
}
