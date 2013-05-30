//
//  UITableViewController.h
package ios.ui;

@:framework("UIKit")
extern class UITableViewController extends UIViewController implements UITableViewDelegate implements UITableViewDataSource {

	public function initWithStyle (style:UITableViewStyle) :UITableViewController;

	public var tableView :UITableView;
	public var clearsSelectionOnViewWillAppear :Bool;

	@:require(ios6_0)public var refreshControl :UIRefreshControl;

}
