import ios.ui.UIView;
import ios.ui.UILabel;
import ios.ui.UIColor;
import ios.ui.UIFont;
import ios.ui.NSText;
import objc.graphics.CGGeometry;

@:include("QuartzCore/QuartzCore.h")
class StepLabel extends UIView {
	
var background :UIView;
var label :UILabel;
public var delegate :Dynamic;
public var i :Int;

public function initWithFrame (frame:CGRect) {
    
    // Initialization code
	background = new UIView();
	background.frame = new CGRect(-16, -16, 32, 32);
	background.backgroundColor = UIColor.whiteColor();
	background.layer.cornerRadius = 16;
	addSubview(background);
	
	label = new UILabel();
	label.frame = new CGRect(-16, -16, 32, 32);
	label.backgroundColor = UIColor.clearColor();
	label.textAlignment = NSTextAlignmentCenter;
	label.font = UIFont.boldSystemFontOfSize(16);
	addSubview(label);
}

public function setIndex(i:Int) {
	this.i = i;
	label.text = "1";//[NSString stringWithFormat:@"%i", (i+1)];
}
public function select (v:Bool) {
	if (v) {
		UIView.beginAnimations("fade", null);
		UIView.setAnimationDuration(0.2);
		UIView.setAnimationCurve(UIViewAnimationCurveEaseOut);
	}
	background.backgroundColor = v ? UIColor.whiteColor() : UIColor.darkGrayColor();
	label.alpha = v ? 1 : 0.3;
	if (v) {
		UIView.commitAnimations();
	}
}

}