//
//  UISearchBar.h
package ios.ui;
//
//  Copyright (c) 2008-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIView.h>
#import <UIKit/UIInterface.h>
#import <UIKit/UIGeometry.h>
#import <UIKit/UITextField.h>
#import <UIKit/UIKitDefines.h>

typedef NS_ENUM(Int, UISearchBarIcon) {
    UISearchBarIconSearch, // The magnifying glass
    UISearchBarIconClear, // The circle with an x in it
    UISearchBarIconBookmark, // The open book icon
    UISearchBarIconResultsList, // The list lozenge icon
};

extern interface UISearchBarDelegate;
@class UITextField, UILabel, UIButton, UIColor;

extern class UISearchBar extends UIView {

	public var         UIBarStyle              barStyle;              // default is UIBarStyleDefault (blue)
	public var  id<UISearchBarDelegate> delegate;              // weak reference. default is nil
public var text :String;
public var prompt :String;
public var placeholder :String;
	public var         BOOL                    showsBookmarkButton;   // default is NO
	public var         BOOL                    showsCancelButton;     // default is NO
	public var         BOOL                    showsSearchResultsButton NS_AVAILABLE_IOS(3_2); // default is NO
	public var (nonatomic, getter=isSearchResultsButtonSelected) BOOL searchResultsButtonSelected NS_AVAILABLE_IOS(3_2); // default is NO
	public function setShowsCancelButton:(BOOL)showsCancelButton animated:(BOOL)animated NS_AVAILABLE_IOS(3_0);

	public var (nonatomic,retain) UIColor                *tintColor;             // default is nil
	public var (nonatomic,assign,getter=isTranslucent) BOOL translucent NS_AVAILABLE_IOS(3_0); // Default is NO. Always YES if barStyle is set to UIBarStyleBlackTranslucent

// available text input traits
	public var  UITextAutocapitalizationType autocapitalizationType;  // default is UITextAutocapitalizationTypeNone
	public var  UITextAutocorrectionType     autocorrectionType;      // default is UITextAutocorrectionTypeDefault
	public var  UITextSpellCheckingType      spellCheckingType;       // default is UITextSpellCheckingTypeDefault
	public var  UIKeyboardType               keyboardType;            // default is UIKeyboardTypeDefault

public var  NSArray   *scopeButtonTitles        NS_AVAILABLE_IOS(3_0); // array of NSStrings. no scope bar shown unless 2 or more items
	public var       NSInteger  selectedScopeButtonIndex NS_AVAILABLE_IOS(3_0); // index into array of scope button titles. default is 0. ignored if out of range
	public var       BOOL       showsScopeBar            NS_AVAILABLE_IOS(3_0); // default is NO. if YES, shows the scope bar. call sizeToFit: to update frame

/* Allow placement of an input accessory view to the keyboard for the search bar
 */
	public var  (nonatomic, readwrite, retain) UIView *inputAccessoryView;

// 1pt wide images and resizable images will be scaled or tiled according to the resizable area, otherwise the image will be tiled
	public var (nonatomic,retain) UIImage *backgroundImage NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
	public var (nonatomic,retain) UIImage *scopeBarBackgroundImage NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

/* In general, you should specify a value for the normal state to be used by other states which don't have a custom value set
 */

/* The rounded-rect search text field image. Valid states are UIControlStateNormal and UIControlStateDisabled
 */
	public function setSearchFieldBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
- (UIImage *)searchFieldBackgroundImageForState:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

	public function setImage:(UIImage *)iconImage forSearchBarIcon:(UISearchBarIcon)icon state:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
- (UIImage *)imageForSearchBarIcon:(UISearchBarIcon)icon state:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

//
// Customizing the appearance of the scope bar buttons.
//

/* If backgroundImage is an image returned from -[UIImage resizableImageWithCapInsets:] the cap widths will be calculated from the edge insets, otherwise, the cap width will be calculated by subtracting one from the image's width then dividing by 2. The cap widths will also be used as the margins for text placement. To adjust the margin use the margin adjustment methods.
 */
	public function setScopeBarButtonBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR; 
- (UIImage *)scopeBarButtonBackgroundImageForState:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

/* To customize the segmented control appearance you will need to provide divider images to go between two unselected segments (leftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal), selected on the left and unselected on the right (leftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal), and unselected on the left and selected on the right (leftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected).
 */
	public function setScopeBarButtonDividerImage:(UIImage *)dividerImage forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
- (UIImage *)scopeBarButtonDividerImageForLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

/* You may specify the font, text color, text shadow color, and text shadow offset for the title in the text attributes dictionary, using the keys found in UIStringDrawing.h.
 */
	public function setScopeBarButtonTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
- (NSDictionary *)scopeBarButtonTitleTextAttributesForState:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

/* To nudge the position of the search text field background in the search bar
 */
	public var  UIOffset searchFieldBackgroundPositionAdjustment NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

/* To nudge the position of the text within the search text field background
 */
	public var  UIOffset searchTextPositionAdjustment NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

/* To nudge the position of the icon within the search text field
 */
	public function setPositionAdjustment:(UIOffset)adjustment forSearchBarIcon:(UISearchBarIcon)icon NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
- (UIOffset)positionAdjustmentForSearchBarIcon:(UISearchBarIcon)icon NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
}

extern interface UISearchBarDelegate {

@optional

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;                      // return NO to not become first responder
	public function searchBarTextDidBeginEditing:(UISearchBar *)searchBar;                     // called when text starts editing
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar;                        // return NO to not resign first responder
	public function searchBarTextDidEndEditing:(UISearchBar *)searchBar;                       // called when text ends editing
	public function searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;   // called when text changes (including clear)
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_AVAILABLE_IOS(3_0); // called before text changes

	public function searchBarSearchButtonClicked:(UISearchBar *)searchBar;                     // called when keyboard search button pressed
	public function searchBarBookmarkButtonClicked:(UISearchBar *)searchBar;                   // called when bookmark button pressed
	public function searchBarCancelButtonClicked:(UISearchBar *) searchBar;                    // called when cancel button pressed
	public function searchBarResultsListButtonClicked:(UISearchBar *)searchBar NS_AVAILABLE_IOS(3_2); // called when search results button pressed

	public function searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(Int)selectedScope NS_AVAILABLE_IOS(3_0);

}
