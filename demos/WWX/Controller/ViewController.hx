import ios.ui.UIViewController;
import ios.ui.UINavigationController;
import ios.ui.UISwipeGestureRecognizer;
import ios.ui.UIColor;
import ios.ui.UIImage;
import ios.ui.UIView;
import ios.ui.UIScreen;
import ios.ui.UIApplication;
import ios.ui.UIAlertView;
import ios.assets.*;
import swift.graphics.CGGeometry;
import AlbumPickerController;
import PhotosPickerController;


class ViewController extends UIViewController 
					implements AlbumPickerDelegate
					implements PhotosPickerDelegate
/*					implements VideoBuilderDelegate
					implements ExporterDelegate
					implements StepsViewlDelegate*/
					implements UIAlertViewDelegate {


	var assetslibrary :ALAssetsLibrary;
	var navigationController :UINavigationController;
	var currentStep :Int;
	var currentAlbumName :String;
	
	var stepsView :StepsView;
	var albumPicker :AlbumPickerController;
	var photosPicker :PhotosPickerController;
/*	var videoController :VideoBuilderController;
	var exportController :ExporterController;*/
	
	var leftGesture :UISwipeGestureRecognizer;
	var rightGesture :UISwipeGestureRecognizer;
	//var moviePlayer :MPMoviePlayerController;
	var currentPath :String;

override public function loadView () {
	var frame = UIScreen.mainScreen().bounds;
	view = new UIView();
	view.frame = frame;
	var pattern = UIImage.imageNamed("BackgroundPattern");
	view.backgroundColor = UIColor.colorWithPatternImage(pattern);
	//view.setOpaque(false);
}

override public function viewDidLoad() {
	
    super.viewDidLoad();
	
	assetslibrary = new ALAssetsLibrary();
	currentStep = 0;
	
	
	stepsView = new StepsView();
	stepsView.initWithFrame ( new CGRect(0, 20, view.frame.size.width, 40));
	stepsView.delegate = this;
	stepsView.autoresizingMask = untyped UIViewAutoresizingFlexibleWidth;
	stepsView.setStep(currentStep);
	
	
	albumPicker = new AlbumPickerController();
	albumPicker.delegate = this;
	albumPicker.localAlbumPicked = localAlbumPicked;
	albumPicker.facebookAlbumPicked = facebookAlbumPicked;
	
	navigationController = new UINavigationController();
	navigationController.navigationBarHidden = true;
	navigationController.view.backgroundColor = UIColor.clearColor();
	navigationController.pushViewController (albumPicker, true);
	view.addSubview(navigationController.view);
	
	leftGesture = new UISwipeGestureRecognizer();
	leftGesture.addTarget (this, new SEL(leftGestureActioned));
	leftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    navigationController.view.addGestureRecognizer ( leftGesture );
	
	rightGesture = new UISwipeGestureRecognizer();
	rightGesture.addTarget (this, new SEL(rightGestureActioned));
	rightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    navigationController.view.addGestureRecognizer ( rightGesture );
	
	// Check facebook session
	var appDelegate :Wwx = cast UIApplication.sharedApplication().delegate;
	/*	if (!appDelegate.session.isOpen) {
			appDelegate.session = [[FBSession alloc] init];
		}*/
}

public function leftGestureActioned () {
	trace("swipe left");
	//if (untyped navigationController.visibleViewController.canSwipeLeft()) {
	if (true) {
		
		switch (currentStep) {
			case 1:
				photosPicked(null);
				
			case 2:
				addExporter();
		}
	}
}
public function rightGestureActioned () {
	trace("swipe right");
	//if (untyped navigationController.visibleViewController.canSwipeRight()) {
	if (true) {	
		// Move everything to right, means you go back one screen
		var p:UIViewController = navigationController.popViewControllerAnimated(true);
		//untyped p.delegate = null;
		p.view.removeFromSuperview();
		p = null;
		setStep(currentStep-1);
	}
}



public function setStep(j:Int) {
	currentStep = j;
	stepsView.setStep(j);
}
public function stepTouched (i:Int) {
	trace(">> touch step ");
	if (i < currentStep) {
		rightGestureActioned();
	}
	else if (i > currentStep) {
		leftGestureActioned();
	}
}
public function enableSteps(b:Bool) {
	if (b) {
		view.addSubview(stepsView);
	}
	else {
		view.insertSubview(stepsView,0);
	}
}


//pragma mark AlbumPicker delegate

public function localAlbumPicked (album:ALAssetsGroup) {
	trace("local album picked");
	photosPicker = new PhotosPickerController();
	photosPicker.delegate = this;
	
	navigationController.pushViewController (photosPicker, true);
	
	photosPicker.loadLocalAlbum(album);
	currentAlbumName = album.valueForProperty (untyped ALAssetsGroupPropertyName);
	
	setStep(1);
}
public function facebookAlbumPicked (album:FBAlbum) {
	trace("facebook album picked");
	photosPicker = new PhotosPickerController();
	photosPicker.delegate = this;
	
	navigationController.pushViewController (photosPicker, true);
	
	photosPicker.loadFacebookAlbum ( album.albumId );
	currentAlbumName = album.name;
	
	setStep(1);
}


// PhotosPicker delegate

public function photosPicked (urls:Array<Dynamic>) {
	
/*	videoController = [[VideoBuilderController alloc] init];
	videoController.delegate = this;
	videoController.isFacebook = [photosPicker isFacebook];
	
	[navigationController pushViewController:videoController animated:YES];
	
	[this setStep:2];*/
}


public function selectMovieAtPath(path:String) {
	
	currentPath = path;
	
	var alert :UIAlertView = new UIAlertView().initWithTitle("My Videos",
													"You've selected a movie, what next?",
												  this,
										  "Cancel",
										  "Play");
	alert.show();
}

// VideoBuilderPicker delegate

public function selectedImagesUrls():Array<Dynamic> {
	return photosPicker.selectedImagesUrls();
}
public function addExporter() {
	
/*	exportController = [[ExporterController alloc] init];
	exportController.delegate = this;
	
	[navigationController pushViewController:exportController animated:YES];
	*/
	setStep(3);
}


#if notready
// ExporterController

public function requestImageForFrameTime(frameTime:CMTime) {
	videoController.requestImageForFrameTime(frameTime);
}
public function image (cgimage:CGImageRef, atFrameTime:CMTime) {
	exportController.image (cgimage, frameTime);
}
public function getVideoName():String {
	return currentAlbumName;
}
public function getAudioTrack():MPMediaItem {
	if (videoController.mediaItemCollection == null) {
		return null;
	}
	MPMediaItem *item = [[videoController.mediaItemCollection items] lastObject];
	return item;
}
- (int) getVideoMaximumFrames {
	return [videoController getVideoMaximumFrames];
}

// Video playback


public function alertView (alertView:UIAlertView, clickedButtonAtIndex:Int) {
	switch (buttonIndex) {
		case 0:
			trace("cancel");
			break;
			
		case 1:
			trace("play");
			playMovieAtPath(currentPath);
			break;
			
		case 2:
			trace("share");
			addExporter();
			exportController.setFinalFile(currentPath);
			exportController.share();
			break;
			
		case 3:
			NSLog(@"delete");
			[[NSFileManager defaultManager] removeItemAtPath:currentPath error:nil];
			[albumPicker viewDidAppear:NO];
			break;
	}
}
public function playMovieAtPath:(NSString*)path {
	
	trace("start video player "+ path);
	var url = NSURL.fileURLWithPath(path);
    moviePlayer = new MPMoviePlayerController().initWithContentURL(url);
	
    [[NSNotificationCenter defaultCenter] addObserver:this
											 selector:@selector(moviePlayBackDidFinish:)
												 name:MPMoviePlayerPlaybackDidFinishNotification
											   object:moviePlayer];
	
    moviePlayer.controlStyle = MPMovieControlStyleDefault;
    moviePlayer.shouldAutoplay = YES;
    view addSubview:moviePlayer.view];
    [moviePlayer setFullscreen:YES animated:YES];
}
public function moviePlayBackDidFinish:(NSNotification*)notification {
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:this name:MPMoviePlayerPlaybackDidFinishNotification object:player];
	
    if ([player
		 respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [player.view removeFromSuperview];
    }
}
#end


/*public function willRotateToInterfaceOrientation (toInterfaceOrientation:UIInterfaceOrientation, duration:Int) {
	navigationController.willRotateToInterfaceOrientation(toInterfaceOrientation, duration);
}*/
override public function shouldAutorotate():Bool {
    return true;
}

/*public function supportedInterfaceOrientations():UIInterfaceOrientationMask {
    return UIInterfaceOrientationMaskAll;
}*/


public function pause() {
/*	if (exportController == navigationController.visibleViewController) {
		exportController.pause();
	}*/
}
public function resume() {
/*	if (exportController == navigationController.visibleViewController) {
		exportController.resume();
	}*/
}
public function applicationDidEnterBackground() {
/*	if (exportController == navigationController.visibleViewController) {
		exportController.isInBackground = true;
	}*/
}
public function applicationWillEnterForeground() {
/*	if (exportController == navigationController.visibleViewController) {
		exportController.isInBackground = false;
	}*/
}


}
