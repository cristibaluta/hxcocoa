//
//  PhotoButton.m
//  InstaSlide
//
//  Created by Baluta Cristian on 10/04/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//
import ios.ui.*;
import swift.foundation.*;
import swift.graphics.CGGeometry;

class CollectionCell extends UICollectionViewCell {

public var imageView :UIImageView;
public var markImage :UIImageView;
public var index :Int;

@:sel(" initWithFrame:")
public function initWithFrame (frame:CGRect) :Dynamic {
	untyped __swift__("self = [super initWithFrame:frame];");
	
	imageView = new UIImageView();
	imageView.frame = new CGRect(0, 0, frame.size.width, frame.size.height);
	imageView.contentMode = UIViewContentModeScaleAspectFill;
	imageView.clipsToBounds = true;
	addSubview(imageView);
	
	markImage = new UIImageView();
	markImage.frame = new CGRect(6, 6, 16, 16);
	markImage.image = UIImage.imageNamed("Checkmark");
	markImage.hidden = true;
	addSubview(markImage);
	
	return this;
}

public function select (sel:Bool) {
	
	markImage.hidden = !sel;
	
	if (sel) {
		UIView.beginAnimations ("zoom", null);
		UIView.setAnimationDuration(0.2);
		
		imageView.frame = CGGeometry.CGRectMake(0, 0, this.frame.size.width, this.frame.size.height);
		imageView.alpha = 1;
		
		UIView.commitAnimations();
	}
	else {
		imageView.frame = new CGRect(6, 6, this.frame.size.width-12, this.frame.size.height-12);
		imageView.alpha = 0.6;
	}
}


public function  dealloc () {
	trace("dealloc collection cell");
	imageView.removeFromSuperview();
	imageView = null;
	markImage.removeFromSuperview();
	markImage = null;
}


}
