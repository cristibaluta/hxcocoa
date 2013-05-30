//
//  UISearchDisplayController.h
package ios.ui;

@:framework("UIKit")
extern class UISearchDisplayController extends NSObject {

- (id)initWithSearchBar:(UISearchBar *)searchBar contentsController:(UIViewController *)viewController;

	public var                            id<UISearchDisplayDelegate> delegate;

	public var (nonatomic,getter=isActive)  BOOL            active;  // configure the view controller for searching. default is NO. animated is NO
	public function setActive:(BOOL)visible animated:(BOOL)animated;       // animate the view controller for searching

	public var (default, null)                         UISearchBar                *searchBar;
	public var (default, null)                         UIViewController           *searchContentsController; // the view we are searching (often a UITableViewController)
	public var (default, null)                         UITableView                *searchResultsTableView;   // will return non-nil. create if requested
	public var                            id<UITableViewDataSource>   searchResultsDataSource;  // default is nil. delegate can provide
	public var                            id<UITableViewDelegate>     searchResultsDelegate;    // default is nil. delegate can provide
public var                              String                   *searchResultsTitle NS_AVAILABLE_IOS(5_0); // default is nil. If nil, the controller uses the default title string

}

@:framework("UIKit")
extern interface UISearchDisplayDelegate {

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
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(String *)searchString;
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(Int)searchOption;

}
