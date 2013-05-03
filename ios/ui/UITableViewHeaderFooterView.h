//
//  UITableViewHeaderFooterView.h
package ios.ui;
//
//  Copyright (c) 2008-2012, Apple Inc. All rights reserved.
//

#import <UIKit/UIView.h>
#import <UIKit/UITableView.h>

// Either the header or footer for a section
@:require(6_0)extern class UITableViewHeaderFooterView extends UIView

	public var  UIColor *tintColor UI_APPEARANCE_SELECTOR;

	public var (default, null) UILabel* textLabel;
	public var (default, null) UILabel* detailTextLabel; // only supported for headers in grouped style

	public var (default, null) UIView *contentView;
	public var UIView *backgroundView;

	public var (default, null) String *reuseIdentifier;

- (id)initWithReuseIdentifier:(String *)reuseIdentifier;
	public function prepareForReuse;  // if the view is reusable (has a reuse identifier), this is called just before the view is returned from the table view method dequeueReusableHeaderFooterViewWithIdentifier:.  If you override, you MUST call super.

}
