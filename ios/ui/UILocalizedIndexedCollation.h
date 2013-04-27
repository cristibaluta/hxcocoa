//
//  UILocalizedIndexedCollation.h
package ios.ui;
//
//  Copyright (c) 2009-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>

@:require(3_0)extern class UILocalizedIndexedCollation extends NSObject
{
  @package
    NSLocale *_locale;
    NSArray *_sectionTitles;
    NSArray *_sectionStartStrings;
    NSArray *_sectionIndexTitles;
    NSArray *_sectionIndexMapping;
    NSString *_transform;
    NSString *_firstSectionStartString;
    NSString *_lastSectionStartString;
    CFStringTokenizerRef _tokenizer;
}

+ (id)currentCollation;

// Provides the list of section titles used to group results (e.g. A-Z,# in US/English)
	public var (default, null) NSArray *sectionTitles;

// Provides the list of index titles used to quickly jump to particular sections
	public var (default, null) NSArray *sectionIndexTitles;

// Specifies the section that should be scrolled to for the title at the given index.
// This method allows you to map between a given item in the index
// and a given section where there isn't a one-to-one mapping.
- (Int)sectionForSectionIndexTitleAtIndex:(Int)indexTitleIndex;

// Returns the index of the section that will contain the object.
// selector must not take any arguments and return an NSString.
- (Int)sectionForObject:(id)object collationStringSelector:(SEL)selector;

// Used for sorting objects within the same section.
// selector must not take any arguments and return an NSString.
// In the process of sorting the array, each object may receive
// selector multiple times, so this method should be fast.
- (NSArray *)sortedArrayFromArray:(NSArray *)array collationStringSelector:(SEL)selector;

}
