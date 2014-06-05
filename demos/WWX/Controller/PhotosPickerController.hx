//
//  PhotosPickerViewController.m
//  InstaSlide
//
//  Created by Baluta Cristian on 09/04/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//
import swift.foundation.*;
import swift.graphics.CGGeometry;
import ios.ui.*;
import ios.ui.UIView;
import ios.ui.UICollectionView;
import ios.assets.ALAssetsLibrary;
import ios.assets.ALAssetsGroup;
import ios.assets.ALAsset;

class PhotosPickerController extends UIViewController 
							implements UICollectionViewDataSource
							implements UICollectionViewDelegate {


	var library :ALAssetsLibrary;
	var cells :Array<CollectionCellData>;
	var inverseButton :CustomButton;
	var timeLabel :UILabel;
	var activityView :UIActivityIndicatorView;
	@:weak public var delegate :Dynamic;
	public var collectionView :UICollectionView;
	inline static var identif = "CollectionCellIdentifier";

override public function loadView () {
	var frame :CGRect = UIScreen.mainScreen().bounds;
	this.view = new UIView();
	this.view.frame = frame;
}

override public function viewDidLoad () {
	trace("photos create");
	
    super.viewDidLoad();
	
	cells = new Array<CollectionCellData>();
	
	var rect = new CGRect(0, 90, this.view.frame.size.width, this.view.frame.size.height-90-50);
	
	var layout = new UICollectionViewFlowLayout();
	layout.itemSize = CGGeometry.CGSizeMake(80, 80);
	layout.minimumInteritemSpacing = 0;
	
/*	this.collectionView = new UICollectionView();
	this.collectionView.frame = rect;
	this.collectionView.collectionViewLayout = layout;*/
	untyped __swift__("self.collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];");
	this.collectionView.delegate = this;
	this.collectionView.dataSource = this;
	this.collectionView.backgroundColor = UIColor.colorWithWhite (0.3, 0.5);
	this.collectionView.autoresizingMask = untyped UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
	this.collectionView.registerClass (untyped CollectionCell.__class(), identif);
	this.view.addSubview ( this.collectionView );
	
	inverseButton = new CustomButton();
	inverseButton.frame = new CGRect(10, this.view.frame.size.height-42, 195, 32);
	inverseButton.label.text = "INVERSE";
	inverseButton.image.image = UIImage.imageNamed("Checkmark");
	inverseButton.autoresizingMask = untyped UIViewAutoresizingFlexibleTopMargin;
	inverseButton.addTarget (this, new SEL(inverseSelections), UIControlEventTouchUpInside);
	this.view.addSubview(inverseButton);
	
/*	readyButton = [[CustomButton alloc] initWithFrame:new CGRect(this.view.frame.size.width-42-50, this.view.frame.size.height-42, 195, 32)];
	readyButton.label.text = @"READY";
	readyButton.image.frame = new CGRect(0, 0, 32, 32);
	readyButton.image.image = [UIImage imageNamed:@"ButNext"];
	readyButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
	readyButton.addTarget (this, new SEL(ready), UIControlEventTouchUpInside);
	view.addSubview(readyButton);*/
	
	timeLabel = new UILabel();
	timeLabel.frame = new CGRect(0, 75, this.view.frame.size.width, 11);
	timeLabel.backgroundColor = UIColor.clearColor();
	timeLabel.textColor = UIColor.grayColor();
	timeLabel.font = UIFont.systemFontOfSize(11);
	timeLabel.text = "";
	view.addSubview(timeLabel);
}

public function loadLocalAlbum (album:ALAssetsGroup) {
	//trace("loadalbum %@", album);
	
	var groupEnumerator = function (asset:ALAsset, index:Int, stop:Bool) {
		
        if (asset != null) {
			
			var dict :NSDictionary = asset.valueForProperty( untyped ALAssetPropertyURLs);
			var url :NSURL = dict.objectForKey("public.jpeg");
			if (url != null) {
				//trace("%@", url);
				var cell:CollectionCellData = new CollectionCellData();
				cell.localurl = url;
				cell.selected = true;
				cell.type = Local;
				cell.delegate = this;
				cells.push(cell);
			}
        }
		else {
			//NSLog (@"finished %i", [images count]);
			
			Concurrency.dispatch_async (Concurrency.dispatch_get_main_queue(), function(){
				collectionView.reloadData();
				printTime();
			});
		}
    };
	
	album.enumerateAssetsUsingBlock ( groupEnumerator );
}

public function loadFacebookAlbum (albumId:String) {
	//trace("load fb album %@", albumId);
	
	activityView = new UIActivityIndicatorView().initWithActivityIndicatorStyle ( UIActivityIndicatorViewStyleWhiteLarge);
	var rect = activityView.frame;
	rect.origin.x = this.collectionView.frame.size.width/2 - rect.size.width/2;
	rect.origin.y = this.collectionView.frame.size.height/2 - rect.size.height/2;
	activityView.frame = rect;
	collectionView.addSubview(activityView);
	activityView.startAnimating();
	
	var req = FBRequest.requestForGraphPath (albumId + "/photos?limit=500");
	
	req.startWithCompletionHandler ( function (connection:FBRequestConnection, result:Dynamic, error:NSError) {
		//trace("%@", result);
		if (result != null) {
			var data :Array<Dynamic> = result.objectForKey("data");
			
			for (obj in data) {
				var cell = new CollectionCellData();
				cell.thumbUrl = obj.objectForKey("picture");
				cell.sourceUrl = obj.objectForKey("source");
				cell.selected = true;
				cell.type = Facebook;
				cell.delegate = this;
				cells.push(cell);
			}
			
			collectionView.reloadData();
			printTime();
			
			activityView.stopAnimating();
			activityView.removeFromSuperview();
			activityView = null;
		}
		}
	);
}

public function inverseSelections () {
	
	inverseButton.select ( !inverseButton.selected );
	
	// Inverse the array state
	for (cell in cells) {
		cell.selected = !cell.selected;
	}
	// Iterate over all active cells and change their state
	var visibleCells :Array<UICollectionViewCell> = this.collectionView.visibleCells();
	for (cell in visibleCells) {
		cast (cell, CollectionCell).select ( cells[cast(cell,CollectionCell).index].selected );
	}
	
	printTime();
}
public function ready() {
	//delegate.photosPicked ( selectedImagesUrls() );
}

public function selectedImagesUrls () :Array<Dynamic> {
	
	var urls = new Array<Dynamic>();
	
	for (cell in cells) {
		if (cell.selected) {
			if (cell.type == Local) {
				urls.push ( cell.localurl );
			}
			else if (cell.type == Facebook) {
				urls.push ( cell.sourceUrl );
			}
		}
	}
	
	return urls;
}

public function isFacebook() {
	if (cells.length > 0) {
		return cells[0].type == Facebook;
	}
	return false;
}

public function printTime() {
	
	var nr_of_active_cells = 0;
	for (cell in cells) if (cell.selected) nr_of_active_cells++;
	var videoDuration = 7 * nr_of_active_cells;
	var min = Math.floor (videoDuration / 60);
	var sec = Math.ceil (videoDuration - min * 60);
	//timeLabel.text = "Video duration %@%imin:%@%isec " + (min<10?"0":"") + min + (sec<10?"0":"") + sec;
}


// -
// Table View Data Source Methods

@:sel("collectionView:numberOfItemsInSection:")
public function numberOfItemsInSection (collectionView:UICollectionView, section:Int) :Int {
    return cells.length;
}

@:sel("collectionView:cellForItemAtIndexPath:")
public function cellForItemAtIndexPath (collectionView_:UICollectionView, indexPath:NSIndexPath) :UICollectionViewCell {
	
	var cell :CollectionCell = collectionView_.dequeueReusableCellWithReuseIdentifier (identif, indexPath);
    var celldata = cells[indexPath.item];
	
	cell.index = indexPath.item;
	celldata.indexPath = indexPath;
	celldata.loadFinishedForIndexPath = loadFinishedForIndexPath;
	
	if (celldata.image == null) {
		cell.imageView.image = null;
		
		Concurrency.dispatch_async (Concurrency.dispatch_get_global_queue(0,0), function(){
			
			if (celldata.type == Local) {
				celldata.loadImageFromLibrary(celldata.localurl);
			}
			else if (celldata.type == Facebook) {
				celldata.loadImageFromUrl(celldata.thumbUrl);
			}
		});
	}
	else {
		cell.imageView.image = celldata.image;
	}
	
	cell.select(celldata.selected);
	
    return cell;
}

@:sel("collectionView:didSelectItemAtIndexPath:")
public function didSelectItemAtIndexPath (collectionView:UICollectionView, indexPath:NSIndexPath) {
	
	var celldata = cells[indexPath.item];
	
	if (celldata.selected) {
		var cell :CollectionCell = cast (collectionView.cellForItemAtIndexPath ( indexPath ), CollectionCell);
		cell.select ( false);
		celldata.selected = false;
	}
	else {
		var cell :CollectionCell = cast (collectionView.cellForItemAtIndexPath ( indexPath ), CollectionCell);
		cell.select ( true);
		celldata.selected = true;
	}
	printTime();
}

public function numberOfSectionsInCollectionView (collectionView:UICollectionView):Int {
	return 1;
}





// -
// CollectionCell image loading

public function startLoadingForIndexPath (indexPath:NSIndexPath) {
	
    var celldata:CollectionCellData = cells[indexPath.item];
    if (celldata.image == null)
    {
		
    }
}

// Called when an icon is ready to be displayed
public function loadFinishedForIndexPath (indexPath:NSIndexPath) {
	
	Concurrency.dispatch_async (Concurrency.dispatch_get_main_queue(), function(){
        var cell = cast ( collectionView.cellForItemAtIndexPath(indexPath), CollectionCell);
		var celldata = cells[indexPath.item];
		cell.imageView.image = celldata.image;
	});
    
}


// swipe support

public function canSwipeLeft():Bool {
	return true;
}
public function canSwipeRight():Bool {
	return true;
}


public function dealloc () {
	trace("dealloc photos controller");
	
	inverseButton.removeFromSuperview();
	inverseButton = null;
	timeLabel.removeFromSuperview();
	timeLabel = null;
	activityView.removeFromSuperview();
	activityView.stopAnimating();
	activityView = null;
	this.collectionView.removeFromSuperview();
	this.collectionView.delegate = null;
	this.collectionView.dataSource = null;
	this.collectionView = null;
	
	//cells.removeAllObjects();
	cells = null;
	
	library = null;
}


}

interface PhotosPickerDelegate {
}
