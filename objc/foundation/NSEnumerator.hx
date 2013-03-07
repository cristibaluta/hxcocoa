package objc.foundation;

extern class NSEnumerator extends NSObject/* implements NSFastEnumeration*/{
	public function nextObject () :Dynamic;
	public function allObjects () :Array<Dynamic>;
	//public  function countByEnumeratingWithState( state:NSFastEnumerationState,  buffer:Dynamic,  len:Int):Int;
}
