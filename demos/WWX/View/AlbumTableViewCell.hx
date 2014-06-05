
import swift.foundation.*;
import swift.graphics.CGGeometry;
import ios.ui.*;
import ios.ui.UITableViewCell;
import ios.ui.UIView;



class AlbumTableViewCell extends UITableViewCell {
	
	public var customImageView :UIImageView;
	public var customTextLabel :UILabel;
	
	public function initWithStyle (style:UITableViewCellStyle, reuseIdentifier:String) :Void {
		
        // Initialization code
		backgroundColor = UIColor.clearColor();
		imageView.contentMode  = UIViewContentModeScaleAspectFill;
		imageView.clipsToBounds = true;
		
		//image view
        customImageView = new UIImageView();
		customImageView.frame = CGGeometry.CGRectMake(6, 10, 60, 60);
        contentView.addSubview ( customImageView );
		
        //labels
        customTextLabel = new UILabel();
		customTextLabel.frame = CGGeometry.CGRectMake(80,30,frame.size.width-80,20);
		customTextLabel.font = UIFont.boldSystemFontOfSize(13);
		customTextLabel.textColor = UIColor.whiteColor();
		customTextLabel.backgroundColor = UIColor.clearColor();
		customTextLabel.autoresizingMask = untyped UIViewAutoresizingFlexibleWidth;
		customTextLabel.adjustsFontSizeToFitWidth = true;
        contentView.addSubview ( customTextLabel );
        
		//accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		
		var bg :UIView = new UIView();
		bg.frame = CGGeometry.CGRectMake(0,0,frame.size.width,frame.size.height);
		bg.backgroundColor = UIColor.orangeColor();
		selectedBackgroundView = bg;
		
	}

	public function setLocalImage (img:UIImage) {
		customImageView.image = img;
	}
	public function loadFacebookImage (imageURL:String) {
    	// Load image in a new thread
    	NSThread.detachNewThreadSelector ( new SEL(loadImageData), this, imageURL);
	}
	function loadImageData (url:String) {
		
		// Load image
    	var imageData = new NSData().initWithContentsOfURL ( NSURL.URLWithString ( url));
		
		performSelectorOnMainThread ( new SEL(cacheImage), imageData, false);
	}
	function cacheImage (imageData:NSData) :Void {
    	customImageView.image = new UIImage().initWithData(imageData);
	}

	override function setSelected (selected:Bool, animated:Bool) {
    	super.setSelected (selected, animated);
	}


	public function dealloc () {
		trace("dealloc collection cell");
		customImageView.removeFromSuperview();
		customImageView = null;
		customTextLabel.removeFromSuperview();
		customTextLabel = null;
	}


}
