package ios.map;

import ios.ui.UIView;
import ios.ui.UIImage;
import swift.location.CLLocation;
import swift.graphics.CGGeometry;


extern enum MKAnnotationViewDragState {
    MKAnnotationViewDragStateNone;      // View is at rest, sitting on the map.
    MKAnnotationViewDragStateStarting;      // View is beginning to drag (e.g. pin lift)
    MKAnnotationViewDragStateDragging;      // View is dragging ("lift" animations are complete)
    MKAnnotationViewDragStateCanceling;     // View was not dragged and should return to it's starting position (e.g. pin drop)
    MKAnnotationViewDragStateEnding;         // View was dragged, new coordinate is set and view should return to resting position (e.g. pin drop)
}


extern class MKAnnotationView extends UIView {

	public function initWithAnnotation (annotation:MKAnnotation, reuseIdentifier:String) :MKAnnotationView;

	public var reuseIdentifier :String;

// Classes that override must call super.
	public function prepareForReuse () :Void;

	public var annotation :MKAnnotation;

	public var image :UIImage;

// By default, the center of annotation view is placed over the coordinate of the annotation.
// centerOffset is the offset in screen points from the center of the annotion view.
	public var centerOffset :CGPoint;

// calloutOffset is the offset in screen points from the top-middle of the annotation view, where the anchor of the callout should be shown.
	public var calloutOffset :CGPoint;

// Defaults to YES. If NO, ignores touch events and subclasses may draw differently.
	public var enabled :Bool;

// Defaults to NO. This gets set/cleared automatically when touch enters/exits during tracking and cleared on up.
	public var highlighted :Bool;

// Defaults to NO. Becomes YES when tapped on in the map view.
	public var selected :Bool;
	public function setSelected (selected:Bool, animated:Bool) :Void;

// If YES, a standard callout bubble will be shown when the annotation is selected.
// The annotation must have a title for the callout to be shown.
	public var canShowCallout :Bool;

// The left accessory view to be used in the standard callout.
	@:retain public var leftCalloutAccessoryView :UIView;//TODO:

// The right accessory view to be used in the standard callout.
	@:retain public var rightCalloutAccessoryView :UIView;

// If YES and the underlying id<MKAnnotation> responds to setCoordinate:, 
// the user will be able to drag this annotation view around the map.
	public var draggable :Bool;

// Automatically set to MKAnnotationViewDragStateStarting, Canceling, and Ending when necessary.
// Implementer is responsible for transitioning to Dragging and None states as appropriate.
	public var dragState :MKAnnotationViewDragState;

// Developers targeting iOS 4.2 and after must use setDragState:animated: instead of setDragState:.
	public function setDragState (newDragState:MKAnnotationViewDragState, animated:Bool) :Void;

}
