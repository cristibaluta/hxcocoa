package objc.foundation;

import objc.foundation.NSObject;

@:framework("Foundation")
extern enum NSFileHandleOptions {
	NSFileHandleOperationException;

	NSFileHandleReadCompletionNotification;
	NSFileHandleReadToEndOfFileCompletionNotification;
	NSFileHandleConnectionAcceptedNotification;
	NSFileHandleDataAvailableNotification;

	NSFileHandleNotificationDataItem;
	NSFileHandleNotificationFileHandleItem;
}

@:framework("Foundation")
extern class NSFileHandle extends NSObject implements NSSecureCoding {

	public function availableData () :NSData;
	public function readDataToEndOfFile () :NSData;
	public function readDataOfLength (length:Int) :NSData;

	public function writeData (data:NSData) :Void;

	public function offsetInFile () :Float;
	public function seekToEndOfFile () :Float;
	public function seekToFileOffset (offset:Int) :Void;

	public function truncateFileAtOffset (offset:Int) :Void;
	public function synchronizeFile () :Void;
	public function closeFile () :Void;

// NSFileHandleCreation

	public static function fileHandleWithStandardInput () :NSFileHandle;
	public static function fileHandleWithStandardOutput () :NSFileHandle;
	public static function fileHandleWithStandardError () :NSFileHandle;
	public static function fileHandleWithNullDevice () :NSFileHandle;

	public static function fileHandleForReadingAtPath (path:String) :NSFileHandle;
	public static function fileHandleForWritingAtPath (path:String) :NSFileHandle;
	public static function fileHandleForUpdatingAtPath (path:String) :NSFileHandle;
	
	@:pointer("error")
	public static function fileHandleForReadingFromURL (url:NSURL, error:NSError) :NSFileHandle;
	@:pointer("error")
	public static function fileHandleForWritingToURL (url:NSURL, error:NSError) :NSFileHandle;
	@:pointer("error")
	public static function fileHandleForUpdatingURL (url:NSURL, error:NSError) :NSFileHandle;


	public function readInBackgroundAndNotifyForModes (modes:Array<Dynamic>) :Void;
	public function readInBackgroundAndNotify () :Void;

	public function readToEndOfFileInBackgroundAndNotifyForModes (modes:Array<Dynamic>) :Void;
	public function readToEndOfFileInBackgroundAndNotify () :Void;

	public function acceptConnectionInBackgroundAndNotifyForModes (modes:Array<Dynamic>) :Void;
	public function acceptConnectionInBackgroundAndNotify () :Void;

	public function waitForDataInBackgroundAndNotifyForModes (modes:Array<Dynamic>) :Void;
	public function waitForDataInBackgroundAndNotify () :Void;

	//public function initWithFileDescriptor (fd:Int, closeOnDealloc:Bool) :NSFileHandle;
	public function initWithFileDescriptor (fd:Int) :NSFileHandle;
	public function fileDescriptor () :Int;

}

@:framework("Foundation")
extern class NSPipe extends NSObject {

	public function fileHandleForReading () :NSFileHandle;
	public function fileHandleForWriting () :NSFileHandle;

	override public function init () :NSPipe;
	public static function pipe () :NSPipe;

}

