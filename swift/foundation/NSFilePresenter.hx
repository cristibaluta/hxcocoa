package swift.foundation;

extern interface NSFilePresenter {

//@required

	public var presentedItemURL :NSURL;
	public var presentedItemOperationQueue :NSOperationQueue;

//@optional

	public var primaryPresentedItemURL :NSURL;//NS_AVAILABLE(10_8, NA);

public function relinquishPresentedItemToReader:(void (^)(void (^reacquirer)(void)))reader;
public function relinquishPresentedItemToWriter:(void (^)(void (^reacquirer)(void)))writer;
public function savePresentedItemChangesWithCompletionHandler:(void (^)(NSError *errorOrNil))completionHandler;
public function accommodatePresentedItemDeletionWithCompletionHandler:(void (^)(NSError *errorOrNil))completionHandler;
public function presentedItemDidMoveToURL:(NSURL *)newURL;
public function presentedItemDidChange;
public function presentedItemDidGainVersion:(NSFileVersion *)version;
public function presentedItemDidLoseVersion:(NSFileVersion *)version;
public function presentedItemDidResolveConflictVersion:(NSFileVersion *)version;
public function accommodatePresentedSubitemDeletionAtURL:(NSURL *)url completionHandler:(void (^)(NSError *errorOrNil))completionHandler;
public function presentedSubitemDidAppearAtURL:(NSURL *)url;
public function presentedSubitemAtURL:(NSURL *)oldURL didMoveToURL:(NSURL *)newURL;
public function presentedSubitemDidChangeAtURL:(NSURL *)url;
public function presentedSubitemAtURL:(NSURL *)url didGainVersion:(NSFileVersion *)version;
public function presentedSubitemAtURL:(NSURL *)url didLoseVersion:(NSFileVersion *)version;
public function presentedSubitemAtURL:(NSURL *)url didResolveConflictVersion:(NSFileVersion *)version;

}
