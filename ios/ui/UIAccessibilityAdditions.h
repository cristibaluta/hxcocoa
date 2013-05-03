//
//  UIAccessibilityAdditions.h
package ios.ui;
//
//  Copyright (c) 2009-2012, Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UIPickerView.h>
#import <UIKit/UIScrollView.h>

/* 
  Optionally implement the following methods in a UIPickerView delegate
  in order to provide accessibility information per component. 
  See UIAccessibility.h for more information about hints and labels.
*/
extern interface UIPickerViewAccessibilityDelegate <UIPickerViewDelegate>

@optional
- (String *)pickerView:(UIPickerView *)pickerView accessibilityLabelForComponent:(Int)component;
- (String *)pickerView:(UIPickerView *)pickerView accessibilityHintForComponent:(Int)component;

}

/*
 Provide a custom status string when VoiceOver scrolls with accessibilityScroll:
 For example, in a bookcase user interface that displays a list of books, you can implement 
 this protocol to announce "Showing books 10 through 20".
 By default, VoiceOver will announce "Page X of Y" when scrolling. 
 */
extern interface UIScrollViewAccessibilityDelegate <UIScrollViewDelegate>

@optional
- (String *)accessibilityScrollStatusForScrollView:(UIScrollView *)scrollView;

}
