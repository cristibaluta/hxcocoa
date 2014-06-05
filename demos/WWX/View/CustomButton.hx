//
//  CheckmarkButton.m
//  InstaSlide
//
//  Created by Baluta Cristian on 11/04/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//
import ios.ui.*;
import swift.graphics.CGGeometry;

@:include("QuartzCore/QuartzCore.h")
class CustomButton extends UIControl {

	var background :UIView;
	var hitArea :UIView;
	public var label :UILabel;
	public var image :UIImageView;
	
public function initWithFrame(frame:CGRect) {
	
    // Initialization code
	background = new UIView();
	background.frame = new CGRect(0, 0, 32, 32);
	background.backgroundColor = UIColor.whiteColor();
	background.layer.cornerRadius = 16;
	background.userInteractionEnabled = false;
	addSubview(background);
	
	label = new UILabel();
	label.frame = new CGRect(40, 0, 200, 32);
	label.backgroundColor = UIColor.clearColor();
	label.textColor = UIColor.whiteColor();
	label.font = UIFont.systemFontOfSize(13);
	addSubview(label);
	
	image = new UIImageView();
	image.frame = new CGRect(8, 8, 16, 16);
	addSubview(image);
	
	hitArea = new UIView();
	hitArea.frame = new CGRect(0, 0, frame.size.width, frame.size.height);
	hitArea.userInteractionEnabled = false;
	addSubview(hitArea);
	
	selected = true;
}

public function select (v:Bool) {
	
	selected = v;
	
	UIView.beginAnimations ("fade", null);
	UIView.setAnimationDuration(0.2);
	UIView.setAnimationCurve (UIViewAnimationCurveEaseOut);
	
	background.backgroundColor = v ? UIColor.whiteColor() : UIColor.darkGrayColor();
	label.alpha = v ? 1 : 0.3;
	image.alpha = v ? 1 : 0.6;
	
	UIView.commitAnimations();
}

public function dealloc() {
	background.removeFromSuperview();
	background = null;
	label.removeFromSuperview();
	label = null;
	image.removeFromSuperview();
	image = null;
	hitArea.removeFromSuperview();
	hitArea = null;
}

}
