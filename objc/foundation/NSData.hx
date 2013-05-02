package objc.foundation;

@:framework("Foundation")
extern enum NSDataReadingOptions {
    NSDataReadingMappedIfSafe;
    NSDataReadingUncached;
    NSDataReadingMappedAlways;
}

@:framework("Foundation")
extern enum NSDataWritingOptions {	                          
    NSDataWritingAtomic;
    NSDataWritingFileProtectionNone;
    NSDataWritingFileProtectionComplete;
    NSDataWritingFileProtectionCompleteUnlessOpen;
    NSDataWritingFileProtectionCompleteUntilFirstUserAuthentication;
    NSDataWritingFileProtectionMask;
}


/****************	Data Search Options	****************/

@:framework("Foundation")
extern enum NSDataSearchOptions {
    NSDataSearchBackwards;
    NSDataSearchAnchored;
}

/****************	Immutable Data		****************/


@:framework("Foundation")
extern class NSData extends NSObject/* implements NSCopying, NSMutableCopying, NSCoding*/ {
	
	public function length () :Int;
	public function bytes () :Dynamic;

	// (NSExtendedData)
	public function description () :String;
	public function getBytes (buffer:Void, length:Int) :Void;
	//public function getBytes (buffer:Void, range:NSRange) :Void;
	public function isEqualToData (other:NSData) :Bool;
	public function subdataWithRange (range:NSRange) :NSData;
	public function writeToFile (path:String, atomically:Bool) :Bool;
	public function writeToURL (url:NSURL, atomically:Bool) :Bool;
	//public function writeToFile (path:String, options:NSDataWritingOptions, error:NSError) :Bool;
	//public function writeToURL (url:NSURL, options:NSDataWritingOptions, error:NSError) :Bool;
	public function rangeOfData (dataToFind:NSData, options:NSDataSearchOptions, range:NSRange) :NSRange;

	// (NSDataCreation)
	public static function data () :NSData;
	public static function dataWithBytes (bytes:Void, length:Int) :NSData;
	public static function dataWithBytesNoCopy (bytes:Void, length:Int) :NSData;
	//public static function dataWithBytesNoCopy (bytes:Void, length:Int, freeWhenDone:Bool) :NSData;
	//public static function dataWithContentsOfFile (path:String, options:NSDataReadingOptions, error:NSError) :NSData;
	//public static function dataWithContentsOfURL (url:NSURL, options:NSDataReadingOptions, error:NSError) :NSData;
	public static function dataWithContentsOfFile (string:String) :NSData;
	public static function dataWithContentsOfURL (url:NSURL) :NSData;
	public function initWithBytes (bytes:Void, length:Int) :NSData;
	public function initWithBytesNoCopy (bytes:Void, length:Int) :NSData;
	//public function initWithBytesNoCopy (bytes:Void, length:Int, freeWhenDone:Bool)b;
	//public function initWithContentsOfFile (path:String, options:NSDataReadingOptions, error:NSError) :NSData;
	//public function initWithContentsOfURL (url:NSURL, options:NSDataReadingOptions, error:NSError) :NSData;
	public function initWithContentsOfFile (string:String) :NSData;
	public function initWithContentsOfURL (url:NSURL) :NSData;
	public function initWithData (data:NSData) :NSData;
	public static function dataWithData (data:NSData) :NSData;

}


/****************	Mutable Data		****************/


@:framework("Foundation")
extern class NSMutableData extends NSData {
	
	public var mutableBytes :Dynamic;
	public function setLength (length:Int) :Void;
	public function appendBytes (bytes:Dynamic, length:Int) :Void;
	
	// (NSExtendedMutableData)
	public function appendData (other:NSData) :Void;
	public function increaseLengthBy (extraLength:Int) :Void;
	public function replaceBytesInRange (range:NSRange, withBytes:Void) :Void;
	public function resetBytesInRange (range:NSRange) :Void;
	public function setData (data:NSData) :Void;
	//public function replaceBytesInRange (range:NSRange, withBytes:Void, length:Int) :Void;
	
	// (NSMutableDataCreation)
	public static function dataWithCapacity (aNumItems:Int) :NSMutableData;
	public static function dataWithLength (length:Int) :NSMutableData;
	public function initWithCapacity (capacity:Int) :NSMutableData;
	public function initWithLength (length:Int) :NSMutableData;
	
}


/****************	    Purgeable Data	****************/

@:framework("Foundation")
extern class NSPurgeableData extends NSMutableData /*implements NSDiscardableContent*/ {

    
}
