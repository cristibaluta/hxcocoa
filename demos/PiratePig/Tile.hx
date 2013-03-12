import ios.ui.UIImageView;
import ios.ui.UIImage;
import ios.ui.UIView;
import ios.ui.UIColor;
import objc.graphics.CGGeometry;


class Tile extends UIView {
	
	public var column:Int;
	public var moving:Bool;
	public var removed:Bool;
	public var row:Int;
	public var type:Int;
	
	
	public function new (imagePath:String) {
		trace("crate new tile "+imagePath);
		super();
		
		var image = new UIImageView().initWithImage ( UIImage.imageNamed(imagePath));
		addSubview (image);
		this.frame = CGGeometry.CGRectMake (image.frame.origin.x, image.frame.origin.y, image.frame.size.width, image.frame.size.height);
		//this.backgroundColor = UIColor.redColor();
		
		userInteractionEnabled = true;
		
		// Currently, MouseEvent listeners are added to each Tile.
		// To make them easier to tap, add an empty fill to increase 
		// the size of the hit area
		
		//graphics.beginFill (0x000000, 0);
		//graphics.drawRect (-5, -5, 66, 66);
		
	}
	
	
	public function initialize ():Void {
		moving = false;
		removed = false;
		this.alpha = 1;
	}
	
	
	public function moveTo (duration:Float, targetX:Float, targetY:Float):Void {
		
		moving = true;
		
		UIView.beginAnimations ("move_to", null);
		UIView.setAnimationDelegate(this);
		UIView.setAnimationDuration ( duration );
		UIView.setAnimationDidStopSelector ( new SEL(animationDidStop) );
		
		this.alpha = 1;
		var rect :CGRect = this.frame;
		rect.origin.x = targetX;
		rect.origin.y = targetY;
		this.frame = rect;
		
		UIView.commitAnimations();
		//Actuate.tween (this, duration, { x: targetX, y: targetY } ).ease (Quad.easeOut).onComplete (this_onMoveToComplete);
		
	}
	
	
	public function remove (animate:Bool = true):Void {
		
		userInteractionEnabled = false;
				
		superview.insertSubview (this, 0);
		
		// This is how the animations are done
		UIView.beginAnimations ("fade_out", null);
		UIView.setAnimationDelegate(this);
		UIView.setAnimationDuration ( 0.3 );
		UIView.setAnimationDidStopSelector ( new SEL(animationDidStop) );
		
		this.alpha = 0;
		var rect :CGRect = this.frame;
		rect.origin.y = rect.origin.y - rect.size.height / 2;
		this.frame = rect;
		
		UIView.commitAnimations();
		
		removed = true;
	}
	
	
	
	
	// Event Handlers
	//@:sel("animationDidStop:1:2:3:")
	function animationDidStop (animationID:String, finished:Float, context:Dynamic) {
		if (untyped animationID.isEqualToString("fade_out")) {
			this.removeFromSuperview();
		}
		else if (untyped animationID.isEqualToString("move_to")) {
			moving = false;
		}
	}
}
