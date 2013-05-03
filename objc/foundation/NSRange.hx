package objc.foundation;

@:framework("Foundation")
extern class NSRange {
	
	public var location :Int;
	public var length :Int;
	public function new (loc:Int, len:Int) :Void;
	
	@:c public static function NSMakeRange (location:Int, length:Int) :NSRange;
	@:c public static function NSMaxRange (range:NSRange) :Int;
	@:c public static function NSLocationInRange (location:Int, range:NSRange) :Bool;
	@:c public static function NSEqualRanges (range1:NSRange, range2:NSRange) :Bool;
	@:c public static function NSUnionRange (range1:NSRange, range2:NSRange) :NSRange;
	@:c public static function NSIntersectionRange (range1:NSRange, range2:NSRange) :NSRange;
	@:c public static function NSStringFromRange (range:NSRange) :String;
	@:c public static function NSRangeFromString (aString:String) :NSRange;
}
