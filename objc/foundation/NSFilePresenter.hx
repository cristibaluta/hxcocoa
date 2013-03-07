package objc.foundation;

extern interface NSFilePresenter {

//@required

	public var presentedItemURL :NSURL;
	public var presentedItemOperationQueue :NSOperationQueue;

//@optional

	public var primaryPresentedItemURL :NSURL;//NS_AVAILABLE(10_8, NA);

- (void)relinquishPresentedItemToReader:(void (^)(void (^reacquirer)(void)))reader;
- (void)relinquishPresentedItemToWriter:(void (^)(void (^reacquirer)(void)))writer;
- (void)savePresentedItemChangesWithCompletionHandler:(void (^)(NSError *errorOrNil))completionHandler;
- (void)accommodatePresentedItemDeletionWithCompletionHandler:(void (^)(NSError *errorOrNil))completionHandler;
- (void)presentedItemDidMoveToURL:(NSURL *)newURL;
- (void)presentedItemDidChange;
- (void)presentedItemDidGainVersion:(NSFileVersion *)version;
- (void)presentedItemDidLoseVersion:(NSFileVersion *)version;
- (void)presentedItemDidResolveConflictVersion:(NSFileVersion *)version;
- (void)accommodatePresentedSubitemDeletionAtURL:(NSURL *)url completionHandler:(void (^)(NSError *errorOrNil))completionHandler;
- (void)presentedSubitemDidAppearAtURL:(NSURL *)url;
- (void)presentedSubitemAtURL:(NSURL *)oldURL didMoveToURL:(NSURL *)newURL;
- (void)presentedSubitemDidChangeAtURL:(NSURL *)url;
- (void)presentedSubitemAtURL:(NSURL *)url didGainVersion:(NSFileVersion *)version;
- (void)presentedSubitemAtURL:(NSURL *)url didLoseVersion:(NSFileVersion *)version;
- (void)presentedSubitemAtURL:(NSURL *)url didResolveConflictVersion:(NSFileVersion *)version;

}
