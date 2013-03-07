package objc.foundation;

import objc.foundation.NSObject;

/* Note: NSUUID is not toll-free bridged with CFUUID. Use UUID strings to convert between CFUUID and NSUUID, if needed. NSUUIDs are not guaranteed to be comparable by pointer value (as CFUUIDRef is); use isEqual: to compare two NSUUIDs. */

@:require(osx10_8)
@:require(ios6_0)
@:framework("Foundation")
extern class NSUUID extends NSObject implements NSCopying implements NSSecureCoding {

/* Create a new autoreleased NSUUID with RFC 4122 version 4 random bytes */
	public static function UUID () :NSUUID;

/* Create a new NSUUID with RFC 4122 version 4 random bytes */
	public function init () :NSUUID;

/* Create an NSUUID from a string such as "E621E1F8-C36C-495A-93FC-0C247A3E6E5F". Returns nil for invalid strings. */
	public function initWithUUIDString (string:String) :NSUUID;

/* Create an NSUUID with the given bytes */
	public function initWithUUIDBytes (bytes:Dynamic) :NSUUID;

/* Get the individual bytes of the receiver */
	public function getUUIDBytes (uuid:Dynamic) :Void;

/* Return a string description of the UUID, such as "E621E1F8-C36C-495A-93FC-0C247A3E6E5F" */
	public function UUIDString () :String;

}

#end
	