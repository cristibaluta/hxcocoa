//
//  UITabBar.h
package ios.ui;
//
//  Copyright (c) 2008-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UIView.h>

@class UITabBarItem;
@class UIImageView;
extern interface UITabBarDelegate;

extern class UITabBar extends UIView {
  @private
    UIView                *_customizeView;
    UIView                *_backgroundView;
    UIImageView           *_shadowView;
    id<UITabBarDelegate>   _delegate;
    NSArray               *_items;
    UITabBarItem          *_selectedItem;
    NSArray               *_customizationItems;
    struct {
        unsigned int alertShown:1;
        unsigned int wasEnabled:1;
        unsigned int customized:1;
        unsigned int downButtonSentAction:1;
        unsigned int isLocked:1;
        unsigned int backgroundIsPattern:1;
    } _tabBarFlags;
    NSArray               *_buttonItems;
    CFMutableArrayRef      _hiddenItems;
    id _appearanceStorage;
}

	public var  id<UITabBarDelegate> delegate;     // weak reference. default is nil
public var    NSArray             *items;        // get/set visible UITabBarItems. default is nil. changes not animated. shown in order
	public var  UITabBarItem        *selectedItem; // will show feedback based on mode. default is nil

	public function setItems:(NSArray *)items animated:(BOOL)animated;   // will fade in or out or reorder and adjust spacing

// Reorder items. This will display a sheet with all the items listed, allow the user to change/reorder items and shows a 'Done' button at the top

	public function beginCustomizingItems:(NSArray *)items;   // list all items that can be reordered. always animates a sheet up. visible items not listed are fixed in place
- (BOOL)endCustomizingAnimated:(BOOL)animated;    // hide customization sheet. normally you should let the user do it. check list of items to see new layout. returns YES if layout changed
- (BOOL)isCustomizing;

/* tintColor will be applied to the tab bar background
 */
	public var (nonatomic,retain) UIColor *tintColor NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

/* selectedImageTintColor will be applied to the gradient image used when creating the
 selected image. Default is nil and will result in the system bright blue for selected
 tab item images. If you wish to also customize the unselected image appearance, you must
 use -setFinishedSelectedImage:finishedUnselectedImage: on individual tab bar items.
 */
	public var (nonatomic,retain) UIColor *selectedImageTintColor NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

/* The background image will be tiled to fit, even if it was not created via the UIImage resizableImage methods.
 */
	public var (nonatomic,retain) UIImage *backgroundImage NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

/* The selection indicator image is drawn on top of the tab bar, behind the bar item icon.
 */
	public var (nonatomic,retain) UIImage *selectionIndicatorImage NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR; 

/* Default is nil. When non-nil, a custom shadow image to show instead of the default shadow image. For a custom shadow to be shown, a custom background image must also be set with -setBackgroundImage: (if the default background image is used, the default shadow image will be used).
 */
	public var (nonatomic,retain) UIImage *shadowImage NS_AVAILABLE_IOS(6_0) UI_APPEARANCE_SELECTOR;

}

//___________________________________________________________________________________________________

extern interface UITabBarDelegate<NSObject>
@optional

	public function tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item; // called when a new view is selected by the user (but not programatically)

/* called when user shows or dismisses customize sheet. you can use the 'willEnd' to set up what appears underneath. 
 changed is YES if there was some change to which items are visible or which order they appear. If selectedItem is no longer visible, 
 it will be set to nil.
 */

	public function tabBar:(UITabBar *)tabBar willBeginCustomizingItems:(NSArray *)items;                     // called before customize sheet is shown. items is current item list
	public function tabBar:(UITabBar *)tabBar didBeginCustomizingItems:(NSArray *)items;                      // called after customize sheet is shown. items is current item list
	public function tabBar:(UITabBar *)tabBar willEndCustomizingItems:(NSArray *)items changed:(BOOL)changed; // called before customize sheet is hidden. items is new item list
	public function tabBar:(UITabBar *)tabBar didEndCustomizingItems:(NSArray *)items changed:(BOOL)changed;  // called after customize sheet is hidden. items is new item list

}
