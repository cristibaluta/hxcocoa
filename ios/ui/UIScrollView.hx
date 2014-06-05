package ios.ui;

import swift.graphics.CGGeometry;
import ios.ui.UIGeometry;

@:framework("UIKit")
extern enum UIScrollViewIndicatorStyle {
    UIScrollViewIndicatorStyleDefault;     // black with white border. good against any background
    UIScrollViewIndicatorStyleBlack;       // black only. smaller. good against a white background
    UIScrollViewIndicatorStyleWhite;        // white only. smaller. good against a black background
}


@:framework("UIKit")
extern class UIScrollView extends UIView {

	public var contentOffset :CGPoint;                  // default CGPointZero
	public var contentSize :CGSize;                    // default CGSizeZero
	public var contentInset :UIEdgeInsets;
	public var delegate :Dynamic;//UIScrollViewDelegate;
	public var directionalLockEnabled :Bool;
	public var bounces :Bool;
	public var alwaysBounceVertical :Bool;
	public var alwaysBounceHorizontal :Bool;
	public var pagingEnabled :Bool;
	public var scrollEnabled :Bool;
	public var showsHorizontalScrollIndicator :Bool;
	public var showsVerticalScrollIndicator :Bool;
	#if ddd
	public var          UIEdgeInsets                 scrollIndicatorInsets;          // default is UIEdgeInsetsZero. adjust indicators inside of insets
	public var          UIScrollViewIndicatorStyle   indicatorStyle;                 // default is UIScrollViewIndicatorStyleDefault
	public var          float                        decelerationRate NS_AVAILABLE_IOS(3_0);

	public function setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;  // animate at constant velocity to new offset
	public function scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;         // scroll so rect is just visible (nearest edges). nothing if rect completely visible

	public function flashScrollIndicators;             // displays the scroll indicators for a short time. This should be done whenever you bring the scroll view to front.



	public var (nonatomic,readonly,getter=isTracking)     BOOL tracking;        // returns YES if user has touched. may not yet have started dragging
	public var (nonatomic,readonly,getter=isDragging)     BOOL dragging;        // returns YES if user has started scrolling. this may require some time and or distance to move to initiate dragging
	public var (nonatomic,readonly,getter=isDecelerating) BOOL decelerating;    // returns YES if user isn't dragging (touch up) but scroll view is still moving

	public var  BOOL delaysContentTouches;       // default is YES. if NO, we immediately call -touchesShouldBegin:withEvent:inContentView:
	public var  BOOL canCancelContentTouches;    // default is YES. if NO, then once we start tracking, we don't try to drag if the touch moves

// override points for subclasses to control delivery of touch events to subviews of the scroll view
// called before touches are delivered to a subview of the scroll view. if it returns NO the touches will not be delivered to the subview
// default returns YES
- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view;
// called before scrolling begins if touches have already been delivered to a subview of the scroll view. if it returns NO the touches will continue to be delivered to the subview and scrolling will not occur
// not called if canCancelContentTouches is NO. default returns YES if view isn't a UIControl
- (BOOL)touchesShouldCancelInContentView:(UIView *)view;



	public var  float minimumZoomScale;     // default is 1.0
	public var  float maximumZoomScale;     // default is 1.0. must be > minimum zoom scale to enable zooming

	public var  float zoomScale NS_AVAILABLE_IOS(3_0);            // default is 1.0
	public function setZoomScale:(float)scale animated:(BOOL)animated NS_AVAILABLE_IOS(3_0);
	public function zoomToRect:(CGRect)rect animated:(BOOL)animated NS_AVAILABLE_IOS(3_0);

	public var  BOOL  bouncesZoom;          // default is YES. if set, user can go past min/max zoom while gesturing and the zoom will animate to the min/max value at gesture end

	public var (nonatomic,readonly,getter=isZooming)       BOOL zooming;       // returns YES if user in zoom gesture
	public var (nonatomic,readonly,getter=isZoomBouncing)  BOOL zoomBouncing;  // returns YES if we are in the middle of zooming back to the min/max value

// When the user taps the status bar, the scroll view beneath the touch which is closest to the status bar will be scrolled to top, but only if its `scrollsToTop` property is YES, its delegate does not return NO from `shouldScrollViewScrollToTop`, and it is not already at the top.
// On iPhone, we execute this gesture only if there's one on-screen scroll view with `scrollsToTop` == YES. If more than one is found, none will be scrolled.
	public var scrollsToTop :Bool;          // default is YES.

// Use these accessors to configure the scroll view's built-in gesture recognizers.
// Do not change the gestures' delegates or override the getters for these properties.
	public var (default, null) UIPanGestureRecognizer *panGestureRecognizer NS_AVAILABLE_IOS(5_0);
// `pinchGestureRecognizer` will return nil when zooming is disabled.
	public var (default, null) UIPinchGestureRecognizer *pinchGestureRecognizer NS_AVAILABLE_IOS(5_0);
	#end
}

@:framework("UIKit")
extern interface UIScrollViewDelegate {
	#if ddd
@optional

	public function scrollViewDidScroll:(UIScrollView *)scrollView;                                               // any offset changes
	public function scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2); // any zoom scale changes

// called on start of dragging (may require some time and or distance to move)
	public function scrollViewWillBeginDragging:(UIScrollView *)scrollView;
// called on finger up if the user dragged. velocity is in points/second. targetContentOffset may be changed to adjust where the scroll view comes to rest. not called when pagingEnabled is YES
	public function scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0);
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
	public function scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

	public function scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;   // called on finger up as we are moving
	public function scrollViewDidEndDecelerating:(UIScrollView *)scrollView;      // called when scroll view grinds to a halt

	public function scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView; // called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView;     // return a view that will be scaled. if delegate returns nil, nothing happens
	public function scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view NS_AVAILABLE_IOS(3_2); // called before the scroll view begins zooming its content
	public function scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale; // scale between minimum and maximum. called after any 'bounce' animations

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView;   // return a yes if you want to scroll to the top. if not defined, assumes YES
	public function scrollViewDidScrollToTop:(UIScrollView *)scrollView;      // called when scrolling animation finished. may be called immediately if already at top
	#end
}
	