package objc.foundation;
import objc.foundation.NSObject;

typedef NSVolumeEnumerationOptions = Int;
typedef NSDirectoryEnumerationOptions = Int;
typedef NSFileManagerItemReplacementOptions = Int;


//extern String * const NSUbiquityIdentityDidChangeNotification NS_AVAILABLE(10_8, 6_0);

extern class NSFileManager extends NSObject {

/*	inline public static var NSFoundationVersionWithFileManagerResourceForkSupport = 412;
	
	inline public static var NSVolumeEnumerationSkipHiddenVolumes = 1UL << 1;
	inline public static var NSVolumeEnumerationProduceFileReferenceURLs = 1UL << 2;

	inline public static var NSDirectoryEnumerationSkipsSubdirectoryDescendants = 1UL << 0;
	inline public static var NSDirectoryEnumerationSkipsPackageDescendants      = 1UL << 1;
	inline public static var NSDirectoryEnumerationSkipsHiddenFiles             = 1UL << 2;

	inline public static var NSFileManagerItemReplacementUsingNewMetadataOnly = 1UL << 0;
	inline public static var NSFileManagerItemReplacementWithoutDeletingBackupItem = 1UL << 1;*/
	
	
	public static function defaultManager () :NSFileManager;
	public function mountedVolumeURLsIncludingResourceValuesForKeys (propertyKeys:Array<String>, options:NSVolumeEnumerationOptions) :Array<NSURL>;
	public function contentsOfDirectoryAtURL (url:NSURL, includingPropertiesForKeys:Array<String>, options:NSDirectoryEnumerationOptions, error:NSError) :Array<NSURL>;
	public function URLsForDirectory (directory:NSSearchPathDirectory, inDomains:NSSearchPathDomainMask) :Array<NSURL>;

	public function URLForDirectory (directory:NSSearchPathDirectory, inDomain:NSSearchPathDomainMask, appropriateForURL:NSURL, create:Bool, error:NSError) :NSURL;
	@:require(osx_7_0) @:require(ios5_0) public function createDirectoryAtURL (url:NSURL, withIntermediateDirectories:Bool, attributes:NSDictionary, error:NSError) :Bool;
	@:require(osx_7_0) @:require(ios5_0) public function createSymbolicLinkAtURL (url:NSURL withDestinationURL:NSURL error:NSError) :Bool;

	public function setDelegate (delegate:Dynamic) :Void;
	public function delegate () :Dynamic;

	public function setAttributes (attributes:NSDictionary, ofItemAtPath:String, error:NSError) :Bool;
	public function createDirectoryAtPath (path:String, withIntermediateDirectories:Bool, attributes:NSDictionary, error:NSError) :Bool;

	public function contentsOfDirectoryAtPath (path:String, error:NSError) :Array<String>;
	public function subpathsOfDirectoryAtPath (path:String, error:NSError) :Array<String>;
	public function attributesOfItemAtPath (path:String, error:NSError) :NSDictionary;
	public function attributesOfFileSystemForPath (path:String, error:NSError) :NSDictionary;

	public function createSymbolicLinkAtPath (path:String, withDestinationPath:String, error:NSError) :Bool;

	public function destinationOfSymbolicLinkAtPath (path:String, error:NSError) :String;

	public function copyItemAtPath (srcPath:String, toPath:String, error:NSError) :Bool;
	public function moveItemAtPath (srcPath:String, toPath:String, error:NSError) :Bool;
	public function linkItemAtPath (srcPath:String, toPath:String, error:NSError) :Bool;
	public function removeItemAtPath (path:String, error:NSError) :Bool;

	public function copyItemAtURL (srcURL:NSURL, toURL:NSURL, error:NSError) :Bool;
	public function moveItemAtURL (srcURL:NSURL, toURL:NSURL, error:NSError) :Bool;
	public function linkItemAtURL (srcURL:NSURL, toURL:NSURL, error:NSError) :Bool;
	public function removeItemAtURL (URL:NSURL, error:NSError) :Bool;

	@:require(osx_10_8) public function trashItemAtURL (url:NSURL, resultingItemURL:NSURL, error:NSError) :Bool;
	

	public function currentDirectoryPath () :String;
	public function changeCurrentDirectoryPath (path:String) :Bool;
	//public function fileExistsAtPath (path:String) :Bool;
	public function fileExistsAtPath (path:String, isDirectory:Bool) :Bool;
	public function isReadableFileAtPath (path:String) :Bool;
	public function isWritableFileAtPath (path:String) :Bool;
	public function isExecutableFileAtPath (path:String) :Bool;
	public function isDeletableFileAtPath (path:String) :Bool;
	public function contentsEqualAtPath (path:String, andPath:String) :Bool;

	public function displayNameAtPath (path:String) :String;
	public function componentsToDisplayForPath (path:String) :Array<String>;
	public function enumeratorAtPath (path:String) :NSDirectoryEnumerator;

/*#if NS_BLOCKS_AVAILABLE
- (NSDirectoryEnumerator *)enumeratorAtURL:(NSURL *)url includingPropertiesForKeys:(Array<> *)keys options:(NSDirectoryEnumerationOptions)mask errorHandler:(Bool (^)(NSURL *url, NSError *error))handler NS_AVAILABLE(10_6, 4_0);
#end*/

	public function subpathsAtPath (path:String) :Array<String>;
	public function contentsAtPath (path:String) :NSData;
	public function createFileAtPath (path:String, contents:NSData, attributes:NSDictionary) :Bool;
	public function fileSystemRepresentationWithPath (path:String) :String;
	public function stringWithFileSystemRepresentation (str:String, length:Int) :String;

	public function replaceItemAtURL (originalItemURL:NSURL, withItemAtURL:NSURL, backupItemName:String, options:NSFileManagerItemReplacementOptions, resultingItemURL:NSURL, error:NSError) :Bool;
	@:require(osx_10_7, ios_5_0) public function setUbiquitous (flag:Bool, itemAtURL:NSURL, destinationURL:NSURL, error:NSError) :Bool;
	@:require(osx_10_7, ios_5_0) public function isUbiquitousItemAtURL (url:NSURL) :Bool;
	@:require(osx_10_7, ios_5_0) public function startDownloadingUbiquitousItemAtURL (url:NSURL, error:NSError) :Bool;
	@:require(osx_10_7, ios_5_0) public function evictUbiquitousItemAtURL (url:NSURL, error:NSError) :Bool;
	@:require(osx_10_7, ios_5_0) public function URLForUbiquityContainerIdentifier (containerIdentifier:String) :NSURL;
	@:require(osx_10_7, ios_5_0) public function URLForPublishingUbiquitousItemAtURL (url:NSURL, expirationDate:NSDate, error:NSError) :NSURL;

	@:require(osx_10_8, ios_6_0) public function ubiquityIdentityToken () :Dynamic;
	
	public function fileManager (fm:NSFileManager, shouldProceedAfterError:NSDictionary) :Bool;
	public function fileManager (fm:NSFileManager, willProcessPath:String) :Void;
}


extern interface NSFileManagerDelegate {
//@optional

/*	public function fileManager:(NSFileManager *)fileManager shouldCopyItemAtPath:(String *)srcPath toPath:(String *) :Bool;
	public function fileManager:(NSFileManager *)fileManager shouldCopyItemAtURL:(NSURL *)srcURL toURL:(NSURL *) :Bool;
	public function fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error copyingItemAtPath:(String *)srcPath toPath:(String *) :Bool;
	public function fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error copyingItemAtURL:(NSURL *)srcURL toURL:(NSURL *) :Bool;
	public function fileManager:(NSFileManager *)fileManager shouldMoveItemAtPath:(String *)srcPath toPath:(String *) :Bool;
	public function fileManager:(NSFileManager *)fileManager shouldMoveItemAtURL:(NSURL *)srcURL toURL:(NSURL *) :Bool;
	public function fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error movingItemAtPath:(String *)srcPath toPath:(String *) :Bool;
	public function fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error movingItemAtURL:(NSURL *)srcURL toURL:(NSURL *) :Bool;
	public function fileManager:(NSFileManager *)fileManager shouldLinkItemAtPath:(String *)srcPath toPath:(String *) :Bool;
	public function fileManager:(NSFileManager *)fileManager shouldLinkItemAtURL:(NSURL *)srcURL toURL:(NSURL *) :Bool;
	public function fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error linkingItemAtPath:(String *)srcPath toPath:(String *) :Bool;
	public function fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error linkingItemAtURL:(NSURL *)srcURL toURL:(NSURL *) :Bool;
	public function fileManager:(NSFileManager *)fileManager shouldRemoveItemAtPath:(String *) :Bool;
	public function fileManager:(NSFileManager *)fileManager shouldRemoveItemAtURL:(NSURL *)URL  :Bool;
	public function fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error removingItemAtPath:(String *) :Bool;
	public function fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error removingItemAtURL:(NSURL *) :Bool;
*/
}


extern class NSDirectoryEnumerator extends NSEnumerator {

	public function fileAttributes () :NSDictionary;
	public function directoryAttributes () :NSDictionary;
	public function skipDescendents () :Void;
	public function level () :Int;
	public function skipDescendants () :Void;

}

/*FOUNDATION_EXPORT String * const NSFileType;
FOUNDATION_EXPORT String * const NSFileTypeDirectory;
FOUNDATION_EXPORT String * const NSFileTypeRegular;
FOUNDATION_EXPORT String * const NSFileTypeSymbolicLink;
FOUNDATION_EXPORT String * const NSFileTypeSocket;
FOUNDATION_EXPORT String * const NSFileTypeCharacterSpecial;
FOUNDATION_EXPORT String * const NSFileTypeBlockSpecial;
FOUNDATION_EXPORT String * const NSFileTypeUnknown;
FOUNDATION_EXPORT String * const NSFileSize;
FOUNDATION_EXPORT String * const NSFileModificationDate;
FOUNDATION_EXPORT String * const NSFileReferenceCount;
FOUNDATION_EXPORT String * const NSFileDeviceIdentifier;
FOUNDATION_EXPORT String * const NSFileOwnerAccountName;
FOUNDATION_EXPORT String * const NSFileGroupOwnerAccountName;
FOUNDATION_EXPORT String * const NSFilePosixPermissions;
FOUNDATION_EXPORT String * const NSFileSystemNumber;
FOUNDATION_EXPORT String * const NSFileSystemFileNumber;
FOUNDATION_EXPORT String * const NSFileExtensionHidden;
FOUNDATION_EXPORT String * const NSFileHFSCreatorCode;
FOUNDATION_EXPORT String * const NSFileHFSTypeCode;
FOUNDATION_EXPORT String * const NSFileImmutable;
FOUNDATION_EXPORT String * const NSFileAppendOnly;
FOUNDATION_EXPORT String * const NSFileCreationDate;
FOUNDATION_EXPORT String * const NSFileOwnerAccountID;
FOUNDATION_EXPORT String * const NSFileGroupOwnerAccountID;
FOUNDATION_EXPORT String * const NSFileBusy;
FOUNDATION_EXPORT String * const NSFileProtectionKey NS_AVAILABLE_IOS(4_0);
FOUNDATION_EXPORT String * const NSFileProtectionNone NS_AVAILABLE_IOS(4_0);
FOUNDATION_EXPORT String * const NSFileProtectionComplete NS_AVAILABLE_IOS(4_0);
FOUNDATION_EXPORT String * const NSFileProtectionCompleteUnlessOpen NS_AVAILABLE_IOS(5_0);
FOUNDATION_EXPORT String * const NSFileProtectionCompleteUntilFirstUserAuthentication NS_AVAILABLE_IOS(5_0);

FOUNDATION_EXPORT String * const NSFileSystemSize;
FOUNDATION_EXPORT String * const NSFileSystemFreeSize;
FOUNDATION_EXPORT String * const NSFileSystemNodes;
FOUNDATION_EXPORT String * const NSFileSystemFreeNodes;*/

/*extern class NSDictionary (NSFileAttributes)

- (unsigned long long)fileSize;
- (NSDate *)fileModificationDate;
- (String *)fileType;
- (NSUInteger)filePosixPermissions;
- (String *)fileOwnerAccountName;
- (String *)fileGroupOwnerAccountName;
- (NSInteger)fileSystemNumber;
- (NSUInteger)fileSystemFileNumber;
- (Bool)fileExtensionHidden;
- (OSType)fileHFSCreatorCode;
- (OSType)fileHFSTypeCode;
- (Bool)fileIsImmutable;
- (Bool)fileIsAppendOnly;
- (NSDate *)fileCreationDate;
- (NSNumber *)fileOwnerAccountID;
- (NSNumber *)fileGroupOwnerAccountID;
}*/

