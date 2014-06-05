//
//  StepsView.m
//  Instaslider
//
//  Created by Baluta Cristian on 20/04/2013.
//  Copyright (c) 2013 Baluta Cristian. All rights reserved.
//
import ios.ui.UIView;
import ios.ui.UILabel;
import ios.ui.UIColor;
import ios.ui.UIFont;
import ios.ui.UIEvent;
import swift.graphics.CGGeometry;
import swift.foundation.NSSet;


class StepsView extends UIView {

public var delegate :Dynamic;
var currentStep :Int;
var steps :Array<StepLabel>;

public function initWithFrame (frame:CGRect) {
	
	currentStep = 0;
	
	var background = new UIView();
	background.frame = new CGRect(0, 20, frame.size.width, 3);
	background.backgroundColor = UIColor.darkGrayColor();
	background.autoresizingMask = untyped UIViewAutoresizingFlexibleWidth;
	addSubview(background);
	
	steps = new Array<StepLabel>();
	
	for (i in 0...4) {
		var v = new StepLabel();
		v.frame = new CGRect(20+18+82*i, 21, 40, 40);
		v.delegate = this;
		v.autoresizingMask = untyped UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
		v.setIndex(i);
		addSubview(v);
		steps.push(v);
	}
}

public function setStep (j:Int) {
	currentStep = j;
	for (i in 0...steps.length) {
		steps[i].select(i == j);
	}
}

public function stepTouched (i:Int) {
	//NSLog(@"> touch step %i", i);
	delegate.stepTouched(i);
}

override public function touchesBegan (touches:NSSet, withEvent:UIEvent) {
	
}

override public function touchesEnded (touches:NSSet, withEvent:UIEvent) {
	var touch = touches.anyObject();
	var p = touch.locationInView(this);
	var s:StepLabel = steps[currentStep];
	
	if (p.x > s.frame.origin.x) {
		delegate.stepTouched(currentStep+1);
	}
	else {
		delegate.stepTouched(currentStep-1);
	}
	var s = "a"+"b";
}

}
