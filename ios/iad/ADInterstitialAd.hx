package ios.iad;

#import <Foundation/Foundation.h>
#import <iAd/ADBannerView.h>


@protocol ADInterstitialAdDelegate;

/*!
 ADInterstitialAd is a full screen advertisement, available on iPad only.

 There are two ways to display an ADInterstitialAd:
 • By providing a container view and calling presentInView:
 • By providing a view controller and calling presentFromViewController:

 ADInterstitialAd should not be used until it has loaded content. This is indicated via the delegate method
 interstitialAdDidLoad: and can also be queried via the loaded property. If the interstitial ad is
 presented before it has loaded, it will throw an exception.
 */

NS_CLASS_AVAILABLE(NA, 4_3)extern class ADInterstitialAd extends NSObject

// The interstitial ad's delegate is notified when it has loaded, when errors occur in
// getting ads, when actions begin and end, and when it has unloaded.
// Applications built against the iOS 5.0 or later SDK and when running on iOS 5.0 or later
// may treat the delegate as if it was 'weak' instead of 'assign' (aka _unsafe_unretained).
	public var id <ADInterstitialAdDelegate> delegate;

// YES if an advertisement is loaded, NO otherwise. This property should always be checked before the
// interstitial ad is presented.
	public var  (nonatomic, readonly, getter=isLoaded) BOOL loaded;

// Actions display full screen content in a modal session. Use this property to determine
// if such an action is currently in progress.
	public var  (nonatomic, readonly, getter=isActionInProgress) BOOL actionInProgress;

// Cancels the current in-progress action. This should only be used in cases where the
// user's attention is required immediately. If this method IS invoked, there will not be a delegate call
// to interstitialAdActionDidFinish:.
- (void)cancelAction;

// This method should be used to display the interstitial in a view hierarchy. That view hierarchy must be managed
// by a view controller and the size of the container view must fit the following constraints:
// • Width must be full screen for the orientation (1024 in landscape, 768 in portrait).
// • Height must be at least 655 pixels in landscape, 911 pixels in portrait.
// • Height cannot exceed full screen height, including no status bar (768 in landscape, 1024 in portrait).
// If the size of the container does not meet these constraints, the interstitial will not be presented and
// this method will return "NO", otherwise it will return "YES".
// If the container view is not already in a view controller's managed hierarchy, it will throw an exception.
// If the interstitial has not loaded at the time this method is invoked, it will throw an exception.
- (BOOL)presentInView:(UIView *)containerView;

// This method should be used to present the interstitial ad in a non-paging UI, such as a transition
// or at the end of a game level. When this API is used, the framework will manage how the interstitial
// is displayed and what happens when the user dismisses it. User dismissal of either the interstitial
// or the ad unit to which it is linked will restore control to the application immediately.
- (void)presentFromViewController:(UIViewController *)viewController;

}

@protocol ADInterstitialAdDelegate <NSObject>

// When this method is invoked, if the application is using presentInView, the he content will be unloaded from the
// container shortly after this method is called and no new content will be loaded. This may occur either as a result
// of user actions or if the ad content has expired.
- (void)interstitialAdDidUnload:(ADInterstitialAd *)interstitialAd;

// This method will be invoked when an error has occurred attempting to get ad content.
// The ADError enum lists the possible error codes.
- (void)interstitialAd:(ADInterstitialAd *)interstitialAd didFailWithError:(NSError *)error;

@optional

// This method is invoked when the interstitial has confirmation that an ad will be presented, but before the ad
// has loaded resources necessary for presentation.
- (void)interstitialAdWillLoad:(ADInterstitialAd *)interstitialAd __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0);

// This method is invoked when the interstitial ad load ad content. The delegate should implement this method so that
// it knows when the interstitial ad is ready to be presented.
- (void)interstitialAdDidLoad:(ADInterstitialAd *)interstitialAd;

// This message will be sent when the user chooses to interact with the ad unit for the interstitial ad.
// The delegate may return NO to block the action from taking place, but this
// should be avoided if possible because most advertisements pay significantly more when
// the action takes place and, over the longer term, repeatedly blocking actions will
// decrease the ad inventory available to the application. Applications should reduce
// their own activity while the advertisement's action executes.
- (BOOL)interstitialAdActionShouldBegin:(ADInterstitialAd *)interstitialAd willLeaveApplication:(BOOL)willLeave;

// This message is sent when the action has completed and control is returned to the application.
// Games, media playback, and other activities that were paused in response to the beginning
// of the action should resume at this point.
- (void)interstitialAdActionDidFinish:(ADInterstitialAd *)interstitialAd;

}
