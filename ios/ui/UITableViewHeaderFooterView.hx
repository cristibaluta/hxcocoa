//
//  UITableViewHeaderFooterView.h
package ios.ui;


// Either the header or footer for a section
@:framework("UIKit")
@:require(ios6)
extern class UITableViewHeaderFooterView extends UIView {

	public var tintColor :UIColor;

	public var textLabel (default, null) :UILabel;
	public var detailTextLabel (default, null) :UILabel; // only supported for headers in grouped style

	public var contentView (default, null) :UIView;
	public var backgroundView :UIView;

	public var reuseIdentifier (default, null) :String;

	public function initWithReuseIdentifier (reuseIdentifier:String) :UITableViewHeaderFooterView;
	public function prepareForReuse():Void;  // if the view is reusable (has a reuse identifier), this is called just before the view is returned from the table view method dequeueReusableHeaderFooterViewWithIdentifier:.  If you override, you MUST call super.

}
