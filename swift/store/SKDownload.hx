package swift.store;
import swift.foundation.NSObject;

@:framework("StoreKit")
extern enum SKDownloadState {
    SKDownloadStateWaiting;     // Download is inactive, waiting to be downloaded
    SKDownloadStateActive;      // Download is actively downloading
    SKDownloadStatePaused;      // Download was paused by the user
    SKDownloadStateFinished;    // Download is finished, content is available
    SKDownloadStateFailed;      // Download failed
    SKDownloadStateCancelled;   // Download was cancelled
}
//@:require(ios6)
@:framework("StoreKit")
extern class SKDownload extends NSObject {

// State of the download
	public var downloadState (default, null) :SKDownloadState;

// Total size of the content, in bytes
	public var contentLength (default, null) :Int;

// Identifier for this content
	public var contentIdentifier (default, null) :String;

// Location of the content data, if downloadState is SKDownloadStateFinished
	public var contentURL (default, null) :NSURL;

// Content version
	public var contentVersion (default, null) :String;

// Failure error, if downloadState is SKDownloadStateFailed
	public var error (default, null) :NSError;

// Overall progress for the download [0..1]
	public var progress (default, null) :Float;

// Estimated time remaining to complete the download, in seconds.  Value is SKDownloadTimeRemainingUnknown if estimate is unknown.
	public var timeRemaining (default, null) :Float;

// Transaction for this download
	public var transaction (default, null) :SKPaymentTransaction;

}
