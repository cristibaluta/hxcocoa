package objc.foundation;

import objc.foundation.NSObject;

typedef NSFileVersionAddingOptions = Int;
typedef NSFileVersionReplacingOptions = Int;


@:require(osx_10_7 || ios_5_0) extern class NSFileVersion extends NSObject {
	
	inline public static var NSFileVersionAddingByMoving = 1 << 0;
	inline public static var NSFileVersionReplacingByMoving = 1 << 0;

	public static function currentVersionOfItemAtURL (url:NSURL) :NSFileVersion;
	public static function otherVersionsOfItemAtURL (url:NSURL) :Array<NSFileVersion>;
	public static function unresolvedConflictVersionsOfItemAtURL (url:NSURL) :Array<NSFileVersion>;
	public static function versionOfItemAtURL (url:NSURL, forPersistentIdentifier:id) :NSFileVersion;

	@:require(osx_10_7) public static function addVersionOfItemAtURL (url:NSURL, withContentsOfURL:NSURL, options:NSFileVersionAddingOptions, error:NSError) :NSFileVersion;
	@:require(osx_10_7) public static function temporaryDirectoryURLForNewVersionOfItemAtURL (url:NSURL) :NSURL;

	public var URL :NSURL;
	public var localizedName :String;
	public var localizedNameOfSavingComputer :String;
	public var modificationDate :Date;
	public var persistentIdentifier :Dynamic;
	public var conflict (default, null) :Bool;
	public var resolved :Bool;
	@:require(osx_10_7) public var discardable :Bool;

	public function replaceItemAtURL (url:NSURL, options:NSFileVersionReplacingOptions, error:NSError) :NSURL;
	public function removeAndReturnError (outError:NSError) :Bool;
	public static function removeOtherVersionsOfItemAtURL (url:NSURL, error:NSError) :Bool;

}
