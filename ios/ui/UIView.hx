package ios.ui;
import objc.graphics.CGGeometry;
import objc.graphics.CGAffineTransform;
import objc.quartz.CALayer;
import objc.foundation.NSObject;
import objc.foundation.NSCoder;
import ios.ui.UIGeometry;
import ios.ui.NSLayoutConstraint;

typedef UIViewContentMode = Int;
typedef UIViewAnimationCurve = Int;
typedef UIViewAnimationTransition = Int;
typedef UIViewAnimationOptions = Int;
typedef UILayoutConstraintAxis = Int;


extern class UIView extends UIResponder, implements NSCoding/*, implements UIAppearance, implements UIAppearanceContainer*/ {
	
	function new() : Void;
	public static function layerClass () :Class<CALayer>;
	
	public function initWithFrame (frame:CGRect) :UIView;
	
	public var userInteractionEnabled :Bool;
	public var tag :Int;
	public var layer (default, null) :CALayer;
	
	// UIViewGeometry
	public var frame :CGRect;
	public var bounds :CGRect;
	public var autoresizesSubviews :Bool;
	public var autoresizingMask :Int;
	
	
	public var center :CGPoint;
	public var transform :CGAffineTransform;
	public var contentScaleFactor :Float;
	public var multipleTouchEnabled :Bool;   // default is NO
	public var exclusiveTouch :Bool;         // default is NO

	public function hitTest (point:CGPoint, withEvent:UIEvent) :UIView;
	public function pointInside (point:CGPoint, withEvent:UIEvent) :Bool;

	public function convertPoint (point:CGPoint, toView:UIView) :CGPoint;
	public function convertRect (rect:CGRect, toView:UIView) :CGRect;

	public function sizeThatFits (size:CGSize) :CGSize;
	public function sizeToFit () :Void;

// UIViewHierarchy

	public var superview (default, null) :UIView;
	public var subviews (default, null) :Array<UIView>;
	public var window (default, null) :UIWindow;

	public function removeFromSuperview () :Void;
	public function insertSubview (view:UIView, atIndex:Int) :Void;
	public function exchangeSubviewAtIndex (index1:Int, withSubviewAtIndex:Int) :Void;

	public function addSubview (view:UIView) :Void;
	//public function insertSubview (view:UIView, belowSubview:UIView) :Void;
	//public function insertSubview (view:UIView, aboveSubview:UIView) :Void;

	public function bringSubviewToFront (view:UIView) :Void;
	public function sendSubviewToBack (view:UIView) :Void;

	public function didAddSubview (subview:UIView) :Void;
	public function willRemoveSubview (subview:UIView) :Void;

	public function willMoveToSuperview (newSuperview:UIView) :Void;
	public function didMoveToSuperview () :Void;
	public function willMoveToWindow (newWindow:UIWindow) :Void;
	public function didMoveToWindow () :Void;

	public function isDescendantOfView (view:UIView) :Bool;
	public function viewWithTag (tag:Int) :UIView;

// Allows you to perform layout before the drawing cycle happens. -layoutIfNeeded forces layout early
	public function setNeedsLayout () :Void;
	public function layoutIfNeeded () :Void;
	public function layoutSubviews () :Void;

// UIViewRendering

	public function drawRect (rect:CGRect) :Void;

	public function setNeedsDisplay () :Void;
	public function setNeedsDisplayInRect (rect:CGRect) :Void;

	public var clipsToBounds :Bool;
	public var backgroundColor :UIColor;
	public var alpha :Float;
	public var opaque :Bool;
	public var clearsContextBeforeDrawing :Bool;
	public var hidden :Bool;
	public var contentMode :UIViewContentMode;
	public var contentStretch :CGRect;

// UIViewAnimation

	public static function beginAnimations (animationID:String, context:Void) :Void;
	public static function commitAnimations () :Void;
	public static function setAnimationDelegate (delegate:Dynamic) :Void;
	public static function setAnimationWillStartSelector (selector:SEL) :Void;
	public static function setAnimationDidStopSelector (selector:SEL) :Void;
	public static function setAnimationDuration (duration:Float) :Void;
	public static function setAnimationDelay (delay:Float) :Void;
	public static function setAnimationStartDate (startDate:Date) :Void;
	public static function setAnimationCurve (curve:UIViewAnimationCurve) :Void;
	public static function setAnimationRepeatCount (repeatCount:Float) :Void;
	public static function setAnimationRepeatAutoreverses (repeatAutoreverses:Bool) :Void;
	public static function setAnimationBeginsFromCurrentState (fromCurrentState:Bool) :Void;

	public static function setAnimationTransition (transition:UIViewAnimationTransition, forView:UIView, cache:Bool) :Void;
	public static function setAnimationsEnabled (enabled:Bool) :Void;
	public static function areAnimationsEnabled () :Bool;

// UIViewAnimationWithBlocks)

	//public static function animateWithDuration (duration:Float, delay:Float, options:UIViewAnimationOptions, animations:Void->Void, completion:Bool->Void) :Void;
	//public static function animateWithDuration (duration:Float, animations:Void->Void, completion:Bool->Void) :Void;
	public static function animateWithDuration (duration:Float, animations:Void->Void) :Void;
	public static function transitionWithView (view:UIView, duration:Float, options:UIViewAnimationOptions, animations:Void->Void, completion:Bool->Void) :Void;
	public static function transitionFromView (fromView:UIView, toView:UIView, duration:Float, options:UIViewAnimationOptions, completion:Bool->Void) :Void;

// UIViewGestureRecognizers

	public var gestureRecognizers :Array<UIGestureRecognizer>;

	public function addGestureRecognizer (gestureRecognizer:UIGestureRecognizer) :Void;
	public function removeGestureRecognizer (gestureRecognizer:UIGestureRecognizer) :Void;

	@:require(ios_6_0) public function gestureRecognizerShouldBegin (gestureRecognizer:UIGestureRecognizer) :Bool;


	inline static var UILayoutConstraintAxisHorizontal :UILayoutConstraintAxis = 0;
	inline static var UILayoutConstraintAxisVertical :UILayoutConstraintAxis = 1;
	
	@:require(ios_6_0) public function constraints () :Array<UILayoutConstraintAxis>;

	@:require(ios_6_0) public function addConstraint (constraint:NSLayoutConstraint) :Void;
	@:require(ios_6_0) public function addConstraints (constraint:Array<NSLayoutConstraint>) :Void;
	@:require(ios_6_0) public function removeConstraint (constraint:NSLayoutConstraint) :Void;
	@:require(ios_6_0) public function removeConstraints (constraint:Array<NSLayoutConstraint>) :Void;

// UIConstraintBasedLayoutCoreMethods) 
	@:require(ios_6_0) public function updateConstraintsIfNeeded () :Void;
	@:require(ios_6_0) public function updateConstraints () :Void;
	@:require(ios_6_0) public function needsUpdateConstraints () :Bool;
	@:require(ios_6_0) public function setNeedsUpdateConstraints () :Void;

// UIConstraintBasedCompatibility) 

	@:require(ios_6_0) public function translatesAutoresizingMaskIntoConstraints () :Bool;
	@:require(ios_6_0) public function setTranslatesAutoresizingMaskIntoConstraints (flag:Bool) :Void;

	@:require(ios_6_0) public static function requiresConstraintBasedLayout () :Bool;

// UIConstraintBasedLayoutLayering
	@:require(ios_6_0) public function alignmentRectForFrame (frame:CGRect) :CGRect;
	@:require(ios_6_0) public function frameForAlignmentRect (alignmentRect:CGRect) :CGRect;
	@:require(ios_6_0) public function alignmentRectInsets () :UIEdgeInsets;
	@:require(ios_6_0) public function viewForBaselineLayout () :UIView;


//UIKIT_EXTERN const Float UIViewNoIntrinsicMetric NS_AVAILABLE_IOS(6_0); // -1
	@:require(ios_6_0) public function intrinsicContentSize () :CGSize;
	@:require(ios_6_0) public function invalidateIntrinsicContentSize () :Void;

	@:require(ios_6_0) public function contentHuggingPriorityForAxis (axis:UILayoutConstraintAxis) :UILayoutPriority;
	@:require(ios_6_0) public function setContentHuggingPriority (priority:UILayoutPriority, forAxis:UILayoutConstraintAxis) :Void;

	@:require(ios_6_0) public function contentCompressionResistancePriorityForAxis (axis:UILayoutConstraintAxis) :UILayoutPriority;
	@:require(ios_6_0) public function setContentCompressionResistancePriority (priority:UILayoutPriority, forAxis:UILayoutConstraintAxis) :Void;


// Size To Fit

//UIKIT_EXTERN const CGSize UILayoutFittingCompressedSize NS_AVAILABLE_IOS(6_0);
//UIKIT_EXTERN const CGSize UILayoutFittingExpandedSize NS_AVAILABLE_IOS(6_0);

// UIConstraintBasedLayoutFittingSize
	@:require(ios_6_0) public function systemLayoutSizeFittingSize (targetSize:CGSize) :CGSize;

// UIConstraintBasedLayoutDebugging
	@:require(ios_6_0) public function constraintsAffectingLayoutForAxis (axis:UILayoutConstraintAxis) :Array<UILayoutConstraintAxis>;
	@:require(ios_6_0) public function hasAmbiguousLayout () :Bool;
	@:require(ios_6_0) public function exerciseAmbiguityInLayout () :Void;

//UIStateRestoration)
	@:require(ios_6_0) public var restorationIdentifier :String;
	@:require(ios_6_0) public function encodeRestorableStateWithCoder (code:NSCoder) :Void;
	@:require(ios_6_0) public function decodeRestorableStateWithCoder (code:NSCoder) :Void;
	
}


/*typedef NS_ENUM(Int, UIViewAnimationCurve) {
    UIViewAnimationCurveEaseInOut,         // slow at beginning and end
    UIViewAnimationCurveEaseIn,            // slow at beginning
    UIViewAnimationCurveEaseOut,           // slow at end
    UIViewAnimationCurveLinear
};

typedef NS_ENUM(Int, UIViewContentMode) {
    UIViewContentModeScaleToFill,
    UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
    UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
    UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
    UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
    UIViewContentModeTop,
    UIViewContentModeBottom,
    UIViewContentModeLeft,
    UIViewContentModeRight,
    UIViewContentModeTopLeft,
    UIViewContentModeTopRight,
    UIViewContentModeBottomLeft,
    UIViewContentModeBottomRight,
};

typedef NS_ENUM(Int, UIViewAnimationTransition) {
    UIViewAnimationTransitionNone,
    UIViewAnimationTransitionFlipFromLeft,
    UIViewAnimationTransitionFlipFromRight,
    UIViewAnimationTransitionCurlUp,
    UIViewAnimationTransitionCurlDown,
};

typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
    UIViewAutoresizingNone                 = 0,
    UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
    UIViewAutoresizingFlexibleWidth        = 1 << 1,
    UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
    UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
    UIViewAutoresizingFlexibleHeight       = 1 << 4,
    UIViewAutoresizingFlexibleBottomMargin = 1 << 5
};

typedef NS_OPTIONS(NSUInteger, UIViewAnimationOptions) {
    UIViewAnimationOptionLayoutSubviews            = 1 <<  0,
    UIViewAnimationOptionAllowUserInteraction      = 1 <<  1, // turn on user interaction while animating
    UIViewAnimationOptionBeginFromCurrentState     = 1 <<  2, // start all views from current value, not initial value
    UIViewAnimationOptionRepeat                    = 1 <<  3, // repeat animation indefinitely
    UIViewAnimationOptionAutoreverse               = 1 <<  4, // if repeat, run animation back and forth
    UIViewAnimationOptionOverrideInheritedDuration = 1 <<  5, // ignore nested duration
    UIViewAnimationOptionOverrideInheritedCurve    = 1 <<  6, // ignore nested curve
    UIViewAnimationOptionAllowAnimatedContent      = 1 <<  7, // animate contents (applies to transitions only)
    UIViewAnimationOptionShowHideTransitionViews   = 1 <<  8, // flip to/from hidden state instead of adding/removing
    
    UIViewAnimationOptionCurveEaseInOut            = 0 << 16, // default
    UIViewAnimationOptionCurveEaseIn               = 1 << 16,
    UIViewAnimationOptionCurveEaseOut              = 2 << 16,
    UIViewAnimationOptionCurveLinear               = 3 << 16,
    
    UIViewAnimationOptionTransitionNone            = 0 << 20, // default
    UIViewAnimationOptionTransitionFlipFromLeft    = 1 << 20,
    UIViewAnimationOptionTransitionFlipFromRight   = 2 << 20,
    UIViewAnimationOptionTransitionCurlUp          = 3 << 20,
    UIViewAnimationOptionTransitionCurlDown        = 4 << 20,
    UIViewAnimationOptionTransitionCrossDissolve   = 5 << 20,
    UIViewAnimationOptionTransitionFlipFromTop     = 6 << 20,
    UIViewAnimationOptionTransitionFlipFromBottom  = 7 << 20,
} NS_ENUM_AVAILABLE_IOS(4_0);*/
