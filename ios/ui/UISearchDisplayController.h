//
//  UISearchDisplayController.h
package ios.ui;
//
//  Copyright (c) 2009-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIView.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UILabel.h>
#import <UIKit/UITableView.h>

@class UISearchBar, UITableView, UIViewController, UIPopoverController;
extern interface UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate;

@:require(3_0)extern class UISearchDisplayController extends NSObject {
  @private
    UIViewController           *_viewController;
    UITableView                *_tableView;
    UIView                     *_dimmingView;
    UISearchBar                *_searchBar;
    UILabel                    *_noResultsLabel;
    NSString                   *_noResultsMessage;
    NSString                   *_resultsTitle;
    id<UISearchDisplayDelegate> _delegate;
    id<UITableViewDataSource>   _tableViewDataSource;
    id<UITableViewDelegate>     _tableViewDelegate;
    CFMutableArrayRef           _containingScrollViews;
    Float                     _lastKeyboardAdjustment;
    Float                     _lastFooterAdjustment;
    UIPopoverController        *_popoverController;
    UITableViewStyle            _searchResultsTableViewStyle;
    id                          _navigationControllerBookkeeper;
    struct {
        unsigned int visible:1;
        unsigned int animating:1;
        unsigned int hidIndexBar:1;
        unsigned int hidNavigationBar:1;
        unsigned int noResultsMessageVisible:1;
        unsigned int noResultsMessageAutoDisplay:1;
        unsigned int navigationBarHidingEnabled:1;
        unsigned int dimTableViewOnEmptySearchString:1;
        unsigned int isRotatingWithPopover:1;
        unsigned int cancelButtonManagementDisabled:1;
        unsigned int allowDisablingNavigationBarHiding:1;
        unsigned int showsResultsForEmptyField:1;
        unsigned int adjustsSearchBarContentInsetForIndexBar:1;
    } _searchDisplayControllerFlags;
}

- (id)initWithSearchBar:(UISearchBar *)searchBar contentsController:(UIViewController *)viewController;

	public var                            id<UISearchDisplayDelegate> delegate;

	public var (nonatomic,getter=isActive)  BOOL            active;  // configure the view controller for searching. default is NO. animated is NO
	public function setActive:(BOOL)visible animated:(BOOL)animated;       // animate the view controller for searching

	public var (default, null)                         UISearchBar                *searchBar;
	public var (default, null)                         UIViewController           *searchContentsController; // the view we are searching (often a UITableViewController)
	public var (default, null)                         UITableView                *searchResultsTableView;   // will return non-nil. create if requested
	public var                            id<UITableViewDataSource>   searchResultsDataSource;  // default is nil. delegate can provide
	public var                            id<UITableViewDelegate>     searchResultsDelegate;    // default is nil. delegate can provide
public var                              NSString                   *searchResultsTitle NS_AVAILABLE_IOS(5_0); // default is nil. If nil, the controller uses the default title string

}

extern interface UISearchDisplayDelegate <NSObject>

@optional

// when we start/end showing the search UI
	public function  searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller;
	public function  searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller;
	public function  searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller;
	public function  searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller;

// called when the table is created destroyed, shown or hidden. configure as necessary.
	public function searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView;
	public function searchDisplayController:(UISearchDisplayController *)controller willUnloadSearchResultsTableView:(UITableView *)tableView;

// called when table is shown/hidden
	public function searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView;
	public function searchDisplayController:(UISearchDisplayController *)controller didShowSearchResultsTableView:(UITableView *)tableView;
	public function searchDisplayController:(UISearchDisplayController *)controller willHideSearchResultsTableView:(UITableView *)tableView;
	public function searchDisplayController:(UISearchDisplayController *)controller didHideSearchResultsTableView:(UITableView *)tableView;

// return YES to reload table. called when search string/option changes. convenience methods on top UISearchBar delegate methods
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString;
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(Int)searchOption;

}
