package objc.foundation;


extern class NSFileCoordinator
{

	//Constants

	//Static Methods
	public  function filePresenters():Array<>;
	public  function addFilePresenter( filePresenter:id<NSFilePresenter>):Void;
	public  function removeFilePresenter( filePresenter:id<NSFilePresenter>):Void;

	//Properties

	//Methods
	public  function initWithFilePresenter( filePresenterOrNil:id<NSFilePresenter>):Dynamic;
	public  function coordinateWritingItemAtURL( url:NSURL,  options:NSFileCoordinatorWritingOptions,  outError:NSError*,  writer:Dynamic):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function coordinateWritingItemAtURL1( url1:NSURL,  options1:NSFileCoordinatorWritingOptions,  url2:NSURL,  options2:NSFileCoordinatorWritingOptions,  outError:NSError*,  writer:Dynamic):Void;
	public  function prepareForReadingItemsAtURLs( readingURLs:Array<>,  readingOptions:NSFileCoordinatorReadingOptions,  writingURLs:Array<>,  writingOptions:NSFileCoordinatorWritingOptions,  outError:NSError*,  batchAccessor:Dynamic):Void;
	public  function itemAtURL( oldURL:NSURL,  newURL:NSURL):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function itemAtURL1( oldURL:NSURL,  newURL:NSURL):Void;
	public  function coordinateReadingItemAtURL( url:NSURL,  options:NSFileCoordinatorReadingOptions,  outError:NSError*,  reader:Dynamic):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function coordinateReadingItemAtURL1( readingURL:NSURL,  readingOptions:NSFileCoordinatorReadingOptions,  writingURL:NSURL,  writingOptions:NSFileCoordinatorWritingOptions,  outError:NSError*,  readerWriter:Dynamic):Void;
	public  function cancel():Void;
}

extern enum NSFileCoordinatorReadingOptions
{
	NSFileCoordinatorReadingWithoutChanges;
	NSFileCoordinatorReadingResolvesSymbolicLink;
}

extern enum NSFileCoordinatorWritingOptions
{
	NSFileCoordinatorWritingForDeleting;
	NSFileCoordinatorWritingForMoving;
	NSFileCoordinatorWritingForMerging;
	NSFileCoordinatorWritingForReplacing;
}

