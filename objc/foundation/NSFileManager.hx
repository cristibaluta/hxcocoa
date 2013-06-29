package objc.foundation;
import objc.foundation.NSObject;
import objc.foundation.NSValue;
import objc.foundation.NSPathUtilities;

typedef OSType = String;

@:framework("Foundation")
extern enum NSVolumeEnumerationOptions {
	NSVolumeEnumerationSkipHiddenVolumes;
	NSVolumeEnumerationProduceFileReferenceURLs;
}
@:framework("Foundation")
extern enum NSDirectoryEnumerationOptions {
	NSDirectoryEnumerationSkipsSubdirectoryDescendants;
	NSDirectoryEnumerationSkipsPackageDescendants;
	NSDirectoryEnumerationSkipsHiddenFiles;
}
@:framework("Foundation")
extern enum NSFileManagerItemReplacementOptions {
	NSFileManagerItemReplacementUsingNewMetadataOnly;
	NSFileManagerItemReplacementWithoutDeletingBackupItem;
}


@:framework("Foundation")
extern class NSFileManager extends NSObject {
	
	
	public static function defaultManager () :NSFileManager;
	public function mountedVolumeURLsIncludingResourceValuesForKeys (propertyKeys:Array<String>, options:NSVolumeEnumerationOptions) :Array<NSURL>;
	public function contentsOfDirectoryAtURL (url:NSURL, includingPropertiesForKeys:Array<String>, options:NSDirectoryEnumerationOptions, error:NSError) :Array<NSURL>;
	public function URLsForDirectory (directory:NSSearchPathDirectory, inDomains:NSSearchPathDomainMask) :Array<NSURL>;

	public function URLForDirectory (directory:NSSearchPathDirectory, inDomain:NSSearchPathDomainMask, appropriateForURL:NSURL, create:Bool, error:NSError) :NSURL;
	@:require(osx10_7,ios5) public function createDirectoryAtURL (url:NSURL, withIntermediateDirectories:Bool, attributes:NSDictionary, error:NSError) :Bool;
	@:require(osx10_7,ios5) public function createSymbolicLinkAtURL (url:NSURL, withDestinationURL:NSURL, error:NSError) :Bool;

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

	@:require(osx10_8) public function trashItemAtURL (url:NSURL, resultingItemURL:NSURL, error:NSError) :Bool;
	

	public function currentDirectoryPath () :String;
	public function changeCurrentDirectoryPath (path:String) :Bool;
	@:overload(function(path:String) :Bool {})
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
	@:require(osx10_7,ios5) public function setUbiquitous (flag:Bool, itemAtURL:NSURL, destinationURL:NSURL, error:NSError) :Bool;
	@:require(osx10_7,ios5) public function isUbiquitousItemAtURL (url:NSURL) :Bool;
	@:require(osx10_7,ios5) public function startDownloadingUbiquitousItemAtURL (url:NSURL, error:NSError) :Bool;
	@:require(osx10_7,ios5) public function evictUbiquitousItemAtURL (url:NSURL, error:NSError) :Bool;
	@:require(osx10_7,ios5) public function URLForUbiquityContainerIdentifier (containerIdentifier:String) :NSURL;
	@:require(osx10_7,ios5) public function URLForPublishingUbiquitousItemAtURL (url:NSURL, expirationDate:NSDate, error:NSError) :NSURL;

	@:require(osx10_8,ios6) public function ubiquityIdentityToken () :Dynamic;
	
	//public function fileManager (fm:NSFileManager, shouldProceedAfterError:NSDictionary) :Bool;
	public function fileManager (fm:NSFileManager, willProcessPath:String) :Void;
	

	// NSDictionary (NSFileAttributes)

	public function fileSize () :Float;
	public function fileModificationDate () :NSDate;
	public function fileType () :String;
	public function filePosixPermissions () :Int;
	public function fileOwnerAccountName () :String;
	public function fileGroupOwnerAccountName () :String;
	public function fileSystemNumber () :Int;
	public function fileSystemFileNumber () :Int;
	public function fileExtensionHidden () :Bool;
	public function fileHFSCreatorCode () :OSType;
	public function fileHFSTypeCode () :OSType;
	public function fileIsImmutable () :Bool;
	public function fileIsAppendOnly () :Bool;
	public function fileCreationDate () :NSDate;
	public function fileOwnerAccountID () :NSNumber;
	public function fileGroupOwnerAccountID () :NSNumber;
}


@:framework("Foundation")
extern interface NSFileManagerDelegate {
#if display

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
#end
}


@:framework("Foundation")
extern class NSDirectoryEnumerator extends NSEnumerator {

	public function fileAttributes () :NSDictionary;
	public function directoryAttributes () :NSDictionary;
	public function skipDescendents () :Void;
	public function level () :Int;
	public function skipDescendants () :Void;

}

@:framework("Foundation")
extern enum NSFileAttributes {
	NSFileType;
	NSFileTypeDirectory;
	NSFileTypeRegular;
	NSFileTypeSymbolicLink;
	NSFileTypeSocket;
	NSFileTypeCharacterSpecial;
	NSFileTypeBlockSpecial;
	NSFileTypeUnknown;
	NSFileSize;
	NSFileModificationDate;
	NSFileReferenceCount;
	NSFileDeviceIdentifier;
	NSFileOwnerAccountName;
	NSFileGroupOwnerAccountName;
	NSFilePosixPermissions;
	NSFileSystemNumber;
	NSFileSystemFileNumber;
	NSFileExtensionHidden;
	NSFileHFSCreatorCode;
	NSFileHFSTypeCode;
	NSFileImmutable;
	NSFileAppendOnly;
	NSFileCreationDate;
	NSFileOwnerAccountID;
	NSFileGroupOwnerAccountID;
	NSFileBusy;
	NSFileProtectionKey;
	NSFileProtectionNone;
	NSFileProtectionComplete;
	@:require(ios5) NSFileProtectionCompleteUnlessOpen;
	@:require(ios5) NSFileProtectionCompleteUntilFirstUserAuthentication;

	NSFileSystemSize;
	NSFileSystemFreeSize;
	NSFileSystemNodes;
	NSFileSystemFreeNodes;
}
