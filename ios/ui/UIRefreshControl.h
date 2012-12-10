//
//  UIRefreshControl.h
package ios.ui;
//
//  Copyright 2012 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIControl.h>
#import <UIKit/UIKitDefines.h>

NS_CLASS_AVAILABLE_IOS(6_0)extern class UIRefreshControl : UIControl

/* The designated initializer
 * This initializes a UIRefreshControl with a default height and width.
 * Once assigned to a UITableViewController, the frame of the control is managed automatically.
 * When a user has pulled-to-refresh, the UIRefreshControl fires its UIControlEventValueChanged event.
 */
- (id)init;

	public var  (nonatomic, readonly, getter=isRefreshing) BOOL refreshing;

	public var UIColor *tintColor UI_APPEARANCE_SELECTOR;
	public var NSAttributedString *attributedTitle UI_APPEARANCE_SELECTOR;

// May be used to indicate to the refreshControl that anexternal event has initiated the refresh action
	public function beginRefreshing NS_AVAILABLE_IOS(6_0);
// Must be explicitly called when the refreshing has completed
	public function endRefreshing NS_AVAILABLE_IOS(6_0);

}
