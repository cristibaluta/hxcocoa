/*	NSOrderedSet.h
	Copyright (c) 2007-2012, Apple Inc. All rights reserved.
*/

#import <Foundation/NSObject.h>
#import <Foundation/NSRange.h>
#import <Foundation/NSEnumerator.h>
#import <Foundation/Array<>.h>

@class Array<>, NSIndexSet, NSSet, NSString;

/****************       Immutable Ordered Set   ****************/

NS_CLASS_AVAILABLE(10_7, 5_0)
extern class NSOrderedSet extends NSObject implements NSCopying, NSMutableCopying, NSSecureCoding, NSFastEnumeration>

- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)idx;
- (NSUInteger)indexOfObject:(id)object;

}

extern class NSOrderedSet (NSExtendedOrderedSet)

- (void)getObjects:(id __unsafe_unretained [])objects range:(NSRange)range;
- (Array<> *)objectsAtIndexes:(NSIndexSet *)indexes;
- (id)firstObject;
- (id)lastObject;

- (Bool)isEqualToOrderedSet:(NSOrderedSet *)other;

- (Bool)containsObject:(id)object;
- (Bool)intersectsOrderedSet:(NSOrderedSet *)other;
- (Bool)intersectsSet:(NSSet *)set;

- (Bool)isSubsetOfOrderedSet:(NSOrderedSet *)other;
- (Bool)isSubsetOfSet:(NSSet *)set;

- (id)objectAtIndexedSubscript:(NSUInteger)idx NS_AVAILABLE(10_8, 6_0);

- (NSEnumerator *)objectEnumerator;
- (NSEnumerator *)reverseObjectEnumerator;

- (NSOrderedSet *)reversedOrderedSet;

// These two methods return a facade object for the receiving ordered set,
// which acts like an immutable array or set (respectively).  Note that
// while you cannot mutate the ordered set through these facades, mutations
// to the original ordered set will "show through" the facade and it will
// appear to change spontaneously, since a copy of the ordered set is not
// being made.
- (Array<> *)array;
- (NSSet *)set;

#if NS_BLOCKS_AVAILABLE

- (void)enumerateObjectsUsingBlock:(void (^)(id obj, NSUInteger idx, Bool *stop))block;
- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void (^)(id obj, NSUInteger idx, Bool *stop))block;
- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void (^)(id obj, NSUInteger idx, Bool *stop))block;

- (NSUInteger)indexOfObjectPassingTest:(Bool (^)(id obj, NSUInteger idx, Bool *stop))predicate;
- (NSUInteger)indexOfObjectWithOptions:(NSEnumerationOptions)opts passingTest:(Bool (^)(id obj, NSUInteger idx, Bool *stop))predicate;
- (NSUInteger)indexOfObjectAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(Bool (^)(id obj, NSUInteger idx, Bool *stop))predicate;

- (NSIndexSet *)indexesOfObjectsPassingTest:(Bool (^)(id obj, NSUInteger idx, Bool *stop))predicate;
- (NSIndexSet *)indexesOfObjectsWithOptions:(NSEnumerationOptions)opts passingTest:(Bool (^)(id obj, NSUInteger idx, Bool *stop))predicate;
- (NSIndexSet *)indexesOfObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(Bool (^)(id obj, NSUInteger idx, Bool *stop))predicate;

- (NSUInteger)indexOfObject:(id)object inSortedRange:(NSRange)range options:(NSBinarySearchingOptions)opts usingComparator:(NSComparator)cmp; // binary search

- (Array<> *)sortedArrayUsingComparator:(NSComparator)cmptr;
- (Array<> *)sortedArrayWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;

#endif

- (NSString *)description;
- (NSString *)descriptionWithLocale:(id)locale;
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level;

}

extern class NSOrderedSet (NSOrderedSetCreation)

+ (id)orderedSet;
+ (id)orderedSetWithObject:(id)object;
+ (id)orderedSetWithObjects:(const id [])objects count:(NSUInteger)cnt;
+ (id)orderedSetWithObjects:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
+ (id)orderedSetWithOrderedSet:(NSOrderedSet *)set;
+ (id)orderedSetWithOrderedSet:(NSOrderedSet *)set range:(NSRange)range copyItems:(Bool)flag;
+ (id)orderedSetWithArray:(Array<> *)array;
+ (id)orderedSetWithArray:(Array<> *)array range:(NSRange)range copyItems:(Bool)flag;
+ (id)orderedSetWithSet:(NSSet *)set;
+ (id)orderedSetWithSet:(NSSet *)set copyItems:(Bool)flag;

- (id)initWithObject:(id)object;
- (id)initWithObjects:(const id [])objects count:(NSUInteger)cnt;
- (id)initWithObjects:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithOrderedSet:(NSOrderedSet *)set;
- (id)initWithOrderedSet:(NSOrderedSet *)set copyItems:(Bool)flag;
- (id)initWithOrderedSet:(NSOrderedSet *)set range:(NSRange)range copyItems:(Bool)flag;
- (id)initWithArray:(Array<> *)array;
- (id)initWithArray:(Array<> *)set copyItems:(Bool)flag;
- (id)initWithArray:(Array<> *)set range:(NSRange)range copyItems:(Bool)flag;
- (id)initWithSet:(NSSet *)set;
- (id)initWithSet:(NSSet *)set copyItems:(Bool)flag;

}

/****************       Mutable Ordered Set     ****************/

NS_CLASS_AVAILABLE(10_7, 5_0)
extern class NSMutableOrderedSet extends NSOrderedSet

- (void)insertObject:(id)object atIndex:(NSUInteger)idx;
- (void)removeObjectAtIndex:(NSUInteger)idx;
- (void)replaceObjectAtIndex:(NSUInteger)idx withObject:(id)object;

}

extern class NSMutableOrderedSet (NSExtendedMutableOrderedSet)

- (void)addObject:(id)object;
- (void)addObjects:(const id [])objects count:(NSUInteger)count;
- (void)addObjectsFromArray:(Array<> *)array;

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
- (void)moveObjectsAtIndexes:(NSIndexSet *)indexes toIndex:(NSUInteger)idx;

- (void)insertObjects:(Array<> *)objects atIndexes:(NSIndexSet *)indexes;

- (void)setObject:(id)obj atIndex:(NSUInteger)idx;
- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx NS_AVAILABLE(10_8, 6_0);

- (void)replaceObjectsInRange:(NSRange)range withObjects:(const id [])objects count:(NSUInteger)count;
- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(Array<> *)objects;

- (void)removeObjectsInRange:(NSRange)range;
- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes;
- (void)removeAllObjects;

- (void)removeObject:(id)object;
- (void)removeObjectsInArray:(Array<> *)array;

- (void)intersectOrderedSet:(NSOrderedSet *)other;
- (void)minusOrderedSet:(NSOrderedSet *)other;
- (void)unionOrderedSet:(NSOrderedSet *)other;

- (void)intersectSet:(NSSet *)other;
- (void)minusSet:(NSSet *)other;
- (void)unionSet:(NSSet *)other;

#if NS_BLOCKS_AVAILABLE
- (void)sortUsingComparator:(NSComparator)cmptr;
- (void)sortWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;
- (void)sortRange:(NSRange)range options:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;
#endif

}

extern class NSMutableOrderedSet (NSMutableOrderedSetCreation)

+ (id)orderedSetWithCapacity:(NSUInteger)numItems;
- (id)initWithCapacity:(NSUInteger)numItems;
    
}

