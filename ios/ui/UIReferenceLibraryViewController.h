//
//  UIReferenceLibraryViewController.h
package ios.ui;
//
//  Copyright 2011-2012, Apple Inc. All rights reserved.
//

#import <UIKit/UIViewController.h>

@:require(ios5) 
extern class UIReferenceLibraryViewController extends UIViewController {}

/* Returns YES if any installed dictionary has a definition for the provided term.
 */
+ (BOOL)dictionaryHasDefinitionForTerm:(String *)term;

/* Initializes an instance of a UIReferenceLibraryViewController with the term provided.
 */
- (id)initWithTerm:(String *)term;

}
