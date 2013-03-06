//
//  UIPasteboard.h
package ios.ui;
//
//  Copyright (c) 2008-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>

UIKIT_EXTERN NSString *const UIPasteboardNameGeneral;
UIKIT_EXTERN NSString *const UIPasteboardNameFind;

@class UIColor, UIImage;

@:require(3_0)extern class UIPasteboard extends NSObject { 
  @private
    NSString *_name;
}

+ (UIPasteboard *)generalPasteboard;
+ (UIPasteboard *)pasteboardWithName:(NSString *)pasteboardName create:(BOOL)create;
+ (UIPasteboard *)pasteboardWithUniqueName;

	public var (default, null) NSString *name;

+ (void)removePasteboardWithName:(NSString *)pasteboardName;

	public var (getter=isPersistent,nonatomic) BOOL persistent;
	public var (default, null) NSInteger changeCount;

// First item

- (NSArray *)pasteboardTypes;
- (BOOL)containsPasteboardTypes:(NSArray *)pasteboardTypes;
- (NSData *)dataForPasteboardType:(NSString *)pasteboardType;

- (id)valueForPasteboardType:(NSString *)pasteboardType;

	public function setValue:(id)value forPasteboardType:(NSString *)pasteboardType;
	public function setData:(NSData *)data forPasteboardType:(NSString *)pasteboardType;

// Multiple items

	public var (default, null) NSInteger numberOfItems;
- (NSArray *)pasteboardTypesForItemSet:(NSIndexSet*)itemSet;		
- (BOOL)containsPasteboardTypes:(NSArray *)pasteboardTypes inItemSet:(NSIndexSet *)itemSet;	
- (NSIndexSet *)itemSetWithPasteboardTypes:(NSArray *)pasteboardTypes;
- (NSArray *)valuesForPasteboardType:(NSString *)pasteboardType inItemSet:(NSIndexSet *)itemSet;	
- (NSArray *)dataForPasteboardType:(NSString *)pasteboardType inItemSet:(NSIndexSet *)itemSet;

// Direct access

public var  NSArray *items;
	public function addItems:(NSArray *)items;

}

// Notification

UIKIT_EXTERN NSString *const UIPasteboardChangedNotification;
UIKIT_EXTERN NSString *const    UIPasteboardChangedTypesAddedKey;
UIKIT_EXTERN NSString *const    UIPasteboardChangedTypesRemovedKey;

UIKIT_EXTERN NSString *const UIPasteboardRemovedNotification;

// Extensions

UIKIT_EXTERN NSArray *UIPasteboardTypeListString;
UIKIT_EXTERN NSArray *UIPasteboardTypeListURL;
UIKIT_EXTERN NSArray *UIPasteboardTypeListImage;
UIKIT_EXTERN NSArray *UIPasteboardTypeListColor;

extern class UIPasteboard(UIPasteboardDataExtensions)

public var  NSString *string;
public var  NSArray *strings;

public var  NSURL *URL;
public var  NSArray *URLs;

public var  UIImage *image;
public var  NSArray *images;

public var  UIColor *color;
public var  NSArray *colors;

}
