//
//  UIBarItem.h
package ios.ui;
//
//  Copyright (c) 2008-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIGeometry.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UIAppearance.h>
#import <UIKit/UIControl.h>

@class UIImage;

extern class UIBarItem extends NSObject <UIAppearance> {
  @private
}

	public var (nonatomic,getter=isEnabled) BOOL         enabled;      // default is YES
public var              NSString    *title;        // default is nil
	public var (nonatomic,retain)           UIImage     *image;        // default is nil
	public var (nonatomic,retain)           UIImage     *landscapeImagePhone NS_AVAILABLE_IOS(5_0); // default is nil
	public var                   UIEdgeInsets imageInsets;  // default is UIEdgeInsetsZero
	public var                   UIEdgeInsets landscapeImagePhoneInsets NS_AVAILABLE_IOS(5_0);  // default is UIEdgeInsetsZero. These insets apply only when the landscapeImagePhone property is set.
	public var                   NSInteger    tag;          // default is 0

/* You may specify the font, text color, text shadow color, and text shadow offset for the title in the text attributes dictionary, using the keys found in UIStringDrawing.h.
 */
	public function setTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
- (NSDictionary *)titleTextAttributesForState:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

}
