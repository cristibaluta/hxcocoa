package objc.foundation;


extern class NSFileHandle extends NSObject implements NSSecureCoding {

- (NSData *)availableData;

- (NSData *)readDataToEndOfFile;
- (NSData *)readDataOfLength:(NSUInteger)length;

	public function writeData (data:NSData) :Void;

- (unsigned long long)offsetInFile;
- (unsigned long long)seekToEndOfFile;
	public function seekToFileOffset (offset:Int) :Void;

	public function truncateFileAtOffset (offset:Int) :Void;
	public function synchronizeFile () :Void;
	public function closeFile () :Void;

// NSFileHandleCreation

+ (id)fileHandleWithStandardInput;
+ (id)fileHandleWithStandardOutput;
+ (id)fileHandleWithStandardError;
+ (id)fileHandleWithNullDevice;

+ (id)fileHandleForReadingAtPath:(NSString *)path;
+ (id)fileHandleForWritingAtPath:(NSString *)path;
+ (id)fileHandleForUpdatingAtPath:(NSString *)path;

+ (id)fileHandleForReadingFromURL:(NSURL *)url error:(NSError **)error NS_AVAILABLE(10_6, 4_0);
+ (id)fileHandleForWritingToURL:(NSURL *)url error:(NSError **)error NS_AVAILABLE(10_6, 4_0);
+ (id)fileHandleForUpdatingURL:(NSURL *)url error:(NSError **)error NS_AVAILABLE(10_6, 4_0);

}

/*FOUNDATION_EXPORT NSString * const NSFileHandleOperationException;

FOUNDATION_EXPORT NSString * const NSFileHandleReadCompletionNotification;
FOUNDATION_EXPORT NSString * const NSFileHandleReadToEndOfFileCompletionNotification;
FOUNDATION_EXPORT NSString * const NSFileHandleConnectionAcceptedNotification;
FOUNDATION_EXPORT NSString * const NSFileHandleDataAvailableNotification;

FOUNDATION_EXPORT NSString * const NSFileHandleNotificationDataItem;
FOUNDATION_EXPORT NSString * const NSFileHandleNotificationFileHandleItem;
FOUNDATION_EXPORT NSString * const NSFileHandleNotificationMonitorModes NS_DEPRECATED(10_0, 10_7, 2_0, 5_0);
*/
	public function readInBackgroundAndNotifyForModes:(Array<> *)modes;
	public function readInBackgroundAndNotify;

	public function readToEndOfFileInBackgroundAndNotifyForModes:(Array<> *)modes;
	public function readToEndOfFileInBackgroundAndNotify;

	public function acceptConnectionInBackgroundAndNotifyForModes:(Array<> *)modes;
	public function acceptConnectionInBackgroundAndNotify;

	public function waitForDataInBackgroundAndNotifyForModes:(Array<> *)modes;
	public function waitForDataInBackgroundAndNotify () :Void;

#if __BLOCKS__
	public var  (copy) void (^readabilityHandler)(NSFileHandle *)  NS_AVAILABLE(10_7, 5_0);
	public var  (copy) void (^writeabilityHandler)(NSFileHandle *) NS_AVAILABLE(10_7, 5_0);
#end


	public function initWithFileDescriptor (fd:Int, closeOnDealloc:Bool) :NSFileHandle;
	public function initWithFileDescriptor (fd:Int) :NSFileHandle;
	public function fileDescriptor () :Int;

}

extern class NSPipe extends NSObject

	public function fileHandleForReading () :NSFileHandle;
	public function fileHandleForWriting () :NSFileHandle;

	public function init () :NSPipe;
	public static function pipe () :NSPipe;

}

