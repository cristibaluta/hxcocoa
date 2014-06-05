import ios.ui.UIImageView;
import swift.graphics.CGGeometry;
import swift.graphics.CGImage;

class IMImage {
	
	public var imageView :UIImageView;
	public var image :CGImageRef;
	
	// Set this when you create the object
	public var fromFrame :CGRect;
	public var toFrame :CGRect;

	// Used in 'exportig' mode
	public var from_frame_nr :Int;
	public var to_frame_nr :Int;
	public var kbInFrame :Int;
	public var kbOutFrame :Int;
	public var durationFrame :Int;

	// Set this when you request a frame, used in 'exporting' mode
	public var x :Float;
	public var y :Float;
	public var width :Float;
	public var height :Float;
	public var scale :Float;
	public var alpha :Float;
	
	public function new () :Void {}
		
	public function setFrameState (frame:Int) :Void {
		
		x = lineEquation (fromFrame.origin.x, toFrame.origin.x, frame, from_frame_nr, to_frame_nr);
		y = lineEquation (fromFrame.origin.y, toFrame.origin.y, frame, from_frame_nr, to_frame_nr);
		width = lineEquation (fromFrame.size.width, toFrame.size.width, frame, from_frame_nr, to_frame_nr);
		height = lineEquation (fromFrame.size.height, toFrame.size.height, frame, from_frame_nr, to_frame_nr);
		scale = width / toFrame.size.width;
		alpha = 1;
	
		if (frame >= from_frame_nr && frame <= kbInFrame) {
			alpha = lineEquation (0, 1, frame, from_frame_nr, kbInFrame);
		}
		else if (frame >= kbOutFrame && frame <= to_frame_nr) {
			alpha = lineEquation (1, 0, frame, kbOutFrame, to_frame_nr);
		}
	}
	function lineEquation (x1:Float, x2:Float, y0:Float, y1:Float, y2:Float) :Float {
		return (x2 - x1) * (y0 - y1) / (y2 - y1) + x1;
	}
}
