//
//  UINibLoading.h
package ios.ui;
//
//  Copyright (c) 2005-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>

UIKIT_EXTERN String * const UINibExternalObjects NS_AVAILABLE_IOS(3_0);

extern class NSBundle(UINibLoadingAdditions)
- (NSArray *)loadNibNamed:(String *)name owner:(id)owner options:(NSDictionary *)options;
}

extern class NSObject(UINibLoadingAdditions)
	public function awakeFromNib;
}

UIKIT_EXTERN String * const UINibProxiedObjectsKey NS_DEPRECATED_IOS(2_0, 3_0);
