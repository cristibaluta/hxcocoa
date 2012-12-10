package ios.iad;

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, ADError) {
#if __IPHONE_4_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
    ADErrorUnknown = 0,
    ADErrorServerFailure = 1,
    ADErrorLoadingThrottled = 2,
    ADErrorInventoryUnavailable = 3,
#endif
#if __IPHONE_4_1 <= __IPHONE_OS_VERSION_MAX_ALLOWED
    ADErrorConfigurationError = 4,
    ADErrorBannerVisibleWithoutContent = 5,
#endif
#if __IPHONE_4_3 <= __IPHONE_OS_VERSION_MAX_ALLOWED
    ADErrorApplicationInactive = 6,
#endif
#if __IPHONE_6_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
    ADErrorAdUnloaded = 7,
#endif
} NS_ENUM_AVAILABLE_IOS(4_0);

// Supported ad sizes:
typedef NS_ENUM(NSInteger, ADAdType) {
    // iPhone { portrait : 320x50, landscape : 480x32 } , iPad { portrait : 768x66, landscape : 1024x66 }
    ADAdTypeBanner,
    // iPad : 300x250, based on IAB "Medium Rectangle" Ad Unit
    ADAdTypeMediumRectangle
} NS_ENUM_AVAILABLE_IOS(6_0);

@protocol ADBannerViewDelegate;

// ADBannerView provides a view for displaying iAds in an application. iAds are automatically
// loaded, presented, and refreshed. When a banner view is tapped, the iAd will begin its
// action. In most cases, the action displays a fullscreen interactive iAd.
// NOTE: ADBannerView must be added to a view hierarchy managed by a UIViewController.
NS_CLASS_AVAILABLE(NA, 4_0)extern class ADBannerView extends UIView

// Initialize the view with a specific ad type. The ad type cannot be changed after initialization.
- (id)initWithAdType:(ADAdType)type __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_6_0);

// Returns the view's ad type.
	public var ADAdType adType __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_6_0);

// The banner view delegate is notified when advertisements are loaded, when errors occur in
// getting ads, and when banner actions begin end. On iOS 5 and later, this property is a weak
// reference and cannot be used with objects that modify the behavior of release or retain.
	public var id <ADBannerViewDelegate> delegate;

// YES if an advertisement is loaded, NO otherwise.
	public var  (nonatomic, readonly, getter=isBannerLoaded) BOOL bannerLoaded;

// YES if the user is currently engaged with a fullscreen interactive advertisement.
	public var  (nonatomic, readonly, getter=isBannerViewActionInProgress) BOOL bannerViewActionInProgress;

// Cancels the current in-progress banner view action. This should only be used in cases where the
// user's attention is required immediately.
- (void)cancelBannerViewAction;

// Reserved for future use.
	public var NSString *advertisingSection;

}

@protocol ADBannerViewDelegate <NSObject>
@optional

// This method is invoked when the banner has confirmation that an ad will be presented, but before the ad
// has loaded resources necessary for presentation.
- (void)bannerViewWillLoadAd:(ADBannerView *)banner __OSX_AVAILABLE_STARTING(__MAC_NA, __IPHONE_5_0);

// This method is invoked each time a banner loads a new advertisement. Once a banner has loaded an ad,
// it will display that ad until another ad is available. The delegate might implement this method if
// it wished to defer placing the banner in a view hierarchy until the banner has content to display.
- (void)bannerViewDidLoadAd:(ADBannerView *)banner;

// This method will be invoked when an error has occurred attempting to get advertisement content.
// The ADError enum lists the possible error codes.
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error;

// This message will be sent when the user taps on the banner and some action is to be taken.
// Actions either display full screen content in a modal session or take the user to a different
// application. The delegate may return NO to block the action from taking place, but this
// should be avoided if possible because most advertisements pay significantly more when
// the action takes place and, over the longer term, repeatedly blocking actions will
// decrease the ad inventory available to the application. Applications may wish to pause video,
// audio, or other animated content while the advertisement's action executes.
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave;

// This message is sent when a modal action has completed and control is returned to the application.
// Games, media playback, and other activities that were paused in response to the beginning
// of the action should resume at this point.
- (void)bannerViewActionDidFinish:(ADBannerView *)banner;

}

extern NSString * const ADErrorDomain;
