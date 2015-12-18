//
//  AlbumPickerControllerViewController.m
//  InstaSlide
//
//  Created by Baluta Cristian on 09/04/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//
import ios.assets.ALAssetsGroup;
import ios.assets.ALAssetsLibrary;
import ios.ui.*;
import ios.ui.UIApplication;
import ios.ui.UITableView;
import objc.foundation.*;
import objc.graphics.CGGeometry;
import FBSession;



@:include("QuartzCore/QuartzCore.h")
class AlbumPickerController extends UIViewController implements UITableViewDelegate implements UITableViewDataSource {

	
	var tableView :UITableView;
	var library :ALAssetsLibrary;
	var groups :Array<ALAssetsGroup>;
	var fb_albums :Array<FBAlbum>;
	var movies :Array<String>;
	var activityView :UIActivityIndicatorView;
	var loadingFacebook :Bool;
	
	public var delegate :Dynamic;
	dynamic public function localAlbumPicked (album:ALAssetsGroup) :Void{ var x = 0; }
	dynamic public function facebookAlbumPicked (album:FBAlbum) :Void{ }
	dynamic public function selectMovieAtPath (path:String) :Void{}
	
override public function loadView () :Void {
	var frame = UIScreen.mainScreen().bounds;
	view = new UIView();
	view.frame = frame;
}

override public function viewDidLoad () :Void {
	trace("album picker did load");
    super.viewDidLoad();
	
	groups = new Array<ALAssetsGroup>();
	movies = ["Movie 1", "movie 2"];
	
	tableView = new UITableView();
	tableView.frame = new CGRect(20, 80, view.frame.size.width-40, view.frame.size.height-80);
	//, UITableViewStylePlain);
	tableView.delegate = this;
	tableView.dataSource = this;
	tableView.backgroundColor = UIColor.clearColor();
	tableView.separatorColor = UIColor.darkGrayColor();
	tableView.autoresizingMask = untyped UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
	view.addSubview(tableView);
	
    var failHandler :ALAssetsLibraryAccessFailureBlock = function (error:NSError) {
		trace("assets enumaeration failed");
    };
	
	var groupsEnumerator :ALAssetsLibraryGroupsEnumerationResultsBlock = function (group:ALAssetsGroup, stop:Bool) {
		
        if (group != null) {
			trace("storing asset");
			groups.push(group);
        }
		else {
			trace("reload table");
			tableView.reloadData();
		}
    };
	
	library = new ALAssetsLibrary();
	library.enumerateGroupsWithTypes ( ALAssetsGroupAll, groupsEnumerator, failHandler );
}

override public function viewDidAppear (animated:Bool) {
	//NSLog(@"did appear");
	//movies = new Array<String>();
	
	// Check if we have any video
/*	var documentsDirectoryPath = NSPathUtilities.NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, true)[0];
	var dirContents = NSFileManager.defaultManager().contentsOfDirectoryAtPath (documentsDirectoryPath, null);
	for (file in dirContents) {
		if (untyped file.hasSuffix(".mp4") && untyped !file.hasSuffix("temp.mp4")) {
			movies.push ( documentsDirectoryPath + "/" + file );
		}
	}
	//NSLog(@"%@", movies);
	tableView.reloadData();*/
}



// Table View Data Source Methods

@:sel("tableView:numberOfRowsInSection:")
public function numberOfRowsInSection (tableView:UITableView, section:Int) :Int {
	
	if (movies.length > 0) {
		switch (section) {
			case 0:return movies.length;
			case 1:return groups.length;
			case 2:return fb_albums!=null ? fb_albums.length : 1;
		}
	}
	else {
		switch (section) {
			case 0:return groups.length;
			case 1:return fb_albums!=null ? fb_albums.length : 1;
		}
	}
	return 0;
}

@:sel("tableView:cellForRowAtIndexPath:")
public function cellForRowAtIndexPath (tableView_:UITableView, indexPath:NSIndexPath) :UITableViewCell {
    
    // Buid the cell
    var identif = "AlbumCellIdentifier";
    
    var cell = cast(tableView_.dequeueReusableCellWithIdentifier(identif), AlbumTableViewCell);
    
    if (cell == null) {
        cell = new AlbumTableViewCell();
		cell.initWithStyle (UITableViewCellStyleDefault, identif);
    }
    
    // Add info to the cell
    
	var row = indexPath.row;
	cell.customImageView.image = null;
	var shift = movies.length > 0 ? 1 : 0;
	
	if (indexPath.section == 0 && shift > 0) {
		//var comps = movies[row].split("/");
		cell.customTextLabel.text = movies[row];//comps[comps.length-1];
		cell.customImageView.image = UIImage.imageNamed("SymbolCamera");
	}
	else if (indexPath.section == 0+shift) {
		var group :ALAssetsGroup = groups[row];
		cell.customTextLabel.text = group.valueForProperty(untyped ALAssetsGroupPropertyName);
		// + " (" + group.numberOfAssets() + ")";
		cell.setLocalImage ( UIImage.imageWithCGImage ( group.posterImage()));
	}
	else if (indexPath.section == 1+shift) {
		if (fb_albums == null) {
			cell.customTextLabel.text = "Login to Facebook";
			cell.customImageView.image = null;
		}
		else {
			var album = fb_albums[row];
/*			TODO: [NSDecimalNumber length]: unrecognized selector sent to instance 0x1dd8aa20
				album.nr: Is it really string?*/
			cell.customTextLabel.text = album.name + " ( "+album.albumId+" )";
			//var url = "https://graph.facebook.com/"+album.albumId+"/picture";
			var url = "https://graph.facebook.com/"+album.albumId+"/picture?type=album&access_token=" + FBSession.activeSession().accessToken;
			cell.loadFacebookImage(url);
		}
	}
	
    return cell;
}

@:sel("tableView:heightForRowAtIndexPath:")
public function heightForRowAtIndexPath (tableView:UITableView, indexPath:NSIndexPath) :Float {
	return 80;
}

@:sel("tableView:didSelectRowAtIndexPath:")
public function didSelectRowAtIndexPath (tableView_:UITableView, indexPath:NSIndexPath) :Void {
    
	trace("Row touched");
	var row = indexPath.row;
	var section = indexPath.section;
	var shift = movies.length > 0 ? 1 : 0;
	
	//[tableView_ deselectRowAtIndexPath:indexPath animated:true];
	
	if (section == 0 && shift > 0) {
		//delegate.selectMovieAtPath(movies[row]);
	}
	else if (section == 0+shift) {
		var group = groups[row];
		localAlbumPicked ( group );
	}
	else if (fb_albums != null) {
		
		facebookAlbumPicked ( fb_albums[row] );
	}
	else {
		
		if (!loadingFacebook) {
			
			activityView = new UIActivityIndicatorView().initWithActivityIndicatorStyle(UIActivityIndicatorViewStyleWhite);
			var rect = activityView.frame;
			rect.origin.x = 20;
			rect.origin.y = 30;
			activityView.frame = rect;
			
			tableView.cellForRowAtIndexPath(indexPath).addSubview(activityView);
			activityView.startAnimating();
			
			loginToFacebook();
		}
	}
}

public function numberOfSectionsInTableView (tableView:UITableView) :Int {
	return movies.length > 0 ? 3 : 2;
}

@:sel("tableView:viewForHeaderInSection:")
public function viewForHeaderInSection (tableView_:UITableView, section:Int) :UIView {
	
	var v = new UIView();
	v.frame = new CGRect(0, 0, tableView_.frame.size.width, 35);
	v.layer.cornerRadius = 4;
	v.backgroundColor = UIColor.colorWithWhite(0.65, 1);
    
	var symbol :String = "";
	var title :String = "";
	
	if (movies.length > 0) {
		switch (section) {
			case 0:symbol = "SymbolVideo";title = "My Videos";
			case 1:symbol = "SymbolFolder";title = "Local Albums";
			case 2:symbol = "ButFb";title = "Facebook Albums";
		}
	}
	else {
		switch (section) {
			case 0:symbol = "SymbolFolder";title = "Local Albums";
			case 1:symbol = "ButFb";title = "Facebook Albums";
		}
	}
	
	var img = new UIImageView().initWithImage ( UIImage.imageNamed ( symbol));
	v.addSubview(img);
	
	var label = new UILabel();
	label.frame = new CGRect(40, 10, 200, 13);
	label.backgroundColor = UIColor.clearColor();
	label.textColor = UIColor.whiteColor();
	label.font = UIFont.boldSystemFontOfSize(13);
	label.text = title;
	v.addSubview(label);
	
	return v;
}
@:sel("tableView:heightForHeaderInSection:")
public function heightForHeaderInSection (tableView:UITableView, section:Int) :Float {
	return 35;
}


// Facebook

public function loginToFacebook () {
	
	loadingFacebook = true;
	var permissions = ["user_photos"];
	
	FBSession.openActiveSessionWithReadPermissions (permissions, true,
	function (session:FBSession, status:FBSessionState, error:NSError) {
									  
		if (error == null && status == FBSessionStateOpen) {
			update();
		}else{
			trace("error");
			loadingFacebook = false;
		}
	});
}

public function update () :Void {
	
	var req = FBRequest.requestForGraphPath("me/albums");
	
	req.startWithCompletionHandler (
	function (connection:FBRequestConnection, result:Dynamic, error:NSError) {
		
		if (result != null) {
			fb_albums = new Array<FBAlbum>();
			var a :Array<Dynamic> = result.objectForKey("data");
			
			for (obj in a) {
				if (obj.objectForKey("count") == null) {
					continue;
				}
				var album = new FBAlbum();
				album.name = obj.objectForKey("name");
				album.nr = obj.objectForKey("count");
				album.coverPhoto = obj.objectForKey("cover_photo");
				album.albumId = obj.objectForKey("id");
				fb_albums.push(album);
			}
			tableView.reloadData();
			
			activityView.stopAnimating();
			activityView.removeFromSuperview();
			activityView = null;
		}
	});
}


/*public function shouldAutorotate () :Bool {
    return true;
}*/

/*- (BOOL)supportedInterfaceOrientations () :Bool {
    return UIInterfaceOrientationMaskAll;
}*/


// swipe support

public function canSwipeLeft () :Bool {
	return false;
}
public function canSwipeRight () :Bool {
	return false;
}

}


interface AlbumPickerDelegate {
	public function localAlbumPicked(album:ALAssetsGroup) :Void;
	public function selectMovieAtPath (path:String) :Void;
}
