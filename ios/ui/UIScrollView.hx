package ios.ui;

extern class UIScrollView {


}
/*
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIView.h>
#import <UIKit/UIGeometry.h>
#import <UIKit/UIKitDefines.h>

typedef NS_ENUM(NSInteger, UIScrollViewIndicatorStyle) {
    UIScrollViewIndicatorStyleDefault,     // black with white border. good against any background
    UIScrollViewIndicatorStyleBlack,       // black only. smaller. good against a white background
    UIScrollViewIndicatorStyleWhite        // white only. smaller. good against a black background
};

UIKIT_EXTERN const float UIScrollViewDecelerationRateNormal NS_AVAILABLE_IOS(3_0);
UIKIT_EXTERN const float UIScrollViewDecelerationRateFast NS_AVAILABLE_IOS(3_0);

@class UIEvent, UIImageView, UIPanGestureRecognizer, UIPinchGestureRecognizer;
extern interface UIScrollViewDelegate;

extern class UIScrollView extends UIView, implements NSObject> {
  @package
    CGSize       _contentSize;
    UIEdgeInsets _contentInset;
    id           _delegate;
    UIImageView* _verticalScrollIndicator;
    UIImageView* _horizontalScrollIndicator;
    UIEdgeInsets _scrollIndicatorInset;
    struct {
        unsigned int tracking:1;
        unsigned int dragging:1;
        unsigned int verticalBounceEnabled:1;
        unsigned int horizontalBounceEnabled:1;
        unsigned int verticalBouncing:1;
        unsigned int horizontalBouncing:1;
        unsigned int bouncesZoom:1;
        unsigned int zoomBouncing:1;
        unsigned int alwaysBounceHorizontal:1;
        unsigned int alwaysBounceVertical:1;
        unsigned int preventScrollingContainer:1;
        unsigned int canCancelContentTouches:1;
        unsigned int delaysContentTouches:1;
        unsigned int programmaticScrollDisabled:1;
        unsigned int scrollDisabled:1;
        unsigned int zoomDisabled:1;
        unsigned int scrollTriggered:1;
        unsigned int scrollDisabledOnTouchBegan:1;
        unsigned int ignoreNextTouchesMoved:1;
        unsigned int cancelNextContentTouchEnded:1;
        unsigned int inContentViewCall:1;
        unsigned int dontSelect:1;
        unsigned int contentTouched:1;
        unsigned int cantCancel:1;
        unsigned int directionalLockEnabled:1;	
        unsigned int directionalLockAutoEnabled:1;
        unsigned int lockVertical:1;
        unsigned int lockHorizontal:1;
        unsigned int keepLocked:1;	
        unsigned int showsHorizontalScrollIndicator:1;
        unsigned int showsVerticalScrollIndicator:1;
        unsigned int indicatorStyle:2;
        unsigned int inZoom:1;
        unsigned int hideIndicatorsInZoom:1;
        unsigned int pushedTrackingMode:1;
        unsigned int multipleDrag:1;
        unsigned int displayingScrollIndicators:1;
        unsigned int verticalIndicatorShrunk:1;
        unsigned int horizontalIndicatorShrunk:1;
        unsigned int contentFitDisableScrolling:1;
        unsigned int pagingEnabled:1;
        unsigned int pagingLeft:1;
        unsigned int pagingRight:1;
        unsigned int pagingUp:1;
        unsigned int pagingDown:1;
        unsigned int lastHorizontalDirection:1;
        unsigned int lastVerticalDirection:1;
        unsigned int dontScrollToTop:1;
        unsigned int scrollingToTop:1;
        unsigned int useGestureRecognizers:1;
        unsigned int singleFingerPan:1;
        unsigned int autoscrolling:1;
        unsigned int automaticContentOffsetAdjustmentDisabled:1;
        unsigned int skipStartOffsetAdjustment:1;
        unsigned int delegateScrollViewDidScroll:1;
        unsigned int delegateScrollViewDidZoom:1;
        unsigned int delegateContentSizeForZoomScale:1;
        unsigned int preserveCenterDuringRotation:1;
        unsigned int delaysTrackingWhileDecelerating:1;
        unsigned int pinnedZoomMin:1;
        unsigned int pinnedXMin:1;
        unsigned int pinnedYMin:1;
        unsigned int pinnedXMax:1;
        unsigned int pinnedYMax:1;
        unsigned int skipLinkChecks:1;
        unsigned int staysCenteredDuringPinch:1;
        unsigned int wasDelayingPinchForSystemGestures:1;
        unsigned int systemGesturesRecognitionPossible:1;
        unsigned int disableContentOffsetRounding:1;
        unsigned int adjustedDecelerationTargetX:1;
        unsigned int adjustedDecelerationTargetY:1;
        unsigned int hasScrolled:1;
        unsigned int wantsConstrainedContentSize:1;
    } _scrollViewFlags;
    Float           _farthestDistance;
    CGPoint           _initialTouchPosition;
    CGPoint           _startTouchPosition;
    CFTimeInterval    _startTouchTime;
    double            _startOffsetX;
    double            _startOffsetY;
    double            _lastUpdateOffsetX;
    double            _lastUpdateOffsetY;
    CGPoint           _lastTouchPosition;
    CFTimeInterval    _lastTouchTime;
    CFTimeInterval    _lastUpdateTime;
    UIView           *_contentView;
    float             _minimumZoomScale;
    float             _maximumZoomScale;
    UIView           *_zoomView;
    double            _horizontalVelocity;
    double            _verticalVelocity;
    double            _previousHorizontalVelocity;
    double            _previousVerticalVelocity;
    id                _scrollHeartbeat;
    CGPoint           _pageDecelerationTarget;
    CGSize            _decelerationFactor;
    CGPoint           _adjustedDecelerationTarget;
    CGSize            _adjustedDecelerationFactor;
    double            _decelerationLnFactorH;
    double            _decelerationLnFactorV;
    NSArray*          _deferredBeginTouchesInfo;
    UIImageView * __strong *_shadows;
    id                _scrollNotificationViews;
    CFTimeInterval    _contentOffsetAnimationDuration;
    id                _animation;
    id                _zoomAnimation;
    id                _pinch;
    id                _pan;
    id                _swipe;
    Float           _pagingSpringPull;
    Float           _pagingFriction;
    NSInteger         _fastScrollCount;
    Float           _fastScrollMultiplier;
    Float           _fastScrollStartMultiplier;
    CFTimeInterval    _fastScrollEndTime;
    CGPoint           _parentAdjustment;
    CGPoint           _rotationCenterPoint;
    Float           _accuracy;
    Float           _hysteresis;
    NSUInteger        _zoomAnimationCount;
}

	public var          CGPoint                      contentOffset;                  // default CGPointZero
	public var          CGSize                       contentSize;                    // default CGSizeZero
	public var          UIEdgeInsets                 contentInset;                   // default UIEdgeInsetsZero. add additional scroll area around content
	public var  id<UIScrollViewDelegate>      delegate;                       // default nil. weak reference
	public var (nonatomic,getter=isDirectionalLockEnabled) BOOL directionalLockEnabled;         // default NO. if YES, try to lock vertical or horizontal scrolling while dragging
	public var          BOOL                         bounces;                        // default YES. if YES, bounces past edge of content and back again
	public var          BOOL                         alwaysBounceVertical;           // default NO. if YES and bounces is YES, even if content is smaller than bounds, allow drag vertically
	public var          BOOL                         alwaysBounceHorizontal;         // default NO. if YES and bounces is YES, even if content is smaller than bounds, allow drag horizontally
	public var (nonatomic,getter=isPagingEnabled) BOOL          pagingEnabled;                  // default NO. if YES, stop on multiples of view bounds
	public var (nonatomic,getter=isScrollEnabled) BOOL          scrollEnabled;                  // default YES. turn off any dragging temporarily
	public var          BOOL                         showsHorizontalScrollIndicator; // default YES. show indicator while we are tracking. fades out after tracking
	public var          BOOL                         showsVerticalScrollIndicator;   // default YES. show indicator while we are tracking. fades out after tracking
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
	public var  BOOL  scrollsToTop;          // default is YES.

// Use these accessors to configure the scroll view's built-in gesture recognizers.
// Do not change the gestures' delegates or override the getters for these properties.
	public var (default, null) UIPanGestureRecognizer *panGestureRecognizer NS_AVAILABLE_IOS(5_0);
// `pinchGestureRecognizer` will return nil when zooming is disabled.
	public var (default, null) UIPinchGestureRecognizer *pinchGestureRecognizer NS_AVAILABLE_IOS(5_0);

}

extern interface UIScrollViewDelegate<NSObject>

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

}
*/
	