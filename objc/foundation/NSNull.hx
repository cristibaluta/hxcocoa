package objc.foundation;

import objc.foundation.NSObject;

@:framework("Foundation")
extern class NSNull extends NSObject implements NSCopying implements NSSecureCoding {

	public static function null () :NSNull;
	
}
