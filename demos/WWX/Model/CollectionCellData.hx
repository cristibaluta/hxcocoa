import objc.foundation.*;
import ios.ui.UIImage;
import ios.assets.ALAssetsLibrary;
import ios.assets.ALAsset;

enum ImageSourceType {
	Local;
	Facebook;
}

class CollectionCellData extends NSObject {
	
public var indexPath :NSIndexPath;
public var selected :Bool;
public var isLoading :Bool;
public var type :ImageSourceType;
public var localurl :NSURL;
public var thumbUrl :String;
public var sourceUrl :String;
public var image :UIImage;
public var delegate :Dynamic;

dynamic public function loadFinishedForIndexPath (indexPath:NSIndexPath) :Void{}

public function loadImageFromLibrary(url:NSURL) {
	
	isLoading = true;
	
    // Load image in a new thread
    NSThread.detachNewThreadSelector ( new SEL(loadImageCG), this, url);
}
public function loadImageCG(url:NSURL) {
	var resultblock :ALAssetsLibraryAssetForURLResultBlock = function (myasset:ALAsset){
		
		var img = UIImage.imageWithCGImage ( myasset.thumbnail() );
		performSelectorOnMainThread ( new SEL(loadFinished), img, false);
	};
	var failureblock :ALAssetsLibraryAccessFailureBlock = function (myerror:NSError){
		trace("Cant get image - %@"+ myerror.localizedDescription());
	};
	
	var assetslibrary = new ALAssetsLibrary();
	assetslibrary.assetForURL (url, resultblock, failureblock);
}



public function loadImageFromUrl(url:String) {
	
	isLoading = true;
	
    // Load image in a new thread
    NSThread.detachNewThreadSelector ( new SEL (loadImageData), this, url);
}
public function loadImageData (url:String) {
	
	// Load image
    var imageData = new NSData().initWithContentsOfURL ( NSURL.URLWithString(url));
    var img = new UIImage().initWithData(imageData);
	performSelectorOnMainThread ( new SEL(loadFinished), img, false);
}


public function loadFinished (image:UIImage) {
	if (isLoading) {
		isLoading = false;
		this.image = image;
	}
	//delegate.loadFinishedForIndexPath(indexPath);
	loadFinishedForIndexPath(indexPath);
}

}
