//
//  FBAlbum.m
//  Instaslider
//
//  Created by Baluta Cristian on 14/04/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//
import swift.foundation.*;
import ios.ui.*;

class FBAlbum extends NSObject {

public var nr :String;
public var coverPhoto :String;
public var albumId :String;
public var name :String;
public var image :UIImage;
public var delegate :Dynamic;

dynamic public function onImageCached (image :UIImage) :Void{}
	
public function new(){ super(); }

public function preload () {
    
    if (image != null) {
		dispatchLoadingEvent();
        return;
    }
    
	var url = "https://graph.facebook.com/"+albumId+"/picture";
	
    // Load image in a new thread
    NSThread.detachNewThreadSelector (new SEL(loadImageData), this, url);
}
public function loadImageData (url:String) :Void {
	
	// Load image
    var imageData = new NSData().initWithContentsOfURL ( NSURL.URLWithString(url));
	performSelectorOnMainThread (new SEL(cacheImage), imageData, false);
}
public function cacheImage(imageData:NSData) {
	var image2 = new UIImage();
	var image3 = new UIImage().initWithData(imageData);
    image = new UIImage().initWithData(imageData);
    dispatchLoadingEvent();
}

public function dispatchLoadingEvent() {
	//if (onImageCached != null) {
		onImageCached ( image );
	//}
/*    if (delegate.respondsToSelector(new SEL(delegate.onImageCached)))
        delegate.performSelector(new SEL(delegate.onImageCached), image);*/
}


}
