package objc.foundation;

import objc.foundation.NSObject;

@:framework("Foundation")
extern class NSNull extends NSObject implements NSCopying implements NSSecureCoding {

	@:sel("null")
	public static function __null () :NSNull;

	@:sel("class")
	public static function __class () :Class<Dynamic>;
	
}
