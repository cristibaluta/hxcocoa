package objc.store;
import objc.foundation.NSObject;

extern enum SKDownloadState {
    SKDownloadStateWaiting;     // Download is inactive, waiting to be downloaded
    SKDownloadStateActive;      // Download is actively downloading
    SKDownloadStatePaused;      // Download was paused by the user
    SKDownloadStateFinished;    // Download is finished, content is available
    SKDownloadStateFailed;      // Download failed
    SKDownloadStateCancelled;   // Download was cancelled
}
//@:require(ios6_0)
@:framework("StoreKit")
extern class SKDownload extends NSObject {

// State of the download
	public var (default, null) downloadState :SKDownloadState;

// Total size of the content, in bytes
	public var (default, null) contentLength :Int;

// Identifier for this content
	public var (default, null) contentIdentifier :String;

// Location of the content data, if downloadState is SKDownloadStateFinished
	public var (default, null) contentURL :NSURL;

// Content version
	public var (default, null) contentVersion :String;

// Failure error, if downloadState is SKDownloadStateFailed
	public var (default, null) error :NSError;

// Overall progress for the download [0..1]
	public var (default, null) progress :Float;

// Estimated time remaining to complete the download, in seconds.  Value is SKDownloadTimeRemainingUnknown if estimate is unknown.
	public var (default, null) timeRemaining :Float;

// Transaction for this download
	public var (default, null) transaction :SKPaymentTransaction;

}
