//
//  UIAccessibilityIdentification.h
package ios.ui;
//
//  Copyright 2010-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIView.h>
#import <UIKit/UIImage.h>

extern interface UIAccessibilityIdentification <NSObject>
@required

/*
 A string that identifies the user interface element.
 default == nil
*/
	public var  NSString *accessibilityIdentifier NS_AVAILABLE_IOS(5_0);

}

extern class UIView (UIAccessibility) <UIAccessibilityIdentification>
}

/*
 Defaults to the filename of the image, if available.
 The default identifier for a UIImageView will be the identifier of its UIImage.
 */
extern class UIImage (UIAccessibility) <UIAccessibilityIdentification>
}
