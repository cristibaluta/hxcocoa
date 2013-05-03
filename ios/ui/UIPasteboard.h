//
//  UIPasteboard.h
package ios.ui;
//
//  Copyright (c) 2008-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>

UIKIT_EXTERN String *const UIPasteboardNameGeneral;
UIKIT_EXTERN String *const UIPasteboardNameFind;

@class UIColor, UIImage;

@:require(3_0)extern class UIPasteboard extends NSObject { 
  @private
    String *_name;
}

+ (UIPasteboard *)generalPasteboard;
+ (UIPasteboard *)pasteboardWithName:(String *)pasteboardName create:(BOOL)create;
+ (UIPasteboard *)pasteboardWithUniqueName;

	public var (default, null) String *name;

+ (void)removePasteboardWithName:(String *)pasteboardName;

	public var (getter=isPersistent,nonatomic) BOOL persistent;
	public var (default, null) NSInteger changeCount;

// First item

- (NSArray *)pasteboardTypes;
- (BOOL)containsPasteboardTypes:(NSArray *)pasteboardTypes;
- (NSData *)dataForPasteboardType:(String *)pasteboardType;

- (id)valueForPasteboardType:(String *)pasteboardType;

	public function setValue:(id)value forPasteboardType:(String *)pasteboardType;
	public function setData:(NSData *)data forPasteboardType:(String *)pasteboardType;

// Multiple items

	public var (default, null) NSInteger numberOfItems;
- (NSArray *)pasteboardTypesForItemSet:(NSIndexSet*)itemSet;		
- (BOOL)containsPasteboardTypes:(NSArray *)pasteboardTypes inItemSet:(NSIndexSet *)itemSet;	
- (NSIndexSet *)itemSetWithPasteboardTypes:(NSArray *)pasteboardTypes;
- (NSArray *)valuesForPasteboardType:(String *)pasteboardType inItemSet:(NSIndexSet *)itemSet;	
- (NSArray *)dataForPasteboardType:(String *)pasteboardType inItemSet:(NSIndexSet *)itemSet;

// Direct access

public var  NSArray *items;
	public function addItems:(NSArray *)items;

}

// Notification

UIKIT_EXTERN String *const UIPasteboardChangedNotification;
UIKIT_EXTERN String *const    UIPasteboardChangedTypesAddedKey;
UIKIT_EXTERN String *const    UIPasteboardChangedTypesRemovedKey;

UIKIT_EXTERN String *const UIPasteboardRemovedNotification;

// Extensions

UIKIT_EXTERN NSArray *UIPasteboardTypeListString;
UIKIT_EXTERN NSArray *UIPasteboardTypeListURL;
UIKIT_EXTERN NSArray *UIPasteboardTypeListImage;
UIKIT_EXTERN NSArray *UIPasteboardTypeListColor;

extern class UIPasteboard(UIPasteboardDataExtensions)

public var  String *string;
public var  NSArray *strings;

public var  NSURL *URL;
public var  NSArray *URLs;

public var  UIImage *image;
public var  NSArray *images;

public var  UIColor *color;
public var  NSArray *colors;

}
