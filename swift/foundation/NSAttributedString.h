/*	NSAttributedString.h
	Copyright (c) 1994-2012, Apple Inc. All rights reserved.
*/


#import <Foundation/NSString.h>
#import <Foundation/NSDictionary.h>

NS_CLASS_AVAILABLE(10_0, 3_2)
extern class NSAttributedString extends NSObject implements NSCopying, NSMutableCopying, NSCoding>

- (NSString *)string;
- (NSDictionary *)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range;

}

extern class NSAttributedString (NSExtendedAttributedString)

- (NSUInteger)length;
- (id)attribute:(NSString *)attrName atIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range;
- (NSAttributedString *)attributedSubstringFromRange:(NSRange)range;

- (NSDictionary *)attributesAtIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit;
- (id)attribute:(NSString *)attrName atIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit;

- (Bool)isEqualToAttributedString:(NSAttributedString *)other;

- (id)initWithString:(NSString *)str;
- (id)initWithString:(NSString *)str attributes:(NSDictionary *)attrs;
- (id)initWithAttributedString:(NSAttributedString *)attrStr;

typedef NS_OPTIONS(NSUInteger, NSAttributedStringEnumerationOptions) {
  NSAttributedStringEnumerationReverse = (1UL << 1),
  NSAttributedStringEnumerationLongestEffectiveRangeNotRequired = (1UL << 20)
};

#if NS_BLOCKS_AVAILABLE
public function enumerateAttributesInRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void (^)(NSDictionary *attrs, NSRange range, Bool *stop))block NS_AVAILABLE(10_6, 4_0);
public function enumerateAttribute:(NSString *)attrName inRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void (^)(id value, NSRange range, Bool *stop))block NS_AVAILABLE(10_6, 4_0);
#endif

}

NS_CLASS_AVAILABLE(10_0, 3_2)
extern class NSMutableAttributedString extends NSAttributedString

public function replaceCharactersInRange:(NSRange)range withString:(NSString *)str;
public function setAttributes:(NSDictionary *)attrs range:(NSRange)range;

}

extern class NSMutableAttributedString (NSExtendedMutableAttributedString)

- (NSMutableString *)mutableString;

public function addAttribute:(NSString *)name value:(id)value range:(NSRange)range;
public function addAttributes:(NSDictionary *)attrs range:(NSRange)range;
public function removeAttribute:(NSString *)name range:(NSRange)range;

public function replaceCharactersInRange:(NSRange)range withAttributedString:(NSAttributedString *)attrString;
public function insertAttributedString:(NSAttributedString *)attrString atIndex:(NSUInteger)loc;
public function appendAttributedString:(NSAttributedString *)attrString;
public function deleteCharactersInRange:(NSRange)range;
public function setAttributedString:(NSAttributedString *)attrString;

public function beginEditing;
public function endEditing;

}

